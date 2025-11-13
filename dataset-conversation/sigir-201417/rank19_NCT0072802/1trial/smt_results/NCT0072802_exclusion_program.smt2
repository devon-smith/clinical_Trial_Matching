;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_medical_service_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any medical service at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone any medical service at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any medical service in their history.","meaning":"Boolean indicating whether the patient has ever undergone any medical service in their history."} ;; "medical services"
(declare-const patient_has_undergone_medical_service_inthehistory@@inpatient_context Bool) ;; {"when_to_set_to_true":"Set to true if the medical service undergone by the patient was in an inpatient context.","when_to_set_to_false":"Set to false if the medical service undergone by the patient was not in an inpatient context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medical service was in an inpatient context.","meaning":"Boolean indicating whether the medical service undergone by the patient was in an inpatient context."} ;; "inpatient medical services"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_medical_service_inthehistory@@inpatient_context
      patient_has_undergone_medical_service_inthehistory)
:named REQ0_AUXILIARY0)) ;; "inpatient medical services" implies "medical services"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_medical_service_inthehistory@@inpatient_context)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inpatient medical services."
