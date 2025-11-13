;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of neutropenia.","meaning":"Boolean indicating whether the patient currently has neutropenia."} ;; "neutropenia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_neutropenia_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neutropenia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_solid_organ_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a solid organ transplant at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a solid organ transplant at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a solid organ transplant.","meaning":"Boolean indicating whether the patient has ever undergone a solid organ transplant at any time in their medical history."} ;; "solid organ transplant"
(declare-const patient_has_undergone_transplantation_of_bone_marrow_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bone marrow transplant at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a bone marrow transplant at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bone marrow transplant.","meaning":"Boolean indicating whether the patient has ever undergone a bone marrow transplant at any time in their medical history."} ;; "bone marrow transplant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_solid_organ_transplant_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a recipient of a solid organ transplant."

(assert
(! (not patient_has_undergone_transplantation_of_bone_marrow_inthehistory)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a recipient of a bone marrow transplant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_bacteremia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bacteremia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bacteremia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bacteremia.","meaning":"Boolean indicating whether the patient currently has bacteremia."} ;; "bacteremia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_bacteremia_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bacteremia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_respiratory_microbial_culture_now_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a respiratory microbial culture performed and the result is positive (i.e., a pathogen is detected).","when_to_set_to_false":"Set to false if the patient currently has a respiratory microbial culture performed and the result is negative (i.e., no pathogen detected).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a respiratory microbial culture performed or its result.","meaning":"Boolean indicating whether the patient currently has a positive result from a respiratory microbial culture."} ;; "respiratory tract culture"

(declare-const patient_has_undergone_respiratory_microbial_culture_now_outcome_is_positive@@acinetobacter_baumannii_present Bool) ;; {"when_to_set_to_true":"Set to true if Acinetobacter baumannii is present in the patient's current positive respiratory microbial culture result.","when_to_set_to_false":"Set to false if Acinetobacter baumannii is not present in the patient's current positive respiratory microbial culture result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Acinetobacter baumannii is present in the patient's current positive respiratory microbial culture result.","meaning":"Boolean indicating whether Acinetobacter baumannii is present in the patient's current positive respiratory microbial culture result."} ;; "Acinetobacter baumannii present in a respiratory tract culture"

(declare-const patient_has_undergone_respiratory_microbial_culture_now_outcome_is_positive@@stenotrophomonas_maltophilia_present Bool) ;; {"when_to_set_to_true":"Set to true if Stenotrophomonas maltophilia is present in the patient's current positive respiratory microbial culture result.","when_to_set_to_false":"Set to false if Stenotrophomonas maltophilia is not present in the patient's current positive respiratory microbial culture result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Stenotrophomonas maltophilia is present in the patient's current positive respiratory microbial culture result.","meaning":"Boolean indicating whether Stenotrophomonas maltophilia is present in the patient's current positive respiratory microbial culture result."} ;; "Stenotrophomonas maltophilia present in a respiratory tract culture"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply the stem variable (if a specific organism is present, the culture is positive)
(assert
(! (=> patient_has_undergone_respiratory_microbial_culture_now_outcome_is_positive@@acinetobacter_baumannii_present
      patient_has_undergone_respiratory_microbial_culture_now_outcome_is_positive)
    :named REQ3_AUXILIARY0)) ;; "Acinetobacter baumannii present in a respiratory tract culture"

(assert
(! (=> patient_has_undergone_respiratory_microbial_culture_now_outcome_is_positive@@stenotrophomonas_maltophilia_present
      patient_has_undergone_respiratory_microbial_culture_now_outcome_is_positive)
    :named REQ3_AUXILIARY1)) ;; "Stenotrophomonas maltophilia present in a respiratory tract culture"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_respiratory_microbial_culture_now_outcome_is_positive@@acinetobacter_baumannii_present)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Acinetobacter baumannii present in a respiratory tract culture."

(assert
(! (not patient_has_undergone_respiratory_microbial_culture_now_outcome_is_positive@@stenotrophomonas_maltophilia_present)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Stenotrophomonas maltophilia present in a respiratory tract culture."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_secondary_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of secondary infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of secondary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of secondary infection.","meaning":"Boolean indicating whether the patient currently has a secondary infection."} ;; "second infection"
(declare-const patient_has_finding_of_secondary_infection_now@@requires_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's secondary infection requires antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's secondary infection does not require antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's secondary infection requires antibiotic therapy.","meaning":"Boolean indicating whether the patient's secondary infection requires antibiotic therapy."} ;; "requiring antibiotic therapy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_secondary_infection_now@@requires_antibiotic_therapy
      patient_has_finding_of_secondary_infection_now)
   :named REQ4_AUXILIARY0)) ;; "requiring antibiotic therapy" implies "second infection"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_secondary_infection_now@@requires_antibiotic_therapy)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a second infection requiring antibiotic therapy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_enrolled_in_another_clinical_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in another clinical study.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in another clinical study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in another clinical study.","meaning":"Boolean indicating whether the patient is currently enrolled in another clinical study."} ;; "The patient is excluded if the patient is enrolled in another clinical study."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_enrolled_in_another_clinical_study_now)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is enrolled in another clinical study."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_unable_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to provide informed consent.","meaning":"Boolean indicating whether the patient is currently unable to provide informed consent."} ;; "the patient is unable to provide informed consent"
(declare-const surrogate_is_unable_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the surrogate of the patient is currently unable to provide informed consent.","when_to_set_to_false":"Set to false if the surrogate of the patient is currently able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surrogate of the patient is currently unable to provide informed consent.","meaning":"Boolean indicating whether the surrogate of the patient is currently unable to provide informed consent."} ;; "the surrogate of the patient is unable to provide informed consent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_unable_to_provide_informed_consent_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide informed consent."

(assert
(! (not surrogate_is_unable_to_provide_informed_consent_now)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the surrogate of the patient is unable to provide informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const attending_intensive_care_unit_physician_declined_enrollment_for_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the attending intensive care unit physician has declined enrollment in the study for the patient at the current time.","when_to_set_to_false":"Set to false if the attending intensive care unit physician has not declined enrollment in the study for the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attending intensive care unit physician has declined enrollment in the study for the patient at the current time.","meaning":"Boolean indicating whether the attending intensive care unit physician has declined enrollment in the study for the patient at the current time."} ;; "the attending intensive care unit physician declined enrollment in the study for the patient"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not attending_intensive_care_unit_physician_declined_enrollment_for_patient_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the attending intensive care unit physician declined enrollment in the study for the patient."
