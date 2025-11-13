;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged from birth (age ≥ 0 years) AND age ≤ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 0.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged from birth (age ≥ 0 years)."

(assert
  (! (<= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_operation_on_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a cardiac surgery procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a cardiac surgery procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a cardiac surgery procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a cardiac surgery procedure."} // "To be included, the patient must be undergoing cardiac surgery."
(declare-const patient_will_undergo_cardiopulmonary_bypass_operation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a cardiopulmonary bypass operation planned at the present time (i.e., it is scheduled or intended as part of the current surgical plan).","when_to_set_to_false":"Set to false if the patient does not have a cardiopulmonary bypass operation planned at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a cardiopulmonary bypass operation planned at the present time.","meaning":"Boolean indicating whether the patient has a cardiopulmonary bypass operation planned at the present time."} // "To be included, the patient must have planned cardiopulmonary bypass."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_undergoing_operation_on_heart_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be undergoing cardiac surgery."

(assert
  (! patient_will_undergo_cardiopulmonary_bypass_operation_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have planned cardiopulmonary bypass."
