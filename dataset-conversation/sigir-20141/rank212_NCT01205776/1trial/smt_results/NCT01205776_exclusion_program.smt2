;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical condition finding as specified by the exclusion criterion.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical condition finding as specified by the exclusion criterion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical condition finding as specified by the exclusion criterion.","meaning":"Boolean indicating whether the patient currently has a clinical condition finding as specified by the exclusion criterion."} ;; "clinical condition specified by the criterion: 'Clinical'."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_patient_condition_finding_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinical condition specified by the criterion: 'Clinical'."
