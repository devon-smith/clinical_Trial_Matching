;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical condition (disease, condition, or finding).","when_to_set_to_false":"Set to false if the patient currently does not have any medical condition (disease, condition, or finding).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical condition.","meaning":"Boolean indicating whether the patient currently has a medical condition."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@is_life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition is life threatening.","when_to_set_to_false":"Set to false if the patient's current medical condition is not life threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition is life threatening.","meaning":"Boolean indicating whether the patient's current medical condition is life threatening."} ;; "life threatening medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@requires_immediate_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition requires immediate treatment.","when_to_set_to_false":"Set to false if the patient's current medical condition does not require immediate treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition requires immediate treatment.","meaning":"Boolean indicating whether the patient's current medical condition requires immediate treatment."} ;; "requiring immediate treatment"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@is_life_threatening
      patient_has_finding_of_disease_condition_finding_now)
   :named REQ0_AUXILIARY0)) ;; "life threatening medical condition"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@requires_immediate_treatment
      patient_has_finding_of_disease_condition_finding_now)
   :named REQ0_AUXILIARY1)) ;; "medical condition requiring immediate treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a life threatening medical condition requiring immediate treatment
(assert
(! (not (and patient_has_finding_of_disease_condition_finding_now@@is_life_threatening
             patient_has_finding_of_disease_condition_finding_now@@requires_immediate_treatment))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life threatening medical condition requiring immediate treatment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_can_undergo_ultrasonography_of_thorax_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo ultrasonography of the thorax (chest ultrasound examination).","when_to_set_to_false":"Set to false if the patient cannot currently undergo ultrasonography of the thorax (chest ultrasound examination).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo ultrasonography of the thorax.","meaning":"Boolean indicating whether the patient can currently undergo ultrasonography of the thorax (chest ultrasound examination)."} ;; "chest ultrasound examination"
(declare-const patient_is_able_to_sit_up_for_chest_ultrasound_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to sit up for a chest ultrasound examination.","when_to_set_to_false":"Set to false if the patient is currently unable to sit up for a chest ultrasound examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to sit up for a chest ultrasound examination.","meaning":"Boolean indicating whether the patient is currently able to sit up for a chest ultrasound examination."} ;; "unable to sit up for a chest ultrasound examination"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Being able to sit up is required for chest ultrasound examination
(assert
(! (=> patient_is_able_to_sit_up_for_chest_ultrasound_examination_now
     patient_can_undergo_ultrasonography_of_thorax_now)
:named REQ1_AUXILIARY0)) ;; "unable to sit up for a chest ultrasound examination" implies cannot undergo chest ultrasound

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_able_to_sit_up_for_chest_ultrasound_examination_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to sit up for a chest ultrasound examination."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_able_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide consent.","meaning":"Boolean indicating whether the patient is currently able to provide consent."} ;; "unable to provide consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_able_to_provide_consent_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide consent."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_unable_to_speak_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to speak in English.","when_to_set_to_false":"Set to false if the patient is currently able to speak in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to speak in English.","meaning":"Boolean indicating whether the patient is currently unable to speak in English."} ;; "the patient is unable to speak in English"
(declare-const patient_is_unable_to_read_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to read in English.","when_to_set_to_false":"Set to false if the patient is currently able to read in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to read in English.","meaning":"Boolean indicating whether the patient is currently unable to read in English."} ;; "the patient is unable to read in English"
(declare-const patient_is_unable_to_write_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to write in English.","when_to_set_to_false":"Set to false if the patient is currently able to write in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to write in English.","meaning":"Boolean indicating whether the patient is currently unable to write in English."} ;; "the patient is unable to write in English"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_is_unable_to_speak_in_english_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to speak in English."

(assert
  (! (not patient_is_unable_to_read_in_english_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to read in English."

(assert
  (! (not patient_is_unable_to_write_in_english_now)
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to write in English."
