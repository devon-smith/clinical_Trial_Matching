"""
Conversational assistant loop that prioritizes missing patient attributes
using TrialDB rankings and trial characteristics.
"""

from __future__ import annotations

from ast import Break
import sqlite3
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Callable, Dict, List, Optional, Sequence, Set, Tuple, Union

from Matcher import DEFAULT_DB_PATH, TrialMatcher
from llm_questioner import LLMQuestionGenerator

QuestionProvider = Callable[[str], str]

CONVERSATION_STATES = {
    'INITIAL': 'initial',
    'GET_AGE': 'get_age',
    'GET_GENDER': 'get_gender',
    'GET_LOCATION': 'get_location',
    'GET_CONDITION': 'get_condition',
    'GET_SYMPTOMS': 'get_symptoms',
    'PRIORITIZE_CONDITIONS': 'prioritize_conditions',
    'GET_PREFERENCES': 'get_preferences',
    'READY_TO_SEARCH': 'ready_to_search'
}

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
    def __init__(self, db_path: Union[Path, str] = DEFAULT_DB_PATH, question_generator: Optional[LLMQuestionGenerator] = None):
        self.db_path = str(db_path)
        self.matcher = TrialMatcher(db_path)
        self.question_generator = question_generator or LLMQuestionGenerator()
        self._characteristic_cache: Dict[str, Dict] = {}
        self.last_preferences: Optional[PreferenceState] = None
        self.conversation_state = CONVERSATION_STATES['INITIAL']
        self.patient_data = {
            'age': None,
            'gender': None,
            'location': None,
            'zip_code': None,
            'conditions': [],
            'symptoms': [],
            'primary_condition': None,
            'preferences': None,
        }

    def _connect(self) -> sqlite3.Connection:
        conn = sqlite3.connect(self.db_path)
        conn.row_factory = sqlite3.Row
        return conn

    def _get_criteria_attributes(self) -> Set[str]:
        """Get all unique criterion types from the database."""
        conn = self._connect()
        cursor = conn.cursor()
        try:
            cursor.execute("SELECT DISTINCT criterion_type FROM criteria")
            attributes = {row[0] for row in cursor.fetchall()}
            print("Available criteria attributes in database:", attributes)
            return attributes
        finally:
            conn.close()

    def get_next_question(self) -> str:
        """Get the next question based on the current conversation state."""
        if self.conversation_state == CONVERSATION_STATES['INITIAL']:
            self.conversation_state = CONVERSATION_STATES['GET_AGE']
            return "To help find the most relevant clinical trials, I'll need some information. First, could you please tell me your age?"

        elif self.conversation_state == CONVERSATION_STATES['GET_AGE']:
            self.conversation_state = CONVERSATION_STATES['GET_GENDER']
            return "Thank you. Could you please share your gender? (e.g., male, female, non-binary, prefer not to say)"

        elif self.conversation_state == CONVERSATION_STATES['GET_GENDER']:
            self.conversation_state = CONVERSATION_STATES['GET_LOCATION']
            return "Thank you. Where are you located? Please enter your city and state (e.g., 'San Francisco, CA') or ZIP code so I can find trials near you."

        elif self.conversation_state == CONVERSATION_STATES['GET_LOCATION']:
            self.conversation_state = CONVERSATION_STATES['GET_CONDITION']
            return ("Thank you. Now, could you please tell me about the main health condition or conditions "
                    "you're experiencing? Please list any specific diagnoses you've received.")
    
        elif self.conversation_state == CONVERSATION_STATES['GET_CONDITION']:
            self.conversation_state = CONVERSATION_STATES['GET_SYMPTOMS']
            return ("I understand you mentioned these conditions: {}. "
                "Could you describe your main symptoms in more detail? This will help me find the most relevant trials.".format(
                    ", ".join(self.patient_data['conditions']) if self.patient_data['conditions'] else "a condition"
                ))
    
        elif self.conversation_state == CONVERSATION_STATES['GET_SYMPTOMS']:
            if len(self.patient_data['conditions']) > 1:
                self.conversation_state = CONVERSATION_STATES['PRIORITIZE_CONDITIONS']
                return ("I see you mentioned multiple conditions: {}. "
                        "Which one would you like to prioritize for clinical trial matching? "
                        "Please enter the number corresponding to your priority.".format(
                        ", ".join(f"{i+1}. {cond}" for i, cond in enumerate(self.patient_data['conditions']))
                    ))
            else:
                self.conversation_state = CONVERSATION_STATES['GET_PREFERENCES']
                return ("Thank you for providing your medical information. "
                        "Before I search, I'd like to understand your practical preferences "
                        "to better rank the results. You can set your preferences or skip this step.")

        elif self.conversation_state == CONVERSATION_STATES['PRIORITIZE_CONDITIONS']:
            self.conversation_state = CONVERSATION_STATES['GET_PREFERENCES']
            return ("Thank you. I'll prioritize finding trials related to {}. "
                    "Before I search, I'd like to understand your practical preferences "
                    "to better rank the results. You can set your preferences or skip this step.".format(
                self.patient_data['primary_condition']
            ))

        elif self.conversation_state == CONVERSATION_STATES['GET_PREFERENCES']:
            self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
            return "Thank you! I'll now search for relevant clinical trials tailored to your preferences."
        return "I'm ready to help you find clinical trials. What would you like to do next?"

    def process_response(self, user_input: str) -> Tuple[str, bool]:
        """Process user input and return (response_message, done)"""
        print(f"Current state: {self.conversation_state}")
        print(f"User input: {user_input}")
        print(f"Patient data: {self.patient_data}")
    
        if not user_input.strip():
            return "I didn't catch that. Could you please repeat?", False
    
        user_input = user_input.strip()
    
        if self.conversation_state == CONVERSATION_STATES['GET_AGE']:
            try:
                age = int(user_input)
                if 1 <= age <= 120:
                    self.patient_data['age'] = age
                    self.conversation_state = CONVERSATION_STATES['GET_GENDER']
                    return "Thank you. Could you please share your gender? (e.g., male, female, non-binary, prefer not to say)", False
                return "Please enter a valid age between 1 and 120.", False
            except ValueError:
                return "Please enter your age as a number.", False
    
        elif self.conversation_state == CONVERSATION_STATES['GET_GENDER']:
            # Normalize the input and check against common gender options
            gender = user_input.lower().strip(' .!?')
            valid_genders = ['male', 'female', 'non-binary', 'prefer not to say']

            if any(term in gender for term in valid_genders):
                self.patient_data['gender'] = gender
                self.conversation_state = CONVERSATION_STATES['GET_LOCATION']
                return ("Thank you. Where are you located? Please enter your city and state "
                       "(e.g., 'San Francisco, CA') or ZIP code so I can find trials near you."), False
            return "Please specify your gender (e.g., male, female, non-binary, or prefer not to say).", False

        elif self.conversation_state == CONVERSATION_STATES['GET_LOCATION']:
            # Accept city/state or ZIP code
            location = user_input.strip()
            if not location:
                return "Please enter your location (city and state, or ZIP code).", False

            # Check if it's a ZIP code (5 digits)
            zip_match = re.match(r'^\d{5}(-\d{4})?$', location)
            if zip_match:
                self.patient_data['zip_code'] = location[:5]
                self.patient_data['location'] = location
            else:
                # Assume it's city, state format
                self.patient_data['location'] = location
                # Try to extract ZIP if provided alongside city
                zip_in_location = re.search(r'\d{5}', location)
                if zip_in_location:
                    self.patient_data['zip_code'] = zip_in_location.group()

            self.conversation_state = CONVERSATION_STATES['GET_CONDITION']
            return ("Thank you. Now, could you please tell me about the main health condition or conditions "
                   "you're experiencing? Please list any specific diagnoses you've received."), False

        elif self.conversation_state == CONVERSATION_STATES['GET_CONDITION']:
            if not user_input:
                return "Please share at least one health condition to help us find relevant trials.", False
            # Split conditions by common separators and clean up
            conditions = [c.strip() for c in re.split(r'[,\n]', user_input) if c.strip()]
            if not conditions:
                return "I didn't catch that. Could you please list your health conditions separated by commas?", False
        
            self.patient_data['conditions'] = conditions
            if len(conditions) == 1:
                self.patient_data['primary_condition'] = conditions[0]
                self.conversation_state = CONVERSATION_STATES['GET_SYMPTOMS']
            else:
                self.conversation_state = CONVERSATION_STATES['PRIORITIZE_CONDITIONS']
                conditions_list = "\n".join(f"{i+1}. {cond}" for i, cond in enumerate(conditions))
                return (f"I see you mentioned multiple conditions:\n{conditions_list}\n\n"
                       "Which one would you like to prioritize for clinical trial matching? "
                       "Please enter the number (1-{}) corresponding to your priority.".format(len(conditions))), False
        
            return ("Thank you. Could you describe your main symptoms in more detail? "
                   "This will help me find the most relevant trials."), False
    
        elif self.conversation_state == CONVERSATION_STATES['PRIORITIZE_CONDITIONS']:
            try:
                choice = int(user_input.strip())
                if 1 <= choice <= len(self.patient_data['conditions']):
                    self.patient_data['primary_condition'] = self.patient_data['conditions'][choice-1]
                    self.conversation_state = CONVERSATION_STATES['GET_SYMPTOMS']
                    return ("Thank you. I'll prioritize finding trials related to {}. "
                           "Could you describe your main symptoms in more detail?".format(
                               self.patient_data['primary_condition'])), False
                return f"Please enter a number between 1 and {len(self.patient_data['conditions'])}.", False
            except ValueError:
                return "Please enter the number corresponding to the condition you'd like to prioritize.", False
    
        elif self.conversation_state == CONVERSATION_STATES['GET_SYMPTOMS']:
            if not user_input.strip():
                return "Could you please describe your symptoms? This will help me find the most relevant trials.", False

            self.patient_data['symptoms'] = user_input
            self.conversation_state = CONVERSATION_STATES['GET_PREFERENCES']
            return ("Thank you for providing your medical information. "
                    "Before I search, I'd like to understand your practical preferences "
                    "to better rank the results. You can set your preferences below, or skip this step."), False

        elif self.conversation_state == CONVERSATION_STATES['GET_PREFERENCES']:
            stripped = user_input.strip().lower()
            if stripped in ('skip', 'no', 'n', 'default', 'defaults', ''):
                self.patient_data['preferences'] = None
            else:
                from preference_scorer import parse_preferences_from_message
                prefs = parse_preferences_from_message(user_input)
                # Store as plain dict for session serialization
                self.patient_data['preferences'] = {
                    'travel_willingness': prefs.travel_willingness,
                    'risk_tolerance': prefs.risk_tolerance,
                    'schedule_flexibility': prefs.schedule_flexibility,
                    'acceptable_modalities': list(prefs.acceptable_modalities) if prefs.acceptable_modalities else None,
                }
            self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
            summary_lines = [
                f"- Age: {self.patient_data['age']}",
                f"- Gender: {self.patient_data['gender']}",
                f"- Location: {self.patient_data['location']}",
                f"- Condition: {self.patient_data['primary_condition']}",
                f"- Symptoms: {self.patient_data['symptoms']}",
            ]
            if self.patient_data['preferences'] is not None:
                summary_lines.append("- Preferences: customized")
            return ("Great! I'll now search for relevant clinical trials based on:\n"
                    + "\n".join(summary_lines)), False

        elif self.conversation_state == CONVERSATION_STATES['READY_TO_SEARCH']:
            # Perform the trial search with the collected patient data
            from smt_matcher import SMTMatcher
            import os
            from dotenv import load_dotenv
            
            # Load environment variables and get database path
            load_dotenv()
            db_path = os.getenv('DATABASE_URL', 'sqlite:///Trials.db').replace('sqlite:///', '')
            matcher = SMTMatcher(db_path=db_path)

            # In the READY_TO_SEARCH state, before calling evaluate_all_trials

            # First, let's see what criteria attributes exist in the database
            criteria_attributes = self._get_criteria_attributes()

            # In the READY_TO_SEARCH state, before calling evaluate_all_trials

            # Map our collected data to the expected attribute names in the database
            mapped_patient_data = {}

            # Age mapping - handle both direct age and age range
            if 'age' in self.patient_data and self.patient_data['age'] is not None:
                age = int(self.patient_data['age'])
                mapped_patient_data['age'] = age
                mapped_patient_data['age_years'] = age

            # Gender mapping - handle different formats
            if 'gender' in self.patient_data and self.patient_data['gender']:
                gender = self.patient_data['gender'].lower()
                # Map to single character format (M/F) which is common in clinical trials
                if gender in ['male', 'm', 'man']:
                    mapped_patient_data['gender'] = 'M'
                elif gender in ['female', 'f', 'woman']:
                    mapped_patient_data['gender'] = 'F'
                else:
                    mapped_patient_data['gender'] = gender.upper()

            # Conditions - map to diagnosis
            if 'primary_condition' in self.patient_data and self.patient_data['primary_condition']:
                condition = self.patient_data['primary_condition'].lower()
                mapped_patient_data['diagnosis'] = condition
                mapped_patient_data['condition'] = condition

            # Additional conditions as a list
            if 'conditions' in self.patient_data and self.patient_data['conditions']:
                conditions = [c.lower() for c in self.patient_data['conditions']]
                mapped_patient_data['conditions'] = conditions
                mapped_patient_data['diagnoses'] = conditions  # Some trials might use 'diagnoses' plural

            # Symptoms
            if 'symptoms' in self.patient_data and self.patient_data['symptoms']:
                symptoms = self.patient_data['symptoms'].lower()
                mapped_patient_data['symptoms'] = symptoms
                mapped_patient_data['symptom'] = symptoms  # Some trials might use singular

            # Update the mapping section (around line 260) to:
            required_criteria = ['age', 'gender', 'diagnosis']
            for crit in required_criteria:
                if crit not in mapped_patient_data:
                    # Provide default values for required criteria
                    if crit == 'age':
                        mapped_patient_data[crit] = 30  # Default age
                        # Add age in different formats
                        mapped_patient_data['patient_age_value_recorded_now_in_years'] = 30
                    elif crit == 'gender':
                        mapped_patient_data[crit] = 'F'  # Default to Female
                        # Add gender in different formats
                        mapped_patient_data['patient_gender'] = 'F'
                    elif crit == 'diagnosis' and 'primary_condition' in self.patient_data:
                        diagnosis = self.patient_data['primary_condition'].lower()
                        mapped_patient_data[crit] = diagnosis
                        # Add diagnosis in different formats
                        mapped_patient_data[f'patient_has_diagnosis_of_{diagnosis.replace(" ", "_")}'] = True
                        mapped_patient_data[f'patient_has_diagnosis_of_{diagnosis.replace(" ", "_")}_inthehistory'] = True

            # Add common conditions that might be in criteria
            common_conditions = ['cancer', 'diabetes', 'hypertension', 'obesity']
            for condition in common_conditions:
                if condition in str(mapped_patient_data.get('diagnosis', '')).lower():
                    mapped_patient_data[f'patient_has_diagnosis_of_{condition}'] = True
                    mapped_patient_data[f'patient_has_diagnosis_of_{condition}_inthehistory'] = True

            print("Mapped patient data for matching:", mapped_patient_data)
            
            # Debug: Print patient data being sent to matcher
            print("\n=== DEBUG: Patient Data for Matching ===")
            print("Mapped Patient Data:", mapped_patient_data)

            try:
                # Get matching trials using evaluate_all_trials
                trial_results = matcher.evaluate_all_trials(mapped_patient_data)

                # Debug: Print detailed matching results
                print("\n=== DEBUG: Trial Matching Results ===")
                passed_trials = [nct_id for nct_id, result in trial_results.items() if result['status'] == 'PASS']
                print(f"Total trials passed: {len(passed_trials)}")
                print(f"Total trials failed: {len(trial_results) - len(passed_trials)}")

                # Print first few failed trials with reasons
                print("\nSample failed trials:")
                failed_count = 0
                for nct_id, result in trial_results.items():
                    if result['status'] != 'PASS' and failed_count < 3:  # Show first 3 failures
                        print(f"\nTrial {nct_id}:")
                        print(f"  Status: {result['status']}")
                        if 'failed_constraints' in result:
                            for fc in result['failed_constraints'][:3]:  # Show first 3 failed constraints
                                print(f"  - Failed: {fc.get('attribute')} {fc.get('operator')} {fc.get('value')}")
                        failed_count += 1
                
                # Filter for trials that passed
                matching_trials = [
                    {
                        'nct_id': nct_id,
                        'brief_title': self._get_trial_title(nct_id),
                        'status': result['status']
                    }
                    for nct_id, result in trial_results.items()
                    if result['status'] == 'PASS'  # Only include trials that passed all hard constraints
                ]
                
                if not matching_trials:
                    return "I couldn't find any matching clinical trials based on your information. Would you like to try a different search?", True
                
                # Format the results
                trial_list = "\n".join([
                    f"- {trial['nct_id']}: {trial.get('brief_title', 'No title available')}"
                    for trial in matching_trials[:5]  # Show top 5 results
                ])
                
                return (f"I found a number of clinical trials that might be a good match. "
                       f"Here are the top results:\n\n{trial_list}\n\n"
                       "Would you like more information about any of these trials?"), True
                        
            except Exception as e:
                print(f"Error searching for trials: {str(e)}")
                return "I encountered an error while searching for clinical trials. Please try again later.", True
    
        return "I'm not sure how to respond to that. Could you rephrase?", False
    

    def _get_trial_title(self, nct_id: str) -> str:
        """Get the title of a clinical trial by its NCT ID.
    
        Args:
            nct_id: The NCT ID of the trial
    
        Returns:
            The trial's title or a default message if not found
        """
        conn = self._connect()
        cursor = conn.cursor()
        try:
            cursor.execute(
                "SELECT title FROM trials WHERE nct_id = ?",
                (nct_id,)
            )
            row = cursor.fetchone()
            return row[0] if row and row[0] else "No title available"
        except Exception as e:
            print(f"Error fetching title for trial {nct_id}: {e}")
            return "No title available"
        finally:
            conn.close()

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
            # Ensure we always surface at least one attribute to ask about
            if not missing:
                missing = ["additional_information"]
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
        ranked = sorted(scored.items(), key=lambda item: item[1]["score"], reverse=True)
        if not ranked and ranked_trials:
            # Provide a generic next-best attribute to ask for when everything passes
            first = ranked_trials[0]
            return [
                (
                    "additional_information",
                    {
                        "score": 0.0,
                        "trials": [
                            {
                                "nct_id": first["nct_id"],
                                "rank": first["rank"] or 1,
                                "title": first["title"],
                                "phase": first["phase"],
                            }
                        ],
                        "characteristics": {},
                    },
                )
            ]
        return ranked

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

    def conduct_session(self, patient_id: Optional[str] = None, max_questions: int = 5, answer_provider: Optional[QuestionProvider] = None, verbose: bool = False):
        """Conduct a conversation session. Test-friendly: accepts scripted answers and limits questions.

        Args:
            patient_id: Optional patient identifier (unused for now, kept for compatibility)
            max_questions: Maximum number of question/answer turns
            answer_provider: Callable that returns an answer given a prompt
            verbose: If True, prints prompts and responses
        Returns:
            Dict of patient attributes suitable for matching
        """
        turns = 0
        while turns < max_questions:
            prompt = self.get_next_question()
            if verbose:
                print(f"\n{prompt}")

            answer = ""
            if answer_provider is not None:
                try:
                    answer = answer_provider(prompt)
                except Exception:
                    answer = ""
            else:
                # Non-interactive default for tests
                answer = ""

            # Update preferences opportunistically from free-form answers
            if answer:
                pref = self._extract_preference(answer, {"nct_id": "stub"})
                if pref:
                    if self.last_preferences is None:
                        self.last_preferences = PreferenceState()
                    self._apply_preference(pref, self.last_preferences, verbose)

            response, done = self.process_response(answer)
            if verbose and response:
                print(response)
            turns += 1
            if done:
                break

        return self.get_patient_data_for_matching()

    def get_patient_data_for_matching(self) -> Dict:
        """Get the patient data in a format suitable for trial matching."""
        return {
            'age': self.patient_data['age'],
            'gender': self.patient_data['gender'],
            'primary_condition': self.patient_data['primary_condition'] or 
                               (self.patient_data['conditions'][0] if self.patient_data['conditions'] else None),
            'all_conditions': self.patient_data['conditions'],
            'symptoms': self.patient_data['symptoms']
        }

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
