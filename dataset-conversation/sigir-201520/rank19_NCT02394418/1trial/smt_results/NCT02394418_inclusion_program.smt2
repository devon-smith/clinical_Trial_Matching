;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_delirium_now Bool) ;; "To be included, the patient must have delirium." {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of delirium.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of delirium.","meaning":"Boolean indicating whether the patient currently has delirium."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_delirium_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have delirium."
