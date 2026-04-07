"""
Eligibility criteria visualization module.

Provides structured breakdowns of patient-trial eligibility, plain-language
explanations for ineligibility, and clarifying question generation for
criteria with unknown/missing data.
"""

from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional

from smt_matcher import SMTMatcher, Constraint

# Maps database criterion attributes back to human-readable follow-up labels
# Used to enrich the eligibility breakdown with patient-provided data
_CRITERION_TO_FOLLOWUP: Dict[str, str] = {
    # Stage
    "patient_has_finding_of_clinical_stage_iii_now": "stage",
    "patient_has_finding_of_clinical_stage_4_now": "stage",
    "patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now": "stage",
    "patient_has_diagnosis_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now": "stage",
    "patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_3_now": "stage",
    "patient_has_finding_of_non_small_cell_carcinoma_of_lung_tnm_stage_4_now": "stage",
    # Metastasis
    "patient_has_finding_of_widespread_metastatic_malignant_neoplastic_disease_now": "metastatic_status",
    # Treatment history
    "patient_has_undergone_chemotherapy_inthehistory": "prior_treatments",
    "patient_has_undergone_chemotherapy_inthepast4weeks": "prior_treatments",
    "patient_has_undergone_teleradiotherapy_procedure_inthehistory": "prior_treatments",
    "patient_has_undergone_immunological_therapy_inthehistory": "prior_treatments",
    "patient_has_undergone_biological_treatment_inthepast4weeks": "prior_treatments",
    "patient_has_undergone_hormone_therapy_inthehistory": "prior_treatments",
    "patient_has_undergone_first_line_treatment_inthehistory": "prior_treatments",
    "patient_has_undergone_drug_therapy_inthehistory": "prior_treatments",
    "patient_has_undergone_antidepressant_therapy_inthehistory": "prior_treatments",
    "patient_has_undergone_infliximab_therapy_inthehistory": "prior_treatments",
    "patient_has_undergone_non_steroidal_anti_inflammatory_agent_therapy_inthehistory": "prior_treatments",
    "patient_can_undergo_chemotherapy_now": "prior_treatments",
    # Current medications
    "patient_is_undergoing_drug_therapy_now": "current_medications",
    "patient_is_undergoing_biological_treatment_now": "current_medications",
    "patient_is_undergoing_chemotherapy_now": "current_medications",
    "patient_is_undergoing_anticoagulant_therapy_now": "current_medications",
    "patient_is_undergoing_warfarin_therapy_now": "current_medications",
    "patient_is_undergoing_aspirin_therapy_now": "current_medications",
    "patient_is_undergoing_hormone_therapy_now": "current_medications",
    "patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now": "current_medications",
    "patient_is_undergoing_anticonvulsant_therapy_now": "current_medications",
    "patient_is_taking_opioid_receptor_agonist_containing_product_now": "current_medications",
    "patient_is_taking_dopamine_receptor_agonist_containing_product_now": "current_medications",
    "patient_is_undergoing_immunosuppressive_therapy_now": "current_medications",
    "patient_is_undergoing_lipid_lowering_therapy_now": "current_medications",
    # Lab values
    "patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent": "a1c",
    "patient_has_undergone_hemoglobin_a1c_measurement_now": "a1c",
    "patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent": "ejection_fraction",
    "patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent": "ejection_fraction",
    "patient_fev1_after_bronchodilation_value_recorded_now_withunit_percent_of_predicted": "fev1_percent",
    "patient_fev1_after_bronchodilation_value_recorded_now_withunit_percent_predicted": "fev1_percent",
    "patient_absolute_cd4_count_procedure_value_recorded_now_withunit_per_cubic_millimeter": "cd4_count",
    "patient_lymphocyte_antigen_cd4_value_recorded_now_withunit_cells_per_mm3": "cd4_count",
    # ECOG
    "patient_ecog_performance_status_value_recorded_now_withunit_integer": "ecog_status",
    "patient_has_finding_of_ecog_performance_status_finding_now": "ecog_status",
    "patient_has_finding_of_ecog_performance_status_grade_3_now": "ecog_status",
    "patient_has_finding_of_ecog_performance_status_grade_4_now": "ecog_status",
    # Smoking
    "patient_has_finding_of_cigarette_smoker_now": "smoking_status",
    "patient_has_finding_of_smoker_now": "smoking_status",
    "patient_has_finding_of_non_smoker_now": "smoking_status",
    "patient_has_finding_of_ex_smoker_now": "smoking_status",
    "patient_has_finding_of_tobacco_smoking_behavior_finding_now": "smoking_status",
    "patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory": "smoking_status",
    "patient_is_exposed_to_tobacco_smoking_behavior_finding_now": "smoking_status",
    # Receptor status
    "patient_has_finding_of_estrogen_receptor_positive_tumor_now": "receptor_status",
    # Kidney/dialysis
    "patient_has_diagnosis_of_end_stage_renal_disease_now": "on_dialysis",
    "patient_has_finding_of_end_stage_renal_disease_now": "on_dialysis",
    "patient_has_diagnosis_of_end_stage_renal_failure_on_dialysis_now": "on_dialysis",
}


