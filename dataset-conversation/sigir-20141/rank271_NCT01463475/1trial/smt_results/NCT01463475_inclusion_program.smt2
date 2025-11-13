;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 35 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 35 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 35)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 35 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_willing_to_provide_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is not willing to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to provide written informed consent.","meaning":"Boolean indicating whether the patient is willing to provide written informed consent."} ;; "To be included, the patient must be willing to provide written informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_willing_to_provide_written_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to provide written informed consent."
