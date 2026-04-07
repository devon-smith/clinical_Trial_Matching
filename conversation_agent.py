"""
Conversational assistant that uses freeform LLM extraction
for patient intake, keeping total exchanges to 2-3 max.
"""

from __future__ import annotations

import re
import sqlite3
from dataclasses import dataclass, field
from pathlib import Path
from typing import Callable, Dict, List, Optional, Sequence, Set, Tuple, Union

from Matcher import DEFAULT_DB_PATH, TrialMatcher
from llm_questioner import LLMQuestionGenerator
from condition_followups import (
    detect_condition, get_followup_questions, parse_answer,
)
from dynamic_followups import discover_followup_questions

QuestionProvider = Callable[[str], str]

# Simplified states for the new freeform flow
CONVERSATION_STATES = {
    'INTAKE': 'intake',           # waiting for first open-ended response
    'FOLLOWUP': 'followup',       # asking for missing fields
    'CONDITION_DETAIL': 'condition_detail',  # condition-specific follow-ups
    'PREF_TRAVEL': 'pref_travel',         # asking about travel willingness
    'PREF_RISK': 'pref_risk',             # asking about risk tolerance
    'PREF_TREATMENT': 'pref_treatment',   # asking about treatment type
    'READY_TO_SEARCH': 'ready_to_search',
}

# Required fields and their human-readable labels
REQUIRED_FIELDS = {
    'age': 'your age',
    'conditions': 'your health condition or diagnosis',
    'location': 'your location (city/state or ZIP code)',
}