def _build_followup_patient_fact(
    attr: str, patient_val: Any, patient_attrs: Dict[str, Any]
) -> str:
    """Build a rich patient fact string that includes follow-up context.

    If the criterion was matched via a follow-up answer, show the original
    patient-provided detail alongside the boolean evaluation.
    Works with both hardcoded _CRITERION_TO_FOLLOWUP and dynamic criteria_map.
    """
    followup_key = _CRITERION_TO_FOLLOWUP.get(attr)

    # Also check dynamic criteria_map — reverse lookup which attribute_key
    # maps to this criterion_type
    if not followup_key:
        criteria_map = patient_attrs.get('condition_criteria_map', {})
        for ak, ct_list in criteria_map.items():
            if attr in ct_list:
                followup_key = ak
                break

    if not followup_key:
        return f"Your value: {_format_value(patient_val)}"

    # Look for the answer in condition_details (dynamic) or followup_ prefix (legacy)
    condition_details = patient_attrs.get('condition_details', {})
    raw_answer = condition_details.get(followup_key)
    if raw_answer is None:
        raw_answer = patient_attrs.get(f"followup_{followup_key}")
    if raw_answer is None:
        return f"Your value: {_format_value(patient_val)}"

    # Build context-rich fact based on the followup type
    label_map = {
        "stage": "Your stage",
        "metastatic_status": "Metastatic",
        "prior_treatments": "Prior treatment",
        "current_medications": "Current medications",
        "a1c": "Your A1C",
        "ejection_fraction": "Your ejection fraction",
        "fev1_percent": "Your FEV1",
        "cd4_count": "Your CD4 count",
        "ecog_status": "Your ECOG status",
        "smoking_status": "Smoking status",
        "receptor_status": "Receptor status",
        "on_dialysis": "Dialysis status",
    }
    label = label_map.get(followup_key, followup_key.replace("_", " ").title())

    if isinstance(raw_answer, bool):
        return f"{label}: {'Yes' if raw_answer else 'No'}"
    return f"{label}: {raw_answer}"


# ---------------------------------------------------------------------------
# Attribute humanization helpers
# ---------------------------------------------------------------------------

def _humanize_attribute(attr: str) -> str:
    """Convert a database attribute name to a human-readable label."""
    label = attr
    label = label.replace('patient_', '')
    label = label.replace('_now', '')
    label = label.replace('_inthehistory', ' (history)')
    label = label.replace('_inthepast', ' (past ')
    label = label.replace('months', ' months)')
    label = label.replace('month', ' month)')
    label = label.replace('_', ' ')
    label = label.replace('withunit ', '(')
    # Capitalize first letter of each word for readability
    label = label.strip().title()
    return label


def _humanize_operator(op: str) -> str:
    """Convert an operator to a human-readable string."""
    return {
        '==': 'equals',
        '!=': 'does not equal',
        '>': 'is greater than',
        '>=': 'is at least',
        '<': 'is less than',
        '<=': 'is at most',
        'in': 'is one of',
        'equals': 'equals',
        'not_equals': 'does not equal',
    }.get(op, op)


