;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_ventilated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently ventilated.","when_to_set_to_false":"Set to false if the patient is currently not ventilated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently ventilated.","meaning":"Boolean indicating whether the patient is currently ventilated."}  // "To be included, the patient must be a ventilated patient."
(declare-const patient_has_finding_of_sinus_rhythm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sinus rhythm.","when_to_set_to_false":"Set to false if the patient currently does not have sinus rhythm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinus rhythm.","meaning":"Boolean indicating whether the patient currently has sinus rhythm."}  // "To be included, the patient must be a patient with sinus rhythm."
(declare-const patient_has_finding_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has septic shock.","meaning":"Boolean indicating whether the patient currently has septic shock."}  // "To be included, the patient must be a patient with septic shock."
(declare-const patient_requires_hemodynamic_assessment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires hemodynamic assessment.","when_to_set_to_false":"Set to false if the patient currently does not require hemodynamic assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires hemodynamic assessment.","meaning":"Boolean indicating whether the patient currently requires hemodynamic assessment."}  // "To be included, the patient must be a patient requiring hemodynamic assessment."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: "To be included, the patient must be a ventilated patient."
(assert
  (! patient_has_finding_of_patient_ventilated_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 1: "To be included, the patient must be a patient with sinus rhythm."
(assert
  (! patient_has_finding_of_sinus_rhythm_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS))

;; Component 2: "To be included, the patient must be a patient with septic shock."
(assert
  (! patient_has_finding_of_septic_shock_now
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 3: "To be included, the patient must be a patient requiring hemodynamic assessment."
(assert
  (! patient_requires_hemodynamic_assessment_now
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS))
