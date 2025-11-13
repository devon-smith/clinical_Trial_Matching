;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_transfer_of_care_from_hospital_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a transfer of care from another hospital at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a transfer of care from another hospital at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a transfer of care from another hospital.","meaning":"Boolean indicating whether the patient has ever undergone a transfer of care from another hospital in their medical history."} ;; "transferred from another hospital"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_transfer_of_care_from_hospital_inthehistory)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was transferred from another hospital."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_collection_of_blood_specimen_for_laboratory_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone collection of blood specimen for laboratory purposes at any time in the past or present.","when_to_set_to_false":"Set to false if the patient has never undergone collection of blood specimen for laboratory purposes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone collection of blood specimen for laboratory purposes.","meaning":"Boolean indicating whether the patient has ever undergone collection of blood specimen for laboratory purposes."} ;; "blood taking"
(declare-const patient_has_undergone_collection_of_blood_specimen_for_laboratory_inthehistory@@refused Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever refused collection of blood specimen for laboratory purposes.","when_to_set_to_false":"Set to false if the patient has never refused collection of blood specimen for laboratory purposes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever refused collection of blood specimen for laboratory purposes.","meaning":"Boolean indicating whether the patient has ever refused collection of blood specimen for laboratory purposes."} ;; "refused blood taking"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_collection_of_blood_specimen_for_laboratory_inthehistory@@refused
      patient_has_undergone_collection_of_blood_specimen_for_laboratory_inthehistory)
