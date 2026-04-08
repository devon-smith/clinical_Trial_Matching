"""
dynamic_followups.py
--------------------
Discovers follow-up questions by analyzing the criteria that matched trials
actually check, rather than relying on hardcoded disease-category mappings.

Flow:
  1. Patient reports a condition  →  lightweight trial lookup by disease
  2. Gather criteria those trials use
  3. Remove criteria we already know (age, sex, the condition itself)
  4. Rank by impact (trial count × hard-constraint weight)
  5. Feed into criteria_question_mapper to generate grouped questions
  6. Return top 3-5 questions
"""

from __future__ import annotations

import sqlite3
from typing import Dict, List, Optional

from criteria_question_mapper import (
    QuestionTemplate,
    generate_questions_from_criteria,
)

# Default path to the trial database
_DEFAULT_DB = "trial_data.sqlite"

# Maximum questions to return
_MAX_QUESTIONS = 5

# Minimum trial count for a criterion to be worth asking about
_MIN_TRIAL_COUNT = 2

# Criteria entity substrings to skip — already known or not patient-askable
_SKIP_SUBSTRINGS = [
    "patient_age_",
    "patient_sex_is_",
    "patient_aged_",
    # Administrative / procedural — not things patients can answer
    "informed_consent",
    "written_informed_consent",
    "encounter_for_check_up",
    "follow_up_visit",
    "collection_of_blood_specimen",
    "complete_blood_count",
    "laboratory_test",
    "medical_record_not_available",
    "insufficient_clinical_detail",
    "imaging_",
    "can_undergo_biopsy",
    "can_undergo_excision",
    # Too vague to ask about
    "is_exposed_to_drug_or_medicament",
    "has_finding_of_disease_now",
    # Clinical findings patients can't self-assess
    "prognosis_outlook",
    "preinfarction_syndrome",
    "disorder_of_hemostasis",
    "calcinosis",
    "sclerodactyly",
    "telangiectasia",
    "esophageal_motility",
    "raynaud_phenomenon",
    # Overly generic
    "finding_of_co_morbid_conditions",
    "neoplasm_now",
    "malignant_neoplastic_disease_now",
    "disease_condition_finding",
]


def _should_skip(criterion_type: str) -> bool:
    """Check if a criterion should be skipped (already known or not askable)."""
    for sub in _SKIP_SUBSTRINGS:
        if sub in criterion_type:
            return True
    return False


def discover_followup_questions(
    condition: str,
    known_attrs: Optional[Dict] = None,
    patient_data: Optional[Dict] = None,
    db_path: str = _DEFAULT_DB,
    max_questions: int = _MAX_QUESTIONS,
    trial_ids: Optional[List[str]] = None,
) -> List[QuestionTemplate]:
    """Discover the most impactful follow-up questions for a patient's condition.

    Queries the trial database to find which criteria are most commonly used
    by trials matching the patient's condition, then generates human-friendly
    questions for the most impactful unknowns.

    Args:
        condition: The patient's reported condition (e.g., "stomach cancer")
        known_attrs: Dict of attributes already known about the patient.
            Keys matching criterion_types will be excluded from questions.
        patient_data: Dict with patient demographics (age, gender) for
            filtering irrelevant questions (e.g., pregnancy for males).
        db_path: Path to the SQLite database.
        max_questions: Maximum number of questions to return.
        trial_ids: Optional pre-computed list of trial NCT IDs. If provided,
            skips the internal trial lookup (useful when the caller already
            did preliminary retrieval).

    Returns:
        List of QuestionTemplate objects, sorted by priority (highest first).
    """
    known_attrs = known_attrs or {}
    patient_data = patient_data or {}

    # 1. Find trials matching the condition (or use pre-supplied IDs)
    if trial_ids is None:
        trial_ids = _find_matching_trial_ids(condition, db_path)
    if not trial_ids:
        return []

    print(f"  Dynamic followups: {len(trial_ids)} candidate trials for '{condition}'")

    # 2. Gather criteria from those trials, ranked by frequency
    criteria = _gather_ranked_criteria(trial_ids, db_path)
    if not criteria:
        print("  Dynamic followups: no criteria found")
        return []

    print(f"  Dynamic followups: {len(criteria)} unresolved criteria found")

    # 3. Filter out known attributes
    criteria = _filter_known(criteria, known_attrs)

    # 3b. Filter out criteria about unrelated conditions
    criteria = _filter_unrelated_conditions(criteria, condition)

    # 4. Generate questions
    questions = generate_questions_from_criteria(criteria)

    # 5. Filter by patient demographics
    questions = _filter_by_demographics(questions, patient_data)

    print(f"  Dynamic followups: asking top {min(max_questions, len(questions))} of {len(questions)} questions")

    # 6. Return top N
    return questions[:max_questions]


