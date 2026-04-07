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
    re.compile(r"(?:actually|sorry|oops|correction|i meant|i mean|no,?\s+i(?:'m| am))\b", re.I),
    re.compile(r"\bwait,?\s+(?:i(?:'m| am)|my|it'?s|that'?s|i meant|actually)", re.I),
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

# Hold / wait — patient wants to add more info before searching
_HOLD_PATTERNS = [
    re.compile(r"\b(?:let me add|want to (?:add|tell)|hold on|wait|before you search|not (?:yet|ready)|one more thing|I also have|can I add)\b", re.I),
    re.compile(r"\b(?:more (?:detail|info)|add more|wait a (?:sec|moment|minute))\b", re.I),
]

_QUESTION_PATTERNS = [
    re.compile(r"\b(?:what (?:does|is|are)|how (?:does|do|long)|can you explain|tell me about|what's|what does)\b", re.I),
    re.compile(r"\b(?:what do you mean|what is (?:a|an|the)|what are)\b", re.I),
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
    "ecog": (
        "An **ECOG score** measures how well you can carry out daily activities:\n\n"
        "**0** — Fully active, no restrictions\n"
        "**1** — Can't do strenuous work, but can handle light activity and self-care\n"
        "**2** — Up and about more than 50% of the day, can do self-care but not work\n"
        "**3** — In bed or a chair more than 50% of the day, limited self-care\n"
        "**4** — Completely bedridden\n\n"
        "Most trials require ECOG 0-1 (fully active or minor limitations)."
    ),
    "informed consent": (
        "**Informed consent** means you'll receive a detailed explanation of the trial — "
        "what it involves, potential risks, benefits, and alternatives — before you agree "
        "to participate. You can withdraw at any time, even after signing."
    ),
    "clinical trial": (
        "A **clinical trial** is a research study that tests new treatments, drugs, or "
        "procedures in people. They're how new medical treatments get proven safe and effective "
        "before becoming widely available. Participation is always voluntary."
    ),
    "biomarker": (
        "A **biomarker** is a measurable indicator in your body — like a gene mutation, "
        "protein level, or blood test result — that helps doctors understand your disease "
        "and predict which treatments might work best for you."
    ),
    "double blind": (
        "**Double-blind** means neither you nor your doctor knows which treatment group "
        "you're in during the study. This prevents bias in evaluating results. "
        "An independent team monitors safety throughout."
    ),
    "standard of care": (
        "**Standard of care** is the current best-known treatment for your condition. "
        "Many trials compare a new treatment against the standard of care, so even if "
        "you're in the control group, you still receive established treatment."
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


def _detect_hold(text: str) -> bool:
    """Check if the user wants to pause and add more information."""
    return any(p.search(text) for p in _HOLD_PATTERNS)


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
        self._use_dynamic_followups: bool = False    # True if using dynamic criteria-driven questions
        self.quick_replies: Optional[List[Dict]] = None  # Server-driven quick-reply buttons for frontend

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

        # Hold / wait — patient wants to add more before searching
        # (checked before correction, since "wait" can appear in both)
        if self.conversation_state in (
            CONVERSATION_STATES['PREF_TRAVEL'],
            CONVERSATION_STATES['PREF_RISK'],
            CONVERSATION_STATES['PREF_TREATMENT'],
            CONVERSATION_STATES['READY_TO_SEARCH'],
        ) and _detect_hold(user_input):
            return self._handle_hold(user_input)

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
        """Reset — clear condition data but preserve demographics."""
        saved_age = self.patient_data.get('age')
        saved_gender = self.patient_data.get('gender')
        saved_location = self.patient_data.get('location')
        saved_zip = self.patient_data.get('zip_code')

        self.conversation_state = CONVERSATION_STATES['INTAKE']
        self.patient_data = {
            'age': saved_age,
            'gender': saved_gender,
            'location': saved_location,
            'zip_code': saved_zip,
            'conditions': [],
            'symptoms': '',
            'primary_condition': None,
            'preferences': None,
            'condition_details': {},
            'condition_category': None,
        }
        self._pending_followups = []
        self.quick_replies = None

        has_demographics = saved_age is not None and saved_location
        if has_demographics:
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

        return (
            "No problem — let's start fresh. Tell me about your condition, "
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
        self._use_dynamic_followups = False
        self.quick_replies = None

    def _handle_question(self, answer: str) -> Tuple[str, bool]:
        """Answer a mid-flow question, then resume where we left off."""
        # Build a contextual resume hint based on current state
        resume = ""
        if self.conversation_state == CONVERSATION_STATES['FOLLOWUP']:
            followup = _build_followup_ask(self.patient_data)
            if followup:
                resume = f"\n\nNow, back to your search — {followup}"
        elif self.conversation_state == CONVERSATION_STATES['CONDITION_DETAIL']:
            remaining = [fq for fq in self._pending_followups
                         if fq['attribute'] not in self.patient_data.get('condition_details', {})]
            if remaining:
                # Re-state the first unanswered question specifically
                first_q = remaining[0]['question']
                if len(remaining) > 1:
                    resume = (f"\n\nNow, back to your search — {first_q} "
                              f"(and {len(remaining) - 1} more when you're ready)")
                else:
                    resume = f"\n\nNow, back to your search — {first_q}"
        elif self.conversation_state == CONVERSATION_STATES['PREF_TRAVEL']:
            resume = ("\n\nNow, back to your search — any preferences on "
                      "**travel distance**, **trial type**, or **treatment type**?")
        elif self.conversation_state == CONVERSATION_STATES['PREF_RISK']:
            resume = "\n\nNow, back to your search — **how do you feel about experimental treatments?**"
        elif self.conversation_state == CONVERSATION_STATES['PREF_TREATMENT']:
            resume = "\n\nNow, back to your search — **any treatment types you'd prefer or want to avoid?**"

        return f"{answer}{resume}", False

    def _handle_hold(self, message: str) -> Tuple[str, bool]:
        """Handle 'hold on' / 'let me add more' — pause before searching."""
        # Try to extract any new data from the hold message itself
        extracted = self._extract_fields_from_message(message)
        newly_filled = _merge_extracted(self.patient_data, extracted)

        if newly_filled:
            ack = _build_acknowledgment(self.patient_data, newly_filled)
            self.conversation_state = CONVERSATION_STATES['FOLLOWUP']
            return f"{ack}\n\nAnything else you'd like to add before I search?", False

        # No new data — just acknowledge and wait
        self.conversation_state = CONVERSATION_STATES['FOLLOWUP']
        return "Of course! What else can you tell me?", False

    def _handle_correction(self, message: str) -> Tuple[str, bool]:
        """Handle corrections like 'actually I'm 52' or 'I meant breast cancer'.

        When condition changes, clears stale follow-up data and re-triggers search.
        """
        # Re-extract fields from the correction message
        extracted = self._extract_fields_from_message(message)

        # Rule-based fallback for conditions: "I meant X not Y" / "I have X, not Y"
        if not extracted.get('conditions'):
            # "I meant X not Y" — extract X
            m = re.search(
                r"(?:i\s+meant|it'?s\s+actually|actually\s+(?:i\s+have|it'?s))\s+(.+?)(?:\s+not\s+.+)?$",
                message, re.I
            )
            if m:
                cond_text = m.group(1).strip().rstrip('.,!')
                if len(cond_text) > 2 and not re.match(r'^\d+$', cond_text):
                    extracted['conditions'] = [cond_text]

        if not extracted.get('conditions'):
            # "not X, I have Y" / "not X, it's Y"
            m = re.search(
                r"not\s+\w[\w\s]*?,\s*(?:it'?s|i (?:have|meant))\s+(.+?)$",
                message, re.I
            )
            if m:
                cond_text = m.group(1).strip().rstrip('.,!')
                if len(cond_text) > 2:
                    extracted['conditions'] = [cond_text]

        if not extracted.get('conditions'):
            # "sorry, I have X" / "actually I have X"
            m = re.search(
                r"(?:sorry|actually|oops),?\s+i\s+have\s+(.+?)$",
                message, re.I
            )
            if m:
                cond_text = m.group(1).strip().rstrip('.,!')
                if len(cond_text) > 2:
                    extracted['conditions'] = [cond_text]

        # Rule-based age correction: "actually 45" / "I'm 45" / "my age is 45"
        if not extracted.get('age'):
            extracted['age'] = _try_extract_age(message)
            # Also try: "actually X not Y" where X is a number
            if not extracted.get('age'):
                m = re.search(r'(?:actually|meant)\s+(\d{1,3})\b', message, re.I)
                if m:
                    age = int(m.group(1))
                    if 1 <= age <= 120:
                        extracted['age'] = age

        updated_fields = []
        condition_changed = False

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
            condition_changed = True

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

        # If condition changed, clear stale condition-specific data
        if condition_changed:
            self.patient_data['condition_details'] = {}
            self.patient_data['condition_category'] = None
            self.patient_data['condition_criteria_map'] = {}
            self.patient_data['preferences'] = None
            self._pending_followups = []
            self._use_dynamic_followups = False

        # Build response
        ack = "Updated " + ", ".join(updated_fields) + "."

        # Check if all required fields are filled — if so, re-trigger search
        followup = _build_followup_ask(self.patient_data)
        if followup is None:
            self.conversation_state = CONVERSATION_STATES['READY_TO_SEARCH']
            return f"{ack} Searching with your updated information...", False

        # Still missing required fields
        self.conversation_state = CONVERSATION_STATES['FOLLOWUP']
        return f"{ack}\n\n{followup}", False

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

        Presents ALL questions in a single bullet-point message and sets
        self.quick_replies with button metadata for the frontend.

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

        if not self._pending_followups:
            return None

        # Build ALL questions as numbered bullet points in one message
        parts = []
        quick_replies: List[Dict] = []
        for i, fq in enumerate(self._pending_followups, 1):
            q = fq['question']
            if fq.get('choices'):
                options = ", ".join(fq['choices'])
                q += f" ({options})"
            parts.append(f"**{i}.** {q}")

            # Build quick-reply button metadata for each question
            if fq.get('choices'):
                quick_replies.append({
                    'question_num': i,
                    'attribute': fq['attribute'],
                    'type': 'choice',
                    'options': fq['choices'],
                })
            elif fq.get('value_type') in ('boolean', 'yes_no'):
                quick_replies.append({
                    'question_num': i,
                    'attribute': fq['attribute'],
                    'type': 'yes_no',
                    'options': ['Yes', 'No', "I don't know"],
                })

        question_msg = "\n".join(parts)

        self.conversation_state = CONVERSATION_STATES['CONDITION_DETAIL']

        # Set quick_replies for frontend (including a skip-all option)
        quick_replies.append({
            'type': 'skip',
            'options': ["I don't know any of these"],
        })
        self.quick_replies = quick_replies

        intro = f"I found some potential trials for **{condition}**. A few quick questions to improve your matches:"
        full_msg = f"{ack}\n\n{intro}\n\n{question_msg}\n\nAnswer as many as you can — just say \"skip\" for any you're not sure about."

        return full_msg.strip(), False

    def _handle_condition_detail(self, message: str) -> Tuple[str, bool]:
        """Handle responses to condition-specific follow-up questions.

        All questions were presented at once, so we parse answers for all
        pending questions from a single freeform response. Unanswered
        questions are left as unknown (not re-asked).
        """
        text = message.strip().lower()

        # Handle "I don't know" / skip — only if the ENTIRE message is a skip
        skip_phrases = [
            "i don't know", "idk", "not sure", "no idea", "skip",
            "don't know", "dont know", "i'm not sure", "im not sure",
            "i have no idea", "no clue", "unsure", "haven't been told",
            "skip all", "skip these", "i don't know any of these",
        ]
        is_full_skip = any(text == phrase or text == phrase + "."
                           for phrase in skip_phrases)

        if is_full_skip:
            ack = "No problem — I'll search broadly and your doctor can help narrow it down later."
            return self._finish_condition_detail(ack)

        # Parse answers for ALL pending questions at once
        remaining = [fq for fq in self._pending_followups
                     if fq['attribute'] not in self.patient_data.get('condition_details', {})]

        if not remaining:
            return self._finish_condition_detail("")

        details = self.patient_data.setdefault('condition_details', {})
        criteria_map = self.patient_data.setdefault('condition_criteria_map', {})

        # Per-answer "I don't know" phrases — these mean "skip this one"
        _IDK_PHRASES = {
            "i don't know", "idk", "not sure", "no idea", "skip",
            "don't know", "dont know", "unsure", "?", "n/a", "na",
            "i'm not sure", "im not sure", "no clue",
        }

        def _is_idk(text: str) -> bool:
            return text.strip().lower().rstrip('.!') in _IDK_PHRASES

        def _store_answer(fq, value):
            """Store an answer and its associated criterion_types.
            If the answer is 'I don't know', store as None (explicit unknown)."""
            attr = fq['attribute']
            if isinstance(value, str) and _is_idk(value):
                details[attr] = None  # explicit unknown — acknowledged, won't re-ask
            else:
                details[attr] = value
            if fq.get('criterion_types'):
                criteria_map[attr] = fq['criterion_types']

        # Strategy 1: Split on numbered patterns (1. X  2. Y  3. Z)
        numbered_parts = re.split(r'\s*\d+[.)]\s+', message.strip())
        numbered_parts = [p.strip() for p in numbered_parts if p.strip()]

        # Strategy 2: Split on newlines
        newline_parts = [p.strip() for p in message.strip().split('\n') if p.strip()]

        # Strategy 3: Split on commas followed by uppercase or numbered items
        comma_parts = re.split(r',\s*(?=[A-Z1-9])', message.strip())
        comma_parts = [p.strip() for p in comma_parts if p.strip()]

        # Pick the best split: the one closest to the number of questions
        n_questions = len(remaining)
        candidates = [
            (numbered_parts, abs(len(numbered_parts) - n_questions)),
            (newline_parts, abs(len(newline_parts) - n_questions)),
            (comma_parts, abs(len(comma_parts) - n_questions)),
        ]
        # Prefer splits that have at least as many parts as questions
        candidates.sort(key=lambda x: (x[1], -len(x[0])))
        best_parts = candidates[0][0]

        parsed_count = 0
        if len(best_parts) >= n_questions:
            # Map each part to its corresponding question
            for fq, ans_text in zip(remaining, best_parts):
                attr, value = parse_answer(ans_text, fq)
                if value is not None:
                    _store_answer(fq, value)
                    parsed_count += 1
        elif len(best_parts) > 1:
            # Partial match — assign what we can
            for fq, ans_text in zip(remaining, best_parts):
                attr, value = parse_answer(ans_text, fq)
                if value is not None:
                    _store_answer(fq, value)
                    parsed_count += 1
        else:
            # Single response — try parsing against each question
            for fq in remaining:
                attr, value = parse_answer(message, fq)
                if value is not None:
                    _store_answer(fq, value)
                    parsed_count += 1

        if parsed_count == 0:
            # Couldn't parse — store as raw text for the first unanswered question
            for fq in remaining:
                if fq['attribute'] not in details:
                    _store_answer(fq, message.strip())
                    break

        # Done — don't re-ask unanswered questions (they stay as unknown)
        answered = sum(1 for fq in self._pending_followups if fq['attribute'] in details)
        skipped = sum(1 for fq in self._pending_followups
                      if fq['attribute'] in details and details[fq['attribute']] is None)
        known = answered - skipped
        total = len(self._pending_followups)

        if answered == total and skipped == 0:
            ack = "Thanks — that helps a lot with matching."
        elif skipped > 0 and known > 0:
            ack = (f"Got it — answered {known} of {total}. "
                   f"No problem on the ones you're not sure about — "
                   f"I'll include those as unknown and your doctor can help verify later.")
        elif skipped == total or answered == 0:
            ack = ("No problem — I'll include those as unknown and your doctor can "
                   "help verify later.")
        elif answered > 0:
            ack = f"Got it — answered {known} of {total}. I'll work with what I have for the rest."
        else:
            ack = "Thanks — I'll search with the information I have."
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
        self.quick_replies = [{
            'type': 'choice',
            'options': ['Open to anything', 'Local only', 'No surgery', 'Proven treatments only'],
        }]
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
