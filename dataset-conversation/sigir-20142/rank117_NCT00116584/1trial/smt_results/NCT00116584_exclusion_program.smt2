;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_gender String) ;; {"when_to_set_to_value":"Set to the value corresponding to the patient's self-identified gender (e.g., male, female, nonbinary, other, or unknown).","when_to_set_to_null":"Set to null if the patient's gender is unknown, not documented, or cannot be determined.","meaning":"Categorical variable representing the patient's self-identified gender."} ;; "gender"
(declare-const patient_race String) ;; {"when_to_set_to_value":"Set to the value corresponding to the patient's self-identified race (e.g., White, Black or African American, Asian, Native American, Pacific Islander, Other, or Unknown).","when_to_set_to_null":"Set to null if the patient's race is unknown, not documented, or cannot be determined.","meaning":"Categorical variable representing the patient's self-identified race."} ;; "race"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (i.e., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "gender"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (i.e., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "gender"

;; ===================== Constraint Assertions (REQ 0) =====================
;; No exclusion based on race or gender: always satisfied, so encode as tautology
(assert
(! (not false)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is not excluded based on race or gender."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "under the age of 2 months or greater than 12 months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_months 2))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is under the age of 2 months."

(assert
(! (not (> patient_age_value_recorded_now_in_months 12))
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is greater than 12 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cyanotic_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cyanotic heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have cyanotic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cyanotic heart disease.","meaning":"Boolean indicating whether the patient currently has cyanotic heart disease."} ;; "A patient is excluded if the patient has cyanotic heart disease."
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_cyanotic_heart_disease_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has cyanotic heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_lobar_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of lobar pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of lobar pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of lobar pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of lobar pneumonia."} ;; "lobar pneumonia"
(declare-const patient_has_diagnosis_of_lobar_pneumonia_now@@defined_by_chest_radiograph_results Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of lobar pneumonia is defined by results of chest radiographs.","when_to_set_to_false":"Set to false if the patient's diagnosis of lobar pneumonia is not defined by results of chest radiographs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of lobar pneumonia is defined by results of chest radiographs.","meaning":"Boolean indicating whether the patient's diagnosis of lobar pneumonia is defined by results of chest radiographs."} ;; "as defined by results of chest radiographs"
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest x-ray now.","when_to_set_to_false":"Set to false if the patient has not undergone a plain chest x-ray now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest x-ray now.","meaning":"Boolean indicating whether the patient has undergone a plain chest x-ray now."} ;; "chest radiographs"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_lobar_pneumonia_now@@defined_by_chest_radiograph_results
      patient_has_diagnosis_of_lobar_pneumonia_now)
   :named REQ3_AUXILIARY0)) ;; "as defined by results of chest radiographs"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_lobar_pneumonia_now@@defined_by_chest_radiograph_results)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has lobar pneumonia, as defined by results of chest radiographs."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease."} ;; "interstitial lung disease"
(declare-const patient_has_finding_of_atelectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atelectasis.","when_to_set_to_false":"Set to false if the patient currently does not have atelectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atelectasis.","meaning":"Boolean indicating whether the patient currently has atelectasis."} ;; "atelectasis"
(declare-const patient_has_finding_of_atelectasis_now@@identified_on_chest_radiographs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's atelectasis is identified on chest radiographs.","when_to_set_to_false":"Set to false if the patient's atelectasis is not identified on chest radiographs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's atelectasis is identified on chest radiographs.","meaning":"Boolean indicating whether the patient's atelectasis is identified on chest radiographs."} ;; "diffuse patchy marking consistent with atelectasis on chest radiographs"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_atelectasis_now@@identified_on_chest_radiographs
      patient_has_finding_of_atelectasis_now)
:named REQ4_AUXILIARY0)) ;; "diffuse patchy marking consistent with atelectasis on chest radiographs" implies "atelectasis"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient is NOT excluded if they have interstitial lung disease OR diffuse patchy marking consistent with atelectasis on chest radiographs.
;; Therefore, exclusion only applies if NEITHER condition is present.
(assert
(! (not (or patient_has_finding_of_interstitial_lung_disease_now
            patient_has_finding_of_atelectasis_now@@identified_on_chest_radiographs))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is not excluded if the patient has interstitial lung disease or has diffuse patchy marking consistent with atelectasis on chest radiographs."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_croup_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of croup.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of croup.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of croup.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of croup."} ;; "croup"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_croup_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has croup."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_pulmonary_aspiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary aspiration (foreign body aspiration).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary aspiration (foreign body aspiration).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary aspiration (foreign body aspiration).","meaning":"Boolean indicating whether the patient currently has pulmonary aspiration (foreign body aspiration)."} ;; "foreign body aspiration"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_pulmonary_aspiration_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has foreign body aspiration."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cystic fibrosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cystic fibrosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cystic fibrosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cystic fibrosis in their medical history."} ;; "has a history of cystic fibrosis"
