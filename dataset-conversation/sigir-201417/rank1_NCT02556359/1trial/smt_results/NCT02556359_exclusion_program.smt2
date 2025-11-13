;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_refuses_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently refuses to provide consent.","when_to_set_to_false":"Set to false if the patient currently does not refuse to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently refuses to provide consent.","meaning":"Boolean indicating whether the patient currently refuses to provide consent."} ;; "refuses to provide consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_refuses_to_provide_consent_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient refuses to provide consent."
