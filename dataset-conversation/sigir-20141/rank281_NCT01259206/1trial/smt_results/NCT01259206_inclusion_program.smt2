;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of diabetes mellitus."} // "To be included, the patient must have a clinical diagnosis of diabetes mellitus."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_diabetes_mellitus_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of diabetes mellitus."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} // "To be included, the patient must have obesity."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have obesity."
