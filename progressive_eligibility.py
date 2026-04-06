"""
Progressive eligibility checking module.

Provides multi-turn conversational flows for checking trial eligibility
criteria in priority order, handling boundary cases with clinical review
recommendations, and generating plain-language clarifying questions.
"""

from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional

from smt_matcher import SMTMatcher
from eligibility_visualizer import (
    EligibilityVisualizer,
    _format_value,
    _generate_clarifying_question,
    CriterionStatus,
)


# ---------------------------------------------------------------------------
# Priority tiers for criteria checking
# ---------------------------------------------------------------------------

# Hard exclusions checked first (highest priority = lowest number)
_PRIORITY_TIERS = {
    # Tier 1: Demographics — quick hard exclusions
    "age": 1,
    "sex": 1,
    "gender": 1,
    # Tier 2: Primary diagnosis
    "diagnosis": 2,
    "finding": 2,
    "malignant": 2,
    "neoplastic": 2,
    # Tier 3: Critical exclusions
    "pregnant": 3,
    "breastfeeding": 3,
    "lactating": 3,
    "childbearing": 3,
    # Tier 4: Medical history
    "inthehistory": 4,
    "inthepast": 4,
    "surgery": 4,
    "operative": 4,
    # Tier 5: Lab values and measurements
    "value_recorded": 5,
    "measurement": 5,
    "level": 5,
    "count": 5,
    # Tier 6: Medications and treatments
    "medication": 6,
    "drug": 6,
    "exposed_to": 6,
    "treatment": 6,
    # Tier 7: Lifestyle and other
    "alcohol": 7,
    "smoking": 7,
    "contraception": 7,
}


def _get_criterion_priority(attribute: str) -> int:
    """Get the priority tier for a criterion attribute (lower = higher priority)."""
    attr_lower = attribute.lower()
    for keyword, tier in _PRIORITY_TIERS.items():
        if keyword in attr_lower:
            return tier
    return 8  # Default: lowest priority


# ---------------------------------------------------------------------------
# Boundary case detection
# ---------------------------------------------------------------------------

# Criteria patterns that frequently have boundary/judgment-dependent interpretations
_BOUNDARY_PATTERNS = {
    "cardiovascular": {
        "description": "cardiovascular disease assessment",
        "boundary_explanation": (
            "This criterion often depends on clinical judgment. "
            "Conditions like controlled hypertension on medication "
            "may or may not qualify depending on the trial's definition "
            "of 'significant cardiovascular disease.'"
        ),
        "follow_up_questions": [
            "Do you have any history of heart attacks, strokes, or heart failure?",
            "Do you take any blood pressure medications? If so, is your blood pressure well-controlled?",
            "Have you ever been hospitalized for a heart-related condition?",
            "Have you had any cardiac procedures (stenting, bypass, pacemaker)?",
        ],
        "recommendation": (
            "This criterion needs clinical review. We recommend discussing "
            "this with the trial coordinator, as the answer depends on the "
            "severity and control of your condition."
        ),
    },
    "significant": {
        "description": "clinical significance assessment",
        "boundary_explanation": (
            "The term 'significant' in clinical trials is often subjective "
            "and left to the investigator's discretion. What counts as "
            "'significant' can vary between trials."
        ),
        "follow_up_questions": [
            "How would you describe the severity of this condition?",
            "Is this condition currently being treated or managed?",
            "Has this condition required hospitalization in the past year?",
        ],
        "recommendation": (
            "Because 'significant' is a judgment call, we recommend flagging "
            "this for discussion with the trial coordinator."
        ),
    },
    "chronic": {
        "description": "chronic condition assessment",
        "boundary_explanation": (
            "Chronic conditions can range from well-managed to severe. "
            "The trial may accept patients with well-controlled chronic "
            "conditions but exclude those with uncontrolled ones."
        ),
        "follow_up_questions": [
            "How long have you had this condition?",
            "Is it currently well-managed with medication?",
            "Has it caused any complications?",
        ],
        "recommendation": (
            "Chronic conditions often need clinical review. Discuss your "
            "specific situation with the trial coordinator."
        ),
    },
    "mental_disorder": {
        "description": "mental health history assessment",
        "boundary_explanation": (
            "Mental health criteria often depend on severity and current "
            "treatment status. A history of depression, for example, may "
            "or may not be exclusionary depending on current stability."
        ),
        "follow_up_questions": [
            "Are you currently being treated for any mental health conditions?",
            "Have you been hospitalized for a mental health condition in the past year?",
            "Is your condition stable on current treatment?",
        ],
        "recommendation": (
            "Mental health criteria often require clinical judgment. "
            "Flag this for the trial coordinator."
        ),
    },
    "hepatic": {
        "description": "liver function assessment",
        "boundary_explanation": (
            "Liver function criteria often use specific thresholds (like "
            "'2x upper limit of normal'). Borderline values may need "
            "retesting or clinical interpretation."
        ),
        "follow_up_questions": [
            "Do you know your recent liver enzyme levels (ALT, AST)?",
            "Have you been diagnosed with any liver conditions?",
            "Do you consume alcohol regularly?",
        ],
        "recommendation": (
            "If your liver function values are borderline, discuss with "
            "the trial coordinator about whether retesting is possible."
        ),
    },
    "renal": {
        "description": "kidney function assessment",
        "boundary_explanation": (
            "Kidney function criteria (eGFR, creatinine) can fluctuate. "
            "Borderline values may warrant retesting."
        ),
        "follow_up_questions": [
            "Do you know your recent kidney function test results (eGFR, creatinine)?",
            "Have you been diagnosed with any kidney conditions?",
        ],
        "recommendation": (
            "If your kidney function is borderline, ask the trial coordinator "
            "about retesting options."
        ),
    },
}


