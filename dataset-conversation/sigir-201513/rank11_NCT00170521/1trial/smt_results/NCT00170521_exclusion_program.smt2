;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const parent_is_unable_to_provide_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if at least one parent of the patient is unable to provide informed consent.","when_to_set_to_false":"Set to false if all parents of the patient are able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any parent of the patient is unable to provide informed consent.","meaning":"Boolean indicating whether at least one parent of the patient is unable to provide informed consent."} ;; "the patient has a parent who is unable to provide informed consent"
(declare-const parent_is_unwilling_to_provide_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if at least one parent of the patient is unwilling to provide informed consent.","when_to_set_to_false":"Set to false if all parents of the patient are willing to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any parent of the patient is unwilling to provide informed consent.","meaning":"Boolean indicating whether at least one parent of the patient is unwilling to provide informed consent."} ;; "the patient has a parent who is unwilling to provide informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not parent_is_unable_to_provide_informed_consent)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has a parent who is unable to provide informed consent"

(assert
(! (not parent_is_unwilling_to_provide_informed_consent)
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has a parent who is unwilling to provide informed consent"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged greater than or equal to thirteen years"
(declare-const patient_is_unable_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to provide informed consent.","meaning":"Boolean indicating whether the patient is currently unable to provide informed consent."} ;; "the patient is unable to provide informed consent"
(declare-const patient_is_unwilling_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently willing to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to provide informed consent.","meaning":"Boolean indicating whether the patient is currently unwilling to provide informed consent."} ;; "the patient is unwilling to provide informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and (>= patient_age_value_recorded_now_in_years 13)
             (or patient_is_unable_to_provide_informed_consent_now
                 patient_is_unwilling_to_provide_informed_consent_now)))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is aged greater than or equal to thirteen years) AND ((the patient is unable to provide informed consent) OR (the patient is unwilling to provide informed consent)))."
