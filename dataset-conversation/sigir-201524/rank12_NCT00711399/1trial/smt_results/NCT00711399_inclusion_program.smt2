;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed informed consent at the present time.","when_to_set_to_false":"Set to false if the patient has not signed informed consent at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent at the present time.","meaning":"Boolean indicating whether the patient has signed informed consent at the present time."} // "the patient must have signed informed consent"
(declare-const parent_of_patient_has_signed_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the parent of the patient has signed informed consent at the present time.","when_to_set_to_false":"Set to false if the parent of the patient has not signed informed consent at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent of the patient has signed informed consent at the present time.","meaning":"Boolean indicating whether the parent of the patient has signed informed consent at the present time."} // "the parent of the patient has signed informed consent"
(declare-const guardian_of_patient_has_signed_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the guardian of the patient has signed informed consent at the present time.","when_to_set_to_false":"Set to false if the guardian of the patient has not signed informed consent at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the guardian of the patient has signed informed consent at the present time.","meaning":"Boolean indicating whether the guardian of the patient has signed informed consent at the present time."} // "the guardian of the patient has signed informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_signed_informed_consent_now
         parent_of_patient_has_signed_informed_consent_now
         guardian_of_patient_has_signed_informed_consent_now)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (signed informed consent) OR (the parent of the patient has signed informed consent) OR (the guardian of the patient has signed informed consent)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cough.","meaning":"Boolean indicating whether the patient currently has cough."} // "cough"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyspnea (shortness of breath).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyspnea (shortness of breath).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dyspnea (shortness of breath).","meaning":"Boolean indicating whether the patient currently has dyspnea (shortness of breath)."} // "shortness of breath"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (cough) OR (shortness of breath).
(assert
  (! (or patient_has_finding_of_cough_now
         patient_has_finding_of_dyspnea_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (cough) OR (shortness of breath)."