def _detect_boundary_case(attribute: str, description: str) -> Optional[Dict]:
    """Check if a criterion is likely a boundary/judgment-dependent case."""
    text = f"{attribute} {description}".lower()
    for pattern, info in _BOUNDARY_PATTERNS.items():
        if pattern in text:
            return info
    return None


# ---------------------------------------------------------------------------
# Data classes
# ---------------------------------------------------------------------------

@dataclass
class ClarifyingQuestion:
    """A single clarifying question for the patient."""
    attribute: str
    human_label: str
    question: str
    why_it_matters: str
    examples: str
    is_hard: bool
    priority: int
    is_boundary_case: bool = False
    boundary_info: Optional[Dict] = None
    formal_constraint: str = ""


@dataclass
class ProgressiveCheckState:
    """State of a progressive eligibility check session."""
    nct_id: str
    trial_title: str
    total_criteria: int
    checked_criteria: int
    eligible_count: int
    ineligible_count: int
    unknown_count: int
    current_status: str  # "checking", "eligible", "ineligible", "needs_review"
    hard_exclusion_hit: bool = False
    exclusion_reason: str = ""
    remaining_questions: List[ClarifyingQuestion] = field(default_factory=list)
    answered_criteria: List[Dict[str, Any]] = field(default_factory=list)
    boundary_cases: List[Dict[str, Any]] = field(default_factory=list)


# ---------------------------------------------------------------------------
# Main progressive eligibility class
# ---------------------------------------------------------------------------

