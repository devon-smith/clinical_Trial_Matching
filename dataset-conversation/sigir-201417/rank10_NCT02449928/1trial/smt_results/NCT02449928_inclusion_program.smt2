;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of septic shock.","meaning":"Boolean indicating whether the patient currently has a diagnosis of septic shock."} ;; "To be included, the patient must have a diagnosis of septic shock."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_septic_shock_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of septic shock."
