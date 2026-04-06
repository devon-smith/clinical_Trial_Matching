"""
Concept canonicalization and audit module.

Provides transparency into how user search terms map to canonical medical
concepts, which concepts are included/excluded in search expansion, and
why certain queries succeed or fail. Built from the SNOMED-like canonical
variable names in the trial criteria database.
"""

import re
import sqlite3
from dataclasses import dataclass, field
from difflib import SequenceMatcher
from pathlib import Path
from typing import Any, Dict, List, Optional

DEFAULT_DB_PATH = Path(__file__).with_name("trial_data.sqlite")


# ---------------------------------------------------------------------------
# SNOMED-like concept hierarchy built from database criterion names
# ---------------------------------------------------------------------------

@dataclass
class MedicalConcept:
    """A canonical medical concept derived from the criteria database."""
    concept_id: str  # normalized key, e.g. "appendicitis"
    canonical_name: str  # human-readable, e.g. "Appendicitis"
    snomed_pattern: str  # the db attribute pattern, e.g. "patient_has_diagnosis_of_appendicitis_now"
    parent: Optional[str] = None  # parent concept_id
    children: List[str] = field(default_factory=list)
    siblings: List[str] = field(default_factory=list)
    related: List[str] = field(default_factory=list)
    trial_count: int = 0  # how many trials reference this concept
    # SNOMED-like metadata
    concept_type: str = "diagnosis"  # diagnosis, finding, procedure, measurement
    temporal: str = "now"  # now, inthehistory, inthepastNmonths


@dataclass
class ConceptMatch:
    """A match between a user query and a canonical concept."""
    concept: MedicalConcept
    match_score: float  # 0-1 similarity
    match_type: str  # "exact", "partial", "semantic", "parent", "child"
    matched_tokens: List[str] = field(default_factory=list)


@dataclass
class ConceptExpansion:
    """The full expansion tree for a user query."""
    query: str
    canonical_match: Optional[ConceptMatch] = None
    included_concepts: List[ConceptMatch] = field(default_factory=list)
    excluded_concepts: List[ConceptMatch] = field(default_factory=list)
    related_concepts: List[ConceptMatch] = field(default_factory=list)
    rejected_concepts: List[Dict[str, str]] = field(default_factory=list)
    trial_terms_matched: List[str] = field(default_factory=list)
    suggestions: List[str] = field(default_factory=list)
    query_success: bool = True
    failure_reason: str = ""


# ---------------------------------------------------------------------------
# Concept hierarchy definitions
# ---------------------------------------------------------------------------

