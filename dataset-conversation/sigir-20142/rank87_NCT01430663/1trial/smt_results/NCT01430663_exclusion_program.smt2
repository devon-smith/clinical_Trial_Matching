;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has informed consent.","meaning":"Boolean indicating whether the patient currently has informed consent."} ;; "patient does NOT have informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_informed_consent_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have informed consent."