def _filter_by_demographics(
    questions: List[QuestionTemplate],
    patient_data: Dict,
) -> List[QuestionTemplate]:
    """Remove questions that are irrelevant based on patient demographics."""
    gender = (patient_data.get("gender") or "").lower().strip()
    condition = (patient_data.get("primary_condition") or "").lower()

    # Attribute keys that are redundant if the patient already stated their condition
    _REDUNDANT_IF_CONDITION_STATED = {
        "diagnosis_malignant_neoplastic_disease",  # "diagnosed with cancer?" when they said cancer
        "finding_malignant_neoplastic_disease",     # "do you have cancer?"
        "finding_disease",                          # "do you have a disease?"
        "diagnosis_diabetes_mellitus",              # "diagnosed with diabetes?" when they said diabetes
        "finding_disease_condition_finding",         # "do you have a medical condition?"
    }

    # Also check if the question is about the same condition the patient stated
    # (e.g., "diagnosed with COPD?" when they said "COPD")
    condition_words = set(condition.split())

    # Map common abbreviations to their full forms for matching
    _CONDITION_EXPANSIONS: Dict[str, List[str]] = {
        "copd": ["chronic", "obstructive", "lung"],
        "ms": ["multiple", "sclerosis"],
        "chf": ["congestive", "heart", "failure"],
        "ckd": ["chronic", "kidney", "disease"],
        "hiv": ["human", "immunodeficiency", "virus"],
        "ra": ["rheumatoid", "arthritis"],
        "t2d": ["type", "diabetes"],
    }
    for abbr, expansions in _CONDITION_EXPANSIONS.items():
        if abbr in condition_words:
            condition_words.update(expansions)

    def _is_condition_echo(q: QuestionTemplate) -> bool:
        """Check if a question is just echoing back the patient's condition."""
        # Check question text for condition words
        q_words = set(q.question_text.lower().split())
        overlap = condition_words & q_words
        significant = [w for w in overlap if len(w) > 3]
        return len(significant) >= 2

    filtered = []
    for q in questions:
        # Skip pregnancy/breastfeeding for males
        if q.attribute_key == "pregnancy_status" and gender in ("male", "m", "man"):
            continue
        # Skip redundant "do you have X" when patient already stated their condition
        if q.attribute_key in _REDUNDANT_IF_CONDITION_STATED and condition:
            continue
        # Skip questions that echo back the patient's condition
        if condition and _is_condition_echo(q):
            continue
        filtered.append(q)

    return filtered


