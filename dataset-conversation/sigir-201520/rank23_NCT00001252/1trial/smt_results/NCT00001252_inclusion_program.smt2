;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 0 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 0.0)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be aged ≥ 0 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_deemed_medically_fit_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently deemed medically fit to participate.","when_to_set_to_false":"Set to false if the patient is currently deemed not medically fit to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently deemed medically fit to participate.","meaning":"Boolean indicating whether the patient is currently deemed medically fit to participate."} // "the patient must be deemed medically fit to participate"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_deemed_medically_fit_to_participate_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be deemed medically fit to participate"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_willing_to_provide_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to provide informed consent.","when_to_set_to_false":"Set to false if the patient is not willing to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to provide informed consent.","meaning":"Boolean indicating whether the patient is willing to provide informed consent."} // "the patient must be willing to provide informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_willing_to_provide_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to provide informed consent"
