;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of systemic lupus erythematosus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of systemic lupus erythematosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of systemic lupus erythematosus."} // "To be included, the patient must have a clinical diagnosis of systemic lupus erythematosus."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_systemic_lupus_erythematosus_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of systemic lupus erythematosus."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired cognition (cognitive impairment).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired cognition (cognitive impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired cognition (cognitive impairment).","meaning":"Boolean indicating whether the patient currently has impaired cognition (cognitive impairment)."} // "To be included, the patient must have self-reported cognitive impairment."
(declare-const patient_has_finding_of_impaired_cognition_now@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired cognition (cognitive impairment) is self-reported.","when_to_set_to_false":"Set to false if the patient's impaired cognition (cognitive impairment) is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's impaired cognition (cognitive impairment) is self-reported.","meaning":"Boolean indicating whether the patient's impaired cognition (cognitive impairment) is self-reported."} // "To be included, the patient must have self-reported cognitive impairment."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_impaired_cognition_now@@self_reported
         patient_has_finding_of_impaired_cognition_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have self-reported cognitive impairment."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_impaired_cognition_now@@self_reported
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have self-reported cognitive impairment."
