;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_essential_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of essential hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of essential hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has essential hypertension.","meaning":"Boolean indicating whether the patient currently has essential hypertension."}  // "essential hypertension"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  // "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_essential_hypertension_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient with essential hypertension."

(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_given_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given an informed consent form.","when_to_set_to_false":"Set to false if the patient has not given an informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given an informed consent form.","meaning":"Boolean indicating whether the patient has given an informed consent form."} // "To be included, the patient must have given an informed consent form."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_given_informed_consent_form
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have given an informed consent form."