# Optional but useful
OPTIONAL_FIELDS = {
    'gender': 'your gender',
    'symptoms': 'your symptoms in more detail',
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


def _try_extract_age(text: str) -> Optional[int]:
    """Attempt rule-based age extraction as LLM fallback."""
    patterns = [
        r"(?:i'm|i am|im|age[: ]*)\s*(\d{1,3})",
        r"(\d{1,3})\s*(?:years?\s*old|yo\b|y/?o\b)",
    ]
    for pat in patterns:
        m = re.search(pat, text, re.IGNORECASE)
        if m:
            age = int(m.group(1))
            if 1 <= age <= 120:
                return age
    return None


def _try_extract_zip(text: str) -> Optional[str]:
    """Extract a 5-digit ZIP code from text."""
    m = re.search(r'\b(\d{5})(?:-\d{4})?\b', text)
    return m.group(1) if m else None


def _try_extract_gender(text: str) -> Optional[str]:
    """Simple rule-based gender extraction."""
    lower = text.lower()
    for token in ['male', 'female', 'non-binary', 'nonbinary', 'prefer not to say']:
        if token in lower:
            return token.replace('nonbinary', 'non-binary')
    return None


# ---------------------------------------------------------------------------
# Intent detection helpers
# ---------------------------------------------------------------------------

_CORRECTION_PATTERNS = [
    re.compile(r"(?:actually|wait|sorry|oops|correction|i meant|i mean|no,?\s+i(?:'m| am))\b", re.I),
    re.compile(r"\bnot\s+\d+.*(?:i(?:'m| am)|my age)\s+(?:is\s+)?\d+", re.I),
    re.compile(r"(?:change|update|correct|fix)\s+(?:my\s+)?(?:age|location|condition|gender)", re.I),
]

# Full reset — clears everything including demographics
_RESET_PATTERNS = [
    re.compile(r"\b(?:start over|restart|reset|begin again|clear)\b", re.I),
]

# New search — keeps demographics, only resets condition data
_NEW_SEARCH_PATTERNS = [
    re.compile(r"\b(?:new search|different condition|another condition|search (?:for )?(?:something|another)|try (?:a )?different|look for something else)\b", re.I),
]

_QUESTION_PATTERNS = [
    re.compile(r"\b(?:what (?:does|is|are)|how (?:does|do|long)|can you explain|tell me about|what's)\b", re.I),
    re.compile(r"\?$"),
]

# Common clinical trial questions with answers
_FAQ_ANSWERS: Dict[str, str] = {
    "phase": (
        "Clinical trials have four phases:\n\n"
        "**Phase 1** — Tests safety in a small group (20-80 people). Highest risk, earliest stage.\n"
        "**Phase 2** — Tests effectiveness and side effects (100-300 people).\n"
        "**Phase 3** — Compares the treatment to existing options in a large group (1,000-3,000 people). Most data.\n"
        "**Phase 4** — Post-approval monitoring for long-term effects."
    ),
    "placebo": (
        "A **placebo** is an inactive treatment (like a sugar pill) used as a comparison. "
        "Not all trials use placebos — many compare a new treatment against the current best treatment instead. "
        "You can ask the study team whether a specific trial uses a placebo."
    ),
    "randomized": (
        "**Randomized** means participants are assigned to treatment groups by chance (like flipping a coin). "
        "This ensures fair comparison between groups. You won't get to choose which group you're in."
    ),
    "eligibility": (
        "**Eligibility criteria** are the requirements you must meet to join a trial. "
        "They typically include age range, specific diagnosis, prior treatments, and general health. "
        "These exist to ensure participant safety and valid results."
    ),
    "cost": (
        "Most clinical trials cover the cost of the study treatment and related tests. "
        "Some also cover travel expenses. Your regular medical costs may still apply. "
        "Always ask the study team about costs before enrolling."
    ),
    "risk": (
        "All clinical trials carry some risk — possible side effects, the treatment may not work, "
        "or you might receive a placebo. However, trials are closely monitored by safety boards, "
        "and you can withdraw at any time."
    ),
}


def _detect_correction(text: str) -> bool:
    """Check if the user is correcting previously provided information."""
    return any(p.search(text) for p in _CORRECTION_PATTERNS)


def _detect_new_search(text: str) -> bool:
    """Check if the user wants a new search (keep demographics)."""
    return any(p.search(text) for p in _NEW_SEARCH_PATTERNS)


def _detect_reset(text: str) -> bool:
    """Check if the user wants a full reset (clear everything)."""
    return any(p.search(text) for p in _RESET_PATTERNS)


def _detect_question(text: str) -> Optional[str]:
    """Check if the user is asking a mid-flow question. Returns an answer or None."""
    if not any(p.search(text) for p in _QUESTION_PATTERNS):
        return None

    lower = text.lower()
    for keyword, answer in _FAQ_ANSWERS.items():
        if keyword in lower:
            return answer

    # Generic question — we can't answer it but should acknowledge
    return None


def _looks_like_gibberish(text: str) -> bool:
    """Detect input that's likely random characters or not meaningful."""
    stripped = text.strip()
    # Too short to be useful (single char, or very few letters)
    alpha_chars = sum(1 for c in stripped if c.isalpha())
    if alpha_chars < 3:
        return True
    # Mostly non-alpha characters (random keyboard mashing)
    if len(stripped) > 3 and alpha_chars / len(stripped) < 0.4:
        return True
    # All consonants, no vowels (likely gibberish like "bcdfghjkl")
    vowels = sum(1 for c in stripped.lower() if c in 'aeiou')
    if alpha_chars > 4 and vowels == 0:
        return True
    return False


def _merge_extracted(patient_data: Dict, extracted: Dict) -> List[str]:
    """Merge LLM-extracted fields into patient_data. Returns list of newly filled field names.

    Demographics (age, gender, location) are only set when currently empty.
    If the user wants to update existing demographics, the correction handler
    or _handle_field_update takes care of that.
    Condition data always replaces empty values (supports new search flow).
    """
    newly_filled = []

    age = extracted.get('age')
    if age is not None:
        if isinstance(age, (int, float)) and 10 <= int(age) <= 120:
            new_age = int(age)
            if patient_data.get('age') is None:
                patient_data['age'] = new_age
                newly_filled.append('age')
            elif patient_data['age'] != new_age:
                # User provided a different age — update it
                patient_data['age'] = new_age
                newly_filled.append('age')

    gender = extracted.get('gender')
    if gender:
        new_gender = str(gender).lower()
        if patient_data.get('gender') is None:
            patient_data['gender'] = new_gender
            newly_filled.append('gender')
        elif patient_data['gender'] != new_gender:
            patient_data['gender'] = new_gender
            newly_filled.append('gender')

    location = extracted.get('location')
    if location:
        new_location = str(location)
        if patient_data.get('location') is None or patient_data['location'] != new_location:
            patient_data['location'] = new_location
            zip_code = _try_extract_zip(new_location)
            if zip_code:
                patient_data['zip_code'] = zip_code
            newly_filled.append('location')

    conditions = extracted.get('conditions') or []
    if conditions and not patient_data.get('conditions'):
        patient_data['conditions'] = [str(c) for c in conditions]
        patient_data['primary_condition'] = str(conditions[0])
        newly_filled.append('conditions')

    symptoms = extracted.get('symptoms')
    if symptoms and not patient_data.get('symptoms'):
        patient_data['symptoms'] = str(symptoms)
        newly_filled.append('symptoms')

    return newly_filled


def _build_acknowledgment(patient_data: Dict, newly_filled: List[str]) -> str:
    """Build a specific, conversational acknowledgment of what was just captured."""
    if not newly_filled:
        return ""

    # Build specific acknowledgment phrases per field
    parts = []
    if 'conditions' in newly_filled:
        conds = patient_data['conditions']
        cond_str = conds[0] if len(conds) == 1 else ', '.join(conds)
        parts.append(f"**{cond_str}** — I'll search for trials that match your diagnosis")
    if 'symptoms' in newly_filled:
        parts.append(f"I'll factor in your symptoms to find the most relevant matches")
    if 'age' in newly_filled:
        parts.append(f"**{patient_data['age']}** years old, noted")
    if 'gender' in newly_filled:
        parts.append(f"noted that you're **{patient_data['gender']}**")
    if 'location' in newly_filled:
        parts.append(f"**{patient_data['location']}** — I'll prioritize trials near you")

    if not parts:
        return ""
    return "Thank you for sharing that. " + ". ".join(parts) + "."


def _build_followup_ask(patient_data: Dict) -> Optional[str]:
    """Build a follow-up asking for missing required fields, phrased as a natural continuation."""
    missing_labels = []
    for key, label in REQUIRED_FIELDS.items():
        val = patient_data.get(key)
        if val is None or (isinstance(val, list) and len(val) == 0):
            missing_labels.append((key, label))

    if not missing_labels:
        return None

    # Use contextual phrasing based on what we already know
    has_condition = bool(patient_data.get('conditions'))
    has_age = patient_data.get('age') is not None

    labels = [label for _, label in missing_labels]

    if len(labels) == 1:
        key = missing_labels[0][0]
        if key == 'location' and has_condition:
            return "To narrow things down, could you tell me **where you're located** (city/state or ZIP)?"
        if key == 'age':
            return "Could you also share **your age**? It helps match eligibility criteria."
        if key == 'conditions':
            return "What **health condition or diagnosis** are you looking to find trials for?"
        return f"I also need to know **{labels[0]}** to find the best matches."

    joined = ", ".join(f"**{l}**" for l in labels[:-1]) + f" and **{labels[-1]}**"
    return f"To find the best matches, could you also share {joined}?"


def _detect_redundant_condition_symptom(patient_data: Dict) -> Optional[str]:
    """If conditions and symptoms are essentially the same, ask a smarter question."""
    conditions = patient_data.get('conditions', [])
    symptoms = patient_data.get('symptoms', '')
    if not conditions or not symptoms:
        return None

    # Check if the symptom text is just the condition name repeated
    cond_lower = {c.lower().strip() for c in conditions}
    symptom_lower = symptoms.lower().strip()
    for cond in cond_lower:
        if symptom_lower == cond or symptom_lower in cond or cond in symptom_lower:
            return (
                f"You mentioned **{conditions[0]}** — can you tell me more about "
                "what type, when you were diagnosed, and what stage or severity?"
            )
    return None


# ---------------------------------------------------------------------------
# Natural-language preference parsing
# ---------------------------------------------------------------------------

_TRAVEL_PATTERNS: List[Tuple[re.Pattern, int]] = [
    (re.compile(r"anywhere|national|don'?t care|doesn'?t matter|any distance|as far as|willing to fly", re.I), 5),
    (re.compile(r"state|statewide|100|hundred", re.I), 4),
    (re.compile(r"regional|hour|60|an hour away", re.I), 3),
    (re.compile(r"nearby|close|30|half.hour|not too far", re.I), 2),
    (re.compile(r"local|very close|15|walking|same city|near me only", re.I), 1),
]

_RISK_PATTERNS: List[Tuple[re.Pattern, int]] = [
    (re.compile(r"fully experimental|anything|cutting.edge|earliest|phase.?[01i]|don'?t mind risk", re.I), 5),
    (re.compile(r"comfortable.*experiment|open.*early|phase.?2|willing.*risk", re.I), 4),
    (re.compile(r"open|newer|some risk|moderate|balanced", re.I), 3),
    (re.compile(r"mostly proven|later.phase|phase.?3|established|prefer.*safe", re.I), 2),
    (re.compile(r"proven only|no risk|fda.approved|safest|conservative|well.tested", re.I), 1),
]

_MODALITY_KEYWORDS: Dict[str, List[str]] = {
    'Drug': ['drug', 'medication', 'medicine', 'pill', 'oral', 'infusion', 'chemo', 'chemotherapy', 'injection'],
    'Surgery': ['surgery', 'surgical', 'operation', 'procedure', 'invasive'],
    'Device': ['device', 'implant', 'stimulat'],
    'Behavioral': ['behavioral', 'therapy', 'counseling', 'cognitive', 'lifestyle', 'mindfulness'],
    'Radiation': ['radiation', 'radiotherapy', 'proton'],
}


def _parse_travel(text: str) -> Optional[int]:
    """Parse travel willingness from natural language (1-5 scale)."""
    for pattern, score in _TRAVEL_PATTERNS:
        if pattern.search(text):
            return score
    # Try to extract a mile number
    m = re.search(r'(\d+)\s*(?:miles?|mi)\b', text, re.I)
    if m:
        miles = int(m.group(1))
        if miles <= 15:
            return 1
        if miles <= 30:
            return 2
        if miles <= 60:
            return 3
        if miles <= 100:
            return 4
        return 5
    return None


def _parse_risk(text: str) -> Optional[int]:
    """Parse risk tolerance from natural language (1-5 scale)."""
    for pattern, score in _RISK_PATTERNS:
        if pattern.search(text):
            return score
    return None


def _parse_modalities(text: str) -> Tuple[Optional[set], Optional[set]]:
    """Parse preferred and avoided treatment modalities.

    Uses proximity: checks whether an avoid/prefer phrase appears close to
    each modality keyword, rather than relying on global flags.
    Returns (preferred_set_or_None, avoided_set_or_None).
    """
    lower = text.lower()
    preferred = set()
    avoided = set()

    avoid_phrases = ['avoid', "don't want", 'do not want', 'not comfortable',
                     'rather not', 'prefer not', 'stay away', 'not interested in',
                     'no ']

    # Split on commas/semicolons/and to analyze each clause independently
    clauses = re.split(r'[,;]|\band\b', lower)

    for clause in clauses:
        clause = clause.strip()
        is_avoid_clause = any(phrase in clause for phrase in avoid_phrases)
        for modality, keywords in _MODALITY_KEYWORDS.items():
            for kw in keywords:
                if kw in clause:
                    if is_avoid_clause:
                        avoided.add(modality)
                    else:
                        preferred.add(modality)
                    break

    return (preferred if preferred else None, avoided if avoided else None)


def _mentions_schedule(text: str) -> bool:
    """Check if the user mentioned time/schedule constraints."""
    schedule_words = ['time', 'schedule', 'busy', 'work', 'flexible', 'inflexible',
                      'weekday', 'weekend', 'morning', 'evening', 'hours',
                      'availability', 'commitment']
    lower = text.lower()
    return any(w in lower for w in schedule_words)


class ConversationalTrialAssistant:
    def __init__(
        self,
        db_path: Union[Path, str] = DEFAULT_DB_PATH,
        question_generator: Optional[LLMQuestionGenerator] = None,
    ):
        self.db_path = str(db_path)
        self.matcher = TrialMatcher(db_path)
        self.question_generator = question_generator or LLMQuestionGenerator()
        self._characteristic_cache: Dict[str, Dict] = {}
        self.last_preferences: Optional[PreferenceState] = None
        self.conversation_state = CONVERSATION_STATES['INTAKE']
        self.patient_data: Dict = {
            'age': None,
            'gender': None,
            'location': None,
            'zip_code': None,
            'conditions': [],
            'symptoms': '',
            'primary_condition': None,
            'preferences': None,
            'condition_details': {},       # Follow-up answers keyed by attribute
            'condition_category': None,    # Matched category ID from condition_followups
        }
        self._pending_followups: List[Dict] = []   # Queued condition follow-up questions
        self._followup_batch: int = 0               # Which batch we're on (0 or 1)
        self._use_dynamic_followups: bool = False    # True if using dynamic criteria-driven questions

    # ------------------------------------------------------------------
    # LLM extraction helper
    # ------------------------------------------------------------------

    def _extract_fields_from_message(self, message: str) -> Dict:
        """Use LLM to extract intake fields, with rule-based fallbacks."""
        try:
            from llm_service import LLMService
            llm = LLMService()
            extracted = llm.extract_intake_fields(message)
        except Exception:
            extracted = {
                'age': None, 'gender': None, 'location': None,
                'conditions': [], 'symptoms': None, 'treatments_tried': None,
            }

        # Rule-based fallbacks for fields the LLM missed
        if not extracted.get('age'):
            extracted['age'] = _try_extract_age(message)
        if not extracted.get('gender'):
            extracted['gender'] = _try_extract_gender(message)
        if not extracted.get('location'):
            zip_code = _try_extract_zip(message)
            if zip_code:
                extracted['location'] = zip_code

        return extracted

    # ------------------------------------------------------------------
    # Core conversation processing
    # ------------------------------------------------------------------

    def process_response(self, user_input: str) -> Tuple[str, bool]:
        """Process user input and return (response_message, is_done)."""
        if not user_input.strip():
            return "I didn't catch that. Could you please try again?", False

        user_input = user_input.strip()

        # --- GLOBAL INTENTS (checked before state routing) ---

        # New search (keep demographics) — check before full reset
        if _detect_new_search(user_input):
            return self._handle_new_search()

        # Full reset / start over
        if _detect_reset(user_input):
            return self._handle_reset()

        # Mid-flow question (only outside intake — during intake, treat everything as data)
        if self.conversation_state != CONVERSATION_STATES['INTAKE']:
            faq_answer = _detect_question(user_input)
            if faq_answer is not None:
                return self._handle_question(faq_answer)

        # Correction ("actually I'm 52", "I meant breast cancer")
        if self.conversation_state != CONVERSATION_STATES['INTAKE'] and _detect_correction(user_input):
            return self._handle_correction(user_input)

        # --- Inline field update via /update command from summary card ---
        if user_input.startswith('/update '):
            return self._handle_field_update(user_input)

        # --- STATE ROUTING ---

        if self.conversation_state == CONVERSATION_STATES['INTAKE']:
            return self._handle_intake(user_input)

        if self.conversation_state == CONVERSATION_STATES['FOLLOWUP']:
            return self._handle_followup(user_input)

        if self.conversation_state == CONVERSATION_STATES['CONDITION_DETAIL']:
            return self._handle_condition_detail(user_input)

        if self.conversation_state == CONVERSATION_STATES['PREF_TRAVEL']:
            return self._handle_pref_travel(user_input)
        if self.conversation_state == CONVERSATION_STATES['PREF_RISK']:
            return self._handle_pref_risk(user_input)
        if self.conversation_state == CONVERSATION_STATES['PREF_TREATMENT']:
            return self._handle_pref_treatment(user_input)

        if self.conversation_state == CONVERSATION_STATES['READY_TO_SEARCH']:
            return "I'm ready to search for trials.", False

        return "I'm not sure how to respond to that. Could you rephrase?", False

    # ------------------------------------------------------------------
    # Global intent handlers
    # ------------------------------------------------------------------

    def _handle_new_search(self) -> Tuple[str, bool]:
        """Start a new search but keep demographics (age, gender, location)."""
        saved_age = self.patient_data.get('age')
        saved_gender = self.patient_data.get('gender')
        saved_location = self.patient_data.get('location')
        saved_zip = self.patient_data.get('zip_code')

        self._clear_condition_data()

        has_demographics = saved_age is not None and saved_location

        if has_demographics:
            # Skip straight to intake for condition only
            self.conversation_state = CONVERSATION_STATES['INTAKE']
            # Build a summary of what we still have
            parts = []
            if saved_age:
                parts.append(f"age **{saved_age}**")
            if saved_gender:
                parts.append(f"**{saved_gender}**")
            if saved_location:
                parts.append(f"**{saved_location}**")
            info_str = ", ".join(parts)
            return (
                f"Starting fresh! I still have your info ({info_str}). "
                f"What condition would you like to search for?"
            ), False
        else:
            # Not enough demographics — do a full intake
            self.conversation_state = CONVERSATION_STATES['INTAKE']
            return (
                "Sure — let's search for something new. "
                "Tell me about your condition, and include your age and location "
                "if you haven't already."
            ), False

    def _handle_reset(self) -> Tuple[str, bool]:
        """Full reset — clear everything including demographics."""
        self.conversation_state = CONVERSATION_STATES['INTAKE']
        self.patient_data = {
            'age': None,
            'gender': None,
            'location': None,
            'zip_code': None,
            'conditions': [],
            'symptoms': '',
            'primary_condition': None,
            'preferences': None,
            'condition_details': {},
            'condition_category': None,
        }
        self._pending_followups = []
        self._followup_batch = 0
        return (
            "No problem — let's start completely fresh. Tell me about your condition, "
            "your age, and where you're located."
        ), False

    def _clear_condition_data(self) -> None:
        """Reset condition-specific data while preserving demographics."""
        self.patient_data['conditions'] = []
        self.patient_data['symptoms'] = ''
        self.patient_data['primary_condition'] = None
        self.patient_data['preferences'] = None
        self.patient_data['condition_details'] = {}
        self.patient_data['condition_category'] = None
        self.patient_data['condition_criteria_map'] = {}
        self._pending_followups = []
        self._followup_batch = 0
        self._use_dynamic_followups = False

    def _handle_question(self, answer: str) -> Tuple[str, bool]:
        """Answer a mid-flow question, then resume."""
        # Build a resume hint based on current state
        resume = ""
        if self.conversation_state == CONVERSATION_STATES['FOLLOWUP']:
            followup = _build_followup_ask(self.patient_data)
            if followup:
                resume = f"\n\nBack to your search — {followup}"
        elif self.conversation_state == CONVERSATION_STATES['CONDITION_DETAIL']:
            batch_q = self._build_condition_question_batch()
            if batch_q:
                resume = f"\n\nBack to your search — {batch_q}"
        elif self.conversation_state == CONVERSATION_STATES['PREF_TRAVEL']:
            resume = "\n\nBack to your search — **how far would you be willing to travel** for a trial?"
        elif self.conversation_state == CONVERSATION_STATES['PREF_RISK']:
            resume = "\n\nBack to your search — **how do you feel about experimental treatments?**"
        elif self.conversation_state == CONVERSATION_STATES['PREF_TREATMENT']:
            resume = "\n\nBack to your search — **any treatment types you'd prefer or want to avoid?**"

        return f"{answer}{resume}", False

    def _handle_correction(self, message: str) -> Tuple[str, bool]:
        """Handle corrections like 'actually I'm 52' or 'I meant breast cancer'."""
        saved_state = self.conversation_state

        # Re-extract fields from the correction message
        extracted = self._extract_fields_from_message(message)
        updated_fields = []

        # Apply corrections — overwrite existing values
        age = extracted.get('age')
        if age is not None and isinstance(age, (int, float)) and 10 <= int(age) <= 120:
            old_age = self.patient_data.get('age')
            self.patient_data['age'] = int(age)
            updated_fields.append(f"age to **{int(age)}**" + (f" (was {old_age})" if old_age else ""))

        gender = extracted.get('gender')
        if gender:
            self.patient_data['gender'] = str(gender).lower()
            updated_fields.append(f"gender to **{gender}**")

        location = extracted.get('location')
        if location:
            self.patient_data['location'] = str(location)
            zip_code = _try_extract_zip(str(location))
            if zip_code:
                self.patient_data['zip_code'] = zip_code
            updated_fields.append(f"location to **{location}**")

        conditions = extracted.get('conditions') or []
        if conditions:
            old_cond = self.patient_data.get('primary_condition') or (
                self.patient_data['conditions'][0] if self.patient_data.get('conditions') else None
            )
            self.patient_data['conditions'] = [str(c) for c in conditions]
            self.patient_data['primary_condition'] = str(conditions[0])
            updated_fields.append(
                f"condition to **{conditions[0]}**" + (f" (was {old_cond})" if old_cond else "")
            )

        symptoms = extracted.get('symptoms')
        if symptoms:
            self.patient_data['symptoms'] = str(symptoms)
            updated_fields.append("symptoms")

        if not updated_fields:
            return (
                "I understood you want to make a correction, but I couldn't identify "
                "what to change. Could you say something like \"my age is 52\" or "
                "\"I have breast cancer, not lung cancer\"?"
            ), False

        # Build response
        ack = "Updated " + ", ".join(updated_fields) + "."

        # Check if all required fields are filled — if so, re-trigger search
        followup = _build_followup_ask(self.patient_data)
        if followup is None:
            # All fields complete — go to ready_to_search to re-run
            self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
            return f"{ack} Let me re-search with your updated information...", False

        # Otherwise restore state and continue
        self.conversation_state = saved_state
        return ack, False

    def _handle_field_update(self, message: str) -> Tuple[str, bool]:
        """Handle /update field=value commands from the summary card UI."""
        # Parse: /update age=52 or /update condition=breast cancer
        parts = message[len('/update '):].split('=', 1)
        if len(parts) != 2:
            return "I couldn't parse that update.", False

        field_name = parts[0].strip().lower()
        value = parts[1].strip()

        if field_name == 'age':
            try:
                age = int(value)
                if 10 <= age <= 120:
                    self.patient_data['age'] = age
                    self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
                    return f"Updated age to **{age}**. Re-searching...", False
            except ValueError:
                return "Please enter a valid age number.", False

        elif field_name in ('location', 'loc'):
            self.patient_data['location'] = value
            zip_code = _try_extract_zip(value)
            if zip_code:
                self.patient_data['zip_code'] = zip_code
            self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
            return f"Updated location to **{value}**. Re-searching...", False

        elif field_name in ('condition', 'conditions'):
            conditions = [c.strip() for c in value.split(',') if c.strip()]
            self.patient_data['conditions'] = conditions
            self.patient_data['primary_condition'] = conditions[0] if conditions else None
            self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
            return f"Updated condition to **{conditions[0] if conditions else value}**. Re-searching...", False

        elif field_name == 'gender':
            self.patient_data['gender'] = value.lower()
            self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
            return f"Updated gender to **{value}**. Re-searching...", False

        return f"I don't recognize the field '{field_name}'.", False

    # ------------------------------------------------------------------
    # State handlers
    # ------------------------------------------------------------------

    def _handle_intake(self, message: str) -> Tuple[str, bool]:
        """Handle the first open-ended message."""
        # Check for gibberish before calling LLM
        if _looks_like_gibberish(message):
            return (
                "I couldn't quite understand that. Could you describe your health "
                "condition in a few words? For example: \"I have type 2 diabetes\" "
                "or \"breast cancer, stage 2.\""
            ), False

        extracted = self._extract_fields_from_message(message)
        newly_filled = _merge_extracted(self.patient_data, extracted)

        # If LLM extracted nothing meaningful, ask a clarifying question
        if not newly_filled and not self.patient_data.get('conditions'):
            return (
                "I wasn't able to pick up specific details from that. "
                "Could you tell me what health condition you're looking for trials for? "
                "You can also include your age and location."
            ), False

        # Build acknowledgment + ask for missing
        ack = _build_acknowledgment(self.patient_data, newly_filled)

        # Check for redundant condition/symptom overlap
        redundant_q = _detect_redundant_condition_symptom(self.patient_data)
        if redundant_q:
            # Clear the duplicate symptom so followup re-asks properly
            self.patient_data['symptoms'] = ''
            self.conversation_state = CONVERSATION_STATES['FOLLOWUP']
            response = f"{ack}\n\n{redundant_q}" if ack else redundant_q
            return response, False

        followup_ask = _build_followup_ask(self.patient_data)

        if followup_ask is None:
            # All required fields filled — try condition-specific follow-ups
            cond_result = self._try_transition_to_condition_detail(ack)
            if cond_result:
                return cond_result
            # No condition follow-ups available — go to preferences
            return self._transition_to_preferences(ack)

        # Still missing fields — move to followup
        self.conversation_state = CONVERSATION_STATES['FOLLOWUP']
        response = f"{ack}\n\n{followup_ask}" if ack else followup_ask
        return response, False

    def _handle_followup(self, message: str) -> Tuple[str, bool]:
        """Handle follow-up messages to fill remaining fields."""
        # Check for gibberish
        if _looks_like_gibberish(message):
            followup_ask = _build_followup_ask(self.patient_data)
            return (
                f"I couldn't understand that. {followup_ask or 'Could you try rephrasing?'}"
            ), False

        extracted = self._extract_fields_from_message(message)
        newly_filled = _merge_extracted(self.patient_data, extracted)

        # Also try direct parsing for simple responses (e.g., just a number for age)
        if not newly_filled:
            newly_filled = self._try_direct_parse(message)

        # If still nothing extracted, gently re-ask
        if not newly_filled:
            followup_ask = _build_followup_ask(self.patient_data)
            return (
                f"I wasn't able to pick up what I needed from that. {followup_ask or 'Could you try rephrasing?'}"
            ), False

        ack = _build_acknowledgment(self.patient_data, newly_filled)
        followup_ask = _build_followup_ask(self.patient_data)

        if followup_ask is None:
            # All required fields filled — try condition-specific follow-ups
            cond_result = self._try_transition_to_condition_detail(ack)
            if cond_result:
                return cond_result
            # No condition follow-ups — go to preferences
            return self._transition_to_preferences(ack)

        # Still missing — ask again
        if ack:
            return f"{ack}\n\n{followup_ask}", False
        return followup_ask, False

    def _try_direct_parse(self, message: str) -> List[str]:
        """Try simple rule-based parsing for short responses."""
        filled = []
        text = message.strip()

        # Age: bare number
        if self.patient_data.get('age') is None:
            try:
                age = int(text)
                if 1 <= age <= 120:
                    self.patient_data['age'] = age
                    filled.append('age')
                    return filled
            except ValueError:
                pass

        # ZIP code
        if self.patient_data.get('location') is None:
            zip_match = re.match(r'^\d{5}(-\d{4})?$', text)
            if zip_match:
                self.patient_data['location'] = text
                self.patient_data['zip_code'] = text[:5]
                filled.append('location')
                return filled
            # City, State pattern
            if re.match(r'^[A-Za-z\s]+,\s*[A-Za-z]{2}$', text):
                self.patient_data['location'] = text
                filled.append('location')
                return filled

        # Gender
        if self.patient_data.get('gender') is None:
            gender = _try_extract_gender(text)
            if gender:
                self.patient_data['gender'] = gender
                filled.append('gender')
                return filled

        # Conditions: if we still need them and user typed something
        if not self.patient_data.get('conditions') and len(text) > 1:
            conditions = [c.strip() for c in re.split(r'[,\n]', text) if c.strip()]
            if conditions:
                self.patient_data['conditions'] = conditions
                self.patient_data['primary_condition'] = conditions[0]
                filled.append('conditions')
                return filled

        return filled

    # ------------------------------------------------------------------
    # Condition-specific follow-up questions
    # ------------------------------------------------------------------

    def _try_transition_to_condition_detail(self, ack: str = "") -> Optional[Tuple[str, bool]]:
        """If condition is known and has follow-ups, transition to CONDITION_DETAIL.

        Uses dynamic criteria-driven questions first (derived from the actual
        trial database), falling back to hardcoded condition_followups.

        Returns (response, is_done) if transitioning, None otherwise.
        """
        condition = self.patient_data.get('primary_condition') or (
            self.patient_data['conditions'][0]
            if self.patient_data.get('conditions') else None
        )
        if not condition:
            return None

        # Try dynamic questions first (data-driven from trial criteria)
        dynamic_qs = discover_followup_questions(
            condition,
            known_attrs=self.patient_data.get('condition_details'),
            patient_data=self.patient_data,
        )

        if dynamic_qs:
            # Convert QuestionTemplate objects to the dict format used by
            # _build_condition_question_batch and _handle_condition_detail
            self._pending_followups = [
                {
                    'question': qt.question_text,
                    'attribute': qt.attribute_key,
                    'value_type': qt.value_type,
                    'choices': qt.choices,
                    'criterion_types': qt.criterion_types,
                }
                for qt in dynamic_qs
            ]
            self.patient_data['condition_category'] = 'dynamic'
            self._use_dynamic_followups = True
        else:
            # Fall back to hardcoded condition categories
            category = detect_condition(condition)
            if not category:
                return None

            followups = get_followup_questions(condition)
            if not followups:
                return None

            self.patient_data['condition_category'] = category.category_id
            self._pending_followups = followups
            self._use_dynamic_followups = False

        self._followup_batch = 0

        # Build the first batch of grouped questions
        question_msg = self._build_condition_question_batch()
        if not question_msg:
            return None

        self.conversation_state = CONVERSATION_STATES['CONDITION_DETAIL']
        intro = f"I'd like to ask a few quick questions about your **{condition}**"
        full_msg = f"{ack}\n\n{intro} to help find the most relevant trials:\n\n{question_msg}\n\nIf you're not sure about any of these, just say \"I don't know\" and I'll search more broadly."

        return full_msg.strip(), False

    def _build_condition_question_batch(self) -> Optional[str]:
        """Build a message with 2-3 grouped follow-up questions from the pending list.

        Returns the formatted question text, or None if no questions remain.
        """
        remaining = [fq for fq in self._pending_followups
                     if fq['attribute'] not in self.patient_data.get('condition_details', {})]
        if not remaining:
            return None

        # Take 2-3 questions per batch
        batch_size = min(3, len(remaining))
        batch = remaining[:batch_size]

        parts = []
        for i, fq in enumerate(batch, 1):
            q = fq['question']
            if fq.get('choices'):
                options = ", ".join(fq['choices'])
                q += f" ({options})"
            parts.append(f"**{i}.** {q}")

        return "\n".join(parts)

    def _handle_condition_detail(self, message: str) -> Tuple[str, bool]:
        """Handle responses to condition-specific follow-up questions."""
        text = message.strip().lower()

        # Handle "I don't know" / skip — only if the ENTIRE message is a skip
        # (not if "I don't know" appears as part of a multi-answer response)
        skip_phrases = [
            "i don't know", "idk", "not sure", "no idea", "skip",
            "don't know", "dont know", "i'm not sure", "im not sure",
            "i have no idea", "no clue", "unsure", "haven't been told",
            "skip all", "skip these",
        ]
        # Only skip if the entire message (stripped) matches a skip phrase
        is_full_skip = any(text == phrase or text == phrase + "."
                           for phrase in skip_phrases)

        if is_full_skip:
            # Mark all pending as skipped and move on
            ack = "No problem — I'll search broadly and your doctor can help narrow it down later."
            return self._finish_condition_detail(ack)

        # Parse answers from the response — try to match each pending question
        remaining = [fq for fq in self._pending_followups
                     if fq['attribute'] not in self.patient_data.get('condition_details', {})]
        batch = remaining[:3]  # Current batch

        if not batch:
            return self._finish_condition_detail("")

        parsed_any = False
        details = self.patient_data.setdefault('condition_details', {})

        # Also store criterion_types mapping for dynamic followups
        criteria_map = self.patient_data.setdefault('condition_criteria_map', {})

        def _store_answer(fq, value):
            """Store an answer and its associated criterion_types."""
            attr = fq['attribute']
            details[attr] = value
            # Store criterion_types for this attribute (used by matching pipeline)
            if fq.get('criterion_types'):
                criteria_map[attr] = fq['criterion_types']

        if len(batch) == 1:
            # Single question — entire response is the answer
            fq = batch[0]
            attr, value = parse_answer(message, fq)
            if value is not None:
                _store_answer(fq, value)
                parsed_any = True
        else:
            # Multiple questions — try to split numbered answers
            # Patterns: "1. X  2. Y  3. Z" or "1) X 2) Y" or with newlines
            parts = re.split(r'\s*\d+[.)]\s+', message.strip())
            # First element is empty if message starts with "1."
            parts = [p.strip() for p in parts if p.strip()]

            if len(parts) >= len(batch):
                # Successfully split numbered responses
                for fq, ans_text in zip(batch, parts):
                    attr, value = parse_answer(ans_text, fq)
                    if value is not None:
                        _store_answer(fq, value)
                        parsed_any = True
            else:
                # Try comma/newline splitting
                parts = re.split(r'\n|,\s*(?=[A-Z])', message.strip())
                parts = [p.strip() for p in parts if p.strip()]

                if len(parts) >= len(batch):
                    for fq, ans_text in zip(batch, parts):
                        attr, value = parse_answer(ans_text, fq)
                        if value is not None:
                            _store_answer(fq, value)
                            parsed_any = True
                else:
                    # Fall back: parse entire message against each question
                    for fq in batch:
                        attr, value = parse_answer(message, fq)
                        if value is not None:
                            _store_answer(fq, value)
                            parsed_any = True

        if not parsed_any:
            # Couldn't parse — store as raw text for the first unanswered question
            for fq in batch:
                if fq['attribute'] not in details:
                    _store_answer(fq, message.strip())
                    parsed_any = True
                    break

        self._followup_batch += 1

        # Check if there are more questions to ask (batch 2)
        remaining_after = [fq for fq in self._pending_followups
                           if fq['attribute'] not in details]

        if remaining_after and self._followup_batch < 2:
            ack = "Thanks for those details."

            next_batch = self._build_condition_question_batch()
            if next_batch:
                return f"{ack} A couple more:\n\n{next_batch}", False

        # Done with condition details — move to preferences
        ack = "Thanks — that helps a lot with matching."
        return self._finish_condition_detail(ack)

    def _finish_condition_detail(self, ack: str) -> Tuple[str, bool]:
        """Finish condition detail collection and move to next state."""
        # Check if demographics are still missing
        followup_ask = _build_followup_ask(self.patient_data)
        if followup_ask is not None:
            self.conversation_state = CONVERSATION_STATES['FOLLOWUP']
            if ack:
                return f"{ack}\n\n{followup_ask}", False
            return followup_ask, False

        # All required fields filled — move to preferences
        return self._transition_to_preferences(ack)

    # ------------------------------------------------------------------
    # Conversational preference capture
    # ------------------------------------------------------------------

    def _ensure_preferences(self) -> Dict:
        """Lazily initialize the preferences dict."""
        if self.patient_data.get('preferences') is None:
            self.patient_data['preferences'] = {
                'travel_willingness': 3,     # default: regional
                'risk_tolerance': 3,         # default: open to newer
                'schedule_flexibility': 3,   # default: moderate
                'acceptable_modalities': None,
            }
        return self.patient_data['preferences']

    def _transition_to_preferences(self, ack: str = "") -> Tuple[str, bool]:
        """Transition from intake/followup into a single combined preference question."""
        self._ensure_preferences()
        self.conversation_state = CONVERSATION_STATES['PREF_TRAVEL']
        pref_q = (
            "Any preferences on **how far you'd travel**, **what kind of trials** "
            "you're open to, or **treatment types** you'd prefer or avoid? "
            "Or are you open to anything?"
        )
        if ack:
            return f"{ack}\n\n{pref_q}", False
        return pref_q, False

    def _handle_pref_travel(self, message: str) -> Tuple[str, bool]:
        """Parse all preferences from one response. Ask follow-ups only for partial answers."""
        prefs = self._ensure_preferences()

        _TRAVEL_LABELS = {1: 'local trials', 2: 'nearby trials', 3: 'regional trials',
                          4: 'statewide trials', 5: 'trials anywhere in the country'}
        _RISK_LABELS = {1: "proven treatments", 2: "later-phase trials",
                        3: "a balanced mix", 4: "some experimental options",
                        5: "cutting-edge trials"}

        stripped = message.strip().lower()

        # "Open to anything" / skip — go straight to search
        open_phrases = [
            'open to anything', 'open to everything', 'no preference',
            "don't care", "doesn't matter", 'skip', 'no', 'nope',
            'anything', 'whatever', 'all good', "i'm flexible",
        ]
        if any(phrase in stripped for phrase in open_phrases):
            self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
            return "No preferences — I'll show you the best matches across the board. Searching...", False

        # Try to extract all three from one response
        ack_parts = []
        got_travel = False
        got_risk = False
        got_treatment = False

        travel = _parse_travel(message)
        if travel is not None:
            prefs['travel_willingness'] = travel
            ack_parts.append(f"**{_TRAVEL_LABELS.get(travel, 'regional trials')}**")
            got_travel = True

        risk = _parse_risk(message)
        if risk is not None:
            prefs['risk_tolerance'] = risk
            ack_parts.append(f"**{_RISK_LABELS.get(risk, 'a balanced mix')}**")
            got_risk = True

        preferred, avoided = _parse_modalities(message)
        if preferred:
            prefs['acceptable_modalities'] = list(preferred)
            ack_parts.append(f"prioritize **{', '.join(preferred).lower()}**")
            got_treatment = True
        elif avoided:
            from preference_scorer import ALL_MODALITIES
            remaining = set(ALL_MODALITIES) - avoided
            if remaining:
                prefs['acceptable_modalities'] = list(remaining)
            ack_parts.append(f"avoid **{', '.join(avoided).lower()}**")
            got_treatment = True

        if _mentions_schedule(message):
            prefs['schedule_flexibility'] = 2

        # Build acknowledgment
        if ack_parts:
            ack = "Got it — " + ", ".join(ack_parts) + "."
        else:
            ack = "Noted."

        # If we got at least one signal, or the message was substantive, go to search
        if got_travel or got_risk or got_treatment or len(stripped.split()) >= 3:
            self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
            return f"{ack} Searching for clinical trials tailored to you...", False

        # Very short/unclear — ask one follow-up
        self.conversation_state = CONVERSATION_STATES['PREF_RISK']
        return f"{ack} Could you say a bit more — like how far you'd travel, or if you'd prefer well-tested trials?", False

    def _handle_pref_risk(self, message: str) -> Tuple[str, bool]:
        """Handle follow-up if first combined answer was too vague."""
        prefs = self._ensure_preferences()

        travel = _parse_travel(message)
        if travel is not None:
            prefs['travel_willingness'] = travel

        risk = _parse_risk(message)
        if risk is not None:
            prefs['risk_tolerance'] = risk

        preferred, avoided = _parse_modalities(message)
        if preferred:
            prefs['acceptable_modalities'] = list(preferred)
        elif avoided:
            from preference_scorer import ALL_MODALITIES
            remaining = set(ALL_MODALITIES) - avoided
            if remaining:
                prefs['acceptable_modalities'] = list(remaining)

        self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
        return "Got it. Searching for clinical trials tailored to you...", False

    def _handle_pref_treatment(self, message: str) -> Tuple[str, bool]:
        """Fallback — should rarely reach here. Just go to search."""
        self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
        return "Searching for clinical trials tailored to you...", False

    # ------------------------------------------------------------------
    # Helpers (kept from original for compatibility)
    # ------------------------------------------------------------------

    def _connect(self) -> sqlite3.Connection:
        conn = sqlite3.connect(self.db_path)
        conn.row_factory = sqlite3.Row
        return conn

    def _get_criteria_attributes(self) -> Set[str]:
        conn = self._connect()
        cursor = conn.cursor()
        try:
            cursor.execute("SELECT DISTINCT criterion_type FROM criteria")
            return {row[0] for row in cursor.fetchall()}
        finally:
            conn.close()

    def get_patient_data_for_matching(self) -> Dict:
        return {
            'age': self.patient_data['age'],
            'gender': self.patient_data['gender'],
            'primary_condition': self.patient_data['primary_condition'] or
                                (self.patient_data['conditions'][0] if self.patient_data['conditions'] else None),
            'all_conditions': self.patient_data['conditions'],
            'symptoms': self.patient_data['symptoms'],
        }

    def _get_trial_title(self, nct_id: str) -> str:
        conn = self._connect()
        cursor = conn.cursor()
        try:
            cursor.execute("SELECT title FROM trials WHERE nct_id = ?", (nct_id,))
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
            SELECT ptr.nct_id, ptr.rank, t.title, t.phase, t.status
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

    def fetch_trial_characteristics(self, nct_id: str) -> Dict[str, Dict]:
        if nct_id in self._characteristic_cache:
            return self._characteristic_cache[nct_id]
        conn = self._connect()
        cursor = conn.cursor()
        cursor.execute(
            "SELECT characteristic_key, characteristic_value, value_type "
            "FROM trial_characteristics WHERE nct_id = ?",
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

    def filter_trials_by_preferences(
        self, trials: Sequence[sqlite3.Row], preferences: PreferenceState,
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
