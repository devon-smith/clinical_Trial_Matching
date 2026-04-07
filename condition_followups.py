"""
Condition-specific follow-up questions for clinical trial eligibility.

Given a detected condition, returns the 3-5 most eligibility-relevant
follow-up questions along with the patient attribute each answer captures.
Parsed answers are merged into the patient profile for eligibility matching.
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional, Tuple


# ---------------------------------------------------------------------------
# Data structures
# ---------------------------------------------------------------------------

@dataclass
class FollowUpQuestion:
    """A single follow-up question tied to a patient attribute."""
    question: str
    attribute: str          # Key added to patient_attrs (e.g., "stage", "a1c")
    value_type: str         # "choice", "numeric", "text", "boolean"
    choices: List[str] = field(default_factory=list)   # Valid options for choice type
    sensitive: bool = False  # Requires careful framing (e.g., self-harm)


@dataclass
class ConditionCategory:
    """A disease category with aliases and follow-up questions."""
    category_id: str
    display_name: str
    aliases: List[str]
    followups: List[FollowUpQuestion]


# ---------------------------------------------------------------------------
# Lookup table — 20 disease categories
# ---------------------------------------------------------------------------

CONDITION_FOLLOWUPS: Dict[str, ConditionCategory] = {}


def _register(cat: ConditionCategory) -> None:
    CONDITION_FOLLOWUPS[cat.category_id] = cat


# --- 1. Breast Cancer ---
_register(ConditionCategory(
    category_id="breast_cancer",
    display_name="Breast Cancer",
    aliases=["breast cancer", "breast tumor", "breast carcinoma",
             "breast neoplasm", "dcis", "invasive breast"],
    followups=[
        FollowUpQuestion(
            question="What stage is your breast cancer?",
            attribute="stage",
            value_type="choice",
            choices=["I", "II", "III", "IV"],
        ),
        FollowUpQuestion(
            question="Do you know your receptor status — specifically ER, PR, and HER2?",
            attribute="receptor_status",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Have you had any prior treatments — surgery, chemotherapy, radiation, or hormonal therapy?",
            attribute="prior_treatments",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Has your cancer spread to other parts of your body (metastasized)?",
            attribute="metastatic_status",
            value_type="boolean",
        ),
    ],
))

# --- 2. Liver Cancer ---
_register(ConditionCategory(
    category_id="liver_cancer",
    display_name="Liver Cancer",
    aliases=["liver cancer", "hepatocellular carcinoma", "hcc",
             "cholangiocarcinoma", "liver tumor", "hepatic cancer"],
    followups=[
        FollowUpQuestion(
            question="What type of liver cancer do you have — hepatocellular carcinoma (HCC), cholangiocarcinoma, or another type?",
            attribute="liver_cancer_type",
            value_type="choice",
            choices=["HCC", "cholangiocarcinoma", "other"],
        ),
        FollowUpQuestion(
            question="What stage is it?",
            attribute="stage",
            value_type="choice",
            choices=["I", "II", "III", "IV"],
        ),
        FollowUpQuestion(
            question="What's your current liver function — has your doctor mentioned a Child-Pugh score or MELD score?",
            attribute="liver_function",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Have you had any prior treatments — surgery, ablation, chemoembolization, or systemic therapy?",
            attribute="prior_treatments",
            value_type="text",
        ),
    ],
))

# --- 3. Lung Cancer ---
_register(ConditionCategory(
    category_id="lung_cancer",
    display_name="Lung Cancer",
    aliases=["lung cancer", "nsclc", "non-small cell lung cancer",
             "small cell lung cancer", "sclc", "lung tumor",
             "lung carcinoma", "lung neoplasm"],
    followups=[
        FollowUpQuestion(
            question="Is it non-small cell lung cancer (NSCLC) or small cell lung cancer (SCLC)?",
            attribute="lung_cancer_type",
            value_type="choice",
            choices=["NSCLC", "SCLC", "not sure"],
        ),
        FollowUpQuestion(
            question="What stage is your lung cancer?",
            attribute="stage",
            value_type="choice",
            choices=["I", "II", "III", "IV"],
        ),
        FollowUpQuestion(
            question="Do you know if your tumor has any specific mutations — like EGFR, ALK, ROS1, or PD-L1 status?",
            attribute="biomarkers",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Have you had any prior treatments — surgery, chemotherapy, immunotherapy, or radiation?",
            attribute="prior_treatments",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Do you currently smoke, or have you smoked in the past?",
            attribute="smoking_status",
            value_type="choice",
            choices=["current smoker", "former smoker", "never smoked"],
        ),
    ],
))

# --- 4. Diabetes (Type 2) ---
_register(ConditionCategory(
    category_id="type_2_diabetes",
    display_name="Type 2 Diabetes",
    aliases=["type 2 diabetes", "diabetes", "t2d", "type ii diabetes",
             "diabetes mellitus", "diabetic"],
    followups=[
        FollowUpQuestion(
            question="What's your most recent A1C level?",
            attribute="a1c",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="What medications are you currently on for diabetes?",
            attribute="current_medications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Do you have any diabetes-related complications — kidney issues, neuropathy, retinopathy?",
            attribute="complications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="How long have you been diagnosed with diabetes?",
            attribute="diagnosis_duration_years",
            value_type="numeric",
        ),
    ],
))

# --- 5. Depression ---
_register(ConditionCategory(
    category_id="depression",
    display_name="Depression",
    aliases=["depression", "major depressive disorder", "mdd",
             "depressive disorder", "clinical depression", "depressed"],
    followups=[
        FollowUpQuestion(
            question="How many antidepressants have you tried that didn't work well enough?",
            attribute="prior_med_count",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="Are you currently on any psychiatric medication?",
            attribute="current_medications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Have you ever been hospitalized for depression or had thoughts of self-harm? (I ask because some trials have specific requirements around this — please know help is always available at 988 Suicide & Crisis Lifeline.)",
            attribute="severity",
            value_type="text",
            sensitive=True,
        ),
    ],
))

# --- 6. Arthritis ---
_register(ConditionCategory(
    category_id="arthritis",
    display_name="Arthritis",
    aliases=["arthritis", "osteoarthritis", "rheumatoid arthritis",
             "ra", "oa", "joint pain", "joint inflammation"],
    followups=[
        FollowUpQuestion(
            question="Is it osteoarthritis or rheumatoid arthritis, or are you not sure?",
            attribute="arthritis_type",
            value_type="choice",
            choices=["osteoarthritis", "rheumatoid arthritis", "not sure"],
        ),
        FollowUpQuestion(
            question="Which joints are most affected?",
            attribute="affected_joints",
            value_type="text",
        ),
        FollowUpQuestion(
            question="What treatments have you already tried — NSAIDs, physical therapy, biologics?",
            attribute="prior_treatments",
            value_type="text",
        ),
        FollowUpQuestion(
            question="How long have you been dealing with arthritis symptoms?",
            attribute="diagnosis_duration_years",
            value_type="numeric",
        ),
    ],
))

# --- 7. COPD ---
_register(ConditionCategory(
    category_id="copd",
    display_name="COPD",
    aliases=["copd", "chronic obstructive pulmonary disease",
             "emphysema", "chronic bronchitis"],
    followups=[
        FollowUpQuestion(
            question="Do you know your most recent lung function results — specifically your FEV1 percentage?",
            attribute="fev1_percent",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="How many flare-ups (exacerbations) have you had in the past year?",
            attribute="exacerbation_count",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="What medications are you currently using — inhalers, oxygen therapy, or other treatments?",
            attribute="current_medications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Do you currently smoke, or have you smoked in the past?",
            attribute="smoking_status",
            value_type="choice",
            choices=["current smoker", "former smoker", "never smoked"],
        ),
    ],
))

# --- 8. Asthma ---
_register(ConditionCategory(
    category_id="asthma",
    display_name="Asthma",
    aliases=["asthma", "bronchial asthma", "allergic asthma",
             "exercise-induced asthma", "severe asthma"],
    followups=[
        FollowUpQuestion(
            question="How would you rate your asthma severity — mild, moderate, or severe?",
            attribute="asthma_severity",
            value_type="choice",
            choices=["mild", "moderate", "severe"],
        ),
        FollowUpQuestion(
            question="What medications are you currently on — rescue inhaler only, daily controller, or biologics?",
            attribute="current_medications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="How often do you have asthma attacks or need your rescue inhaler in a typical week?",
            attribute="symptom_frequency",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Do you have any known triggers — allergies, exercise, or environmental factors?",
            attribute="triggers",
            value_type="text",
        ),
    ],
))

# --- 9. Heart Failure ---
_register(ConditionCategory(
    category_id="heart_failure",
    display_name="Heart Failure",
    aliases=["heart failure", "congestive heart failure", "chf",
             "hfref", "hfpef", "cardiac failure", "weak heart"],
    followups=[
        FollowUpQuestion(
            question="Do you know your ejection fraction (EF) — the percentage that measures how well your heart pumps?",
            attribute="ejection_fraction",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="What NYHA class has your doctor assigned — I (no limitations), II (mild), III (moderate), or IV (severe)?",
            attribute="nyha_class",
            value_type="choice",
            choices=["I", "II", "III", "IV"],
        ),
        FollowUpQuestion(
            question="What medications are you currently taking for your heart?",
            attribute="current_medications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Have you been hospitalized for heart failure in the past year?",
            attribute="recent_hospitalization",
            value_type="boolean",
        ),
    ],
))

# --- 10. Parkinson's Disease ---
_register(ConditionCategory(
    category_id="parkinsons",
    display_name="Parkinson's Disease",
    aliases=["parkinson's", "parkinsons", "parkinson's disease",
             "parkinson disease", "pd"],
    followups=[
        FollowUpQuestion(
            question="How long ago were you diagnosed with Parkinson's?",
            attribute="diagnosis_duration_years",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="What stage are you at — has your doctor mentioned a Hoehn and Yahr stage?",
            attribute="stage",
            value_type="choice",
            choices=["1", "2", "3", "4", "5", "not sure"],
        ),
        FollowUpQuestion(
            question="What medications are you currently on — levodopa, dopamine agonists, or others?",
            attribute="current_medications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Are you experiencing any motor complications like dyskinesia or on-off fluctuations?",
            attribute="motor_complications",
            value_type="boolean",
        ),
    ],
))

# --- 11. Alzheimer's Disease ---
_register(ConditionCategory(
    category_id="alzheimers",
    display_name="Alzheimer's Disease",
    aliases=["alzheimer's", "alzheimers", "alzheimer's disease",
             "alzheimer disease", "dementia", "memory loss", "cognitive decline"],
    followups=[
        FollowUpQuestion(
            question="What stage has the doctor described — mild cognitive impairment (MCI), mild, moderate, or severe Alzheimer's?",
            attribute="cognitive_stage",
            value_type="choice",
            choices=["MCI", "mild", "moderate", "severe"],
        ),
        FollowUpQuestion(
            question="Has the diagnosis been confirmed with any biomarker tests — like an amyloid PET scan or CSF test?",
            attribute="biomarker_confirmed",
            value_type="boolean",
        ),
        FollowUpQuestion(
            question="What medications are currently being taken — like donepezil, memantine, or lecanemab?",
            attribute="current_medications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Does the patient have a caregiver who can assist with study visits?",
            attribute="has_caregiver",
            value_type="boolean",
        ),
    ],
))

# --- 12. Multiple Sclerosis ---
_register(ConditionCategory(
    category_id="multiple_sclerosis",
    display_name="Multiple Sclerosis",
    aliases=["multiple sclerosis", "ms", "relapsing-remitting ms",
             "rrms", "progressive ms", "ppms", "spms"],
    followups=[
        FollowUpQuestion(
            question="What type of MS do you have — relapsing-remitting, secondary progressive, or primary progressive?",
            attribute="ms_type",
            value_type="choice",
            choices=["relapsing-remitting", "secondary progressive", "primary progressive", "not sure"],
        ),
        FollowUpQuestion(
            question="How many relapses have you had in the past year?",
            attribute="relapse_count",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="What disease-modifying therapies are you currently on or have tried?",
            attribute="current_medications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Do you know your most recent EDSS score (disability level)?",
            attribute="edss_score",
            value_type="numeric",
        ),
    ],
))

# --- 13. Chronic Pain ---
_register(ConditionCategory(
    category_id="chronic_pain",
    display_name="Chronic Pain",
    aliases=["chronic pain", "fibromyalgia", "neuropathic pain",
             "back pain", "chronic back pain", "nerve pain",
             "pain syndrome", "complex regional pain"],
    followups=[
        FollowUpQuestion(
            question="Where is your pain primarily located?",
            attribute="pain_location",
            value_type="text",
        ),
        FollowUpQuestion(
            question="On a scale of 0-10, what's your average daily pain level?",
            attribute="pain_score",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="How long have you been dealing with this pain?",
            attribute="diagnosis_duration_years",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="What treatments have you tried — medications, physical therapy, injections, or surgery?",
            attribute="prior_treatments",
            value_type="text",
        ),
    ],
))

# --- 14. Migraine ---
_register(ConditionCategory(
    category_id="migraine",
    display_name="Migraine",
    aliases=["migraine", "migraines", "chronic migraine",
             "migraine with aura", "episodic migraine", "cluster headache"],
    followups=[
        FollowUpQuestion(
            question="How many migraine days do you have per month?",
            attribute="monthly_migraine_days",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="What preventive medications have you tried — and how many didn't work well enough?",
            attribute="prior_treatments",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Do you experience aura with your migraines?",
            attribute="has_aura",
            value_type="boolean",
        ),
        FollowUpQuestion(
            question="Are you currently on any preventive medication — like a CGRP inhibitor, topiramate, or a beta-blocker?",
            attribute="current_medications",
            value_type="text",
        ),
    ],
))

# --- 15. HIV ---
_register(ConditionCategory(
    category_id="hiv",
    display_name="HIV",
    aliases=["hiv", "hiv positive", "hiv/aids", "aids",
             "human immunodeficiency virus"],
    followups=[
        FollowUpQuestion(
            question="What's your most recent viral load?",
            attribute="viral_load",
            value_type="text",
        ),
        FollowUpQuestion(
            question="What's your most recent CD4 count?",
            attribute="cd4_count",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="Are you currently on antiretroviral therapy (ART), and if so, what regimen?",
            attribute="current_medications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="How long have you been HIV-positive?",
            attribute="diagnosis_duration_years",
            value_type="numeric",
        ),
    ],
))

# --- 16. Kidney Disease ---
_register(ConditionCategory(
    category_id="kidney_disease",
    display_name="Kidney Disease",
    aliases=["kidney disease", "chronic kidney disease", "ckd",
             "renal failure", "renal disease", "kidney failure",
             "dialysis", "end-stage renal disease", "esrd"],
    followups=[
        FollowUpQuestion(
            question="What stage of kidney disease are you in (1-5), or do you know your eGFR?",
            attribute="ckd_stage",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Are you currently on dialysis?",
            attribute="on_dialysis",
            value_type="boolean",
        ),
        FollowUpQuestion(
            question="What's the underlying cause — diabetes, hypertension, or something else?",
            attribute="ckd_cause",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Are you being evaluated for or have you received a kidney transplant?",
            attribute="transplant_status",
            value_type="text",
        ),
    ],
))

# --- 17. Epilepsy ---
_register(ConditionCategory(
    category_id="epilepsy",
    display_name="Epilepsy",
    aliases=["epilepsy", "seizures", "seizure disorder",
             "epileptic", "convulsions"],
    followups=[
        FollowUpQuestion(
            question="What type of seizures do you have — focal, generalized, or both?",
            attribute="seizure_type",
            value_type="choice",
            choices=["focal", "generalized", "both", "not sure"],
        ),
        FollowUpQuestion(
            question="How many seizures have you had in the past month?",
            attribute="monthly_seizure_count",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="How many anti-seizure medications have you tried?",
            attribute="prior_med_count",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="What anti-seizure medications are you currently on?",
            attribute="current_medications",
            value_type="text",
        ),
    ],
))

# --- 18. Stroke ---
_register(ConditionCategory(
    category_id="stroke",
    display_name="Stroke",
    aliases=["stroke", "ischemic stroke", "hemorrhagic stroke",
             "tia", "transient ischemic attack", "cerebrovascular accident",
             "brain attack", "mini stroke"],
    followups=[
        FollowUpQuestion(
            question="Was it an ischemic stroke (blood clot) or hemorrhagic stroke (bleeding)?",
            attribute="stroke_type",
            value_type="choice",
            choices=["ischemic", "hemorrhagic", "TIA", "not sure"],
        ),
        FollowUpQuestion(
            question="When did the stroke occur?",
            attribute="time_since_event",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Do you have any remaining effects — like weakness, speech difficulty, or vision changes?",
            attribute="residual_deficits",
            value_type="text",
        ),
        FollowUpQuestion(
            question="What medications are you on now — blood thinners, statins, or blood pressure medications?",
            attribute="current_medications",
            value_type="text",
        ),
    ],
))

# --- 19. Obesity ---
_register(ConditionCategory(
    category_id="obesity",
    display_name="Obesity",
    aliases=["obesity", "obese", "morbid obesity", "severe obesity",
             "weight loss", "bmi over 30", "overweight"],
    followups=[
        FollowUpQuestion(
            question="Do you know your current BMI, or your height and weight?",
            attribute="bmi",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="Have you tried any weight-loss medications — like GLP-1 drugs (Ozempic, Wegovy), phentermine, or others?",
            attribute="prior_treatments",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Do you have any obesity-related conditions — like type 2 diabetes, sleep apnea, or high blood pressure?",
            attribute="complications",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Have you had or are you considering bariatric surgery?",
            attribute="bariatric_surgery_status",
            value_type="text",
        ),
    ],
))

# --- 20. Eczema / Dermatitis ---
_register(ConditionCategory(
    category_id="eczema",
    display_name="Eczema / Dermatitis",
    aliases=["eczema", "atopic dermatitis", "dermatitis",
             "skin rash", "atopic eczema", "contact dermatitis"],
    followups=[
        FollowUpQuestion(
            question="What percentage of your body is affected, roughly?",
            attribute="body_surface_area",
            value_type="numeric",
        ),
        FollowUpQuestion(
            question="How would you rate the severity — mild, moderate, or severe?",
            attribute="severity",
            value_type="choice",
            choices=["mild", "moderate", "severe"],
        ),
        FollowUpQuestion(
            question="What treatments have you tried — topical steroids, calcineurin inhibitors, biologics like Dupixent?",
            attribute="prior_treatments",
            value_type="text",
        ),
        FollowUpQuestion(
            question="How long have you been dealing with eczema?",
            attribute="diagnosis_duration_years",
            value_type="numeric",
        ),
    ],
))

# --- 21. Endometriosis ---
_register(ConditionCategory(
    category_id="endometriosis",
    display_name="Endometriosis",
    aliases=["endometriosis", "endo", "endometrial tissue",
             "painful periods", "pelvic pain"],
    followups=[
        FollowUpQuestion(
            question="Has your endometriosis been confirmed by surgery (laparoscopy), or is it a clinical diagnosis?",
            attribute="diagnosis_method",
            value_type="choice",
            choices=["surgically confirmed", "clinical diagnosis", "not sure"],
        ),
        FollowUpQuestion(
            question="What stage has your doctor mentioned — I (minimal), II (mild), III (moderate), or IV (severe)?",
            attribute="stage",
            value_type="choice",
            choices=["I", "II", "III", "IV", "not sure"],
        ),
        FollowUpQuestion(
            question="What treatments have you tried — hormonal therapy, pain management, or surgery?",
            attribute="prior_treatments",
            value_type="text",
        ),
        FollowUpQuestion(
            question="Are you trying to conceive, or is fertility a concern?",
            attribute="fertility_concern",
            value_type="boolean",
        ),
    ],
))


# ---------------------------------------------------------------------------
# Build alias → category_id index for fast lookup
# ---------------------------------------------------------------------------

_ALIAS_INDEX: Dict[str, str] = {}
for _cat in CONDITION_FOLLOWUPS.values():
    for _alias in _cat.aliases:
        _ALIAS_INDEX[_alias.lower()] = _cat.category_id


# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------

def detect_condition(condition_text: str) -> Optional[ConditionCategory]:
    """
    Match a patient-reported condition string to a known category.

    Tries exact alias match first, then substring matching.
    Returns None if no match found.
    """
    text = condition_text.strip().lower()

    # Exact alias match
    if text in _ALIAS_INDEX:
        return CONDITION_FOLLOWUPS[_ALIAS_INDEX[text]]

    # Substring match — prefer longest matching alias
    best_match: Optional[str] = None
    best_len = 0
    for alias, cat_id in _ALIAS_INDEX.items():
        if alias in text and len(alias) > best_len:
            best_match = cat_id
            best_len = len(alias)

    if best_match:
        return CONDITION_FOLLOWUPS[best_match]

    return None


def get_followup_questions(condition_text: str) -> List[Dict[str, Any]]:
    """
    Given a condition string, return follow-up questions as dicts.

    Returns:
        List of dicts with keys: question, attribute, value_type, choices, sensitive
        Empty list if condition not recognized.
    """
    category = detect_condition(condition_text)
    if not category:
        return []

    return [
        {
            "question": fq.question,
            "attribute": fq.attribute,
            "value_type": fq.value_type,
            "choices": fq.choices,
            "sensitive": fq.sensitive,
            "category": category.category_id,
            "category_display": category.display_name,
        }
        for fq in category.followups
    ]


# ---------------------------------------------------------------------------
# Answer parsing — extract typed values from patient responses
# ---------------------------------------------------------------------------

_YES_WORDS = {"yes", "yeah", "yep", "yea", "sure", "correct", "right",
              "true", "absolutely", "definitely", "it has", "i have", "i do"}
_NO_WORDS = {"no", "nope", "nah", "not", "never", "false", "none",
             "negative", "i haven't", "i don't", "it hasn't"}


def parse_answer(answer: str, followup: Dict[str, Any]) -> Tuple[str, Any]:
    """
    Parse a patient's free-text answer into a typed value.

    Args:
        answer: The patient's text response
        followup: The follow-up question dict (from get_followup_questions)

    Returns:
        (attribute_name, parsed_value)
    """
    attribute = followup["attribute"]
    value_type = followup["value_type"]
    text = answer.strip()

    if value_type == "boolean":
        return attribute, _parse_boolean(text)

    if value_type == "numeric":
        return attribute, _parse_numeric(text)

    if value_type == "choice":
        return attribute, _parse_choice(text, followup.get("choices", []))

    # text type — keep as-is
    return attribute, text


def _parse_boolean(text: str) -> Optional[bool]:
    low = text.lower()
    for word in _YES_WORDS:
        if word in low:
            return True
    for word in _NO_WORDS:
        if word in low:
            return False
    return None


def _parse_numeric(text: str) -> Optional[float]:
    # Extract numbers that stand alone (not embedded in words like "A1C")
    # Look for numbers preceded by start-of-string, space, or punctuation
    matches = re.findall(r'(?<![A-Za-z])(\d+\.?\d*)(?![A-Za-z])', text)
    if matches:
        # Take the most meaningful number (prefer decimals, then largest)
        best = None
        for m in matches:
            val = float(m)
            if best is None or ('.' in m and '.' not in str(best)) or val > best:
                best = val
        if best is not None:
            return int(best) if best == int(best) else best
    return None


def _parse_choice(text: str, choices: List[str]) -> Optional[str]:
    low = text.lower()
    # Exact match first
    for choice in choices:
        if choice.lower() == low:
            return choice
    # Substring match — longest first to avoid "I" matching before "III"
    sorted_choices = sorted(choices, key=len, reverse=True)
    for choice in sorted_choices:
        if choice.lower() in low:
            return choice
    # Return raw text as fallback
    return text


# ---------------------------------------------------------------------------
# Patient attribute integration
# ---------------------------------------------------------------------------

# Maps (category_id, attribute) → criteria attribute name for SMT matching
_ATTRIBUTE_TO_CRITERIA: Dict[Tuple[str, str], str] = {
    # Stage mappings
    ("breast_cancer", "metastatic_status"): "patient_has_finding_of_metastasis_now",
    ("breast_cancer", "stage"): "patient_cancer_stage",
    ("lung_cancer", "stage"): "patient_cancer_stage",
    ("liver_cancer", "stage"): "patient_cancer_stage",

    # Lab values
    ("type_2_diabetes", "a1c"): "patient_hba1c_value_recorded_now",
    ("kidney_disease", "on_dialysis"): "patient_is_on_dialysis_now",
    ("copd", "fev1_percent"): "patient_fev1_percent_predicted_value_recorded_now",
    ("heart_failure", "ejection_fraction"): "patient_lvef_value_recorded_now",
    ("hiv", "cd4_count"): "patient_cd4_count_value_recorded_now",
    ("obesity", "bmi"): "patient_bmi_value_recorded_now",

    # Smoking
    ("lung_cancer", "smoking_status"): "patient_is_current_smoker_now",
    ("copd", "smoking_status"): "patient_is_current_smoker_now",
}


def merge_followup_answers(
    patient_attrs: Dict[str, Any],
    category_id: str,
    answers: Dict[str, Any],
) -> Dict[str, Any]:
    """
    Merge parsed follow-up answers into the patient attribute dict
    used for eligibility matching.

    Args:
        patient_attrs: Existing patient attributes dict
        category_id: The condition category ID (e.g., "breast_cancer")
        answers: Dict of {attribute: parsed_value} from parse_answer()

    Returns:
        Updated patient_attrs dict with new attributes added
    """
    for attr, value in answers.items():
        if value is None:
            continue

        # Store the raw follow-up attribute for display
        patient_attrs[f"followup_{attr}"] = value

        # Map to criteria attribute if we have a known mapping
        criteria_key = _ATTRIBUTE_TO_CRITERIA.get((category_id, attr))
        if criteria_key:
            # Handle special conversions
            if attr == "smoking_status":
                patient_attrs[criteria_key] = (value == "current smoker")
            elif attr == "metastatic_status":
                patient_attrs[criteria_key] = bool(value)
            elif attr == "on_dialysis":
                patient_attrs[criteria_key] = bool(value)
            else:
                patient_attrs[criteria_key] = value

        # Generic stage handling for cancer types
        if attr == "stage" and category_id in (
            "breast_cancer", "lung_cancer", "liver_cancer",
        ):
            stage_map = {"I": 1, "II": 2, "III": 3, "IV": 4}
            numeric_stage = stage_map.get(str(value))
            if numeric_stage is not None:
                patient_attrs["patient_cancer_stage_numeric"] = numeric_stage
                if numeric_stage == 4:
                    patient_attrs["patient_has_finding_of_metastasis_now"] = True

    return patient_attrs
