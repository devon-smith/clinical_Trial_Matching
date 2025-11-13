;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 85 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 85 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_signed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed consent at the current time.","when_to_set_to_false":"Set to false if the patient has not signed consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed consent at the current time.","meaning":"Boolean indicating whether the patient has signed consent at the current time."} // "To be included, the patient must have signed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_signed_consent_now
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed consent."
