;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented diagnosis of Alzheimer’s disease (AD).","when_to_set_to_false":"Set to false if the patient currently does not have a documented diagnosis of Alzheimer’s disease (AD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer’s disease (AD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer’s disease (AD)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_alzheimer_s_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of Alzheimer disease (AD)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged between 50 and 85 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 50.0)
          (<= patient_age_value_recorded_now_in_years 85.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged between 50 and 85 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured score value if a Mini-Mental State Examination score is recorded for the patient now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score recorded now."} // "Mini-Mental State Examination score"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have a Mini-Mental State Examination score between 14 and 26.
(assert
  (! (and (>= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 14)
          (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 26))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Mini-Mental State Examination score between 14 and 26."

;; ===================== Declarations for the criterion (REQ 3) =====================
;; No new variables are needed for this requirement, as it is a placeholder for other criteria.

;; ===================== Constraint Assertions (REQ 3) =====================
;; This requirement is a placeholder and is always satisfiable with action; no constraint is enforced.
(assert
  (! true
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must meet other inclusion criteria that apply."
