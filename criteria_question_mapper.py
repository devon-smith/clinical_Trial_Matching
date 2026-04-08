"""
criteria_question_mapper.py
---------------------------
Parses database criterion_type strings into structured components, groups
related criteria, and generates human-friendly follow-up questions.

The criteria table uses SNOMED-style naming conventions:
  - patient_has_diagnosis_of_{condition}_{timeframe}
  - patient_has_undergone_{procedure}_{timeframe}
  - patient_is_undergoing_{treatment}_now
  - patient_is_taking_{medication}_now
  - patient_has_finding_of_{finding}_{timeframe}
  - patient_has_allergy_to_{substance}_{timeframe}
  - patient_{measurement}_value_recorded_{timeframe}_withunit_{unit}
  - patient_is_exposed_to_{substance}_{timeframe}
  - patient_can_undergo_{procedure}_{timeframe}
  - patient_will_undergo_{procedure}_{timeframe}
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple


# ---------------------------------------------------------------------------
# Data classes
# ---------------------------------------------------------------------------

@dataclass
class ParsedCriterion:
    """A parsed criterion_type broken into components."""
    raw: str
    category: str          # diagnosis, prior_treatment, current_treatment, etc.
    entity: str            # the medical concept (snake_case)
    entity_human: str      # human-readable form
    timeframe: str         # now, inthehistory, inthepast4weeks, etc.
    is_negation: bool = False


@dataclass
class QuestionTemplate:
    """A generated follow-up question that resolves one or more criteria."""
    question_text: str
    attribute_key: str          # key for storing the patient's answer
    value_type: str             # boolean, numeric, text, choice
    choices: Optional[List[str]] = None
    criterion_types: List[str] = field(default_factory=list)
    priority: float = 0.0
    group_label: str = ""       # human label for the group (e.g. "smoking")
    input_hint: str = "text"    # yes_no, select, number, text
    input_options: Optional[List[str]] = None  # for select type
    input_unit: Optional[str] = None           # for number type (e.g. "kg/m²")
    input_placeholder: Optional[str] = None    # hint text for input field


# ---------------------------------------------------------------------------
# Timeframe patterns — ordered longest-first for greedy matching
# ---------------------------------------------------------------------------

_TIMEFRAME_PATTERNS = sorted([
    "inthefuture42days", "inthefuture6months", "inthefuture3months",
    "inthefuture", "inthehistory",
    "inthepast12hours", "inthepast7days",
    "inthepast1months", "inthepast2weeks", "inthepast3weeks",
    "inthepast4weeks", "inthepast6weeks", "inthepast12weeks",
    "inthepast3months", "inthepast6months",
    "inthepast1years", "inthepast3years",
    "now",
], key=len, reverse=True)

_TIMEFRAME_RE = re.compile(
    r'_(' + '|'.join(re.escape(t) for t in _TIMEFRAME_PATTERNS) + r')$'
)

# ---------------------------------------------------------------------------
# Category extraction regexes — order matters (most specific first)
# ---------------------------------------------------------------------------

_CATEGORY_PATTERNS: List[Tuple[str, re.Pattern]] = [
    ("demographics_age",     re.compile(r'^patient_age_value_recorded_')),
    ("demographics_sex",     re.compile(r'^patient_sex_is_')),
    ("reproductive",         re.compile(r'^patient_(is_pregnant|is_breastfeeding|is_lactating|has_childbearing)')),
    ("diagnosis",            re.compile(r'^patient_has_diagnosis_of_')),
    ("prior_treatment",      re.compile(r'^patient_has_(undergone|treatment_of)_')),
    ("current_treatment",    re.compile(r'^patient_is_undergoing_')),
    ("current_medication",   re.compile(r'^patient_is_taking_')),
    ("finding",              re.compile(r'^patient_has_finding_of_')),
    ("allergy",              re.compile(r'^patient_has_allergy_to_')),
    ("exposure",             re.compile(r'^patient_is_exposed_to_')),
    ("can_undergo",          re.compile(r'^patient_can_undergo_')),
    ("will_undergo",         re.compile(r'^patient_will_undergo_')),
    ("lab_value",            re.compile(r'^patient_.*_value_recorded_')),
    ("positive_check",       re.compile(r'^patients_.*_is_positive_')),
]

# Prefix strippers per category (what to remove to get the entity)
# For prior_treatment, we try multiple prefixes
_PREFIX_STRIP = {
    "diagnosis":          "patient_has_diagnosis_of_",
    "prior_treatment":    "patient_has_undergone_",
    "current_treatment":  "patient_is_undergoing_",
    "current_medication": "patient_is_taking_",
    "finding":            "patient_has_finding_of_",
    "allergy":            "patient_has_allergy_to_",
    "exposure":           "patient_is_exposed_to_",
    "can_undergo":        "patient_can_undergo_",
    "will_undergo":       "patient_will_undergo_",
}

# Alternative prefixes for categories with multiple naming conventions
_ALT_PREFIX_STRIP = {
    "prior_treatment": ["patient_has_treatment_of_"],
}


# ---------------------------------------------------------------------------
# Entity humanization
# ---------------------------------------------------------------------------

_MEDICAL_TERM_OVERRIDES: Dict[str, str] = {
    "hcc": "HCC (hepatocellular carcinoma)",
    "nsclc": "NSCLC",
    "sclc": "SCLC",
    "copd": "COPD",
    "hiv": "HIV",
    "aids": "AIDS",
    "tb": "TB",
    "ecg": "ECG",
    "mri": "MRI",
    "ct": "CT",
    "cabg": "CABG",
    "bmi": "BMI",
    "egfr": "eGFR",
    "psa": "PSA",
    "inr": "INR",
    "a1c": "A1C",
    "hba1c": "HbA1c",
    "ldl": "LDL",
    "hdl": "HDL",
    "alt": "ALT",
    "ast": "AST",
    "ecog": "ECOG",
    "sbrt": "SBRT",
    "operative_procedure": "surgery",
    "bariatric_operative_procedure": "bariatric surgery",
    "surgical_procedure": "surgery",
    "drug_or_medicament": "medication",
    "malignant_neoplastic_disease": "cancer",
    "neoplastic_disease": "cancer",
    "diabetes_mellitus": "diabetes",
    "hypertensive_disorder": "hypertension",
    "congestive_heart_failure": "congestive heart failure",
    "myocardial_infarction": "heart attack",
    "cerebrovascular_accident": "stroke",
    "renal_impairment": "kidney impairment",
    "hepatic_impairment": "liver impairment",
    "tobacco_smoking_behavior_finding": "tobacco/smoking history",
    "tobacco_smoking_consumption": "tobacco/smoking history",
    "cigarette_smoker": "cigarette smoking",
    "non_smoker": "non-smoker status",
    "never_smoked_tobacco": "never-smoker status",
    "ex_smoker": "former smoker status",
    "secondary_malignant_neoplastic_disease": "metastatic cancer",
    "widespread_metastatic_malignant_neoplastic_disease": "cancer that has spread (metastatic)",
    "secondary_primary_tumors_except_basal_cell_carcinoma_or_in_situ_neoplasias":
        "other active cancers (except non-melanoma skin cancer)",
    "neoadjuvant_chemotherapy": "chemotherapy before surgery (neoadjuvant)",
    "antiher2_agents": "HER2-targeted therapy",
    "anti_her2_therapy": "HER2-targeted therapy",
    "clinical_stage_iii": "clinical stage III",
    "clinical_stage_4": "clinical stage IV",
    "mental_disorder": "mental health condition",
    "disease_condition_finding": "medical condition",
    "disorder_due_to_infection": "infectious disease",
    "containing_product": "",
    "corticosteroid_and_corticosteroid_derivative_containing_product": "corticosteroids",
    "disease_of_liver": "liver disease",
    "longevity": "life expectancy estimate",
    "patient_condition_finding": "a specific medical condition",
    "insufficient_clinical_detail_given": None,  # skip — not askable
    "patient_medical_record_not_available": None,  # skip — not askable
    "co_morbid_conditions": "other medical conditions (comorbidities)",
    "fever": "fever",
    "administration_of_antineoplastic_agent": "anti-cancer drug treatment",
    "administration_of_antibiotic": "antibiotics",
    "administration_of_steroid": "steroids",
    "angiotensin_converting_enzyme_inhibitor_containing_product": "ACE inhibitors",
    "angiotensin_ii_receptor_antagonist_containing_product": "ARBs (angiotensin receptor blockers)",
    "antidepressant": "antidepressants",
    "anticoagulant_therapy": "blood thinners (anticoagulant therapy)",
    "immunological_therapy": "immunotherapy",
    "hormone_therapy": "hormone therapy",
    "contraception": "contraception",
    "madrs_montgomery_asberg_depression_rating_scale_score": "MADRS depression score",
    "mini_mental_state_examination_score": "MMSE (mini-mental state exam) score",
    "kps_karnofsky_performance_status_score": "Karnofsky performance status score",
    "disability": "a disability",
}

# Words to drop when they appear at the end after humanization
_SUFFIX_NOISE = {"containing", "product", "agent"}


def _humanize_entity(entity: str) -> Optional[str]:
    """Convert a snake_case medical entity to human-readable text.

    Returns None if the entity is marked as non-askable.
    """
    # Check full-string overrides first
    if entity in _MEDICAL_TERM_OVERRIDES:
        return _MEDICAL_TERM_OVERRIDES[entity]

    # Check if entity ends with "_containing_product" — strip it
    entity = re.sub(r'_containing_product$', '', entity)

    # Replace underscores with spaces
    words = entity.replace('_', ' ').split()

    # Apply per-word overrides
    result_words = []
    for w in words:
        if w in _MEDICAL_TERM_OVERRIDES:
            override = _MEDICAL_TERM_OVERRIDES[w]
            if override:
                result_words.append(override)
        elif w not in _SUFFIX_NOISE:
            result_words.append(w)

    return ' '.join(result_words) if result_words else entity.replace('_', ' ')


# ---------------------------------------------------------------------------
# Timeframe humanization
# ---------------------------------------------------------------------------

_TIMEFRAME_HUMAN: Dict[str, str] = {
    "now": "currently",
    "inthehistory": "in your medical history",
    "inthefuture": "planned",
    "inthepast7days": "in the past week",
    "inthepast2weeks": "in the past 2 weeks",
    "inthepast3weeks": "in the past 3 weeks",
    "inthepast4weeks": "in the past month",
    "inthepast6weeks": "in the past 6 weeks",
    "inthepast12weeks": "in the past 3 months",
    "inthepast1months": "in the past month",
    "inthepast3months": "in the past 3 months",
    "inthepast6months": "in the past 6 months",
    "inthepast1years": "in the past year",
    "inthepast3years": "in the past 3 years",
    "inthepast12hours": "in the past 12 hours",
    "inthefuture42days": "in the next 6 weeks",
    "inthefuture3months": "in the next 3 months",
    "inthefuture6months": "in the next 6 months",
}


# ---------------------------------------------------------------------------
# Criterion parser
# ---------------------------------------------------------------------------

def parse_criterion(criterion_type: str) -> Optional[ParsedCriterion]:
    """Parse a criterion_type string into structured components.

    Returns None for demographics (age/sex) since we already collect those.
    """
    raw = criterion_type.strip()

    # Identify category
    category = "other"
    for cat_name, pattern in _CATEGORY_PATTERNS:
        if pattern.search(raw):
            category = cat_name
            break

    # Skip demographics — already collected
    if category.startswith("demographics"):
        return None

    # Extract timeframe
    timeframe = "now"
    tf_match = _TIMEFRAME_RE.search(raw)
    if tf_match:
        timeframe = tf_match.group(1)

    # Extract entity
    entity = raw
    prefix = _PREFIX_STRIP.get(category)
    stripped = False
    if prefix and entity.startswith(prefix):
        entity = entity[len(prefix):]
        stripped = True

    # Try alternate prefixes (e.g. patient_has_treatment_of_ for prior_treatment)
    if not stripped and category in _ALT_PREFIX_STRIP:
        for alt_prefix in _ALT_PREFIX_STRIP[category]:
            if entity.startswith(alt_prefix):
                entity = entity[len(alt_prefix):]
                stripped = True
                break

    if not stripped:
        if category == "lab_value":
            # Strip "patient_" prefix and "_value_recorded_..." suffix
            entity = re.sub(r'^patient_', '', entity)
            entity = re.sub(r'_value_recorded_.*$', '', entity)
        elif category == "positive_check":
            entity = re.sub(r'^patients_', '', entity)
            entity = re.sub(r'_is_positive_.*$', '', entity)
        elif category == "reproductive":
            entity = re.sub(r'^patient_', '', entity)
        elif category == "demographics_sex":
            entity = re.sub(r'^patient_sex_is_', '', entity)
        else:
            entity = re.sub(r'^patient_', '', entity)

    # Strip timeframe suffix from entity
    if tf_match:
        entity = re.sub(r'_' + re.escape(timeframe) + r'$', '', entity)

    # Strip unit suffix for lab values (e.g. _withunit_percent)
    entity = re.sub(r'_withunit_.*$', '', entity)
    # Strip _in_years, _in_months etc.
    entity = re.sub(r'_in_(years|months|days)$', '', entity)

    entity_human = _humanize_entity(entity)

    # None means this criterion is not askable — skip it
    if entity_human is None:
        return None

    return ParsedCriterion(
        raw=raw,
        category=category,
        entity=entity,
        entity_human=entity_human,
        timeframe=timeframe,
    )


# ---------------------------------------------------------------------------
# Grouping logic
# ---------------------------------------------------------------------------

# Semantic groups: criteria that should be asked as a single question
_SEMANTIC_GROUPS: Dict[str, Dict] = {
    "smoking": {
        "keywords": [
            "smoker", "smoking", "tobacco", "cigarette", "non_smoker",
            "never_smoked", "ex_smoker", "pipe_smoker", "cigar_smoker",
            "smokeless_tobacco", "tobacco_user", "smoking_cessation",
            "tobacco_smoking",
        ],
        "question": "What is your smoking/tobacco history?",
        "attribute_key": "smoking_status",
        "value_type": "choice",
        "choices": ["Never smoked", "Former smoker", "Current smoker"],
    },
    "cancer_stage": {
        "keywords": [
            "clinical_stage_iii", "clinical_stage_4", "clinical_stage_iv",
            "tnm_stage_3", "tnm_stage_4",
        ],
        "question": "What stage is your cancer?",
        "attribute_key": "cancer_stage",
        "value_type": "choice",
        "choices": ["I", "II", "III", "IV", "I don't know"],
    },
    "metastasis": {
        "keywords": [
            "secondary_malignant_neoplastic_disease",
            "secondary_malignant_neoplasm",
            "metastatic", "metastasis",
        ],
        "question": "Has your cancer spread (metastasized) to other parts of your body?",
        "attribute_key": "metastatic_status",
        "value_type": "boolean",
    },
    "ecog": {
        "keywords": [
            "ecog_performance_status", "who_performance_status",
            "general_physical_performance_status",
        ],
        "question": "What is your ECOG performance status (0 = fully active, 4 = bedbound)?",
        "attribute_key": "ecog_status",
        "value_type": "numeric",
    },
    "pregnancy": {
        "keywords": [
            "pregnant", "breastfeeding", "lactating", "childbearing",
            "contraception",
        ],
        "question": "Are you currently pregnant, breastfeeding, or planning to become pregnant?",
        "attribute_key": "pregnancy_status",
        "value_type": "boolean",
    },
    "bmi": {
        "keywords": ["body_mass_index"],
        "question": "Do you know your current BMI (body mass index)?",
        "attribute_key": "bmi",
        "value_type": "numeric",
    },
    "blood_pressure": {
        "keywords": ["systolic_blood_pressure", "diastolic_blood_pressure"],
        "question": "Do you know your recent blood pressure readings?",
        "attribute_key": "blood_pressure",
        "value_type": "text",
    },
    "kidney_function": {
        "keywords": [
            "serum_creatinine", "creatinine_level", "creatinine_renal_clearance",
            "renal_impairment", "end_stage_renal", "kidney_disease",
            "glomerular_filtration",
        ],
        "question": "Do you have any kidney issues, or do you know your creatinine/eGFR levels?",
        "attribute_key": "kidney_function",
        "value_type": "text",
    },
    "liver_function": {
        "keywords": [
            "alanine_aminotransferase", "aspartate_aminotransferase",
            "serum_bilirubin", "hepatic_impairment", "liver_disease",
            "end_stage_liver", "alkaline_phosphatase",
        ],
        "question": "Do you have any liver issues, or do you know your liver function test results?",
        "attribute_key": "liver_function",
        "value_type": "text",
    },
    "heart_condition": {
        "keywords": [
            "congestive_heart_failure", "heart_failure",
            "myocardial_infarction", "coronary_artery",
            "left_ventricular_ejection_fraction", "cardiac",
            "atrial_fibrillation", "arrhythmia",
        ],
        "question": "Do you have any heart conditions (heart failure, prior heart attack, arrhythmia)?",
        "attribute_key": "heart_condition",
        "value_type": "text",
    },
    "diabetes_detail": {
        "keywords": [
            "diabetes_mellitus", "hemoglobin_a1c", "hba1c",
            "glycosylated_hemoglobin", "fasting_glucose",
            "blood_glucose", "insulin",
        ],
        "question": "Do you have diabetes? If so, do you know your most recent A1C or blood sugar levels?",
        "attribute_key": "diabetes_detail",
        "value_type": "text",
    },
    "blood_counts": {
        "keywords": [
            "platelet_count", "white_blood_cell_count",
            "hemoglobin", "hematocrit", "neutrophil",
            "absolute_neutrophil_count", "lymphocyte",
        ],
        "question": "Do you know your recent blood count results (platelets, white blood cells, hemoglobin)?",
        "attribute_key": "blood_counts",
        "value_type": "text",
    },
    "allergy_group": {
        "keywords": ["allergy_to"],
        "question": "Do you have any known drug or substance allergies?",
        "attribute_key": "allergies",
        "value_type": "text",
    },
}


def _match_semantic_group(entity: str, criterion_type: str) -> Optional[str]:
    """Check if a criterion matches a semantic group. Returns group key or None."""
    for group_key, group_def in _SEMANTIC_GROUPS.items():
        for kw in group_def["keywords"]:
            if kw in entity or kw in criterion_type:
                return group_key
    return None


# Categories we skip entirely — already collected or not askable
_SKIP_CATEGORIES = {"demographics_age", "demographics_sex"}


def generate_questions_from_criteria(
    criteria: List[Dict],
) -> List[QuestionTemplate]:
    """Generate grouped, prioritized follow-up questions from a list of criteria.

    Args:
        criteria: List of dicts, each with keys:
            - criterion_type (str)
            - is_inclusion (bool)
            - hard_constraint (bool)
            - trial_count (int) — number of trials using this criterion

    Returns:
        Sorted list of QuestionTemplate objects (highest priority first).
    """
    # Parse all criteria
    parsed_items: List[Tuple[ParsedCriterion, Dict]] = []
    for c in criteria:
        parsed = parse_criterion(c["criterion_type"])
        if parsed and parsed.category not in _SKIP_CATEGORIES:
            parsed_items.append((parsed, c))

    if not parsed_items:
        return []

    # Group into semantic groups or individual questions
    # grouped[key] = { "criteria": [...], "parsed": [...], "total_priority": float }
    grouped: Dict[str, Dict] = {}

    for parsed, crit_info in parsed_items:
        group_key = _match_semantic_group(parsed.entity, parsed.raw)

        if group_key:
            # Semantic group match
            if group_key not in grouped:
                grouped[group_key] = {
                    "criteria": [], "parsed": [], "total_priority": 0.0,
                    "source": "semantic",
                }
            grouped[group_key]["criteria"].append(crit_info)
            grouped[group_key]["parsed"].append(parsed)
        else:
            # Individual criterion — group by (category, entity) to merge timeframes
            ind_key = f"{parsed.category}::{parsed.entity}"
            if ind_key not in grouped:
                grouped[ind_key] = {
                    "criteria": [], "parsed": [], "total_priority": 0.0,
                    "source": "individual",
                }
            grouped[ind_key]["criteria"].append(crit_info)
            grouped[ind_key]["parsed"].append(parsed)

    # Score and build questions
    questions: List[QuestionTemplate] = []

    for key, group in grouped.items():
        # Calculate priority score
        priority = 0.0
        criterion_types = []
        for crit_info in group["criteria"]:
            tc = crit_info.get("trial_count", 1)
            hard = 2.0 if crit_info.get("hard_constraint") else 1.0
            incl = 1.3 if crit_info.get("is_inclusion") else 1.0
            # Bonus for resolving multiple criteria
            multi_bonus = 1.0 + 0.1 * len(group["criteria"])
            priority += tc * hard * incl * multi_bonus
            criterion_types.append(crit_info["criterion_type"])

        if group["source"] == "semantic":
            # Use the predefined semantic group question
            sg = _SEMANTIC_GROUPS[key]
            sg_choices = sg.get("choices")
            hint, options, unit, placeholder = _infer_input_hint(
                criterion_types, sg["value_type"], key, sg_choices,
            )
            q = QuestionTemplate(
                question_text=sg["question"],
                attribute_key=sg["attribute_key"],
                value_type=sg["value_type"],
                choices=sg_choices,
                criterion_types=criterion_types,
                priority=priority,
                group_label=key,
                input_hint=hint,
                input_options=options,
                input_unit=unit,
                input_placeholder=placeholder,
            )
        else:
            # Build question from parsed criteria
            first_parsed = group["parsed"][0]
            q = _build_individual_question(first_parsed, group, criterion_types, priority)

        questions.append(q)

    # Sort by priority descending
    questions.sort(key=lambda q: q.priority, reverse=True)

    return questions


# ---------------------------------------------------------------------------
# Input hint inference
# ---------------------------------------------------------------------------

# Units extracted from criterion_type patterns like "_withunit_kilograms_per_square_meter"
_UNIT_MAP = {
    "kilograms_per_square_meter": ("kg/m²", "e.g. 24.5"),
    "millimeters_of_mercury": ("mmHg", "e.g. 120/80"),
    "milligrams_per_deciliter": ("mg/dL", "e.g. 100"),
    "grams_per_deciliter": ("g/dL", "e.g. 13.5"),
    "percent": ("%", "e.g. 7.2"),
    "cells_per_microliter": ("cells/µL", "e.g. 1500"),
    "milliliters_per_minute": ("mL/min", "e.g. 60"),
    "international_units_per_liter": ("IU/L", "e.g. 40"),
    "years": ("years", "e.g. 45"),
    "months": ("months", "e.g. 6"),
    "weeks": ("weeks", "e.g. 12"),
}


def _extract_unit_from_criterion(criterion_type: str) -> Tuple[Optional[str], Optional[str]]:
    """Extract unit and placeholder from a criterion_type string.

    Returns (unit_label, placeholder) or (None, None).
    """
    m = re.search(r'_withunit_(.+?)(?:_(?:now|inthehistory|inthepast))', criterion_type)
    if not m:
        m = re.search(r'_withunit_(.+)$', criterion_type)
    if m:
        unit_key = m.group(1)
        if unit_key in _UNIT_MAP:
            return _UNIT_MAP[unit_key]
        # Fallback: humanize the unit key
        human_unit = unit_key.replace('_', ' ')
        return human_unit, None
    return None, None


def _infer_input_hint(
    criterion_types: List[str],
    value_type: str,
    category: str,
    choices: Optional[List[str]] = None,
) -> Tuple[str, Optional[List[str]], Optional[str], Optional[str]]:
    """Infer the input_hint, options, unit, and placeholder from criterion patterns.

    Returns (input_hint, input_options, input_unit, input_placeholder).
    """
    raw = criterion_types[0] if criterion_types else ""

    # --- yes_no: binary boolean questions ---
    yes_no_patterns = [
        "is_pregnant", "is_breastfeeding", "is_lactating",
        "has_diagnosis_of_", "has_undergone_", "is_undergoing_",
        "has_finding_of_", "has_allergy_to_", "is_taking_",
        "is_exposed_to_", "can_undergo_", "will_undergo_",
        "is_smoker", "is_non_smoker",
    ]
    if value_type == "boolean" or category in (
        "diagnosis", "prior_treatment", "current_treatment",
        "current_medication", "finding", "allergy", "exposure",
        "reproductive", "can_undergo", "will_undergo",
    ):
        if any(pat in raw for pat in yes_no_patterns) or value_type == "boolean":
            return "yes_no", None, None, None

    # --- number: numeric lab values with units ---
    if "_value_recorded_" in raw or value_type == "numeric":
        unit, placeholder = _extract_unit_from_criterion(raw)
        if not unit:
            # Infer from category
            if "a1c" in raw or "hemoglobin_a1c" in raw:
                unit, placeholder = "%", "e.g. 7.2"
            elif "body_mass_index" in raw or "bmi" in raw:
                unit, placeholder = "kg/m²", "e.g. 24.5"
            elif "creatinine" in raw:
                unit, placeholder = "mg/dL", "e.g. 1.0"
            elif "ecog" in raw or "performance_status" in raw:
                unit, placeholder = "0-4", "0 = fully active"
            elif "ejection_fraction" in raw:
                unit, placeholder = "%", "e.g. 55"
            elif "glomerular_filtration" in raw or "egfr" in raw:
                unit, placeholder = "mL/min", "e.g. 60"
            else:
                unit, placeholder = None, "Enter a number"
        return "number", None, unit, placeholder

    # --- select: categorical with predefined options ---
    if value_type == "choice" and choices:
        return "select", choices, None, None

    # --- text: everything else ---
    return "text", None, None, None


def _build_individual_question(
    parsed: ParsedCriterion,
    group: Dict,
    criterion_types: List[str],
    priority: float,
) -> QuestionTemplate:
    """Build a question for a non-semantic-group criterion."""
    entity_h = parsed.entity_human
    category = parsed.category

    # Determine value_type and question phrasing based on category
    if category == "diagnosis":
        question = f"Have you been diagnosed with {entity_h}?"
        value_type = "boolean"
        attr_key = f"diagnosis_{parsed.entity}"
    elif category == "prior_treatment":
        tf_h = _TIMEFRAME_HUMAN.get(parsed.timeframe, "")
        tf_suffix = f" {tf_h}" if tf_h and tf_h != "currently" else ""
        question = f"Have you had {entity_h}{tf_suffix}?"
        value_type = "boolean"
        attr_key = f"prior_{parsed.entity}"
    elif category == "current_treatment":
        question = f"Are you currently receiving {entity_h}?"
        value_type = "boolean"
        attr_key = f"current_{parsed.entity}"
    elif category == "current_medication":
        question = f"Are you currently taking {entity_h}?"
        value_type = "boolean"
        attr_key = f"taking_{parsed.entity}"
    elif category == "finding":
        question = f"Do you have {entity_h}?"
        value_type = "boolean"
        attr_key = f"finding_{parsed.entity}"
    elif category == "allergy":
        question = f"Are you allergic to {entity_h}?"
        value_type = "boolean"
        attr_key = f"allergy_{parsed.entity}"
    elif category == "exposure":
        question = f"Have you been exposed to {entity_h}?"
        value_type = "boolean"
        attr_key = f"exposure_{parsed.entity}"
    elif category == "lab_value":
        # If the humanized name already contains "score", don't add "level"
        if "score" in entity_h.lower():
            question = f"Do you know your {entity_h}?"
        else:
            question = f"Do you know your {entity_h} level?"
        value_type = "numeric"
        attr_key = f"lab_{parsed.entity}"
    elif category == "reproductive":
        question = f"Regarding {entity_h} — does this apply to you?"
        value_type = "boolean"
        attr_key = f"repro_{parsed.entity}"
    elif category in ("can_undergo", "will_undergo"):
        question = f"Are you able/willing to undergo {entity_h}?"
        value_type = "boolean"
        attr_key = f"can_{parsed.entity}"
    else:
        question = f"Regarding {entity_h} — does this apply to you?"
        value_type = "boolean"
        attr_key = f"other_{parsed.entity}"

    hint, options, unit, placeholder = _infer_input_hint(
        criterion_types, value_type, category,
    )

    return QuestionTemplate(
        question_text=question,
        attribute_key=attr_key,
        value_type=value_type,
        criterion_types=criterion_types,
        priority=priority,
        group_label=category,
        input_hint=hint,
        input_options=options,
        input_unit=unit,
        input_placeholder=placeholder,
    )