def _find_matching_trial_ids(condition: str, db_path: str) -> List[str]:
    """Find trial NCT IDs matching the patient's condition.

    Prioritizes condition-specific matches over broad category matches:
    1. Full-phrase match on diseases/conditions columns (both tables)
    2. Concept-expanded matches (glioblastoma, glioma for brain cancer)
    3. Only if < 5 results: broaden to individual word matches — but
       never let a single generic word like 'cancer' drive retrieval alone
    """
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()
    condition_lower = condition.lower().strip()

    # --- Step 1: Full-phrase search across both tables ---
    specific_ids: set = set()

    # Build phrase-level search terms: the condition + concept expansions
    phrase_terms = [condition_lower]
    try:
        from concept_canonicalizer import ConceptCanonicalizer
        canon = ConceptCanonicalizer(db_path)
        exp = canon.canonicalize_query(condition_lower)
        if exp.query_success and exp.canonical_match:
            phrase_terms.append(exp.canonical_match.concept.canonical_name.lower())
            for child in exp.included_concepts[:6]:
                phrase_terms.append(child.concept.canonical_name.lower())
    except Exception:
        pass

    # Deduplicate while preserving order
    seen_terms: set = set()
    unique_phrases = []
    for t in phrase_terms:
        if t not in seen_terms:
            seen_terms.add(t)
            unique_phrases.append(t)

    for term in unique_phrases:
        like = f"%{term}%"
        # SIGIR trials table
        cur.execute(
            "SELECT nct_id FROM trials WHERE LOWER(diseases) LIKE ? OR LOWER(title) LIKE ?",
            (like, like),
        )
        for row in cur.fetchall():
            specific_ids.add(row[0])
        # ct_gov_trials table
        try:
            cur.execute(
                "SELECT nct_id FROM ct_gov_trials WHERE LOWER(diseases) LIKE ? OR LOWER(title) LIKE ?",
                (like, like),
            )
            for row in cur.fetchall():
                specific_ids.add(row[0])
        except Exception:
            pass

    # If we have 5+ specific results, use only those
    if len(specific_ids) >= 5:
        conn.close()
        print(f"  Trial ID lookup: {len(specific_ids)} specific matches for '{condition}'")
        return list(specific_ids)

    # --- Step 2: Broaden with individual words (excluding generic terms) ---
    _GENERIC_WORDS = {"cancer", "disease", "disorder", "syndrome", "condition",
                      "type", "chronic", "acute", "primary", "secondary"}
    words = condition_lower.split()
    broad_terms = [w for w in words if len(w) > 3 and w not in _GENERIC_WORDS]

    broad_ids: set = set()
    for term in broad_terms:
        like = f"%{term}%"
        cur.execute(
            "SELECT nct_id FROM trials WHERE LOWER(diseases) LIKE ?",
            (like,),
        )
        for row in cur.fetchall():
            broad_ids.add(row[0])
        try:
            cur.execute(
                "SELECT nct_id FROM ct_gov_trials WHERE LOWER(diseases) LIKE ?",
                (like,),
            )
            for row in cur.fetchall():
                broad_ids.add(row[0])
        except Exception:
            pass

    all_ids = specific_ids | broad_ids
    conn.close()
    print(f"  Trial ID lookup: {len(specific_ids)} specific + {len(broad_ids)} broad = {len(all_ids)} total for '{condition}'")
    return list(all_ids)


def _gather_ranked_criteria(
    trial_ids: List[str],
    db_path: str,
) -> List[Dict]:
    """Gather and rank criteria used by the given trials.

    Returns criteria sorted by trial_count descending, with metadata
    needed for question generation.
    """
    if not trial_ids:
        return []

    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    placeholders = ",".join("?" * len(trial_ids))
    cur.execute(f"""
        SELECT
            criterion_type,
            MAX(is_inclusion) as is_inclusion,
            MAX(hard_constraint) as hard_constraint,
            COUNT(DISTINCT nct_id) as trial_count
        FROM criteria
        WHERE nct_id IN ({placeholders})
        GROUP BY criterion_type
        HAVING trial_count >= ?
        ORDER BY trial_count DESC
    """, [*trial_ids, _MIN_TRIAL_COUNT])

    results = []
    for row in cur.fetchall():
        ct = row[0]
        if _should_skip(ct):
            continue
        results.append({
            "criterion_type": ct,
            "is_inclusion": bool(row[1]),
            "hard_constraint": bool(row[2]),
            "trial_count": row[3],
        })

    # If we have very few results with min_count >= 2, also include
    # criteria appearing in just 1 trial (but cap at top 30)
    if len(results) < 10:
        cur.execute(f"""
            SELECT
                criterion_type,
                MAX(is_inclusion) as is_inclusion,
                MAX(hard_constraint) as hard_constraint,
                COUNT(DISTINCT nct_id) as trial_count
            FROM criteria
            WHERE nct_id IN ({placeholders})
            GROUP BY criterion_type
            ORDER BY trial_count DESC
            LIMIT 60
        """, trial_ids)

        seen = {r["criterion_type"] for r in results}
        for row in cur.fetchall():
            ct = row[0]
            if ct in seen or _should_skip(ct):
                continue
            results.append({
                "criterion_type": ct,
                "is_inclusion": bool(row[1]),
                "hard_constraint": bool(row[2]),
                "trial_count": row[3],
            })

    conn.close()
    return results


