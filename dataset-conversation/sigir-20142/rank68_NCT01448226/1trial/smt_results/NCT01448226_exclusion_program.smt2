;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than five years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 5))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than five years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_informed_consent_available_now Bool) ;; {"when_to_set_to_true":"Set to true if informed consent for the patient is available now.","when_to_set_to_false":"Set to false if informed consent for the patient is not available now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent for the patient is available now.","meaning":"Boolean indicating whether informed consent for the patient is available at the current time."} ;; "informed consent for the patient is not available."
(declare-const patient_has_informed_consent_available_now@@not_available Bool) ;; {"when_to_set_to_true":"Set to true if informed consent for the patient is not available now.","when_to_set_to_false":"Set to false if informed consent for the patient is available now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent for the patient is not available now.","meaning":"Boolean indicating whether informed consent for the patient is not available at the current time."} ;; "informed consent for the patient is not available."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the corresponding stem variable is false
(assert
(! (=> patient_has_informed_consent_available_now@@not_available
    (not patient_has_informed_consent_available_now))
:named REQ1_AUXILIARY0)) ;; "Qualifier specifies that the consent is not available."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_informed_consent_available_now@@not_available)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if informed consent for the patient is not available."
