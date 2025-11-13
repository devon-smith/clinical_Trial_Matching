;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_ultrasonography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an ultrasonography procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an ultrasonography procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an ultrasonography procedure.","meaning":"Boolean indicating whether the patient has ever undergone an ultrasonography procedure in their history."} ;; "ultrasound diagnostic"
(declare-const patient_has_undergone_ultrasonography_inthehistory@@diagnostic_of_location_of_pregnancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior ultrasonography procedure was performed specifically to diagnose the location of pregnancy.","when_to_set_to_false":"Set to false if the patient's prior ultrasonography procedure was not performed for the purpose of diagnosing the location of pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ultrasonography procedure was for diagnosing the location of pregnancy.","meaning":"Boolean indicating whether the patient's prior ultrasonography procedure was for diagnosing the location of pregnancy."} ;; "ultrasound diagnostic of location of pregnancy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_ultrasonography_inthehistory@@diagnostic_of_location_of_pregnancy
      patient_has_undergone_ultrasonography_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "ultrasound diagnostic of location of pregnancy" implies "ultrasound diagnostic"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_ultrasonography_inthehistory@@diagnostic_of_location_of_pregnancy)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous ultrasound diagnostic of location of pregnancy."