:named REQ1_AUXILIARY0)) ;; "refused blood taking" implies "blood taking" is relevant

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_collection_of_blood_specimen_for_laboratory_inthehistory@@refused)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refused blood taking."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a doctor diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a doctor diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a doctor diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a doctor diagnosis of asthma."} ;; "asthma"
(declare-const patient_has_diagnosis_of_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a doctor diagnosis of wheezing.","when_to_set_to_false":"Set to false if the patient currently does not have a doctor diagnosis of wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a doctor diagnosis of wheezing.","meaning":"Boolean indicating whether the patient currently has a doctor diagnosis of wheezing."} ;; "wheezing"
(declare-const patient_has_diagnosis_of_wheezing_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a doctor diagnosis of wheezing and the diagnosis is recurrent.","when_to_set_to_false":"Set to false if the patient currently has a doctor diagnosis of wheezing and the diagnosis is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of wheezing is recurrent.","meaning":"Boolean indicating whether the patient currently has a doctor diagnosis of wheezing and the diagnosis is recurrent."} ;; "recurrent wheezing illness"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_wheezing_now@@recurrent
      patient_has_diagnosis_of_wheezing_now)
:named REQ2_AUXILIARY0)) ;; "recurrent wheezing illness" implies "wheezing illness"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have a doctor diagnosis of asthma
(assert
(! (not patient_has_diagnosis_of_asthma_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a doctor diagnosis of asthma."

;; Exclusion: patient must NOT have a doctor diagnosis of recurrent wheezing illness
(assert
(! (not patient_has_diagnosis_of_wheezing_now@@recurrent)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a doctor diagnosis of recurrent wheezing illness."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "in a child"
(declare-const patient_has_diagnosis_of_bronchiolitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bronchiolitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bronchiolitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bronchiolitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bronchiolitis."} ;; "bronchiolitis"
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest x-ray (radiograph) now.","when_to_set_to_false":"Set to false if the patient has not undergone a plain chest x-ray (radiograph) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest x-ray (radiograph) now.","meaning":"Boolean indicating whether the patient has undergone a plain chest x-ray (radiograph) now."} ;; "chest radiograph"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@outcome_is_no_consolidation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's plain chest x-ray (radiograph) now shows no consolidation.","when_to_set_to_false":"Set to false if the patient's plain chest x-ray (radiograph) now does not show no consolidation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's plain chest x-ray (radiograph) now shows no consolidation.","meaning":"Boolean indicating whether the patient's plain chest x-ray (radiograph) now shows no consolidation."} ;; "chest radiograph with no consolidation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: bronchiolitis = (wheezing in a child with a chest radiograph with no consolidation)
(assert
(! (= patient_has_diagnosis_of_bronchiolitis_now
     (and patient_has_diagnosis_of_wheezing_now
          (< patient_age_value_recorded_now_in_years 18)
          patient_has_undergone_plain_chest_x_ray_now@@outcome_is_no_consolidation))
:named REQ3_AUXILIARY0)) ;; "bronchiolitis (defined as wheezing in a child with a chest radiograph with no consolidation)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_plain_chest_x_ray_now@@outcome_is_no_consolidation
       patient_has_undergone_plain_chest_x_ray_now)
:named REQ3_AUXILIARY1)) ;; "chest radiograph with no consolidation" implies "chest radiograph"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_bronchiolitis_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of bronchiolitis (defined as wheezing in a child with a chest radiograph with no consolidation)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute illness.","when_to_set_to_false":"Set to false if the patient currently does not have an acute illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute illness.","meaning":"Boolean indicating whether the patient currently has an acute illness."} ;; "acute illness"
(declare-const patient_illness_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days if the duration of the patient's current illness is known and recorded now.","when_to_set_to_null":"Set to null if the duration of the patient's current illness is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in days of the patient's current illness."} ;; "illness duration greater than 7 days (i.e., does NOT have an acute illness, defined as illness duration ≤ 7 days)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: acute illness = illness duration ≤ 7 days
(assert
(! (= patient_has_finding_of_acute_disease_now
    (<= patient_illness_value_recorded_now_withunit_days 7))
:named REQ4_AUXILIARY0)) ;; "acute illness, defined as illness duration ≤ 7 days"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have illness duration > 7 days (i.e., must have acute illness)
(assert
(! (not patient_has_finding_of_acute_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has illness duration greater than 7 days (i.e., does NOT have an acute illness, defined as illness duration ≤ 7 days)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_can_undergo_follow_up_visit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo a follow-up visit.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo a follow-up visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to undergo a follow-up visit.","meaning":"Boolean indicating whether the patient is currently able to undergo a follow-up visit."} ;; "unable to come for follow-up"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_can_undergo_follow_up_visit_now)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to come for follow-up."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community acquired pneumonia."} ;; "community acquired pneumonia"
(declare-const patient_has_diagnosis_of_aspiration_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aspiration pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of aspiration pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of aspiration pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of aspiration pneumonia."} ;; "aspiration pneumonia"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive example: aspiration pneumonia is an example of NOT having community acquired pneumonia
(assert
(! (=> patient_has_diagnosis_of_aspiration_pneumonia_now
    (not patient_has_diagnosis_of_community_acquired_pneumonia_now))
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (aspiration pneumonia)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT lack community acquired pneumonia
(assert
(! (not (not patient_has_diagnosis_of_community_acquired_pneumonia_now))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have community acquired pneumonia with non-exhaustive examples (aspiration pneumonia)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_pleural_effusion_associated_with_pulmonary_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleural effusion associated with pulmonary infection.","when_to_set_to_false":"Set to false if the patient currently does not have pleural effusion associated with pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion associated with pulmonary infection.","meaning":"Boolean indicating whether the patient currently has pleural effusion associated with pulmonary infection."} ;; "complicated pneumonia with effusion"

(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"

(declare-const patient_has_finding_of_pneumonia_now@@complicated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complicated pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have complicated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complicated pneumonia.","meaning":"Boolean indicating whether the patient currently has complicated pneumonia."} ;; "complicated pneumonia"

(declare-const patient_has_finding_of_pneumonia_now@@complicated@@with_effusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current complicated pneumonia is associated with effusion.","when_to_set_to_false":"Set to false if the patient's current complicated pneumonia is not associated with effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current complicated pneumonia is associated with effusion.","meaning":"Boolean indicating whether the patient's current complicated pneumonia is associated with effusion."} ;; "complicated pneumonia with effusion"

(declare-const patient_has_finding_of_pneumonia_now@@complicated_and_associated_with_pneumothorax Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia is complicated and associated with pneumothorax.","when_to_set_to_false":"Set to false if the patient's current pneumonia is not complicated and/or not associated with pneumothorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia is complicated and associated with pneumothorax.","meaning":"Boolean indicating whether the patient's current pneumonia is complicated and associated with pneumothorax."} ;; "complicated pneumonia with pneumothorax"

(declare-const patient_has_finding_of_pneumonia_now@@complicated_and_clinical_suspicion_of_necrotizing_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia is complicated and there is clinical suspicion of necrotizing pneumonia.","when_to_set_to_false":"Set to false if the patient's current pneumonia is not complicated and/or there is no clinical suspicion of necrotizing pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia is complicated and there is clinical suspicion of necrotizing pneumonia.","meaning":"Boolean indicating whether the patient's current pneumonia is complicated and there is clinical suspicion of necrotizing pneumonia."} ;; "complicated pneumonia with clinical suspicion of necrotizing pneumonia"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pneumonia_now@@complicated
       patient_has_finding_of_pneumonia_now)
    :named REQ7_AUXILIARY0)) ;; "complicated pneumonia"

(assert
(! (=> patient_has_finding_of_pneumonia_now@@complicated@@with_effusion
       patient_has_finding_of_pneumonia_now@@complicated)
    :named REQ7_AUXILIARY1)) ;; "complicated pneumonia with effusion"

(assert
(! (=> patient_has_finding_of_pneumonia_now@@complicated_and_associated_with_pneumothorax
       patient_has_finding_of_pneumonia_now)
    :named REQ7_AUXILIARY2)) ;; "complicated pneumonia with pneumothorax"

(assert
(! (=> patient_has_finding_of_pneumonia_now@@complicated_and_clinical_suspicion_of_necrotizing_pneumonia
       patient_has_finding_of_pneumonia_now)
    :named REQ7_AUXILIARY3)) ;; "complicated pneumonia with clinical suspicion of necrotizing pneumonia"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion 1: complicated pneumonia with effusion
(assert
(! (not patient_has_finding_of_pneumonia_now@@complicated@@with_effusion)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complicated pneumonia with effusion."

;; Exclusion 2: complicated pneumonia with pneumothorax
(assert
(! (not patient_has_finding_of_pneumonia_now@@complicated_and_associated_with_pneumothorax)
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complicated pneumonia with pneumothorax."

;; Exclusion 3: complicated pneumonia with clinical suspicion of necrotizing pneumonia
(assert
(! (not patient_has_finding_of_pneumonia_now@@complicated_and_clinical_suspicion_of_necrotizing_pneumonia)
    :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complicated pneumonia with clinical suspicion of necrotizing pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_been_admitted_to_pediatric_intensive_care_unit_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been admitted to the pediatric intensive care unit at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been admitted to the pediatric intensive care unit at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been admitted to the pediatric intensive care unit.","meaning":"Boolean indicating whether the patient has ever been admitted to the pediatric intensive care unit in their medical history."} ;; "the patient has been admitted to the pediatric intensive care unit"

(declare-const patient_has_undergone_noninvasive_ventilation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone noninvasive ventilation at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone noninvasive ventilation at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone noninvasive ventilation.","meaning":"Boolean indicating whether the patient has ever undergone noninvasive ventilation in their medical history."} ;; "the patient has used non-invasive ventilation"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_been_admitted_to_pediatric_intensive_care_unit_in_the_history)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been admitted to the pediatric intensive care unit."

(assert
(! (not patient_has_undergone_noninvasive_ventilation_inthehistory)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used non-invasive ventilation."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has comorbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have comorbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has comorbid conditions.","meaning":"Boolean indicating whether the patient currently has comorbid conditions."} ;; "comorbidities"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's comorbid conditions are significant.","when_to_set_to_false":"Set to false if the patient's comorbid conditions are not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's comorbid conditions are significant.","meaning":"Boolean indicating whether the patient's comorbid conditions are significant."} ;; "significant comorbidities"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@can_increase_risk_of_complicated_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's comorbid conditions can increase the risk of having complicated pneumonia.","when_to_set_to_false":"Set to false if the patient's comorbid conditions cannot increase the risk of having complicated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's comorbid conditions can increase the risk of having complicated pneumonia.","meaning":"Boolean indicating whether the patient's comorbid conditions can increase the risk of having complicated pneumonia."} ;; "comorbidities that can increase the risk of having complicated pneumonia"
(declare-const risk_of_having_complicated_pneumonia_value_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's current risk of having complicated pneumonia, expressed as a percentage, if available.","when_to_set_to_null":"Set to null if the patient's current risk of having complicated pneumonia is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current risk of having complicated pneumonia, expressed as a percentage."} ;; "risk of having complicated pneumonia"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@significant
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ9_AUXILIARY0)) ;; "significant comorbidities"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@can_increase_risk_of_complicated_pneumonia
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ9_AUXILIARY1)) ;; "comorbidities that can increase the risk of having complicated pneumonia"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have significant comorbidities that can increase the risk of having complicated pneumonia
(assert
(! (not (and patient_has_finding_of_co_morbid_conditions_now@@significant
             patient_has_finding_of_co_morbid_conditions_now@@can_increase_risk_of_complicated_pneumonia))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant comorbidities that can increase the risk of having complicated pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_needs_to_use_other_antibiotics_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs to use any antibiotics other than the primary study drug, regardless of the specific class.","when_to_set_to_false":"Set to false if the patient currently does not need to use any antibiotics other than the primary study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs to use any antibiotics other than the primary study drug.","meaning":"Boolean indicating whether the patient currently needs to use antibiotics other than the primary study drug."} ;; "needs to use other antibiotics"
(declare-const patient_needs_to_use_anti_staphylococcal_agents_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs to use any anti-staphylococcal agent.","when_to_set_to_false":"Set to false if the patient currently does not need to use any anti-staphylococcal agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs to use any anti-staphylococcal agent.","meaning":"Boolean indicating whether the patient currently needs to use anti-staphylococcal agents."} ;; "anti-staphylococcal agents"
(declare-const patient_is_exposed_to_macrolide_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (i.e., taking or administered) any macrolide antibiotic.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any macrolide antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any macrolide antibiotic.","meaning":"Boolean indicating whether the patient is currently exposed to macrolide antibiotics."} ;; "macrolides"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples: anti-staphylococcal agents are examples of "other antibiotics"
(assert
(! (=> patient_needs_to_use_anti_staphylococcal_agents_now
       patient_needs_to_use_other_antibiotics_now)
    :named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples (anti-staphylococcal agents)"

;; Non-exhaustive examples: macrolides are examples of "other antibiotics"
(assert
(! (=> patient_is_exposed_to_macrolide_antibacterial_now
       patient_needs_to_use_other_antibiotics_now)
    :named REQ10_AUXILIARY1)) ;; "with non-exhaustive examples (macrolides)"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT need to use other antibiotics (anti-staphylococcal agents as example)
(assert
(! (not patient_needs_to_use_other_antibiotics_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs to use other antibiotics with non-exhaustive examples (anti-staphylococcal agents)."

;; Exclusion: patient must NOT need to use other antibiotics (macrolides as example)
;; (Note: This is the same variable as above, but the requirement lists both as separate components.)
(assert
(! (not patient_needs_to_use_other_antibiotics_now)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs to use other antibiotics with non-exhaustive examples (macrolides)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_extra_pulmonary_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an extra-pulmonary infection (an infection located outside the lungs).","when_to_set_to_false":"Set to false if the patient currently does not have an extra-pulmonary infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an extra-pulmonary infection.","meaning":"Boolean indicating whether the patient currently has an extra-pulmonary infection (an infection located outside the lungs)."} ;; "extra-pulmonary infection"
(declare-const patient_has_finding_of_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of meningitis.","meaning":"Boolean indicating whether the patient currently has meningitis."} ;; "meningitis"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive example: meningitis is one possible extra-pulmonary infection
(assert
(! (=> patient_has_finding_of_meningitis_now
      patient_has_finding_of_extra_pulmonary_infection_now)
    :named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples (meningitis)."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_extra_pulmonary_infection_now)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an extra-pulmonary infection with non-exhaustive examples (meningitis)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_allergy_to_penicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to penicillin.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to penicillin.","meaning":"Boolean indicating whether the patient currently has an allergy to penicillin."} ;; "allergy to penicillin"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_allergy_to_penicillin_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to penicillin."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_unable_to_tolerate_oral_antibiotics_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to tolerate oral antibiotics.","when_to_set_to_false":"Set to false if the patient is currently able to tolerate oral antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to tolerate oral antibiotics.","meaning":"Boolean indicating whether the patient is currently unable to tolerate oral antibiotics."} ;; "unable to tolerate oral antibiotics"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_unable_to_tolerate_oral_antibiotics_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to tolerate oral antibiotics."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_recurrent_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of recurrent pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of recurrent pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of recurrent pneumonia.","meaning":"Boolean indicating whether the patient currently has recurrent pneumonia."} ;; "recurrent pneumonia"
(declare-const patient_has_finding_of_underlying_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an underlying illness.","when_to_set_to_false":"Set to false if the patient currently does not have an underlying illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an underlying illness.","meaning":"Boolean indicating whether the patient currently has an underlying illness."} ;; "underlying illness"
(declare-const patient_has_finding_of_underlying_illness_now@@can_predispose_to_recurrent_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current underlying illness can predispose to recurrent pneumonia.","when_to_set_to_false":"Set to false if the patient's current underlying illness cannot predispose to recurrent pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current underlying illness can predispose to recurrent pneumonia.","meaning":"Boolean indicating whether the patient's current underlying illness can predispose to recurrent pneumonia."} ;; "underlying illness that can predispose to recurrent pneumonia"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_underlying_illness_now@@can_predispose_to_recurrent_pneumonia
      patient_has_finding_of_underlying_illness_now)
:named REQ14_AUXILIARY0)) ;; "underlying illness that can predispose to recurrent pneumonia"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_underlying_illness_now@@can_predispose_to_recurrent_pneumonia)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an underlying illness that can predispose to recurrent pneumonia."
