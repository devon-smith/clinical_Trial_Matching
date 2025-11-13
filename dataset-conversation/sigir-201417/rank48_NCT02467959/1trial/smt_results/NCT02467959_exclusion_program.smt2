;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_flank_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has flank pain.","when_to_set_to_false":"Set to false if the patient currently does not have flank pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has flank pain.","meaning":"Boolean indicating whether the patient currently has flank pain."} ;; "flank pain"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_flank_pain_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has flank pain."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_appendectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an appendectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an appendectomy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an appendectomy.","meaning":"Boolean indicating whether the patient has ever undergone an appendectomy in their history."} ;; "has had a previous appendectomy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_appendectomy_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous appendectomy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_unstable_vital_signs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unstable vital signs.","when_to_set_to_false":"Set to false if the patient currently does not have unstable vital signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable vital signs.","meaning":"Boolean indicating whether the patient currently has unstable vital signs."} ;; "The patient is excluded if the patient has unstable vital signs."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_unstable_vital_signs_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable vital signs."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peritonitis.","meaning":"Boolean indicating whether the patient currently has peritonitis."} ;; "peritonitis"
(declare-const patient_has_finding_of_peritonitis_now@@frank Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peritonitis and the peritonitis is frank (overt/severe).","when_to_set_to_false":"Set to false if the patient currently has peritonitis but it is not frank, or if the patient does not have peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's peritonitis is frank.","meaning":"Boolean indicating whether the patient's peritonitis is frank (overt/severe)."} ;; "frank peritonitis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_peritonitis_now@@frank
       patient_has_finding_of_peritonitis_now)
   :named REQ4_AUXILIARY0)) ;; "frank peritonitis" (frank peritonitis implies peritonitis)

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_peritonitis_now@@frank)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has frank peritonitis."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_ultrasonography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone ultrasonography at any time in the past, regardless of outcome or context.","when_to_set_to_false":"Set to false if the patient has never undergone ultrasonography at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone ultrasonography.","meaning":"Boolean indicating whether the patient has ever undergone ultrasonography at any time in the past."} ;; "ultrasound"
(declare-const patient_has_undergone_ultrasonography_inthehistory@@temporalcontext_before_emergency_physician_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ultrasonography was performed before the emergency physician's examination.","when_to_set_to_false":"Set to false if the patient's ultrasonography was not performed before the emergency physician's examination (i.e., performed after or at the same time as the examination).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ultrasonography was performed before the emergency physician's examination.","meaning":"Boolean indicating whether the patient's ultrasonography was performed before the emergency physician's examination."} ;; "ultrasound performed before the emergency physician's examination"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_undergone_ultrasonography_inthehistory@@temporalcontext_before_emergency_physician_examination
      patient_has_undergone_ultrasonography_inthehistory)
   :named REQ5_AUXILIARY0)) ;; "ultrasound performed before the emergency physician's examination" implies "ultrasound"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_ultrasonography_inthehistory@@temporalcontext_before_emergency_physician_examination)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an ultrasound performed before the emergency physician's examination."
