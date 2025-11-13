;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."}  // "To be included, the patient must have obesity."
(declare-const patient_has_finding_of_impaired_glucose_tolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired glucose tolerance.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired glucose tolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of impaired glucose tolerance.","meaning":"Boolean indicating whether the patient currently has impaired glucose tolerance."}  // "To be included, the patient must have impaired glucose tolerance."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have obesity."
(assert
  (! patient_has_finding_of_impaired_glucose_tolerance_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have impaired glucose tolerance."