def _filter_unrelated_conditions(
    criteria: List[Dict],
    patient_condition: str,
) -> List[Dict]:
    """Remove criteria that are about a DIFFERENT specific condition than the patient's.

    For example, if the patient has brain cancer, remove criteria like:
    - patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix
    - patient_has_diagnosis_of_basal_cell_carcinoma_of_skin

    But keep generic criteria that apply to all conditions:
    - patient_has_diagnosis_of_secondary_malignant_neoplastic_disease (metastasis)
    - patient_is_pregnant_now
    """
    if not patient_condition:
        return criteria

    # Build a set of words from the patient's condition for matching
    cond_lower = patient_condition.lower().replace('-', ' ')
    cond_words = set(cond_lower.split()) - {'of', 'the', 'and', 'or', 'a', 'an', 'with', 'type'}

    # Body parts / organ systems that indicate a DIFFERENT condition
    _BODY_SITES = {
        'cervix', 'cervical', 'uterine', 'uterus', 'ovarian', 'ovary',
        'prostate', 'prostatic', 'breast', 'mammary',
        'lung', 'pulmonary', 'bronchial',
        'colon', 'colorectal', 'rectal', 'gastric', 'stomach', 'esophageal',
        'hepatic', 'liver', 'pancreatic', 'pancreas',
        'renal', 'kidney', 'bladder',
        'thyroid', 'adrenal',
        'skin', 'cutaneous', 'melanoma',
        'brain', 'cerebral', 'intracranial', 'glioma', 'glioblastoma',
        'bone', 'osseous',
        'testicular', 'testis',
        'endometrial', 'vulvar',
        'head_and_neck', 'laryngeal', 'pharyngeal', 'oral',
    }

    def _is_unrelated_diagnosis(ct: str) -> bool:
        """Check if a criterion is a diagnosis/finding for a body site different from the patient's."""
        # Only filter diagnosis-type criteria
        if 'has_diagnosis_of_' not in ct and 'has_finding_of_' not in ct:
            return False

        # Extract the condition part from the criterion
        crit_parts = ct.lower().replace('patient_has_diagnosis_of_', '').replace('patient_has_finding_of_', '')
        crit_words = set(crit_parts.replace('_', ' ').split()) - {'now', 'inthehistory'}

        # Check if ANY word from the criterion matches the patient's condition
        if cond_words & crit_words:
            return False  # Related to patient's condition

        # Check if the criterion mentions a specific body site
        crit_sites = crit_words & _BODY_SITES
        if crit_sites:
            # This criterion is about a specific body site
            # Check if the patient's condition shares any site words
            patient_sites = cond_words & _BODY_SITES
            if patient_sites and not (patient_sites & crit_sites):
                # Different body site — filter it out
                return True

        return False

    filtered = [c for c in criteria if not _is_unrelated_diagnosis(c['criterion_type'])]
    removed = len(criteria) - len(filtered)
    if removed > 0:
        print(f"  Filtered {removed} unrelated-condition criteria")
    return filtered


def _filter_known(
    criteria: List[Dict],
    known_attrs: Dict,
) -> List[Dict]:
    """Remove criteria that the patient has already answered."""
    if not known_attrs:
        return criteria

    # Build a set of criterion_types we already have data for (or already asked)
    known_criterion_types = set()
    for key in known_attrs:
        # Include all keys — even None values mean "already asked"
        known_criterion_types.add(key)

    return [c for c in criteria if c["criterion_type"] not in known_criterion_types]