# Parent-child relationships for building concept trees
_CONCEPT_HIERARCHY = {
    # Appendicitis family
    "appendicitis": {
        "parent": "disorder_of_appendix",
        "children": [
            "acute_appendicitis",
            "chronic_appendicitis",
            "perforated_appendicitis",
            "gangrenous_appendicitis",
            "abscess_of_appendix",
        ],
        "excluded_children": [
            "amebic_appendicitis",
            "tuberculous_appendicitis",
        ],
        "related": ["abdominal_pain", "peritonitis", "right_iliac_fossa_pain"],
    },
    # Diabetes family
    "diabetes_mellitus": {
        "parent": "disorder_of_endocrine_system",
        "children": [
            "type_1_diabetes_mellitus",
            "type_2_diabetes_mellitus",
            "gestational_diabetes",
            "diabetes_mellitus_type_2_in_obese",
            "insulin_dependent_diabetes_mellitus",
        ],
        "excluded_children": [
            "neonatal_diabetes_mellitus",
            "secondary_diabetes_mellitus",
        ],
        "related": [
            "hyperglycemia",
            "insulin_resistance",
            "diabetic_neuropathy",
            "diabetic_retinopathy",
            "diabetic_nephropathy",
            "metabolic_syndrome",
        ],
    },
    # Cardiovascular family
    "disorder_of_cardiovascular_system": {
        "parent": None,
        "children": [
            "hypertensive_disorder",
            "coronary_arteriosclerosis",
            "heart_failure",
            "cardiac_arrhythmia",
            "ischemic_heart_disease",
            "cardiomyopathy",
            "valvular_heart_disease",
            "peripheral_vascular_disease",
            "cerebrovascular_disease",
            "acute_coronary_syndrome",
            "acute_myocardial_infarction",
        ],
        "excluded_children": [],
        "related": ["chest_pain", "dyspnea", "edema"],
    },
    "hypertensive_disorder": {
        "parent": "disorder_of_cardiovascular_system",
        "children": [
            "essential_hypertension",
            "secondary_hypertension",
            "malignant_hypertension",
            "pulmonary_hypertension",
            "hypertensive_heart_disease",
        ],
        "excluded_children": [],
        "related": ["renal_artery_stenosis", "pheochromocytoma"],
    },
    # Cancer family
    "malignant_neoplastic_disease": {
        "parent": "neoplasm",
        "children": [
            "carcinoma",
            "sarcoma",
            "lymphoma",
            "leukemia",
            "melanoma",
            "breast_cancer",
            "lung_cancer",
            "colorectal_cancer",
            "prostate_cancer",
            "pancreatic_cancer",
            "hepatocellular_carcinoma",
            "gastric_cancer",
            "ovarian_cancer",
            "renal_cell_carcinoma",
            "bladder_cancer",
            "cervical_cancer",
            "head_and_neck_cancer",
        ],
        "excluded_children": [
            "benign_neoplasm",
            "carcinoma_in_situ",
        ],
        "related": ["tumor", "metastasis", "neoplasm"],
    },
    # Respiratory family
    "chronic_obstructive_lung_disease": {
        "parent": "disorder_of_respiratory_system",
        "children": [
            "chronic_bronchitis",
            "emphysema",
            "acute_exacerbation_of_chronic_obstructive_airways_disease",
        ],
        "excluded_children": [],
        "related": ["asthma", "bronchiectasis", "dyspnea", "cough"],
    },
    "asthma": {
        "parent": "disorder_of_respiratory_system",
        "children": [
            "allergic_asthma",
            "exercise_induced_asthma",
            "occupational_asthma",
            "severe_persistent_asthma",
        ],
        "excluded_children": [],
        "related": [
            "chronic_obstructive_lung_disease",
            "bronchospasm",
            "wheezing",
            "dyspnea",
        ],
    },
    # Mental health family
    "depressive_disorder": {
        "parent": "mental_disorder",
        "children": [
            "major_depressive_disorder",
            "dysthymic_disorder",
            "seasonal_affective_disorder",
            "postpartum_depression",
            "treatment_resistant_depression",
        ],
        "excluded_children": [
            "bipolar_disorder",
        ],
        "related": [
            "anxiety_disorder",
            "mental_disorder",
            "suicidal_ideation",
            "insomnia",
        ],
    },
    # Musculoskeletal family
    "arthritis": {
        "parent": "disorder_of_musculoskeletal_system",
        "children": [
            "rheumatoid_arthritis",
            "osteoarthritis",
            "psoriatic_arthritis",
            "juvenile_arthritis",
            "reactive_arthritis",
            "gouty_arthritis",
        ],
        "excluded_children": [
            "septic_arthritis",
        ],
        "related": ["joint_pain", "joint_swelling", "joint_stiffness"],
    },
    # Back pain family
    "low_back_pain": {
        "parent": "backache",
        "children": [
            "chronic_low_back_pain",
            "acute_low_back_pain",
            "lumbago",
        ],
        "excluded_children": [],
        "related": [
            "sciatica",
            "lumbar_spondylosis",
            "degenerative_disc_disease",
            "spinal_stenosis",
            "intervertebral_disc_prolapse",
            "radiculopathy",
            "back_pain",
        ],
    },
    # Knee pain family
    "knee_pain": {
        "parent": "joint_pain",
        "children": [
            "chronic_knee_pain",
            "anterior_knee_pain",
            "patellofemoral_pain_syndrome",
        ],
        "excluded_children": [
            "septic_arthritis_of_knee",
        ],
        "related": [
            "osteoarthritis",
            "arthritis",
            "meniscal_tear",
            "ligament_injury",
            "joint_pain",
            "joint_swelling",
        ],
    },
    # Hip pain family
    "hip_pain": {
        "parent": "joint_pain",
        "children": [
            "greater_trochanteric_pain_syndrome",
        ],
        "excluded_children": [],
        "related": [
            "osteoarthritis",
            "arthritis",
            "bursitis",
            "sciatica",
            "low_back_pain",
            "joint_pain",
        ],
    },
    # Obesity family
    "obesity": {
        "parent": "nutritional_disorder",
        "children": [
            "morbid_obesity",
            "childhood_obesity",
        ],
        "excluded_children": [],
        "related": [
            "overweight",
            "metabolic_syndrome",
            "body_mass_index",
            "weight_loss",
        ],
    },
    # Dementia family
    "dementia": {
        "parent": "cognitive_disorder",
        "children": [
            "alzheimer_disease",
            "vascular_dementia",
            "frontotemporal_dementia",
            "lewy_body_dementia",
        ],
        "excluded_children": [],
        "related": [
            "cognitive_impairment",
            "memory_loss",
            "confusion",
            "delirium",
        ],
    },
    # Pneumonia family
    "pneumonia": {
        "parent": "lower_respiratory_tract_infection",
        "children": [
            "community_acquired_pneumonia",
            "hospital_acquired_pneumonia",
            "viral_pneumonia",
            "bacterial_pneumonia",
            "aspiration_pneumonia",
        ],
        "excluded_children": [
            "pneumocystis_pneumonia",
        ],
        "related": [
            "lower_respiratory_tract_infection",
            "bronchitis",
            "cough",
            "fever",
            "dyspnea",
        ],
    },
}

