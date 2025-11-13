;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_been_treated_with_rose_hip_extracts_within_3_months_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received rose hip extracts at any time within the three months prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not received rose hip extracts within the three months prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received rose hip extracts within the three months prior to the screening visit.","meaning":"Boolean indicating whether the patient has been treated with rose hip extracts within three months before screening."} ;; "the patient has been treated with rose hip extracts within three months before screening"

(declare-const patient_has_been_treated_with_rose_hip_powder_within_3_months_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received rose hip powder at any time within the three months prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not received rose hip powder within the three months prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received rose hip powder within the three months prior to the screening visit.","meaning":"Boolean indicating whether the patient has been treated with rose hip powder within three months before screening."} ;; "the patient has been treated with rose hip powder within three months before screening"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_been_treated_with_rose_hip_extracts_within_3_months_before_screening)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been treated with rose hip extracts within three months before screening."

(assert
(! (not patient_has_been_treated_with_rose_hip_powder_within_3_months_before_screening)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been treated with rose hip powder within three months before screening."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_taken_ginger_product_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken ginger-containing products within the past 3 months before screening.","when_to_set_to_false":"Set to false if the patient has not taken ginger-containing products within the past 3 months before screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken ginger-containing products within the past 3 months before screening.","meaning":"Boolean indicating whether the patient has taken ginger-containing products within the past 3 months before screening."} ;; "the patient has been treated with ginger within three months before screening"

(declare-const patient_is_exposed_to_avocado_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to avocado within the past 3 months before screening.","when_to_set_to_false":"Set to false if the patient has not been exposed to avocado within the past 3 months before screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to avocado within the past 3 months before screening.","meaning":"Boolean indicating whether the patient has been exposed to avocado within the past 3 months before screening."} ;; "the patient has been treated with avocado within three months before screening"

(declare-const patient_is_exposed_to_soya_bean_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to soy within the past 3 months before screening.","when_to_set_to_false":"Set to false if the patient has not been exposed to soy within the past 3 months before screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to soy within the past 3 months before screening.","meaning":"Boolean indicating whether the patient has been exposed to soy within the past 3 months before screening."} ;; "the patient has been treated with soy within three months before screening"

(declare-const patient_is_exposed_to_vitamin_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to vitamins within the past 3 months before screening.","when_to_set_to_false":"Set to false if the patient has not been exposed to vitamins within the past 3 months before screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to vitamins within the past 3 months before screening.","meaning":"Boolean indicating whether the patient has been exposed to vitamins within the past 3 months before screening."} ;; "the patient has been treated with vitamins within three months before screening"

(declare-const patient_is_exposed_to_vitamin_inthepast3months@@large_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to vitamins within the past 3 months and the exposure was in large doses.","when_to_set_to_false":"Set to false if the patient has been exposed to vitamins within the past 3 months but the exposure was not in large doses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to vitamins within the past 3 months was in large doses.","meaning":"Boolean indicating whether the patient has been exposed to vitamins within the past 3 months and the exposure was in large doses."} ;; "the patient has been treated with large doses of vitamins within three months before screening"

(declare-const patient_is_exposed_to_ascorbic_acid_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to vitamin C within the past 3 months before screening.","when_to_set_to_false":"Set to false if the patient has not been exposed to vitamin C within the past 3 months before screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to vitamin C within the past 3 months before screening.","meaning":"Boolean indicating whether the patient has been exposed to vitamin C within the past 3 months before screening."} ;; "vitamin C within three months before screening"

(declare-const patient_is_exposed_to_nutritional_supplement_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to dietary supplements within the past 3 months before screening.","when_to_set_to_false":"Set to false if the patient has not been exposed to dietary supplements within the past 3 months before screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to dietary supplements within the past 3 months before screening.","meaning":"Boolean indicating whether the patient has been exposed to dietary supplements within the past 3 months before screening."} ;; "the patient has been treated with other known dietary supplements within three months before screening"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive example: vitamin C implies large dose of vitamins
(assert
(! (=> patient_is_exposed_to_ascorbic_acid_inthepast3months
      patient_is_exposed_to_vitamin_inthepast3months@@large_dose)
    :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (vitamin C) within three months before screening"

;; Qualifier variable implies stem variable: large dose of vitamins implies vitamins
(assert
(! (=> patient_is_exposed_to_vitamin_inthepast3months@@large_dose
      patient_is_exposed_to_vitamin_inthepast3months)
    :named REQ1_AUXILIARY1)) ;; "large doses of vitamins within three months before screening"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have been treated with ginger within three months before screening
(assert
(! (not patient_has_taken_ginger_product_inthepast3months)
    :named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has been treated with ginger within three months before screening"

;; Exclusion: patient must NOT have been treated with avocado within three months before screening
(assert
(! (not patient_is_exposed_to_avocado_inthepast3months)
    :named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has been treated with avocado within three months before screening"

;; Exclusion: patient must NOT have been treated with soy within three months before screening
(assert
(! (not patient_is_exposed_to_soya_bean_inthepast3months)
    :named REQ1_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has been treated with soy within three months before screening"

;; Exclusion: patient must NOT have been treated with large doses of vitamins within three months before screening
(assert
(! (not patient_is_exposed_to_vitamin_inthepast3months@@large_dose)
    :named REQ1_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has been treated with large doses of vitamins with non-exhaustive examples (vitamin C) within three months before screening"

;; Exclusion: patient must NOT have been treated with other known dietary supplements within three months before screening
(assert
(! (not patient_is_exposed_to_nutritional_supplement_inthepast3months)
    :named REQ1_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has been treated with other known dietary supplements within three months before screening"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_difficulty_collaborating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently deemed to have a hard time collaborating.","when_to_set_to_false":"Set to false if the patient is currently deemed not to have a hard time collaborating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently deemed to have a hard time collaborating.","meaning":"Boolean indicating whether the patient is currently deemed to have a hard time collaborating."} ;; "has been deemed to have a hard time collaborating"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_difficulty_collaborating_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been deemed to have a hard time collaborating."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_abuses_narcotics_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently abuses narcotics.","when_to_set_to_false":"Set to false if the patient currently does not abuse narcotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently abuses narcotics.","meaning":"Boolean indicating whether the patient currently abuses narcotics."} ;; "The patient is excluded if the patient abuses narcotics."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_abuses_narcotics_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient abuses narcotics."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alcohol (i.e., currently uses or consumes alcohol).","when_to_set_to_false":"Set to false if the patient is currently not exposed to alcohol (i.e., does not use or consume alcohol at present).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to alcohol.","meaning":"Boolean indicating whether the patient is currently exposed to alcohol."} ;; "alcohol"
(declare-const patient_is_exposed_to_alcohol_now@@abuse Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to alcohol is characterized by abuse (i.e., the patient abuses alcohol).","when_to_set_to_false":"Set to false if the patient's current exposure to alcohol is not characterized by abuse (i.e., the patient does not abuse alcohol, even if exposed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to alcohol is characterized by abuse.","meaning":"Boolean indicating whether the patient's current exposure to alcohol is characterized by abuse."} ;; "abuses alcohol"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_alcohol_now@@abuse
      patient_is_exposed_to_alcohol_now)
:named REQ4_AUXILIARY0)) ;; "abuses alcohol" means exposure to alcohol characterized by abuse

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_exposed_to_alcohol_now@@abuse)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient abuses alcohol."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder (mental illness).","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder (mental illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder (mental illness).","meaning":"Boolean indicating whether the patient currently has a mental disorder (mental illness) now."} ;; "The patient is excluded if the patient has a current mental illness."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current mental illness."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_allergic_disposition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergic disposition (allergy).","when_to_set_to_false":"Set to false if the patient currently does not have an allergic disposition (allergy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergic disposition (allergy).","meaning":"Boolean indicating whether the patient currently has an allergic disposition (allergy) now."} ;; "allergy"

(declare-const patient_has_finding_of_allergic_disposition_now@@allergen_rose_hips Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergic disposition (allergy) is specifically to rose hips.","when_to_set_to_false":"Set to false if the patient's allergic disposition (allergy) is not to rose hips.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic disposition (allergy) is to rose hips.","meaning":"Boolean indicating whether the patient's allergic disposition (allergy) is specifically to rose hips."} ;; "a known allergy to rose hips"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for rose hips allergy implies general allergy
(assert
(! (=> patient_has_finding_of_allergic_disposition_now@@allergen_rose_hips
       patient_has_finding_of_allergic_disposition_now)
   :named REQ6_AUXILIARY0)) ;; "allergy to rose hips" implies "allergy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_allergic_disposition_now@@allergen_rose_hips)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to rose hips."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any clinical trial other than the present trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in any clinical trial other than the present trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in another clinical trial."} ;; "the patient is participating in another clinical trial"

(declare-const patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within3months_before_present_trial_start Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in another clinical trial occurred within the three months before the present trial started.","when_to_set_to_false":"Set to false if the patient's participation in another clinical trial did not occur within the three months before the present trial started.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in another clinical trial occurred within the three months before the present trial started.","meaning":"Boolean indicating whether the patient's participation in another clinical trial occurred within the three months before the present trial started."} ;; "the patient has participated in another clinical trial within three months before this trial started"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_is_undergoing_clinical_trial_now
            patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within3months_before_present_trial_start))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is participating in another clinical trial) OR (the patient has participated in another clinical trial within three months before this trial started)."