(declare-const patient_has_diagnosis_of_bronchopulmonary_dysplasia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bronchopulmonary dysplasia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bronchopulmonary dysplasia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bronchopulmonary dysplasia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of bronchopulmonary dysplasia in their medical history."} ;; "has a history of bronchopulmonary dysplasia"
(declare-const patient_has_diagnosis_of_chronic_lung_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with chronic lung disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with chronic lung disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with chronic lung disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of chronic lung disease in their medical history."} ;; "has a history of other chronic lung disease"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_cystic_fibrosis_inthehistory)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cystic fibrosis."

(assert
(! (not patient_has_diagnosis_of_bronchopulmonary_dysplasia_inthehistory)
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of bronchopulmonary dysplasia."

(assert
(! (not patient_has_diagnosis_of_chronic_lung_disease_inthehistory)
    :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of other chronic lung disease."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney (renal) disease.","when_to_set_to_false":"Set to false if the patient currently does not have kidney (renal) disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney (renal) disease.","meaning":"Boolean indicating whether the patient currently has kidney (renal) disease."} ;; "renal disease"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver disease."

(assert
(! (not patient_has_finding_of_kidney_disease_now)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal disease."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sickle cell anemia (hemoglobin SS disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sickle cell anemia (hemoglobin SS disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sickle cell anemia (hemoglobin SS disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of sickle cell anemia (hemoglobin SS disease)."} ;; "sickle cell anemia"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has sickle cell anemia."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing artificial respiration (mechanical ventilation) at the present time.","when_to_set_to_false":"Set to false if the patient is not currently undergoing artificial respiration (mechanical ventilation) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing artificial respiration (mechanical ventilation) at the present time.","meaning":"Boolean indicating whether the patient is currently undergoing artificial respiration (mechanical ventilation) now."} ;; "mechanical ventilation"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_undergoing_artificial_respiration_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires mechanical ventilation."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_supraventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has supraventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have supraventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has supraventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has supraventricular tachycardia."} ;; "supraventricular tachycardia"
(declare-const patient_has_finding_of_supraventricular_tachycardia_now@@caused_by_racemic_epinephrine_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's supraventricular tachycardia is caused by racemic epinephrine administration.","when_to_set_to_false":"Set to false if the patient's supraventricular tachycardia is not caused by racemic epinephrine administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether racemic epinephrine administration caused the patient's supraventricular tachycardia.","meaning":"Boolean indicating whether the patient's supraventricular tachycardia is caused by racemic epinephrine administration."} ;; "secondary to racemic epinephrine administration"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_supraventricular_tachycardia_now@@caused_by_racemic_epinephrine_administration
      patient_has_finding_of_supraventricular_tachycardia_now)
:named REQ11_AUXILIARY0)) ;; "supraventricular tachycardia secondary to racemic epinephrine administration"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_supraventricular_tachycardia_now@@caused_by_racemic_epinephrine_administration)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient develops supraventricular tachycardia secondary to racemic epinephrine administration."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_tracheomalacia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of tracheomalacia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of tracheomalacia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of tracheomalacia.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of tracheomalacia."} ;; "tracheomalacia"
(declare-const patient_has_finding_of_bronchomalacia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of bronchomalacia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of bronchomalacia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of bronchomalacia.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of bronchomalacia."} ;; "bronchomalacia"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_tracheomalacia_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tracheomalacia."

(assert
(! (not patient_has_finding_of_bronchomalacia_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchomalacia."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_exposed_to_bronchodilator_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to bronchodilator at any time in the past, regardless of timing relative to study initiation.","when_to_set_to_false":"Set to false if the patient has never been exposed to bronchodilator in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to bronchodilator.","meaning":"Boolean indicating whether the patient has ever been exposed to bronchodilator in the past."} ;; "bronchodilator"

(declare-const patient_is_exposed_to_bronchodilator_inthehistory@@temporalcontext_within2hours_before_study_initiation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to bronchodilator occurred within 2 hours before initiation of the study.","when_to_set_to_false":"Set to false if the patient's exposure to bronchodilator did not occur within 2 hours before initiation of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to bronchodilator occurred within 2 hours before study initiation.","meaning":"Boolean indicating whether the patient's bronchodilator exposure occurred within 2 hours before study initiation."} ;; "within 2 hours of initiation of the study"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_is_exposed_to_bronchodilator_inthehistory@@temporalcontext_within2hours_before_study_initiation
      patient_is_exposed_to_bronchodilator_inthehistory)
:named REQ13_AUXILIARY0)) ;; "within 2 hours of initiation of the study" implies "bronchodilator"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_exposed_to_bronchodilator_inthehistory@@temporalcontext_within2hours_before_study_initiation)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received bronchodilator therapy within 2 hours of initiation of the study."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast72hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any corticosteroid or corticosteroid derivative containing product within the past 72 hours prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not taken any corticosteroid or corticosteroid derivative containing product within the past 72 hours prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any corticosteroid or corticosteroid derivative containing product within the past 72 hours prior to enrollment.","meaning":"Boolean indicating whether the patient has taken any corticosteroid or corticosteroid derivative containing product within the past 72 hours."} ;; "has received systemic corticosteroid therapy within 72 hours of enrollment"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast72hours)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received systemic corticosteroid therapy within 72 hours of enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_persistent_airway_hyperreactivity_within_3_months_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has suffered from persistent airway hyperreactivity at any time within the 3 months before the study.","when_to_set_to_false":"Set to false if the patient has not suffered from persistent airway hyperreactivity within the 3 months before the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has suffered from persistent airway hyperreactivity within the 3 months before the study.","meaning":"Boolean indicating whether the patient has suffered from persistent airway hyperreactivity within the 3 months before the study."} ;; "has suffered from persistent airway hyperreactivity within the 3 months before the study."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not patient_has_finding_of_persistent_airway_hyperreactivity_within_3_months_before_study)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suffered from persistent airway hyperreactivity within the 3 months before the study."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_tolerates_nasal_cannulae_for_45min_or_more_in_60min Bool) ;; {"when_to_set_to_true":"Set to true if the patient tolerates the nasal cannulae for 45 minutes or more out of a 60-minute period.","when_to_set_to_false":"Set to false if the patient tolerates the nasal cannulae for less than 45 minutes out of a 60-minute period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient tolerates the nasal cannulae for at least 45 minutes out of a 60-minute period.","meaning":"Boolean indicating whether the patient tolerates the nasal cannulae for at least 45 minutes out of a 60-minute period."} ;; "tolerate the nasal cannulae for 45 out of 60 minutes"
(declare-const patient_tolerates_nasal_cannulae_for_minutes_value_recorded_in_60min_withunit_min Real) ;; {"when_to_set_to_value":"Set to the number of minutes (0-60) that the patient tolerates the nasal cannulae during a 60-minute observation period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many minutes the patient tolerates the nasal cannulae in a 60-minute period.","meaning":"Numeric value representing the number of minutes the patient tolerates the nasal cannulae out of a 60-minute period, in minutes."} ;; "number of minutes, out of a 60-minute period, that the patient tolerates the nasal cannulae"

;; ===================== Auxiliary Assertions (REQ 16) =====================
(assert
(! (= patient_tolerates_nasal_cannulae_for_45min_or_more_in_60min
    (>= patient_tolerates_nasal_cannulae_for_minutes_value_recorded_in_60min_withunit_min 45))
:named REQ16_AUXILIARY0)) ;; "patient tolerates the nasal cannulae for 45 out of 60 minutes"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_tolerates_nasal_cannulae_for_45min_or_more_in_60min)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT tolerate the nasal cannulae for 45 out of 60 minutes."