# User-friendly aliases for common queries
_QUERY_ALIASES = {
    "diabetes": "diabetes_mellitus",
    "type 2 diabetes": "type_2_diabetes_mellitus",
    "type 1 diabetes": "type_1_diabetes_mellitus",
    "t2dm": "type_2_diabetes_mellitus",
    "t1dm": "type_1_diabetes_mellitus",
    "cancer": "malignant_neoplastic_disease",
    "tumor": "malignant_neoplastic_disease",
    "tumour": "malignant_neoplastic_disease",
    "heart disease": "disorder_of_cardiovascular_system",
    "cardiovascular disease": "disorder_of_cardiovascular_system",
    "cvd": "disorder_of_cardiovascular_system",
    "high blood pressure": "hypertensive_disorder",
    "hypertension": "hypertensive_disorder",
    "bp": "hypertensive_disorder",
    "copd": "chronic_obstructive_lung_disease",
    "chronic obstructive pulmonary disease": "chronic_obstructive_lung_disease",
    "depression": "depressive_disorder",
    "arthritis": "arthritis",
    "joint pain": "arthritis",
    "back pain": "low_back_pain",
    "lower back pain": "low_back_pain",
    "chronic lower back pain": "low_back_pain",
    "lbp": "low_back_pain",
    "chronic back pain": "low_back_pain",
    "obesity": "obesity",
    "overweight": "obesity",
    "dementia": "dementia",
    "alzheimer": "alzheimer_disease",
    "alzheimers": "alzheimer_disease",
    "pneumonia": "pneumonia",
    "appendicitis": "appendicitis",
    "knee pain": "knee_pain",
    "knee pain that won't go away": "knee_pain",
    "chronic knee pain": "knee_pain",
    "hip pain": "hip_pain",
    "glute problems": None,  # intentional failure case
    "butt pain": None,  # intentional failure case
}

# Suggestions for failed queries
_QUERY_SUGGESTIONS = {
    "glute problems": [
        "Try 'lower back pain' or 'sciatica' — gluteal pain is often related to lumbar spine conditions",
        "Try 'piriformis syndrome' for deep buttock pain",
        "Try 'hip pain' if the pain is in the hip/buttock area",
        "Try 'arthritis' if you have joint-related buttock discomfort",
    ],
    "butt pain": [
        "Try 'lower back pain' — buttock pain often originates from the lumbar spine",
        "Try 'sciatica' if the pain radiates down the leg",
        "Try 'piriformis syndrome' for deep buttock/gluteal pain",
    ],
}


# ---------------------------------------------------------------------------
# Main canonicalization class
# ---------------------------------------------------------------------------