def _format_value(value: Any) -> str:
    """Format a constraint value for display."""
    if isinstance(value, bool):
        return 'Yes' if value else 'No'
    if isinstance(value, str):
        low = value.lower()
        if low == 'true':
            return 'Yes'
        if low == 'false':
            return 'No'
    return str(value)


# ---------------------------------------------------------------------------
# Data classes for visualization output
# ---------------------------------------------------------------------------

@dataclass
class CriterionStatus:
    """Status of a single eligibility criterion for a patient."""
    attribute: str
    human_label: str
    operator: str
    expected_value: Any
    is_inclusion: bool
    is_hard: bool
    description: str
    # Status: 'eligible', 'ineligible', or 'unknown'
    status: str
    # The patient fact that was matched, or None if unknown
    patient_value: Optional[Any] = None
    patient_fact: str = ""
    # Formal constraint representation
    formal_constraint: str = ""
    # Plain-language explanation
    explanation: str = ""


@dataclass
class EligibilityBreakdown:
    """Full structured breakdown of eligibility for a patient-trial pair."""
    nct_id: str
    trial_title: str
    overall_status: str  # 'eligible', 'ineligible', 'unknown'
    criteria: List[CriterionStatus] = field(default_factory=list)
    eligible_count: int = 0
    ineligible_count: int = 0
    unknown_count: int = 0
    ineligibility_explanation: str = ""
    unsat_core_formal: List[str] = field(default_factory=list)
    unsat_core_plain: List[str] = field(default_factory=list)
    clarifying_questions: List[Dict[str, str]] = field(default_factory=list)


# ---------------------------------------------------------------------------
# Clarifying question templates for common criterion types
# ---------------------------------------------------------------------------

_CLARIFYING_TEMPLATES = {
    'ecog': (
        "This trial requires a specific level of daily functioning (ECOG performance status). "
        "Would you say you can carry out all normal activities without restriction, or do you "
        "need some help with physically strenuous tasks?"
    ),
    'performance_status': (
        "This trial needs to know about your ability to perform daily activities. "
        "Can you carry out all normal activities without restriction, do you need "
        "some help with strenuous tasks, or do you need frequent assistance?"
    ),
    'pregnant': (
        "This trial needs to know your pregnancy status. "
        "Are you currently pregnant or planning to become pregnant?"
    ),
    'breastfeeding': (
        "This trial needs to know if you are currently breastfeeding."
    ),
    'lactating': (
        "This trial needs to know if you are currently breastfeeding or lactating."
    ),
    'bmi': (
        "This trial has requirements about body mass index (BMI). "
        "Do you know your approximate height and weight? We can calculate your BMI from those."
    ),
    'hba1c': (
        "This trial requires a recent HbA1c (hemoglobin A1c) blood test result, "
        "which measures average blood sugar over the past 2-3 months. "
        "Do you know your most recent HbA1c value?"
    ),
    'a1c': (
        "This trial requires a recent A1C blood test result. "
        "Do you know your most recent A1C percentage?"
    ),
    'blood_pressure': (
        "This trial has blood pressure requirements. "
        "Do you know your most recent blood pressure reading (e.g., 120/80)?"
    ),
    'creatinine': (
        "This trial requires a recent creatinine level (a kidney function test). "
        "Do you know your most recent creatinine lab result?"
    ),
    'egfr': (
        "This trial requires a recent eGFR (estimated glomerular filtration rate), "
        "which measures kidney function. Do you know your most recent eGFR value?"
    ),
    'hemoglobin': (
        "This trial requires a recent hemoglobin level. "
        "Do you know your most recent hemoglobin lab result?"
    ),
    'platelet': (
        "This trial requires a recent platelet count. "
        "Do you know your most recent platelet count from a blood test?"
    ),
    'white_blood_cell': (
        "This trial requires a recent white blood cell (WBC) count. "
        "Do you know your most recent WBC count?"
    ),
    'childbearing_potential': (
        "This trial needs to know if you are of childbearing potential. "
        "Are you of childbearing age and not using reliable contraception?"
    ),
    'allergy': (
        "This trial needs to know about any drug allergies you may have. "
        "Do you have any known allergies to medications?"
    ),
    'smoking': (
        "This trial needs to know about your smoking history. "
        "Have you ever smoked, and if so, do you currently smoke?"
    ),
    'alcohol': (
        "This trial needs to know about your alcohol use. "
        "How would you describe your alcohol consumption?"
    ),
    'surgery': (
        "This trial needs to know about any recent surgeries. "
        "Have you had any surgical procedures in the past 6 months?"
    ),
    'liver': (
        "This trial requires information about your liver function. "
        "Do you have any known liver conditions, or do you know your recent liver enzyme levels?"
    ),
    'cardiac': (
        "This trial requires information about your heart health. "
        "Have you been diagnosed with any heart conditions, or had a recent EKG?"
    ),
    'infection': (
        "This trial needs to know about any active infections. "
        "Do you currently have any infections or are you taking antibiotics?"
    ),
}