class ProgressiveEligibilityChecker:
    """
    Multi-turn conversational eligibility checking that processes
    criteria in priority order and handles boundary cases.
    """

    def __init__(self, smt_matcher: SMTMatcher):
        self.viz = EligibilityVisualizer(smt_matcher)
        self.smt = smt_matcher

    def start_check(
        self,
        patient_attrs: Dict[str, Any],
        nct_id: str,
    ) -> ProgressiveCheckState:
        """
        Start a progressive eligibility check for a patient-trial pair.

        Evaluates all known criteria, then generates prioritized questions
        for unknown ones. If a hard exclusion is hit early, remaining
        questions are skipped.
        """
        breakdown = self.viz.get_breakdown(patient_attrs, nct_id)

        trial_title = breakdown.trial_title
        total = len(breakdown.criteria)
        eligible = breakdown.eligible_count
        ineligible = breakdown.ineligible_count
        unknown = breakdown.unknown_count

        # Check for hard exclusion
        hard_exclusion = any(
            c.status == 'ineligible' and c.is_hard
            for c in breakdown.criteria
        )

        # Build answered criteria from known evaluations
        answered = []
        for c in breakdown.criteria:
            if c.status != 'unknown':
                answered.append({
                    'attribute': c.attribute,
                    'human_label': c.human_label,
                    'status': c.status,
                    'patient_value': _format_value(c.patient_value) if c.patient_value is not None else None,
                    'explanation': c.explanation,
                    'is_hard': c.is_hard,
                    'formal_constraint': c.formal_constraint,
                })

        # Generate prioritized questions for unknowns
        questions = []
        boundary_cases = []
        for c in breakdown.criteria:
            if c.status != 'unknown':
                continue

            priority = _get_criterion_priority(c.attribute)
            boundary = _detect_boundary_case(c.attribute, c.description)

            q = self._build_clarifying_question(c, priority, boundary)
            questions.append(q)

            if boundary:
                boundary_cases.append({
                    'attribute': c.attribute,
                    'human_label': c.human_label,
                    'boundary_info': boundary,
                    'formal_constraint': c.formal_constraint,
                })

        # Sort by priority
        questions.sort(key=lambda q: q.priority)

        # Determine status
        exclusion_reason = ""
        if hard_exclusion:
            status = "ineligible"
            exclusion_reasons = [
                c.explanation for c in breakdown.criteria
                if c.status == 'ineligible' and c.is_hard
            ]
            exclusion_reason = exclusion_reasons[0] if exclusion_reasons else ""
        elif unknown > 0:
            status = "checking"
        else:
            status = "eligible"

        return ProgressiveCheckState(
            nct_id=nct_id,
            trial_title=trial_title,
            total_criteria=total,
            checked_criteria=eligible + ineligible,
            eligible_count=eligible,
            ineligible_count=ineligible,
            unknown_count=unknown,
            current_status=status,
            hard_exclusion_hit=hard_exclusion,
            exclusion_reason=exclusion_reason,
            remaining_questions=(
                [] if hard_exclusion else questions
            ),
            answered_criteria=answered,
            boundary_cases=boundary_cases,
        )

    def process_answer(
        self,
        state: ProgressiveCheckState,
        attribute: str,
        answer: Any,
    ) -> ProgressiveCheckState:
        """
        Process a patient's answer to a clarifying question and
        update the eligibility state.
        """
        # Find the question
        question = None
        remaining = []
        for q in state.remaining_questions:
            if q.attribute == attribute:
                question = q
            else:
                remaining.append(q)

        if not question:
            return state

        # Evaluate the answer against the constraint
        patient_val = self._parse_answer(answer)

        # Look up the constraint in the trial
        trial = self.smt.trials.get(state.nct_id)
        satisfied = False
        if trial:
            for constraint in trial.constraints:
                if constraint.attribute == attribute:
                    self.smt.patient_attrs = {attribute: patient_val}
                    satisfied = self.smt._is_constraint_satisfied(constraint)
                    break

        # Determine criterion status
        if question.is_boundary_case:
            status = "needs_review"
            explanation = question.boundary_info.get("recommendation", "Needs clinical review.")
        elif satisfied:
            status = "eligible"
            explanation = f"You meet this requirement: {question.human_label.lower()}"
        else:
            status = "ineligible"
            explanation = f"You do not meet this requirement: {question.human_label.lower()}"

        # Update state
        new_answered = state.answered_criteria + [{
            'attribute': attribute,
            'human_label': question.human_label,
            'status': status,
            'patient_value': str(patient_val),
            'explanation': explanation,
            'is_hard': question.is_hard,
            'formal_constraint': question.formal_constraint,
        }]

        new_eligible = state.eligible_count + (1 if status == 'eligible' else 0)
        new_ineligible = state.ineligible_count + (1 if status == 'ineligible' else 0)
        new_unknown = state.unknown_count - 1

        # Check for hard exclusion
        hard_exclusion = (
            state.hard_exclusion_hit or
            (status == 'ineligible' and question.is_hard)
        )

        if hard_exclusion and not state.hard_exclusion_hit:
            # New hard exclusion — stop asking questions
            new_status = "ineligible"
            remaining = []
            exclusion_reason = explanation
        elif new_unknown <= 0 and not hard_exclusion:
            new_status = "eligible"
            exclusion_reason = state.exclusion_reason
        elif any(a['status'] == 'needs_review' for a in new_answered):
            new_status = "needs_review"
            exclusion_reason = state.exclusion_reason
        else:
            new_status = "checking"
            exclusion_reason = state.exclusion_reason

        return ProgressiveCheckState(
            nct_id=state.nct_id,
            trial_title=state.trial_title,
            total_criteria=state.total_criteria,
            checked_criteria=new_eligible + new_ineligible,
            eligible_count=new_eligible,
            ineligible_count=new_ineligible,
            unknown_count=new_unknown,
            current_status=new_status,
            hard_exclusion_hit=hard_exclusion,
            exclusion_reason=exclusion_reason if hard_exclusion else state.exclusion_reason,
            remaining_questions=remaining,
            answered_criteria=new_answered,
            boundary_cases=state.boundary_cases,
        )

    def get_next_question(
        self, state: ProgressiveCheckState
    ) -> Optional[Dict[str, Any]]:
        """Get the next clarifying question to ask the patient."""
        if state.hard_exclusion_hit:
            return None
        if not state.remaining_questions:
            return None

        q = state.remaining_questions[0]
        result = {
            'attribute': q.attribute,
            'human_label': q.human_label,
            'question': q.question,
            'why_it_matters': q.why_it_matters,
            'examples': q.examples,
            'is_hard': q.is_hard,
            'priority': q.priority,
            'is_boundary_case': q.is_boundary_case,
            'formal_constraint': q.formal_constraint,
        }

        if q.is_boundary_case and q.boundary_info:
            result['boundary_explanation'] = q.boundary_info.get('boundary_explanation', '')
            result['follow_up_questions'] = q.boundary_info.get('follow_up_questions', [])
            result['recommendation'] = q.boundary_info.get('recommendation', '')

        return result

    def state_to_dict(self, state: ProgressiveCheckState) -> Dict[str, Any]:
        """Convert state to JSON-serializable dict."""
        next_q = self.get_next_question(state)
        return {
            'nct_id': state.nct_id,
            'trial_title': state.trial_title,
            'total_criteria': state.total_criteria,
            'checked_criteria': state.checked_criteria,
            'eligible_count': state.eligible_count,
            'ineligible_count': state.ineligible_count,
            'unknown_count': state.unknown_count,
            'current_status': state.current_status,
            'hard_exclusion_hit': state.hard_exclusion_hit,
            'exclusion_reason': state.exclusion_reason,
            'progress_percent': round(
                state.checked_criteria / max(state.total_criteria, 1) * 100
            ),
            'next_question': next_q,
            'remaining_question_count': len(state.remaining_questions),
            'answered_criteria': state.answered_criteria,
            'boundary_cases': state.boundary_cases,
        }

    def _build_clarifying_question(
        self,
        criterion: CriterionStatus,
        priority: int,
        boundary: Optional[Dict],
    ) -> ClarifyingQuestion:
        """Build a rich clarifying question for a criterion."""
        attr = criterion.attribute
        human = criterion.human_label
        desc = criterion.description
        op = criterion.operator
        value = criterion.expected_value

        # Generate the base question
        base_question = _generate_clarifying_question(attr, desc, op, value)

        # Build "why it matters"
        if criterion.is_hard:
            why = (
                "This is a required criterion. If you don't meet it, "
                "you cannot participate in this trial."
            )
        else:
            why = (
                "This is a preference criterion. It won't disqualify you, "
                "but it helps us score how well this trial fits you."
            )

        # Build examples for self-assessment
        examples = self._generate_examples(attr, op, value)

        return ClarifyingQuestion(
            attribute=attr,
            human_label=human,
            question=base_question,
            why_it_matters=why,
            examples=examples,
            is_hard=criterion.is_hard,
            priority=priority,
            is_boundary_case=boundary is not None,
            boundary_info=boundary,
            formal_constraint=criterion.formal_constraint,
        )

    @staticmethod
    def _generate_examples(attr: str, operator: str, value: Any) -> str:
        """Generate self-assessment examples for common criterion types."""
        attr_lower = attr.lower()

        if 'pregnant' in attr_lower:
            return (
                "Answer 'yes' if you are currently pregnant or think you "
                "might be. Answer 'no' if you are not pregnant."
            )
        if 'breastfeeding' in attr_lower or 'lactating' in attr_lower:
            return (
                "Answer 'yes' if you are currently breastfeeding a child. "
                "Answer 'no' if you are not."
            )
        if 'bmi' in attr_lower or 'body_mass_index' in attr_lower:
            return (
                "BMI is calculated from height and weight. For example: "
                "5'10\" and 180 lbs = BMI 25.8. You can use an online "
                "BMI calculator or ask your doctor."
            )
        if 'hba1c' in attr_lower or 'a1c' in attr_lower:
            return (
                "HbA1c is a blood test measuring average blood sugar over "
                "2-3 months. Normal is below 5.7%, pre-diabetes is 5.7-6.4%, "
                "and diabetes is 6.5% or higher. Check your most recent lab results."
            )
        if 'blood_pressure' in attr_lower or 'hypertensive' in attr_lower:
            return (
                "Blood pressure is measured in mmHg, like 120/80. "
                "Normal is below 120/80, elevated is 120-129/<80, "
                "high is 130/80 or above."
            )
        if 'surgery' in attr_lower or 'operative' in attr_lower:
            return (
                "Think about any operations you've had, even minor ones "
                "like biopsies or dental surgery. Include the approximate date."
            )
        if 'allergy' in attr_lower:
            return (
                "Include any known drug allergies, even mild reactions like "
                "rashes. Mention the specific drug name if you know it."
            )
        if 'smoking' in attr_lower:
            return (
                "Answer about your smoking history: 'never smoked', "
                "'former smoker (quit X years ago)', or "
                "'current smoker (X cigarettes/day)'."
            )
        if 'ecog' in attr_lower or 'performance_status' in attr_lower:
            return (
                "ECOG 0: Fully active, no restrictions. "
                "ECOG 1: Can't do strenuous activity but can do light work. "
                "ECOG 2: Can walk and care for self but can't work. "
                "ECOG 3: Limited self-care, in bed >50% of the time."
            )
        if 'age' in attr_lower:
            return "Simply provide your current age in years."
        if isinstance(value, str) and value.lower() in ('true', 'false'):
            return "Answer 'yes' or 'no'."

        return (
            "Provide the value if you know it, or answer 'I don't know' "
            "if you're unsure. Your doctor can help with specific lab values."
        )

    @staticmethod
    def _parse_answer(answer: Any) -> Any:
        """Parse a patient's answer into a typed value."""
        if isinstance(answer, (bool, int, float)):
            return answer

        if isinstance(answer, str):
            lower = answer.lower().strip()
            if lower in ('yes', 'true', 'y', '1'):
                return True
            if lower in ('no', 'false', 'n', '0'):
                return False
            try:
                return int(lower)
            except ValueError:
                pass
            try:
                return float(lower)
            except ValueError:
                pass
            return answer

        return answer