class ConceptCanonicalizer:
    """
    Maps user queries to canonical medical concepts and provides
    transparency into search expansion.
    """

    def __init__(self, db_path: str = str(DEFAULT_DB_PATH)):
        self.db_path = db_path
        self._db_concepts: Dict[str, int] = {}  # concept_key -> trial_count
        self._load_db_concepts()

    def _load_db_concepts(self) -> None:
        """Load all diagnosis/finding concepts from the database with trial counts."""
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        cursor.execute("""
            SELECT criterion_type, COUNT(DISTINCT nct_id) as trial_count
            FROM criteria
            WHERE criterion_type LIKE 'patient_has_diagnosis_of_%'
               OR criterion_type LIKE 'patient_has_finding_of_%'
            GROUP BY criterion_type
        """)
        for row in cursor.fetchall():
            key = self._attr_to_concept_key(row[0])
            self._db_concepts[key] = row[1]
        conn.close()

    @staticmethod
    def _attr_to_concept_key(attr: str) -> str:
        """Convert a database attribute name to a concept key."""
        key = attr
        key = re.sub(r'^patient_has_(diagnosis|finding)_of_', '', key)
        key = re.sub(r'_(now|inthehistory|inthepast\d+\w+)$', '', key)
        return key

    @staticmethod
    def _concept_key_to_attr_pattern(key: str) -> str:
        """Convert a concept key back to a database attribute pattern."""
        return f"patient_has_diagnosis_of_{key}_"

    @staticmethod
    def _humanize_concept(key: str) -> str:
        """Convert a concept key to human-readable form."""
        return key.replace('_', ' ').title()

    def canonicalize_query(self, query: str) -> ConceptExpansion:
        """
        Map a user query to canonical concepts and generate the full
        expansion tree showing what's included, excluded, and related.
        """
        query_lower = query.lower().strip()
        expansion = ConceptExpansion(query=query)

        # Step 1: Check aliases first
        if query_lower in _QUERY_ALIASES:
            concept_id = _QUERY_ALIASES[query_lower]
            if concept_id is None:
                # Known failure case
                expansion.query_success = False
                expansion.failure_reason = (
                    f"'{query}' is not a recognized medical term in our system. "
                    f"We couldn't map it to any standard medical concept."
                )
                expansion.suggestions = _QUERY_SUGGESTIONS.get(query_lower, [
                    "Try using a more specific medical term",
                    "Describe the location and type of pain/symptom",
                    "Use common condition names (e.g., 'arthritis', 'diabetes')",
                ])
                return expansion
        else:
            # Step 2: Try fuzzy matching against known concepts
            concept_id = self._fuzzy_match_concept(query_lower)

        if not concept_id:
            # Step 3: Try matching against database concepts directly
            concept_id = self._match_db_concepts(query_lower)

        if not concept_id:
            expansion.query_success = False
            expansion.failure_reason = (
                f"'{query}' could not be mapped to a recognized medical concept. "
                f"The system searched through {len(self._db_concepts)} known medical "
                f"terms but found no confident match."
            )
            # Try to find near-misses for suggestions
            near = self._find_near_matches(query_lower, top_n=5)
            expansion.suggestions = [
                f"Did you mean '{self._humanize_concept(n)}'?" for n in near
            ]
            if not expansion.suggestions:
                expansion.suggestions = [
                    "Try using standard medical terminology",
                    "Describe your primary symptom or diagnosis",
                ]
            return expansion

        # Build the concept and its expansion tree
        concept = self._build_concept(concept_id)
        expansion.canonical_match = ConceptMatch(
            concept=concept,
            match_score=1.0 if query_lower in _QUERY_ALIASES else 0.8,
            match_type="exact" if query_lower in _QUERY_ALIASES else "fuzzy",
            matched_tokens=query_lower.split(),
        )

        # Get hierarchy
        hierarchy = _CONCEPT_HIERARCHY.get(concept_id, {})

        # Included children
        for child_id in hierarchy.get("children", []):
            child = self._build_concept(child_id)
            child.parent = concept_id
            expansion.included_concepts.append(ConceptMatch(
                concept=child,
                match_score=0.9,
                match_type="child",
            ))

        # Excluded children
        for excl_id in hierarchy.get("excluded_children", []):
            excl = self._build_concept(excl_id)
            expansion.excluded_concepts.append(ConceptMatch(
                concept=excl,
                match_score=0.6,
                match_type="excluded_child",
            ))
            expansion.rejected_concepts.append({
                "concept": self._humanize_concept(excl_id),
                "reason": f"Excluded from expansion: '{self._humanize_concept(excl_id)}' "
                          f"is a subtype of '{self._humanize_concept(concept_id)}' but "
                          f"is too specific or rare for general matching.",
            })

        # Related concepts (may-entail)
        for rel_id in hierarchy.get("related", []):
            rel = self._build_concept(rel_id)
            expansion.related_concepts.append(ConceptMatch(
                concept=rel,
                match_score=0.5,
                match_type="related",
            ))

        # Find matching trial eligibility terms
        expansion.trial_terms_matched = self._find_trial_terms(concept_id, hierarchy)

        return expansion

    def get_search_mapping(self, query: str) -> Dict[str, Any]:
        """
        Show the full transparency mapping for a user search query.

        Returns what canonical concepts were matched, what trial terms
        they map to, and what was considered but rejected.
        """
        expansion = self.canonicalize_query(query)
        return self.expansion_to_dict(expansion)

    def _build_concept(self, concept_id: str) -> MedicalConcept:
        """Build a MedicalConcept from a concept ID."""
        trial_count = self._db_concepts.get(concept_id, 0)

        # Check for the concept in DB with different temporal suffixes
        for suffix in ['', '_now', '_inthehistory']:
            key = concept_id + suffix if suffix else concept_id
            if key in self._db_concepts:
                trial_count = max(trial_count, self._db_concepts[key])

        hierarchy = _CONCEPT_HIERARCHY.get(concept_id, {})

        return MedicalConcept(
            concept_id=concept_id,
            canonical_name=self._humanize_concept(concept_id),
            snomed_pattern=f"patient_has_diagnosis_of_{concept_id}_now",
            parent=hierarchy.get("parent"),
            children=hierarchy.get("children", []),
            siblings=[],
            related=hierarchy.get("related", []),
            trial_count=trial_count,
        )

    def _fuzzy_match_concept(self, query: str) -> Optional[str]:
        """Try to match query against known concept hierarchy keys."""
        normalized = query.replace(' ', '_').lower()

        # Exact match in hierarchy
        if normalized in _CONCEPT_HIERARCHY:
            return normalized

        # Partial match
        for key in _CONCEPT_HIERARCHY:
            if normalized in key or key in normalized:
                return key

        return None

    def _match_db_concepts(self, query: str) -> Optional[str]:
        """Try to match query against database concept keys."""
        normalized = query.replace(' ', '_').lower()

        # Exact match
        if normalized in self._db_concepts:
            return normalized

        # Partial match — find best
        best_key = None
        best_score = 0.0
        for key in self._db_concepts:
            if normalized in key:
                score = len(normalized) / len(key)
                if score > best_score:
                    best_score = score
                    best_key = key
            elif key in normalized:
                score = len(key) / len(normalized)
                if score > best_score:
                    best_score = score
                    best_key = key

        if best_score > 0.4:
            return best_key

        # SequenceMatcher for fuzzy
        for key in self._db_concepts:
            ratio = SequenceMatcher(None, normalized, key).ratio()
            if ratio > 0.7 and ratio > best_score:
                best_score = ratio
                best_key = key

        return best_key

    def _find_near_matches(self, query: str, top_n: int = 5) -> List[str]:
        """Find the closest concept keys to a query."""
        normalized = query.replace(' ', '_').lower()
        scored = []

        # Check hierarchy keys
        for key in _CONCEPT_HIERARCHY:
            ratio = SequenceMatcher(None, normalized, key).ratio()
            scored.append((key, ratio))

        # Check DB concepts (sample to avoid scanning all 5000+)
        tokens = set(normalized.split('_'))
        for key in self._db_concepts:
            key_tokens = set(key.split('_'))
            overlap = tokens & key_tokens
            if overlap:
                ratio = len(overlap) / max(len(tokens), 1)
                scored.append((key, ratio))

        scored.sort(key=lambda x: x[1], reverse=True)
        return [k for k, _ in scored[:top_n]]

    def _find_trial_terms(
        self, concept_id: str, hierarchy: Dict
    ) -> List[str]:
        """Find actual database criterion terms that match this concept expansion."""
        terms = []

        # The canonical concept itself
        for key, count in self._db_concepts.items():
            if concept_id in key:
                human = self._humanize_concept(key)
                terms.append(f"{human} ({count} trials)")

        # Children
        for child_id in hierarchy.get("children", []):
            for key, count in self._db_concepts.items():
                if child_id in key and key not in [t.split(' (')[0].replace(' ', '_').lower() for t in terms]:
                    human = self._humanize_concept(key)
                    terms.append(f"{human} ({count} trials)")

        return terms[:20]  # Limit output

    def expansion_to_dict(self, exp: ConceptExpansion) -> Dict[str, Any]:
        """Convert a ConceptExpansion to a JSON-serializable dict."""

        def concept_match_dict(cm: ConceptMatch) -> Dict[str, Any]:
            return {
                "concept_id": cm.concept.concept_id,
                "canonical_name": cm.concept.canonical_name,
                "snomed_pattern": cm.concept.snomed_pattern,
                "parent": cm.concept.parent,
                "trial_count": cm.concept.trial_count,
                "match_score": round(cm.match_score, 2),
                "match_type": cm.match_type,
            }

        result: Dict[str, Any] = {
            "query": exp.query,
            "query_success": exp.query_success,
        }

        if not exp.query_success:
            result["failure_reason"] = exp.failure_reason
            result["suggestions"] = exp.suggestions
            return result

        result["canonical_concept"] = (
            concept_match_dict(exp.canonical_match)
            if exp.canonical_match else None
        )
        result["included_concepts"] = [
            concept_match_dict(cm) for cm in exp.included_concepts
        ]
        result["excluded_concepts"] = [
            concept_match_dict(cm) for cm in exp.excluded_concepts
        ]
        result["related_concepts"] = [
            concept_match_dict(cm) for cm in exp.related_concepts
        ]
        result["rejected_concepts"] = exp.rejected_concepts
        result["trial_terms_matched"] = exp.trial_terms_matched
        result["suggestions"] = exp.suggestions

        return result

    def build_tree_display(self, exp: ConceptExpansion) -> str:
        """Build a text-based tree display of the concept expansion."""
        if not exp.query_success:
            lines = [
                f"Query: '{exp.query}'",
                "Status: FAILED",
                f"Reason: {exp.failure_reason}",
                "",
                "Suggestions:",
            ]
            for s in exp.suggestions:
                lines.append(f"  - {s}")
            return "\n".join(lines)

        canon = exp.canonical_match
        lines = [
            f"Query: '{exp.query}'",
            f"Canonical Concept: {canon.concept.canonical_name}",
            f"  SNOMED Pattern: {canon.concept.snomed_pattern}",
            f"  Match Type: {canon.match_type} ({canon.match_score:.0%})",
            f"  Trials Using: {canon.concept.trial_count}",
            "",
        ]

        if exp.included_concepts:
            lines.append("Included Child Concepts (searched):")
            for cm in exp.included_concepts:
                marker = "+" if cm.concept.trial_count > 0 else " "
                lines.append(
                    f"  [{marker}] {cm.concept.canonical_name} "
                    f"({cm.concept.trial_count} trials)"
                )
            lines.append("")

        if exp.excluded_concepts:
            lines.append("Excluded Child Concepts (NOT searched):")
            for cm in exp.excluded_concepts:
                lines.append(f"  [-] {cm.concept.canonical_name}")
            for rej in exp.rejected_concepts:
                lines.append(f"      Reason: {rej['reason']}")
            lines.append("")

        if exp.related_concepts:
            lines.append("Related Concepts (may entail):")
            for cm in exp.related_concepts:
                lines.append(
                    f"  [~] {cm.concept.canonical_name} "
                    f"({cm.concept.trial_count} trials)"
                )
            lines.append("")

        if exp.trial_terms_matched:
            lines.append("Trial Eligibility Terms Matched:")
            for t in exp.trial_terms_matched[:10]:
                lines.append(f"  {t}")
            if len(exp.trial_terms_matched) > 10:
                lines.append(
                    f"  ... +{len(exp.trial_terms_matched) - 10} more"
                )

        return "\n".join(lines)