def _generate_clarifying_question(attribute: str, constraint_desc: str,
                                  operator: str, value: Any) -> str:
    """Generate a patient-friendly clarifying question for an unknown criterion."""
    attr_lower = attribute.lower()

    # Check templates by keyword match
    for keyword, template in _CLARIFYING_TEMPLATES.items():
        if keyword in attr_lower:
            return template

    # Build a generic but informative question from the constraint
    human_attr = _humanize_attribute(attribute)
    human_val = _format_value(value)

    if isinstance(value, str) and value.lower() in ('true', 'false'):
        # Boolean criterion
        condition_desc = human_attr.lower()
        if value.lower() == 'true':
            return (
                f"This trial requires that you have {condition_desc}. "
                f"Does this apply to you?"
            )
        else:
            return (
                f"This trial requires that you do NOT have {condition_desc}. "
                f"Does this apply to you?"
            )

    # Numeric criterion
    human_op = _humanize_operator(operator)
    if constraint_desc:
        return (
            f"This trial has a requirement: {constraint_desc}. "
            f"Do you have this information available?"
        )

    return (
        f"This trial requires that your {human_attr.lower()} {human_op} {human_val}. "
        f"Do you know your current value for this?"
    )


# ---------------------------------------------------------------------------
# Main visualization class
# ---------------------------------------------------------------------------

