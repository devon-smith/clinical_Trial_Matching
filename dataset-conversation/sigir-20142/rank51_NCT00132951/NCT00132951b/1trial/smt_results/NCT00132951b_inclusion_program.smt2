;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "male or female adult"
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired pneumonia."}  ;; "community-acquired pneumonia"
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient (i.e., is an inpatient or other status).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an outpatient.","meaning":"Boolean indicating whether the patient is currently an outpatient."}  ;; "outpatient"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "male"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be a male or female adult outpatient subject diagnosed with community-acquired pneumonia.
(assert
  (! (and (or patient_sex_is_male_now patient_sex_is_female_now) ;; "male or female"
          (>= patient_age_value_recorded_now_in_years 18)        ;; "adult"
          patient_is_outpatient_now                              ;; "outpatient"
          patient_has_diagnosis_of_community_acquired_pneumonia_now) ;; "diagnosed with community-acquired pneumonia"
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential (e.g., postmenopausal or surgically incapable of bearing children).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has childbearing potential.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "be a woman of childbearing potential"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the criteria for acceptable birth control.","when_to_set_to_false":"Set to false if the patient currently does not meet the criteria for acceptable birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the criteria for acceptable birth control.","meaning":"Boolean indicating whether the patient currently meets the criteria for acceptable birth control."} ;; "meet the criteria for acceptable birth control"
(declare-const patient_is_postmenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently postmenopausal.","when_to_set_to_false":"Set to false if the patient is currently not postmenopausal.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently postmenopausal.","meaning":"Boolean value indicating whether the patient is currently postmenopausal."} ;; "be a postmenopausal female patient"
(declare-const patient_is_postmenopausal_now@@for_greater_than_or_equal_to_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently postmenopausal and has been postmenopausal for greater than or equal to 1 year.","when_to_set_to_false":"Set to false if the patient is currently postmenopausal but has not been postmenopausal for greater than or equal to 1 year.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has been postmenopausal for greater than or equal to 1 year.","meaning":"Boolean value indicating whether the patient is currently postmenopausal and has been postmenopausal for greater than or equal to 1 year."} ;; "be a postmenopausal female patient for ≥ 1 year"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a serum pregnancy test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a serum pregnancy test.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "have a negative serum pregnancy test immediately prior to study entry"
(declare-const patient_is_surgically_incapable_of_bearing_children_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically incapable of bearing children.","when_to_set_to_false":"Set to false if the patient is currently not surgically incapable of bearing children.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently surgically incapable of bearing children.","meaning":"Boolean value indicating whether the patient is currently surgically incapable of bearing children."} ;; "be a surgically incapable of bearing children female patient"
(declare-const patient_menstruation_value_recorded_inthehistory_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's last menstrual flow if this information is available in the patient's history.","when_to_set_to_null":"Set to null if the timing of the patient's last menstrual flow is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days since the patient's last menstrual flow, as recorded in the patient's history."} ;; "have a normal menstrual flow ≤ 1 month before study entry"
(declare-const serum_pregnancy_test_result_value_recorded_immediately_prior_to_study_entry_withunit_binary Real) ;; {"when_to_set_to_value":"Set to 0 if the serum pregnancy test performed immediately prior to study entry is negative; set to 1 if positive.","when_to_set_to_null":"Set to null if the result of the serum pregnancy test performed immediately prior to study entry is unknown or cannot be determined.","meaning":"Binary value indicating the result of the serum pregnancy test performed immediately prior to study entry (0 = negative, 1 = positive)."} ;; "have a negative serum pregnancy test immediately prior to study entry"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_postmenopausal_now@@for_greater_than_or_equal_to_1_year
         patient_is_postmenopausal_now)
     :named REQ1_AUXILIARY0)) ;; "be a postmenopausal female patient for ≥ 1 year"

;; Definition: negative serum pregnancy test means not pregnant
(assert
  (! (= patient_is_pregnant_now
        (= serum_pregnancy_test_result_value_recorded_immediately_prior_to_study_entry_withunit_binary 1.0))
     :named REQ1_AUXILIARY1)) ;; "have a negative serum pregnancy test immediately prior to study entry"

;; ===================== Constraint Assertions (REQ 1) =====================
;; If the patient is female, must satisfy one of the three branches:
;; (1) postmenopausal for ≥ 1 year
;; (2) surgically incapable of bearing children
;; (3) woman of childbearing potential AND normal menstrual flow ≤ 1 month before study entry AND negative serum pregnancy test AND meets criteria for acceptable birth control

(assert
  (! (or
        patient_is_postmenopausal_now@@for_greater_than_or_equal_to_1_year
        patient_is_surgically_incapable_of_bearing_children_now
        (and
          patient_has_childbearing_potential_now
          (<= patient_menstruation_value_recorded_inthehistory_withunit_days 30.0) ;; ≤ 1 month (30 days)
          (not patient_is_pregnant_now)
          patient_has_finding_of_contraception_now
        )
     )
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, if the patient is a female patient, the patient must ((be a postmenopausal female patient for ≥ 1 year) OR (be a surgically incapable of bearing children female patient) OR ((be a woman of childbearing potential) AND (have a normal menstrual flow ≤ 1 month before study entry) AND (have a negative serum pregnancy test immediately prior to study entry) AND (meet the criteria for acceptable birth control)))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_written_informed_consent_upon_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent at the time of enrollment.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent at the time of enrollment.","meaning":"Boolean indicating whether the patient has provided written informed consent at the time of enrollment."} ;; "the patient must have provided written informed consent upon enrollment."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_provided_written_informed_consent_upon_enrollment
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have provided written informed consent upon enrollment."

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "To be included, the patient must have a diagnosis of community-acquired pneumonia (as defined below)."
(assert
  (! patient_has_diagnosis_of_community_acquired_pneumonia_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 4) =====================
;; patient_age_value_recorded_now_in_years is already declared:
;; (declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "To be included, the patient must be greater than or equal to 18 years of age."

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must be greater than or equal to 18 years of age.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be greater than or equal to 18 years of age."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_bacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of bacterial pneumonia."} ;; "clinical diagnosis of bacterial pneumonia"
(declare-const patient_has_finding_of_infiltrate_on_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infiltrate on chest x-ray.","when_to_set_to_false":"Set to false if the patient currently does not have an infiltrate on chest x-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infiltrate on chest x-ray.","meaning":"Boolean indicating whether the patient currently has an infiltrate on chest x-ray now."} ;; "presence of presumably new infiltrate[s]"
(declare-const patient_has_finding_of_infiltrate_on_chest_x_ray_now@@presumably_new Bool) ;; {"when_to_set_to_true":"Set to true if the infiltrate on chest x-ray is presumably new.","when_to_set_to_false":"Set to false if the infiltrate on chest x-ray is not presumably new.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infiltrate on chest x-ray is presumably new.","meaning":"Boolean indicating whether the infiltrate on chest x-ray is presumably new."} ;; "presence of presumably new infiltrate[s]"
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a chest x-ray now.","when_to_set_to_false":"Set to false if the patient has not undergone a chest x-ray now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a chest x-ray now.","meaning":"Boolean indicating whether the patient has undergone a chest x-ray now."} ;; "chest x-ray findings"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for presumably new infiltrate implies infiltrate on chest x-ray
(assert
  (! (=> patient_has_finding_of_infiltrate_on_chest_x_ray_now@@presumably_new
         patient_has_finding_of_infiltrate_on_chest_x_ray_now)
     :named REQ5_AUXILIARY0)) ;; "presence of presumably new infiltrate[s]"

;; Non-exhaustive example: presence of presumably new infiltrate(s) is an example of chest x-ray findings that support a clinical diagnosis of bacterial pneumonia
(assert
  (! (=> patient_has_finding_of_infiltrate_on_chest_x_ray_now@@presumably_new
         patient_has_undergone_plain_chest_x_ray_now)
     :named REQ5_AUXILIARY1)) ;; "chest x-ray findings that support a clinical diagnosis of bacterial pneumonia (e.g., presence of presumably new infiltrate[s])"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have chest x-ray findings that support a clinical diagnosis of bacterial pneumonia
(assert
  (! (and patient_has_undergone_plain_chest_x_ray_now
          patient_has_diagnosis_of_bacterial_pneumonia_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have chest x-ray findings that support a clinical diagnosis of bacterial pneumonia (with non-exhaustive examples (presence of presumably new infiltrate[s]))"

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now@@due_to_bacterial_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of community-acquired pneumonia is due to bacterial infection.","when_to_set_to_false":"Set to false if the patient's current diagnosis of community-acquired pneumonia is not due to bacterial infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is due to bacterial infection.","meaning":"Boolean indicating whether the patient's current diagnosis of community-acquired pneumonia is due to bacterial infection."} ;; "clinical diagnosis of community-acquired pneumonia due to bacterial infection"
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now@@mild_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of community-acquired pneumonia is of mild severity.","when_to_set_to_false":"Set to false if the patient's current diagnosis of community-acquired pneumonia is not of mild severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is of mild severity.","meaning":"Boolean indicating whether the patient's current diagnosis of community-acquired pneumonia is of mild severity."} ;; "clinical diagnosis of mild community-acquired pneumonia"
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now@@moderate_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of community-acquired pneumonia is of moderate severity.","when_to_set_to_false":"Set to false if the patient's current diagnosis of community-acquired pneumonia is not of moderate severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is of moderate severity.","meaning":"Boolean indicating whether the patient's current diagnosis of community-acquired pneumonia is of moderate severity."} ;; "clinical diagnosis of moderate community-acquired pneumonia"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_oral_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's current oral temperature in degrees Celsius if measured and available.","when_to_set_to_null":"Set to null if the patient's current oral temperature is not measured, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current oral temperature in degrees Celsius."} ;; "oral temperature > 38°C"
(declare-const patient_tympanic_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's current tympanic temperature in degrees Celsius if measured and available.","when_to_set_to_null":"Set to null if the patient's current tympanic temperature is not measured, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current tympanic temperature in degrees Celsius."} ;; "tympanic temperature > 38.5°C"
(declare-const patient_rectal_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's current rectal temperature in degrees Celsius if measured and available.","when_to_set_to_null":"Set to null if the patient's current rectal temperature is not measured, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current rectal temperature in degrees Celsius."} ;; "rectal temperature > 39°C"
(declare-const patient_has_finding_of_chill_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chills.","when_to_set_to_false":"Set to false if the patient currently does not have chills.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chills.","meaning":"Boolean indicating whether the patient currently has chills."} ;; "chills"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@pleuritic_nature Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain is pleuritic in nature.","when_to_set_to_false":"Set to false if the patient's current chest pain is not pleuritic in nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest pain is pleuritic in nature.","meaning":"Boolean indicating whether the patient's current chest pain is pleuritic in nature."} ;; "pleuritic chest pain"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"
(declare-const patient_has_finding_of_purulent_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has purulent sputum.","when_to_set_to_false":"Set to false if the patient currently does not have purulent sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has purulent sputum.","meaning":"Boolean indicating whether the patient currently has purulent sputum."} ;; "purulent sputum"
(declare-const patient_has_finding_of_purulent_sputum_now@@spontaneous_production Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current purulent sputum is produced spontaneously.","when_to_set_to_false":"Set to false if the patient's current purulent sputum is not produced spontaneously.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the purulent sputum is produced spontaneously.","meaning":"Boolean indicating whether the patient's current purulent sputum is produced spontaneously."} ;; "spontaneous production of purulent sputum"
(declare-const patient_has_finding_of_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sputum.","when_to_set_to_false":"Set to false if the patient currently does not have sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sputum.","meaning":"Boolean indicating whether the patient currently has sputum."} ;; "sputum"
(declare-const patient_has_finding_of_sputum_now@@change_in_character Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sputum has a change in character.","when_to_set_to_false":"Set to false if the patient's current sputum does not have a change in character.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sputum has a change in character.","meaning":"Boolean indicating whether the patient's current sputum has a change in character."} ;; "change in sputum character"
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory crackles (rales).","when_to_set_to_false":"Set to false if the patient currently does not have respiratory crackles (rales).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory crackles (rales).","meaning":"Boolean indicating whether the patient currently has respiratory crackles (rales)."} ;; "rales"
(declare-const patient_has_finding_of_lung_consolidation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary consolidation.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary consolidation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary consolidation.","meaning":"Boolean indicating whether the patient currently has pulmonary consolidation."} ;; "pulmonary consolidation"
(declare-const patient_has_finding_of_chest_dull_to_percussion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dullness on percussion.","when_to_set_to_false":"Set to false if the patient currently does not have dullness on percussion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dullness on percussion.","meaning":"Boolean indicating whether the patient currently has dullness on percussion."} ;; "dullness on percussion"
(declare-const patient_has_finding_of_bronchial_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchial breath sounds.","when_to_set_to_false":"Set to false if the patient currently does not have bronchial breath sounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchial breath sounds.","meaning":"Boolean indicating whether the patient currently has bronchial breath sounds."} ;; "bronchial breath sounds"
(declare-const patient_has_finding_of_egophony_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has egophony.","when_to_set_to_false":"Set to false if the patient currently does not have egophony.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has egophony.","meaning":"Boolean indicating whether the patient currently has egophony."} ;; "egophony"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."} ;; "dyspnea"
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not have tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea.","meaning":"Boolean indicating whether the patient currently has tachypnea."} ;; "tachypnea"
(declare-const patient_has_finding_of_tachypnea_now@@progressive_nature Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current tachypnea is progressive in nature.","when_to_set_to_false":"Set to false if the patient's current tachypnea is not progressive in nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tachypnea is progressive in nature.","meaning":"Boolean indicating whether the patient's current tachypnea is progressive in nature."} ;; "tachypnea (particularly if progressive in nature)"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_diagnosis_of_community_acquired_pneumonia_now@@due_to_bacterial_infection
         patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ6_AUXILIARY0)) ;; "diagnosis of community-acquired pneumonia due to bacterial infection"

(assert
  (! (=> patient_has_diagnosis_of_community_acquired_pneumonia_now@@mild_severity
         patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ6_AUXILIARY1)) ;; "diagnosis of mild community-acquired pneumonia"

(assert
  (! (=> patient_has_diagnosis_of_community_acquired_pneumonia_now@@moderate_severity
         patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ6_AUXILIARY2)) ;; "diagnosis of moderate community-acquired pneumonia"

(assert
  (! (=> patient_has_finding_of_chest_pain_now@@pleuritic_nature
         patient_has_finding_of_chest_pain_now)
     :named REQ6_AUXILIARY3)) ;; "pleuritic chest pain"

(assert
  (! (=> patient_has_finding_of_purulent_sputum_now@@spontaneous_production
         patient_has_finding_of_purulent_sputum_now)
     :named REQ6_AUXILIARY4)) ;; "spontaneous production of purulent sputum"

(assert
  (! (=> patient_has_finding_of_sputum_now@@change_in_character
         patient_has_finding_of_sputum_now)
     :named REQ6_AUXILIARY5)) ;; "change in sputum character"

(assert
  (! (=> patient_has_finding_of_tachypnea_now@@progressive_nature
         patient_has_finding_of_tachypnea_now)
     :named REQ6_AUXILIARY6)) ;; "tachypnea (particularly if progressive in nature)"

;; Non-exhaustive examples for auscultatory findings: rales OR evidence of pulmonary consolidation
(assert
  (! (=> (or patient_has_finding_of_respiratory_crackles_now
            patient_has_finding_of_lung_consolidation_now)
         ;; umbrella: auscultatory findings
         ;; We do not have a direct umbrella variable, so this implication is for documentation
         true)
     :named REQ6_AUXILIARY7)) ;; "auscultatory findings (such as rales or evidence of pulmonary consolidation)"

;; Non-exhaustive examples for pulmonary consolidation: dullness on percussion, bronchial breath sounds, egophony
(assert
  (! (=> (or patient_has_finding_of_chest_dull_to_percussion_now
            patient_has_finding_of_bronchial_breathing_now
            patient_has_finding_of_egophony_now)
         patient_has_finding_of_lung_consolidation_now)
     :named REQ6_AUXILIARY8)) ;; "evidence of pulmonary consolidation (i.e., dullness on percussion, bronchial breath sounds, egophony)"

;; Fever definition: oral temp > 38°C OR tympanic temp > 38.5°C OR rectal temp > 39°C
(assert
  (! (= patient_has_finding_of_fever_now
        (or (> patient_oral_temperature_value_recorded_now_withunit_celsius 38.0)
            (> patient_tympanic_temperature_value_recorded_now_withunit_celsius 38.5)
            (> patient_rectal_temperature_value_recorded_now_withunit_celsius 39.0)))
     :named REQ6_AUXILIARY9)) ;; "fever (oral temperature > 38°C OR tympanic temperature > 38.5°C OR rectal temperature > 39°C)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: ((mild AND due to bacteria) OR (moderate AND due to bacteria))
(assert
  (! (or (and patient_has_diagnosis_of_community_acquired_pneumonia_now@@mild_severity
              patient_has_diagnosis_of_community_acquired_pneumonia_now@@due_to_bacterial_infection)
         (and patient_has_diagnosis_of_community_acquired_pneumonia_now@@moderate_severity
              patient_has_diagnosis_of_community_acquired_pneumonia_now@@due_to_bacterial_infection))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((have a clinical diagnosis of mild community-acquired pneumonia due to bacterial infection) OR (have a clinical diagnosis of moderate community-acquired pneumonia due to bacterial infection))"

;; Component 1: at least one of the following signs/symptoms
(assert
  (! (or patient_has_finding_of_fever_now
         patient_has_finding_of_chill_now
         patient_has_finding_of_chest_pain_now@@pleuritic_nature
         patient_has_finding_of_cough_now
         patient_has_finding_of_purulent_sputum_now@@spontaneous_production
         patient_has_finding_of_sputum_now@@change_in_character
         patient_has_finding_of_respiratory_crackles_now
         patient_has_finding_of_lung_consolidation_now
         patient_has_finding_of_dyspnea_now
         patient_has_finding_of_tachypnea_now@@progressive_nature)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at least one of the following signs and symptoms of community-acquired pneumonia: (fever ... OR chills OR pleuritic chest pain OR cough OR spontaneous production of purulent sputum OR change in sputum character OR auscultatory findings (with non-exhaustive examples (rales OR evidence of pulmonary consolidation (with non-exhaustive examples (dullness on percussion OR bronchial breath sounds OR egophony))) OR dyspnea OR tachypnea (particularly if progressive in nature)))"
