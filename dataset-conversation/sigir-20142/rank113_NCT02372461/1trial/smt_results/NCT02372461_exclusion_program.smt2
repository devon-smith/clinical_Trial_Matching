;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_been_enrolled_in_study_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient was previously enrolled in the study at any time in the past.","when_to_set_to_false":"Set to false if the patient was never previously enrolled in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was previously enrolled in the study.","meaning":"Boolean indicating whether the patient was previously enrolled in the study at any time in the past."} ;; "The patient is excluded if the patient was previously enrolled in the study."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_been_enrolled_in_study_in_the_past)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was previously enrolled in the study."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_edema_of_foot_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pedal edema (edema of the foot).","when_to_set_to_false":"Set to false if the patient currently does not have pedal edema (edema of the foot).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pedal edema (edema of the foot).","meaning":"Boolean indicating whether the patient currently has pedal edema (edema of the foot)."} ;; "pedal edema"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_edema_of_foot_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pedal edema."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_inpatient_stay_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an inpatient stay (hospitalization) within the past two weeks.","when_to_set_to_false":"Set to false if the patient has not had an inpatient stay (hospitalization) within the past two weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an inpatient stay (hospitalization) within the past two weeks.","meaning":"Boolean indicating whether the patient has had an inpatient stay (hospitalization) within the past two weeks."} ;; "hospitalization within the last two weeks"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_inpatient_stay_inthepast2weeks)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hospitalization within the last two weeks."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_lower_chest_wall_in_drawing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lower chest wall in-drawing.","when_to_set_to_false":"Set to false if the patient currently does not have lower chest wall in-drawing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lower chest wall in-drawing.","meaning":"Boolean indicating whether the patient currently has lower chest wall in-drawing."} ;; "lower chest wall in-drawing"
(declare-const patient_has_finding_of_lower_chest_wall_in_drawing_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lower chest wall in-drawing is severe.","when_to_set_to_false":"Set to false if the patient's current lower chest wall in-drawing is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current lower chest wall in-drawing is severe.","meaning":"Boolean indicating whether the patient's current lower chest wall in-drawing is severe."} ;; "severe lower chest wall in-drawing"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_lower_chest_wall_in_drawing_now@@severe
      patient_has_finding_of_lower_chest_wall_in_drawing_now)
:named REQ3_AUXILIARY0)) ;; "severe lower chest wall in-drawing" implies "lower chest wall in-drawing"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_lower_chest_wall_in_drawing_now@@severe)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe lower chest wall in-drawing."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to have a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient is currently known not to have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "the patient is a known patient with asthma"
(declare-const patient_has_diagnosis_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to have a diagnosis of tuberculosis.","when_to_set_to_false":"Set to false if the patient is currently known not to have a diagnosis of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of tuberculosis."} ;; "the patient has tuberculosis"
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness.","when_to_set_to_false":"Set to false if the patient currently does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an illness.","meaning":"Boolean indicating whether the patient currently has an illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness and that illness is severe.","when_to_set_to_false":"Set to false if the patient currently has an illness but it is not severe, or if the patient does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is severe.","meaning":"Boolean indicating whether the patient's current illness is severe."} ;; "another severe illness"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@severe
       patient_has_finding_of_illness_now)
   :named REQ4_AUXILIARY0)) ;; "another severe illness" (severe illness implies illness)

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_diagnosis_of_asthma_now
            patient_has_diagnosis_of_tuberculosis_now
            patient_has_finding_of_illness_now@@severe))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a known patient with asthma) OR (the patient has tuberculosis) OR (the patient has another severe illness)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_antibiotic_therapy_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time within the past forty-eight hours.","when_to_set_to_false":"Set to false if the patient has not undergone antibiotic therapy within the past forty-eight hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy within the past forty-eight hours.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy within the past forty-eight hours."} ;; "antibiotic therapy within the last forty-eight hours"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_antibiotic_therapy_inthepast48hours)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken antibiotic therapy within the last forty-eight hours."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_bulging_fontanelle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bulging fontanelle.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bulging fontanelle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bulging fontanelle.","meaning":"Boolean indicating whether the patient currently has a bulging fontanelle."} ;; "bulging fontanel"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_bulging_fontanelle_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a bulging fontanel."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congenital heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congenital heart disease."} ;; "congenital heart disease"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_congenital_heart_disease_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_surgical_condition_requiring_hospitalization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any surgical condition that requires hospitalization.","when_to_set_to_false":"Set to false if the patient currently does not have any surgical condition that requires hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any surgical condition that requires hospitalization.","meaning":"Boolean indicating whether the patient currently has any surgical condition that requires hospitalization."} ;; "The patient is excluded if the patient has any surgical condition requiring hospitalization."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_surgical_condition_requiring_hospitalization_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any surgical condition requiring hospitalization."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_out_of_catchment_area_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently located outside of the catchment area.","when_to_set_to_false":"Set to false if the patient is currently located within the catchment area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently located outside of the catchment area.","meaning":"Boolean indicating whether the patient is currently located outside of the catchment area."} ;; "The patient is excluded if the patient is out of the catchment area."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_out_of_catchment_area_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is out of the catchment area."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_decreased_level_of_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a reduced level of consciousness.","when_to_set_to_false":"Set to false if the patient currently does not have a reduced level of consciousness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a reduced level of consciousness.","meaning":"Boolean indicating whether the patient currently has a reduced level of consciousness."} ;; "reduced conscious level"