class EligibilityVisualizer:
    """Generates structured eligibility visualizations from SMT evaluation results."""

    def __init__(self, smt_matcher: SMTMatcher):
        self.smt = smt_matcher

    def get_breakdown(
        self,
        patient_attrs: Dict[str, Any],
        nct_id: str,
    ) -> EligibilityBreakdown:
        """
        Generate a full eligibility breakdown for a patient against a trial.

        Returns a structured checklist with status (eligible/ineligible/unknown)
        for each criterion, along with the patient fact matched against it.
        """
        if nct_id not in self.smt.trials:
            return EligibilityBreakdown(
                nct_id=nct_id,
                trial_title="Unknown Trial",
                overall_status="unknown",
            )

        trial = self.smt.trials[nct_id]
        trial_title = getattr(trial, 'title', nct_id)

        criteria_statuses: List[CriterionStatus] = []
        eligible_count = 0
        ineligible_count = 0
        unknown_count = 0

        # Set patient_attrs on the SMT matcher so _is_constraint_satisfied can use it
        self.smt.patient_attrs = patient_attrs

        all_constraints = trial.get_hard_constraints() + trial.get_soft_constraints()

        for constraint in all_constraints:
            is_hard = constraint.hard_constraint
            attr = constraint.attribute
            human_label = _humanize_attribute(attr)
            formal = f"{attr} {constraint.operator} {constraint.value}"

            if attr not in patient_attrs:
                # Unknown — missing data
                question = _generate_clarifying_question(
                    attr, constraint.description,
                    constraint.operator, constraint.value,
                )
                cs = CriterionStatus(
                    attribute=attr,
                    human_label=human_label,
                    operator=constraint.operator,
                    expected_value=constraint.value,
                    is_inclusion=constraint.is_inclusion,
                    is_hard=is_hard,
                    description=constraint.description,
                    status='unknown',
                    patient_value=None,
                    patient_fact="No data available",
                    formal_constraint=formal,
                    explanation=f"We don't have enough information to evaluate: {human_label}.",
                )
                criteria_statuses.append(cs)
                unknown_count += 1
                continue

            patient_val = patient_attrs[attr]
            satisfied = self.smt._is_constraint_satisfied(constraint)

            # For exclusion criteria, logic is inverted: patient matching an
            # exclusion criterion means they are INELIGIBLE
            if constraint.is_inclusion:
                status = 'eligible' if satisfied else 'ineligible'
            else:
                status = 'ineligible' if satisfied else 'eligible'

            if status == 'eligible':
                eligible_count += 1
                explanation = self._build_eligible_explanation(
                    human_label, patient_val, constraint
                )
            else:
                ineligible_count += 1
                explanation = self._build_ineligible_explanation(
                    human_label, patient_val, constraint
                )

            patient_fact = _build_followup_patient_fact(attr, patient_val, patient_attrs)

            cs = CriterionStatus(
                attribute=attr,
                human_label=human_label,
                operator=constraint.operator,
                expected_value=constraint.value,
                is_inclusion=constraint.is_inclusion,
                is_hard=is_hard,
                description=constraint.description,
                status=status,
                patient_value=patient_val,
                patient_fact=patient_fact,
                formal_constraint=formal,
                explanation=explanation,
            )
            criteria_statuses.append(cs)

        # Determine overall status
        hard_ineligible = any(
            c.status == 'ineligible' and c.is_hard for c in criteria_statuses
        )
        hard_unknown = any(
            c.status == 'unknown' and c.is_hard for c in criteria_statuses
        )

        if hard_ineligible:
            overall_status = 'ineligible'
        elif hard_unknown:
            overall_status = 'unknown'
        else:
            overall_status = 'eligible'

        # Build ineligibility explanation if applicable
        inelig_explanation = ""
        unsat_formal: List[str] = []
        unsat_plain: List[str] = []
        if overall_status == 'ineligible':
            inelig_explanation, unsat_formal, unsat_plain = (
                self._build_ineligibility_summary(criteria_statuses)
            )

        # Build clarifying questions for unknown criteria
        clarifying_questions: List[Dict[str, str]] = []
        for cs in criteria_statuses:
            if cs.status == 'unknown':
                question = _generate_clarifying_question(
                    cs.attribute, cs.description,
                    cs.operator, cs.expected_value,
                )
                clarifying_questions.append({
                    'attribute': cs.attribute,
                    'human_label': cs.human_label,
                    'question': question,
                    'criterion_description': cs.description,
                    'formal_constraint': cs.formal_constraint,
                    'is_hard': cs.is_hard,
                })

        return EligibilityBreakdown(
            nct_id=nct_id,
            trial_title=trial_title,
            overall_status=overall_status,
            criteria=criteria_statuses,
            eligible_count=eligible_count,
            ineligible_count=ineligible_count,
            unknown_count=unknown_count,
            ineligibility_explanation=inelig_explanation,
            unsat_core_formal=unsat_formal,
            unsat_core_plain=unsat_plain,
            clarifying_questions=clarifying_questions,
        )

    def _build_eligible_explanation(
        self, human_label: str, patient_val: Any, constraint: Constraint
    ) -> str:
        """Build a plain-language explanation for why a criterion is satisfied."""
        pv = _format_value(patient_val)
        cv = _format_value(constraint.value)
        op = constraint.operator

        if isinstance(constraint.value, str) and constraint.value.lower() in ('true', 'false'):
            expected = constraint.value.lower() == 'true'
            if constraint.is_inclusion:
                if expected:
                    return f"You meet this requirement: {human_label.lower()} is confirmed."
                else:
                    return f"You meet this requirement: {human_label.lower()} is not present, as required."
            else:
                return f"You are not excluded by this criterion: {human_label.lower()}."

        if op in ('>', '>=', '<', '<='):
            human_op = _humanize_operator(op)
            return (
                f"Your {human_label.lower()} ({pv}) {human_op} the required value of {cv}."
            )

        return f"Your {human_label.lower()} ({pv}) matches the requirement ({cv})."

    def _build_ineligible_explanation(
        self, human_label: str, patient_val: Any, constraint: Constraint
    ) -> str:
        """Build a plain-language explanation for why a criterion is NOT satisfied."""
        pv = _format_value(patient_val)
        cv = _format_value(constraint.value)
        op = constraint.operator

        if isinstance(constraint.value, str) and constraint.value.lower() in ('true', 'false'):
            expected = constraint.value.lower() == 'true'
            if constraint.is_inclusion:
                if expected:
                    return (
                        f"This trial requires {human_label.lower()}, "
                        f"but your records show this is not present."
                    )
                else:
                    return (
                        f"This trial requires that you do NOT have {human_label.lower()}, "
                        f"but your records show you do."
                    )
            else:
                # Exclusion criterion that patient matches
                if expected:
                    return (
                        f"This trial excludes patients with {human_label.lower()}, "
                        f"and your records show this applies to you."
                    )
                else:
                    return (
                        f"This trial excludes patients without {human_label.lower()}, "
                        f"and your records show this is not present."
                    )

        if op in ('>', '>='):
            return (
                f"This trial requires {human_label.lower()} {_humanize_operator(op)} {cv}, "
                f"but yours is {pv}."
            )
        if op in ('<', '<='):
            return (
                f"This trial requires {human_label.lower()} {_humanize_operator(op)} {cv}, "
                f"but yours is {pv}."
            )
        if op in ('==', 'equals'):
            return (
                f"This trial requires {human_label.lower()} to be {cv}, "
                f"but yours is {pv}."
            )
        if op in ('!=', 'not_equals'):
            return (
                f"This trial requires {human_label.lower()} to not be {cv}, "
                f"but yours is {pv}."
            )

        return (
            f"Your {human_label.lower()} ({pv}) does not meet "
            f"the trial requirement ({op} {cv})."
        )

    def _build_ineligibility_summary(
        self, criteria: List[CriterionStatus]
    ) -> tuple:
        """
        Build an overall ineligibility explanation with unsat core.

        Returns:
            (plain_explanation, formal_core, plain_core)
        """
        failed_hard = [c for c in criteria if c.status == 'ineligible' and c.is_hard]

        if not failed_hard:
            return ("", [], [])

        # Formal unsat core
        formal_core = [c.formal_constraint for c in failed_hard]

        # Plain-language unsat core
        plain_core = [c.explanation for c in failed_hard]

        # Build the summary
        if len(failed_hard) == 1:
            reason = failed_hard[0]
            summary = (
                f"You don't meet this trial's requirements because: "
                f"{reason.explanation}"
            )
        else:
            reasons = "\n".join(
                f"  - {c.explanation}" for c in failed_hard
            )
            summary = (
                f"You don't meet this trial's requirements for {len(failed_hard)} reasons:\n"
                f"{reasons}"
            )

        return (summary, formal_core, plain_core)

    def to_dict(self, breakdown: EligibilityBreakdown) -> Dict[str, Any]:
        """Convert an EligibilityBreakdown to a JSON-serializable dictionary."""
        return {
            'nct_id': breakdown.nct_id,
            'trial_title': breakdown.trial_title,
            'overall_status': breakdown.overall_status,
            'eligible_count': breakdown.eligible_count,
            'ineligible_count': breakdown.ineligible_count,
            'unknown_count': breakdown.unknown_count,
            'criteria': [
                {
                    'attribute': c.attribute,
                    'human_label': c.human_label,
                    'operator': c.operator,
                    'expected_value': _format_value(c.expected_value),
                    'is_inclusion': c.is_inclusion,
                    'is_hard': c.is_hard,
                    'description': c.description,
                    'status': c.status,
                    'patient_value': _format_value(c.patient_value) if c.patient_value is not None else None,
                    'patient_fact': c.patient_fact,
                    'formal_constraint': c.formal_constraint,
                    'explanation': c.explanation,
                }
                for c in breakdown.criteria
            ],
            'ineligibility_explanation': breakdown.ineligibility_explanation,
            'unsat_core': {
                'formal': breakdown.unsat_core_formal,
                'plain': breakdown.unsat_core_plain,
            },
            'clarifying_questions': breakdown.clarifying_questions,
        }
