;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_undergone_medical_service_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any medical service at any time in their history, regardless of context.","when_to_set_to_false":"Set to false if the patient has not undergone any medical service at any time in their history, regardless of context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any medical service at any time in their history.","meaning":"Boolean indicating whether the patient has undergone any medical service at any time in their history."}  ;; "To be included, the patient must have received outpatient services."
(declare-const patient_has_undergone_medical_service_inthehistory@@service_context_outpatient Bool) ;; {"when_to_set_to_true":"Set to true if the medical service undergone by the patient at any time in their history occurred in the outpatient context.","when_to_set_to_false":"Set to false if the medical service undergone by the patient at any time in their history did not occur in the outpatient context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medical service occurred in the outpatient context.","meaning":"Boolean indicating whether the medical service undergone by the patient at any time in their history occurred in the outpatient context."}  ;; "To be included, the patient must have received outpatient services."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_undergone_medical_service_inthehistory@@service_context_outpatient
         patient_has_undergone_medical_service_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have received outpatient services."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_undergone_medical_service_inthehistory@@service_context_outpatient
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have received outpatient services."
