;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} ;; "the patient has provided informed consent"
(declare-const legal_tutor_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the legal tutor of the patient has provided informed consent.","when_to_set_to_false":"Set to false if the legal tutor of the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legal tutor of the patient has provided informed consent.","meaning":"Boolean indicating whether the legal tutor of the patient has provided informed consent."} ;; "the legal tutor of the patient has provided informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_provided_informed_consent)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT provide informed consent."

(assert
(! (not legal_tutor_has_provided_informed_consent)
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the legal tutor of the patient does NOT provide informed consent."