(declare-const patient_has_finding_of_hypoxia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoxia.","when_to_set_to_false":"Set to false if the patient currently does not have hypoxia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoxia.","meaning":"Boolean indicating whether the patient currently has hypoxia."} ;; "hypoxia"
(declare-const patient_has_finding_of_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has seizures.","when_to_set_to_false":"Set to false if the patient currently does not have seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has seizures.","meaning":"Boolean indicating whether the patient currently has seizures."} ;; "convulsions"
(declare-const patient_has_finding_of_stridor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stridor.","when_to_set_to_false":"Set to false if the patient currently does not have stridor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stridor.","meaning":"Boolean indicating whether the patient currently has stridor."} ;; "stridor"
(declare-const patient_has_finding_of_stridor_now@@when_calm Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stridor when calm.","when_to_set_to_false":"Set to false if the patient currently has stridor but not when calm, or does not have stridor when calm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stridor when calm.","meaning":"Boolean indicating whether the patient currently has stridor when calm."} ;; "stridor when calm"
(declare-const patient_has_finding_of_unable_to_eat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to feed.","when_to_set_to_false":"Set to false if the patient currently does not have inability to feed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to feed.","meaning":"Boolean indicating whether the patient currently has inability to feed."} ;; "inability to feed"
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} ;; "vomiting"
(declare-const patient_has_finding_of_vomiting_now@@persistent_after_3_attempts_to_feed_within_half_hour Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomiting that is persistent after at least 3 attempts to feed within one half hour.","when_to_set_to_false":"Set to false if the patient currently has vomiting but it is not persistent after at least 3 attempts to feed within one half hour, or does not have vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomiting persistent after at least 3 attempts to feed within one half hour.","meaning":"Boolean indicating whether the patient currently has vomiting persistent after at least 3 attempts to feed within one half hour."} ;; "persistent vomiting (after ≥ 3 attempts to feed the patient within one half hour)"

;; General danger sign umbrella variable
(declare-const patient_has_finding_of_general_danger_sign_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any general danger sign as defined by World Health Organization.","when_to_set_to_false":"Set to false if the patient currently does not have any general danger sign as defined by World Health Organization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any general danger sign as defined by World Health Organization.","meaning":"Boolean indicating whether the patient currently has any general danger sign as defined by World Health Organization."} ;; "any general danger sign as defined by World Health Organization"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_stridor_now@@when_calm
           patient_has_finding_of_hypoxia_now
           patient_has_finding_of_unable_to_eat_now
           patient_has_finding_of_vomiting_now@@persistent_after_3_attempts_to_feed_within_half_hour
           patient_has_finding_of_seizure_now
           patient_has_finding_of_decreased_level_of_consciousness_now)
        patient_has_finding_of_general_danger_sign_now)
   :named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples ((stridor when calm) OR (hypoxia (oxygen saturation < 90 percent in air)) OR (inability to feed) OR (persistent vomiting (after ≥ 3 attempts to feed the patient within one half hour)) OR (convulsions) OR (reduced conscious level))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_stridor_now@@when_calm
       patient_has_finding_of_stridor_now)
   :named REQ10_AUXILIARY1)) ;; "stridor when calm" implies "stridor"

(assert
(! (=> patient_has_finding_of_vomiting_now@@persistent_after_3_attempts_to_feed_within_half_hour
       patient_has_finding_of_vomiting_now)
   :named REQ10_AUXILIARY2)) ;; "persistent vomiting (after ≥ 3 attempts to feed the patient within one half hour)" implies "vomiting"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_general_danger_sign_now)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any general danger sign as defined by World Health Organization with non-exhaustive examples..."
