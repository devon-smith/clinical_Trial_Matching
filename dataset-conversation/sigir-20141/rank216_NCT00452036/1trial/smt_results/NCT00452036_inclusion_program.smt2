;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_finding_of_injury_of_head_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a head injury.","when_to_set_to_false":"Set to false if the patient currently does not have a head injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a head injury.","meaning":"Boolean indicating whether the patient currently has a head injury."}  ;; "To be included, the patient must have head injury."
(declare-const patient_has_finding_of_nausea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nausea.","when_to_set_to_false":"Set to false if the patient currently does not have nausea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nausea.","meaning":"Boolean indicating whether the patient currently has nausea."}  ;; "To be included, the patient must have nausea."
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."}  ;; "To be included, the patient must have vomiting."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must have head injury.
(assert
  (! patient_has_finding_of_injury_of_head_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have head injury."

;; Component 1: The patient must have nausea.
(assert
  (! patient_has_finding_of_nausea_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have nausea."

;; Component 2: The patient must have vomiting.
(assert
  (! patient_has_finding_of_vomiting_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have vomiting."
