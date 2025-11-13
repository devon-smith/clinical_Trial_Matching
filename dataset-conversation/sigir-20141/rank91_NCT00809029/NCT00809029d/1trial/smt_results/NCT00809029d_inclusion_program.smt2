;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} // "To be included, the patient must have obesity."
(declare-const patient_has_finding_of_diabetic_on_diet_only_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus that is controlled by diet alone (not requiring medication).","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus controlled by diet alone, or if diabetes is controlled by medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diet-controlled diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus controlled by diet alone."} // "To be included, the patient must have diet controlled diabetes mellitus."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have obesity."
(assert
  (! patient_has_finding_of_diabetic_on_diet_only_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have diet controlled diabetes mellitus."
