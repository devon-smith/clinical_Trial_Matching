import json
import math
import sqlite3
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Union, Any

from rag_retriever import EligibilityRAG
from smt_matcher import SMTMatcher, ValueType
from llm_eligibility_judge import LLMEligibilityJudge, CriterionJudgment
from preference_scorer import PatientPreferences, score_preferences

DEFAULT_DB_PATH = Path(__file__).with_name("trial_data.sqlite")


class TrialMatcher:
    def __init__(self, db_path: Union[Path, str] = DEFAULT_DB_PATH, use_smt: bool = True):
        """
        Initialize the matcher with a deterministic TrialDB backend.
        
        Args:
            db_path: Path to the SQLite database
            use_smt: Whether to use SMT-based matching (more powerful but potentially slower)
        """
        self.db_path = str(db_path)
        self.rag = EligibilityRAG(self.db_path)
        self.use_smt = use_smt
        self.smt_matcher = SMTMatcher(self.db_path) if use_smt else None
        try:
            self.llm_judge = LLMEligibilityJudge()
        except Exception:
            self.llm_judge = None
    
    @property
    def trials(self):
        """Get the trials from the SMT matcher if available."""
        if self.smt_matcher:
            return self.smt_matcher.trials
        return {}

    def _connect(self) -> sqlite3.Connection:
        conn = sqlite3.connect(self.db_path)
        conn.row_factory = sqlite3.Row
        return conn

    def load_patient_attributes(self, patient_id: str) -> Dict[str, object]:
        """
        Load canonical patient facts from the SIGIR dataset that have been ingested into TrialDB.
        
        Args:
            patient_id: The ID of the patient to load
            
        Returns:
            Dictionary of patient attributes
            
        Raises:
            ValueError: If the patient ID is not found in the database
        """
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute(
            """
            SELECT attribute_name, value, value_type
            FROM patient_attributes
            WHERE patient_id = ?
            """,
            (patient_id,),
        )
        rows = cursor.fetchall()
        
        if not rows:
            conn.close()
            raise ValueError(f"Patient with ID '{patient_id}' not found in the database")
            
        attributes: Dict[str, object] = {}
        for row in rows:
            attr_name = row["attribute_name"]
            value = self._deserialize_value(row["value"], row["value_type"])
            current = attributes.get(attr_name)
            if isinstance(current, bool) and isinstance(value, bool):
                attributes[attr_name] = current or value
            else:
                attributes[attr_name] = value
        conn.close()
        return attributes

    def evaluate_trial(self, patient_attrs: Dict[str, object], nct_id: str) -> Tuple[str, List[str]]:
        """
        Evaluate whether a patient definition satisfies the eligibility criteria stored in TrialDB.

        Returns:
            Tuple of (status, missing_attributes)
            status: 'PASS' | 'FAIL' | 'MISSING'
            missing_attributes: List of attribute names needed
        """
        if not patient_attrs:
            # If no patient attributes provided, check what's needed
            conn = self._connect()
            cursor = conn.cursor()
            cursor.execute(
                """
                SELECT DISTINCT criterion_type 
                FROM criteria 
                WHERE nct_id = ? AND is_inclusion = 1
                """,
                (nct_id,),
            )
            missing = [row[0] for row in cursor.fetchall()]
            conn.close()
            return ("MISSING", missing)
            
        if self.use_smt and self.smt_matcher:
            # Use SMT-based evaluation if enabled
            result = self.smt_matcher.evaluate_trial(patient_attrs, nct_id)
            return (result['status'], result['missing_attrs'])
        else:
            # Fall back to the original rule-based evaluation
            return self._evaluate_trial_legacy(patient_attrs, nct_id)
            
    def _evaluate_trial_legacy(self, patient_attrs: Dict[str, object], nct_id: str) -> Tuple[str, List[str]]:
        """Legacy rule-based evaluation (kept for backward compatibility)."""
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute(
            """
            SELECT criterion_type, criterion_value, value_type, comparison, is_inclusion
            FROM criteria
            WHERE nct_id = ?
            """,
            (nct_id,),
        )
        trial_criteria = cursor.fetchall()
        conn.close()

        missing: List[str] = []
        for criterion in trial_criteria:
            attribute = criterion["criterion_type"]
            expected_value = criterion["criterion_value"]
            value_type = criterion["value_type"]
            comparison = criterion["comparison"]
            is_inclusion = bool(criterion["is_inclusion"])

            if attribute not in patient_attrs:
                missing.append(attribute)
                continue

            patient_value = patient_attrs[attribute]
            satisfied = self._evaluate_criterion(
                attribute,
                patient_value,
                expected_value,
                value_type,
                comparison,
            )

            if is_inclusion and not satisfied:
                return ("FAIL", [])
            if not is_inclusion and satisfied:
                return ("FAIL", [])

        if missing:
            return ("MISSING", missing)
        return ("PASS", [])

    def evaluate_patient(self, patient_id: str) -> Dict[str, Tuple[str, List[str]]]:
        """
        Convenience helper: load the patient's canonical attributes from TrialDB and score all trials.
        """
        patient_attrs = self.load_patient_attributes(patient_id)
        return self.get_all_matches(patient_attrs)
        
    def get_detailed_evaluation(self, patient_attrs: Dict[str, Any], nct_id: str) -> Dict[str, Any]:
        """
        Get a detailed evaluation of a patient against a specific trial.
        
        Returns:
            Dictionary containing:
            - status: 'PASS', 'FAIL', or 'MISSING'
            - missing_attrs: List of missing attributes
            - constraints: List of failed constraints with details
        """
        if self.use_smt and self.smt_matcher:
            return self.smt_matcher.evaluate_trial(patient_attrs, nct_id)
        else:
            status, missing = self._evaluate_trial_legacy(patient_attrs, nct_id)
            return {
                'status': status,
                'missing_attrs': missing,
                'constraints': []
            }

    def _get_trial_diseases(self, nct_id: str) -> str:
        """Retrieve the diseases field for a trial from the database."""
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute(
            "SELECT COALESCE(diseases, '') FROM trials WHERE nct_id = ?",
            (nct_id,),
        )
        row = cursor.fetchone()
        conn.close()
        return row[0] if row else ""

    def _get_trial_source(self, nct_id: str) -> str:
        """Return 'ctgov_api' or 'sigir' for a trial."""
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute(
            "SELECT COALESCE(source, 'sigir') FROM trials WHERE nct_id = ?",
            (nct_id,),
        )
        row = cursor.fetchone()
        conn.close()
        return row[0] if row else "sigir"

    def _get_eligibility_text(self, nct_id: str) -> str:
        """Retrieve free-text eligibility criteria for API-sourced trials."""
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute(
            "SELECT COALESCE(eligibility_text, '') FROM trials WHERE nct_id = ?",
            (nct_id,),
        )
        row = cursor.fetchone()
        conn.close()
        return row[0] if row else ""

    @staticmethod
    @staticmethod
    def compute_disease_relevance(
        patient_condition: str,
        trial_diseases: str,
        concept_set: Optional[set] = None,
    ) -> float:
        """
        Compute how relevant a trial's disease focus is to the patient's condition.

        Returns a score between -0.3 (mismatch penalty) and 1.0 (strong match).
        When a concept_set is provided, uses it for precise matching:
        - Primary concept match in trial diseases → high boost (1.0)
        - Child/related concept match → moderate boost (0.7)
        - Same broad category but different specific condition → penalty (-0.15)
        Falls back to token overlap when no concept_set.
        """
        if not patient_condition or not trial_diseases:
            return 0.0

        trial_lower = trial_diseases.lower().replace(",", " ")
        trial_tokens = set(trial_lower.split())
        stop_words = {
            "of", "the", "and", "or", "a", "an", "in", "for", "to",
            "with", "on", "at", "by", "is", "not",
        }
        trial_tokens -= stop_words

        # --- Concept-set-aware scoring ---
        if concept_set:
            # Check each concept against the trial's disease text
            primary_match = False
            child_match = False
            for cid in concept_set:
                concept_name = cid.replace('_', ' ')
                if concept_name in trial_lower:
                    primary_match = True
                    break
                # Also check with underscores removed for compound terms
                if cid in trial_lower.replace(' ', '_'):
                    child_match = True

            if primary_match:
                return 1.0
            if child_match:
                return 0.7

            # Check for broad category overlap (e.g., both are "cancer" but different types)
            broad_categories = {
                'cancer', 'diabetes', 'cardiovascular', 'respiratory',
                'arthritis', 'depression', 'anxiety', 'kidney', 'liver',
                'neurological', 'infectious',
            }
            condition_lower = patient_condition.lower()
            condition_cats = {c for c in broad_categories if c in condition_lower}
            trial_cats = {c for c in broad_categories if c in trial_lower}

            if condition_cats and trial_cats:
                if condition_cats & trial_cats:
                    # Same broad category but no specific concept match → penalty
                    return -0.15
                # Different categories entirely → stronger penalty
                return -0.3

            # No category signal at all → neutral
            return 0.0

        # --- Fallback: token overlap ---
        condition_tokens = set(patient_condition.lower().split()) - stop_words
        if not condition_tokens or not trial_tokens:
            return 0.0

        overlap = condition_tokens & trial_tokens
        if overlap:
            condition_coverage = len(overlap) / len(condition_tokens)
            return min(condition_coverage * 1.2, 1.0)

        return 0.0

    def _load_trial_characteristics(self, nct_id: str) -> Dict[str, str]:
        """Load trial characteristics from the database as a flat dict."""
        conn = sqlite3.connect(self.db_path)
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()
        cursor.execute(
            "SELECT characteristic_key, characteristic_value "
            "FROM trial_characteristics WHERE nct_id = ?",
            (nct_id,),
        )
        chars = {row["characteristic_key"]: row["characteristic_value"] for row in cursor.fetchall()}
        conn.close()
        return chars

    def score_trial(
        self,
        patient_attrs: Dict[str, Any],
        patient_text: str,
        nct_id: str,
        *,
        use_llm_judge: bool = True,
        concept_set: Optional[set] = None,
        preferences: Optional[PatientPreferences] = None,
        distance: Optional[float] = None,
    ) -> Dict[str, Any]:
        """
        Unified scoring: combine SMT constraint evaluation, RAG similarity,
        and optional LLM eligibility judgment.

        Hybrid approach: deterministic SMT for clear-cut boolean checks,
        LLM judge for criteria with missing/unclear data.

        Returns dict with match_score (0-100), eligibility_status, constraint
        counts, RAG score, LLM judgments, and per-criterion details.
        """
        trial_source = self._get_trial_source(nct_id)

        eval_result = self.get_detailed_evaluation(patient_attrs, nct_id)

        constraints = eval_result.get('constraints', [])
        hard_constraints = [c for c in constraints if c.get('hard_constraint')]
        soft_constraints = [c for c in constraints if not c.get('hard_constraint')]

        # --- For API-sourced trials without structured criteria, use eligibility text ---
        eligibility_text_for_llm = ""
        if trial_source == 'ctgov_api' and not hard_constraints:
            eligibility_text_for_llm = self._get_eligibility_text(nct_id)

        # --- LLM judge for unclear criteria ---
        llm_judgments: List[CriterionJudgment] = []
        unclear_criteria = [
            c for c in hard_constraints
            if not c.get('met') and c.get('attribute') not in patient_attrs
        ]
        if (
            use_llm_judge
            and self.llm_judge
            and patient_text
            and (unclear_criteria or eligibility_text_for_llm)
        ):
            try:
                if unclear_criteria:
                    llm_judgments = self.llm_judge.evaluate_criteria(
                        patient_text, unclear_criteria
                    )
                elif eligibility_text_for_llm:
                    # For API trials: pass the free-text eligibility as context
                    # The LLM judge can assess basic criteria from text
                    llm_judgments = self.llm_judge.evaluate_criteria(
                        patient_text,
                        [{"attribute": "eligibility_criteria", "value": eligibility_text_for_llm,
                          "hard_constraint": True, "operator": "text_match"}],
                    )
            except Exception as e:
                print(f"LLM judge error for {nct_id}: {e}")

        # Build lookup of LLM results
        llm_by_attr = {j.criterion: j for j in llm_judgments}

        # Count hard constraints with LLM upgrades
        hard_met = 0
        hard_failed_explicitly = 0
        for c in hard_constraints:
            attr = c.get('attribute', '')
            if c.get('met'):
                hard_met += 1
            elif attr in llm_by_attr and llm_by_attr[attr].status == "MET":
                hard_met += 1  # LLM resolved as MET
            elif attr in patient_attrs:
                hard_failed_explicitly += 1
            elif attr in llm_by_attr and llm_by_attr[attr].status == "NOT_MET":
                hard_failed_explicitly += 1  # LLM resolved as NOT_MET

        hard_total = len(hard_constraints)

        soft_met = sum(1 for c in soft_constraints if c.get('met'))
        soft_total = max(len(soft_constraints), 1)

        # Score components
        hard_evaluable = hard_met + hard_failed_explicitly
        hard_score = (
            hard_met / max(hard_evaluable, 1) if hard_evaluable > 0 else 0.5
        )
        soft_score = soft_met / soft_total

        rag_score = self.rag.score_trial(patient_text, nct_id) if patient_text else 0.0
        rag_normalized = min(rag_score * 3, 1.0)

        # Disease relevance — does this trial actually target the patient's condition?
        trial_diseases = self._get_trial_diseases(nct_id)
        disease_relevance = self.compute_disease_relevance(
            patient_text, trial_diseases, concept_set=concept_set,
        )

        # Clamp disease_relevance: allow negative (penalty) but floor at -0.3
        disease_relevance_clamped = max(disease_relevance, -0.3)

        # Scoring: disease relevance gets 25% weight
        # Negative relevance penalizes mismatched trials
        eligibility = (
            0.30 * hard_score
            + 0.15 * soft_score
            + 0.30 * rag_normalized
            + 0.25 * disease_relevance_clamped
        )

        # Distance score — always applied, sigmoid decay around d_max
        distance_score = 0.5  # neutral when distance unknown
        if distance is not None:
            d_max = 150.0  # default: 150 mile radius
            if preferences and preferences.travel_willingness:
                from preference_scorer import TRAVEL_DISTANCE_MAP
                d_max = TRAVEL_DISTANCE_MAP.get(preferences.travel_willingness, d_max)
            k = 1.2 / d_max  # steeper decay for tighter travel radius
            distance_score = 1.0 / (1.0 + math.exp(k * (distance - d_max)))

        base = 0.85 * eligibility + 0.15 * distance_score

        # Blend patient preferences when available
        pref_result = None
        if preferences is not None:
            trial_chars = self._load_trial_characteristics(nct_id)
            pref_result = score_preferences(preferences, trial_chars, distance)
            pref_score = pref_result["preference_score"]
            combined = 0.82 * base + 0.18 * pref_score
        else:
            combined = base

        # Source boost: API trials have real location/status data → small boost
        if trial_source == 'ctgov_api':
            combined = min(combined + 0.03, 1.0)

        match_score = max(0, min(100, int(round(combined * 100))))

        # Eligibility status
        if eval_result['status'] == 'PASS' and hard_failed_explicitly == 0:
            eligibility_status = 'eligible'
        elif hard_failed_explicitly == 0:
            eligibility_status = 'review_needed'
        elif hard_failed_explicitly > 0:
            eligibility_status = 'not_eligible'
        else:
            eligibility_status = 'review_needed'

        # Build criteria details with LLM annotations
        criteria_details = []
        for c in constraints:
            attr = c.get('attribute', '')
            detail = {
                'attribute': attr,
                'operator': c.get('operator', ''),
                'value': c.get('value', ''),
                'description': c.get('description', ''),
                'is_inclusion': c.get('is_inclusion', True),
                'met': c.get('met', False),
                'hard': c.get('hard_constraint', True),
            }
            # Annotate with LLM judgment if available
            if attr in llm_by_attr:
                j = llm_by_attr[attr]
                detail['llm_status'] = j.status
                detail['llm_confidence'] = j.confidence
                detail['llm_evidence'] = j.evidence
                detail['llm_reasoning'] = j.reasoning
                if j.status == 'MET':
                    detail['met'] = True
            criteria_details.append(detail)

        result = {
            'match_score': match_score,
            'hard_met': hard_met,
            'hard_total': hard_total,
            'soft_met': soft_met,
            'soft_total': len(soft_constraints),
            'eligibility_status': eligibility_status,
            'rag_score': rag_score,
            'criteria_details': criteria_details,
            'llm_judgments_count': len(llm_judgments),
            'source': trial_source,
        }
        if pref_result is not None:
            result['preference_score'] = pref_result['preference_score']
            result['preference_breakdown'] = pref_result['breakdown']

        return result

    def rag_rank_patient(self, patient_id: str, top_n: int = 10) -> List[Tuple[str, float]]:
        """Rank trials by semantic similarity between the patient note and eligibility text."""
        note = self._fetch_patient_note(patient_id)
        if not note.strip():
            return []
        return self.rag.score_patient(note, top_n=top_n)

    def get_all_matches(self, patient_attrs: Dict[str, object]) -> Dict[str, Tuple[str, List[str]]]:
        """
        Evaluate patient against all trials stored in TrialDB.
        """
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute("SELECT nct_id FROM trials")
        trial_ids = [row[0] for row in cursor.fetchall()]
        conn.close()

        results: Dict[str, Tuple[str, List[str]]] = {}
        for nct_id in trial_ids:
            results[nct_id] = self.evaluate_trial(patient_attrs, nct_id)
        return results

    def _deserialize_value(self, raw_value: Optional[str], value_type: Optional[str]) -> object:
        """Convert JSON stored values back into Python types."""
        decoded: object
        if raw_value is None:
            decoded = None
        else:
            try:
                decoded = json.loads(raw_value)
            except (json.JSONDecodeError, TypeError):
                decoded = raw_value

        if value_type is None:
            return decoded

        value_type = value_type.lower()
        try:
            if value_type in {"int", "integer"} and decoded is not None:
                return int(decoded)
            if value_type in {"float", "double"} and decoded is not None:
                return float(decoded)
            if value_type == "bool":
                if isinstance(decoded, bool):
                    return decoded
                if isinstance(decoded, str):
                    return decoded.strip().lower() in {"true", "1", "yes"}
        except (ValueError, TypeError):
            return decoded
        return decoded

    def _evaluate_criterion(
        self,
        criterion_type: str,
        patient_value: object,
        criterion_value: str,
        value_type: Optional[str],
        comparison: Optional[str],
    ) -> bool:
        """
        Deterministic evaluation logic for each criterion template.
        """
        comparison = (comparison or "equals").lower()
        value_type = (value_type or "").lower()
        patient_value = self._normalize_patient_value(patient_value, value_type)

        if criterion_type == "age" or (value_type in {"int", "float"} and "-" in str(criterion_value)):
            return self._evaluate_range(patient_value, criterion_value)

        if criterion_type == "gender":
            return str(patient_value).upper() == str(criterion_value).upper()

        if criterion_type == "diagnosis":
            return str(criterion_value).lower() in str(patient_value).lower()

        if value_type == "bool":
            expected = criterion_value.strip().lower() in {"true", "1", "yes"}
            return bool(patient_value) == expected

        if comparison == "equals":
            return str(patient_value).lower() == str(criterion_value).lower()

        return False

    def _normalize_patient_value(self, patient_value: object, value_type: str) -> object:
        if value_type in {"int", "float"}:
            try:
                return float(patient_value)
            except (TypeError, ValueError):
                return patient_value
        if value_type == "bool":
            if isinstance(patient_value, bool):
                return patient_value
            if isinstance(patient_value, str):
                return patient_value.strip().lower() in {"true", "1", "yes"}
        return patient_value

    def _evaluate_range(self, patient_value: object, criterion_value: str) -> bool:
        try:
            min_str, max_str = criterion_value.split("-")
            min_val = float(min_str.strip())
            max_val = float(max_str.strip())
            patient_num = float(patient_value)
            return min_val <= patient_num <= max_val
        except (ValueError, TypeError):
            return False

    def _fetch_patient_note(self, patient_id: str) -> str:
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute("SELECT note FROM patients WHERE patient_id = ?", (patient_id,))
        row = cursor.fetchone()
        conn.close()
        return row["note"] if row and row["note"] else ""


def run_test_cases():
    """
    Smoke tests to ensure deterministic behavior when working with the SIGIR dataset.
    These tests assume `setup_database.py --reset` and `load_trial_data.py` have already run.
    """
    matcher = TrialMatcher()

    patient_attrs = matcher.load_patient_attributes("sigir-20141")
    assert patient_attrs, "Expected patient attributes for sigir-20141"

    result = matcher.evaluate_trial(patient_attrs, "NCT00133328")
    assert result[0] in {"PASS", "MISSING", "FAIL"}
    print(f"Trial NCT00133328 evaluation for sigir-20141: {result}")

    # Ensure the helper can score an entire patient without raising errors.
    patient_results = matcher.evaluate_patient("sigir-20141")
    assert "NCT00133328" in patient_results
    print("evaluate_patient produced", len(patient_results), "trial outcomes")


if __name__ == "__main__":
    run_test_cases()
