;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_participated_in_womens_health_initiative_memory_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in the Women's Health Initiative Memory Study.","when_to_set_to_false":"Set to false if the patient has not participated in the Women's Health Initiative Memory Study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in the Women's Health Initiative Memory Study.","meaning":"Boolean indicating whether the patient has participated in the Women's Health Initiative Memory Study."} // "To be included, the patient must have participated in the Women's Health Initiative Memory Study."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_participated_in_womens_health_initiative_memory_study
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have participated in the Women's Health Initiative Memory Study."
