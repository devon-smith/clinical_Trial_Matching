"""
Conversational assistant loop that prioritizes missing patient attributes
using TrialDB rankings and trial characteristics.
"""

from __future__ import annotations

import sqlite3
from dataclasses import dataclass, field
from pathlib import Path
from typing import Callable, Dict, List, Optional, Sequence, Set, Tuple

from Matcher import DEFAULT_DB_PATH, TrialMatcher
from llm_questioner import LLMQuestionGenerator

QuestionProvider = Callable[[str], str]


@dataclass
class PreferenceState:
    excluded_trials: Set[str] = field(default_factory=set)
    excluded_modalities: Set[str] = field(default_factory=set)

    def summary(self) -> str:
        segments = []
        if self.excluded_modalities:
            segments.append(f"avoid modalities: {', '.join(sorted(self.excluded_modalities))}")
        if self.excluded_trials:
            segments.append(f"skip trials: {', '.join(sorted(self.excluded_trials))}")
        return "; ".join(segments)


class ConversationalTrialAssistant:
    def __init__(
        self,
        db_path: Path | str = DEFAULT_DB_PATH,
        question_generator: Optional[LLMQuestionGenerator] = None,
    ):
        self.db_path = str(db_path)
        self.matcher = TrialMatcher(db_path)
        self.question_generator = question_generator or LLMQuestionGenerator()
        self._characteristic_cache: Dict[str, Dict] = {}
        self.last_preferences: Optional[PreferenceState] = None

    def _connect(self) -> sqlite3.Connection:
        conn = sqlite3.connect(self.db_path)
        conn.row_factory = sqlite3.Row
        return conn

    def get_ranked_trials(self, patient_id: str, limit: int = 10) -> List[sqlite3.Row]:
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute(
            """
            SELECT ptr.nct_id,
                   ptr.rank,
                   t.title,
                   t.phase,
                   t.status
            FROM patient_trial_rankings AS ptr
            JOIN trials t ON t.nct_id = ptr.nct_id
            WHERE ptr.patient_id = ?
            ORDER BY COALESCE(ptr.rank, 100000)
            LIMIT ?
            """,
            (patient_id, limit),
        )
        rows = cursor.fetchall()
        conn.close()
        return rows

    def rank_missing_attributes(
        self, patient_attrs: Dict[str, object], ranked_trials: Sequence[sqlite3.Row]
    ) -> List[Tuple[str, Dict]]:
        scored: Dict[str, Dict] = {}
        for idx, trial in enumerate(ranked_trials):
            nct_id = trial["nct_id"]
            rank = trial["rank"] or (idx + 1)
            weight = 1.0 / max(rank, 1)
            status, missing = self.matcher.evaluate_trial(patient_attrs, nct_id)
            if status == "PASS":
                continue
            for attribute in missing:
                slot = scored.setdefault(attribute, {"score": 0.0, "trials": [], "characteristics": {}})
                slot["score"] += weight
                slot["trials"].append(
                    {
                        "nct_id": nct_id,
                        "rank": rank,
                        "title": trial["title"],
                        "phase": trial["phase"],
                    }
                )
        return sorted(scored.items(), key=lambda item: item[1]["score"], reverse=True)

    def fetch_trial_characteristics(self, nct_id: str) -> Dict[str, Dict]:
        if nct_id in self._characteristic_cache:
            return self._characteristic_cache[nct_id]
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute(
            """
            SELECT characteristic_key, characteristic_value, value_type
            FROM trial_characteristics
            WHERE nct_id = ?
            """,
            (nct_id,),
        )
        data = {
            row["characteristic_key"]: {
                "value": row["characteristic_value"],
                "value_type": row["value_type"],
            }
            for row in cursor.fetchall()
        }
        conn.close()
        self._characteristic_cache[nct_id] = data
        return data

    def describe_trial(self, trial_row: Dict, rag_scores: Optional[Dict[str, float]] = None) -> str:
        characteristics = self.fetch_trial_characteristics(trial_row["nct_id"])
        # More natural phrasing
        phase = trial_row.get("phase", "a clinical trial").lower()
        title = trial_row.get("title", "This study")
        # Build description parts naturally
        description = [f"{title} is {phase}"]
        # Add intervention if available
        intervention = characteristics.get("intervention_modality", {}).get("value")
        if intervention:
            description.append(f"testing {intervention.lower()}")
        # Add risk profile if available
        risk = characteristics.get("risk_profile", {}).get("value")
        if risk:
            description.append(f"with a {risk.lower()} risk profile")
        # Add logistics if available
        logistics = characteristics.get("logistics_profile", {}).get("value")
        if logistics:
            description.append(f"involving {logistics.lower()}")
        # Add relevance if score is high
        if rag_scores and trial_row["nct_id"] in rag_scores:
            score = rag_scores[trial_row["nct_id"]]
            if score > 0.7:
                description.append("This trial seems particularly relevant based on your information.")
        # Join with natural language
        description_text = " ".join(description) + "."
        return description_text[0].upper() + description_text[1:]  # Capitalize first letter

    def attribute_to_question(self, attribute: str) -> str:
        # Map common attributes to natural questions
        question_map = {
            "patient_has_cancer": "Have you been diagnosed with cancer?",
            "patient_age": "Could you share your age?",
            "patient_ecog_status": "How would you describe your ability to carry out daily activities?",
            "patient_prior_treatment": "Have you received any previous treatments for your condition?",
            "patient_biomarker_status": "Have you had any biomarker testing done?",
            "patient_has_metastasis": "Has the cancer spread to other parts of your body?",
            "patient_has_brain_metastases": "Has the cancer spread to your brain?",
            "patient_has_liver_metastases": "Has the cancer spread to your liver?",
            "patient_has_lung_metastases": "Has the cancer spread to your lungs?",
            "patient_has_bone_metastases": "Has the cancer spread to your bones?",
            "patient_has_lymph_node_metastases": "Has the cancer spread to your lymph nodes?",
            "patient_has_heart_disease": "Do you have any history of heart disease?",
            "patient_has_diabetes": "Have you been diagnosed with diabetes?",
            "patient_has_hypertension": "Do you have high blood pressure?",
            "patient_has_kidney_disease": "Do you have any kidney problems?",
            "patient_has_liver_disease": "Do you have any liver conditions?",
            "patient_has_lung_disease": "Do you have any lung conditions?",
            "patient_has_autoimmune_disease": "Have you been diagnosed with any autoimmune disorders?",
            "patient_is_smoker": "Do you currently smoke or have you smoked in the past?",
            "patient_has_hiv": "Have you tested positive for HIV?",
            "patient_has_hepatitis": "Do you have hepatitis B or C?",
            "patient_has_organ_transplant": "Have you ever had an organ transplant?",
            "patient_is_pregnant": "Are you currently pregnant or planning to become pregnant?",
            "patient_is_breastfeeding": "Are you currently breastfeeding?",
            "patient_has_bleeding_disorder": "Do you have any bleeding disorders?",
            "patient_has_seizure_disorder": "Have you ever been diagnosed with a seizure disorder?",
            "patient_has_mental_illness": "Have you been diagnosed with any mental health conditions?",
            "patient_has_substance_abuse": "Have you struggled with substance abuse?",
            "patient_has_allergies": "Do you have any medication allergies?",
        }
        # Use the predefined question if available
        if attribute in question_map:
            return question_map[attribute]
        # Fallback to a more natural phrasing for other attributes
        text = attribute.replace("patient_", "").replace("_", " ")
        return f"Could you tell me about {text}?"

    def interpret_answer(self, answer: str) -> Optional[bool]:
        normalized = answer.strip().lower()
        if normalized in {"yes", "y", "true"}:
            return True
        if normalized in {"no", "n", "false"}:
            return False
        return None

    def conduct_session(
        self,
        patient_id: str,
        max_questions: int = 5,
        answer_provider: Optional[QuestionProvider] = None,
        verbose: bool = True,
    ) -> Dict[str, object]:
        if answer_provider is None:
            answer_provider = input

        preferences = PreferenceState()
        patient_attrs = self.matcher.load_patient_attributes(patient_id)
        rag_scores_map = dict(self.matcher.rag_rank_patient(patient_id, top_n=50))
        ranked_trials = self.filter_trials_by_preferences(self.get_ranked_trials(patient_id), preferences)
        if not ranked_trials:
            raise ValueError(f"No ranked trials found for patient {patient_id}")

        if verbose:
            print(f"Loaded {len(ranked_trials)} candidate trials for patient {patient_id}.")

        for question_idx in range(max_questions):
            ranked_missing = self.rank_missing_attributes(patient_attrs, ranked_trials)
            if not ranked_missing:
                if verbose:
                    print("All prioritized trials have sufficient data—no more questions needed.")
                break

            attribute, context = ranked_missing[0]
            trial_info = context["trials"][0]
            trial_summary = self.describe_trial(trial_info, rag_scores_map)
            llm_context = {
                "patient_note": self._fetch_patient_note(patient_id),
                "preferences": preferences.summary(),
            }
            llm_question = self.question_generator.generate_question(
                attribute,
                trial_summary,
                llm_context,
            )
            question = f"{question_idx + 1}. {llm_question}"
            answer = answer_provider(question + "\n> ")
            interpreted = self.interpret_answer(answer)

            if interpreted is None:
                preference_update = self._extract_preference(answer, trial_info)
                if preference_update:
                    self._apply_preference(preference_update, preferences, verbose)
                    ranked_trials = self.filter_trials_by_preferences(ranked_trials, preferences)
                    continue
                if verbose:
                    print("Skipping: unable to interpret the response as yes/no.")
                continue

            patient_attrs[attribute] = interpreted
            if verbose:
                print(f"Recorded {attribute} = {interpreted}. Re-evaluating priorities...")

        self.last_preferences = preferences
        return patient_attrs

    def _fetch_patient_note(self, patient_id: str) -> str:
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute("SELECT note FROM patients WHERE patient_id = ?", (patient_id,))
        row = cursor.fetchone()
        conn.close()
        return row["note"] if row and row["note"] else ""

    def filter_trials_by_preferences(
        self,
        trials: Sequence[sqlite3.Row],
        preferences: PreferenceState,
    ) -> List[sqlite3.Row]:
        filtered = []
        for trial in trials:
            nct_id = trial["nct_id"]
            if nct_id in preferences.excluded_trials:
                continue
            characteristics = self.fetch_trial_characteristics(nct_id)
            modality = (characteristics.get("intervention_modality") or {}).get("value")
            if modality and modality in preferences.excluded_modalities:
                continue
            filtered.append(trial)
        return filtered

    def _extract_preference(self, answer: str, trial_info: Dict) -> Optional[Dict]:
        text = answer.lower()
        if "skip" in text or "not interested" in text or "no thanks" in text:
            return {"exclude_trial": trial_info["nct_id"]}

        modality_map = {
            "surgery": "Surgery",
            "surgical": "Surgery",
            "operation": "Surgery",
            "drug": "Drug",
            "medication": "Drug",
            "medicine": "Drug",
            "radiation": "Radiation",
            "chemo": "Drug",
            "chemotherapy": "Drug",
            "device": "Device",
            "implant": "Device",
        }
        avoid_phrases = ["don't want", "do not want", "not comfortable", "no ", "avoid", "rather not"]
        if any(phrase in text for phrase in avoid_phrases):
            for keyword, modality in modality_map.items():
                if keyword in text:
                    return {"exclude_modality": modality}
        return None

    def _apply_preference(self, preference: Dict, preferences: PreferenceState, verbose: bool) -> None:
        if "exclude_trial" in preference:
            preferences.excluded_trials.add(preference["exclude_trial"])
            if verbose:
                print(f"Noted preference: skipping trial {preference['exclude_trial']}")
        if "exclude_modality" in preference:
            preferences.excluded_modalities.add(preference["exclude_modality"])
            if verbose:
                print(f"Noted preference: avoiding {preference['exclude_modality']} modalities")


if __name__ == "__main__":
    agent = ConversationalTrialAssistant()
    try:
        agent.conduct_session("sigir-20141")
    except ValueError as exc:
        print(exc)
