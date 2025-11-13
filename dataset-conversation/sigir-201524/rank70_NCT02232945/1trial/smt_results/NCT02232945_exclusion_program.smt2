;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than 18 years old OR the patient is older than 65 years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than 18 years old."

(assert
(! (not (> patient_age_value_recorded_now_in_years 65))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is older than 65 years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bronchitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bronchitis.","meaning":"Boolean indicating whether the patient currently has bronchitis."} ;; "bronchitis"
(declare-const patient_has_finding_of_bronchitis_now@@confirmed_by_chest_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bronchitis is confirmed by chest imaging (chest X-ray OR chest computed tomography).","when_to_set_to_false":"Set to false if the patient's bronchitis is not confirmed by chest imaging (chest X-ray OR chest computed tomography).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bronchitis is confirmed by chest imaging.","meaning":"Boolean indicating whether the patient's bronchitis is confirmed by chest imaging (chest X-ray OR chest computed tomography)."} ;; "bronchitis confirmed by chest imaging (chest X-ray OR chest computed tomography)"

(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@confirmed_by_chest_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia is confirmed by chest imaging (chest X-ray OR chest computed tomography).","when_to_set_to_false":"Set to false if the patient's pneumonia is not confirmed by chest imaging (chest X-ray OR chest computed tomography).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pneumonia is confirmed by chest imaging.","meaning":"Boolean indicating whether the patient's pneumonia is confirmed by chest imaging (chest X-ray OR chest computed tomography)."} ;; "pneumonia confirmed by chest imaging (chest X-ray OR chest computed tomography)"

(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pleural effusion.","meaning":"Boolean indicating whether the patient currently has pleural effusion."} ;; "pleural effusion"
(declare-const patient_has_finding_of_pleural_effusion_now@@confirmed_by_chest_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pleural effusion is confirmed by chest imaging (chest X-ray OR chest computed tomography).","when_to_set_to_false":"Set to false if the patient's pleural effusion is not confirmed by chest imaging (chest X-ray OR chest computed tomography).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pleural effusion is confirmed by chest imaging.","meaning":"Boolean indicating whether the patient's pleural effusion is confirmed by chest imaging (chest X-ray OR chest computed tomography)."} ;; "pleural effusion confirmed by chest imaging (chest X-ray OR chest computed tomography)"

(declare-const patient_has_finding_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease."} ;; "interstitial lung disease"
(declare-const patient_has_finding_of_interstitial_lung_disease_now@@confirmed_by_chest_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's interstitial lung disease is confirmed by chest imaging (chest X-ray OR chest computed tomography).","when_to_set_to_false":"Set to false if the patient's interstitial lung disease is not confirmed by chest imaging (chest X-ray OR chest computed tomography).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's interstitial lung disease is confirmed by chest imaging.","meaning":"Boolean indicating whether the patient's interstitial lung disease is confirmed by chest imaging (chest X-ray OR chest computed tomography)."} ;; "interstitial lung disease confirmed by chest imaging (chest X-ray OR chest computed tomography)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bronchitis_now@@confirmed_by_chest_imaging
      patient_has_finding_of_bronchitis_now)
   :named REQ1_AUXILIARY0)) ;; "bronchitis confirmed by chest imaging (chest X-ray OR chest computed tomography)"

(assert
(! (=> patient_has_finding_of_pneumonia_now@@confirmed_by_chest_imaging
      patient_has_finding_of_pneumonia_now)
   :named REQ1_AUXILIARY1)) ;; "pneumonia confirmed by chest imaging (chest X-ray OR chest computed tomography)"

(assert
(! (=> patient_has_finding_of_pleural_effusion_now@@confirmed_by_chest_imaging
      patient_has_finding_of_pleural_effusion_now)
   :named REQ1_AUXILIARY2)) ;; "pleural effusion confirmed by chest imaging (chest X-ray OR chest computed tomography)"

(assert
(! (=> patient_has_finding_of_interstitial_lung_disease_now@@confirmed_by_chest_imaging
      patient_has_finding_of_interstitial_lung_disease_now)
   :named REQ1_AUXILIARY3)) ;; "interstitial lung disease confirmed by chest imaging (chest X-ray OR chest computed tomography)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_bronchitis_now@@confirmed_by_chest_imaging)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is confirmed by chest imaging (chest X-ray OR chest computed tomography) to have bronchitis."

(assert
(! (not patient_has_finding_of_pneumonia_now@@confirmed_by_chest_imaging)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is confirmed by chest imaging (chest X-ray OR chest computed tomography) to have pneumonia."

(assert
(! (not patient_has_finding_of_pleural_effusion_now@@confirmed_by_chest_imaging)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is confirmed by chest imaging (chest X-ray OR chest computed tomography) to have pleural effusion."

(assert
(! (not patient_has_finding_of_interstitial_lung_disease_now@@confirmed_by_chest_imaging)
   :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is confirmed by chest imaging (chest X-ray OR chest computed tomography) to have interstitial lung disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_hematology_screening_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hematology (blood routine) screening tests now.","when_to_set_to_false":"Set to false if the patient has not undergone hematology (blood routine) screening tests now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hematology (blood routine) screening tests now.","meaning":"Boolean indicating whether the patient has undergone hematology (blood routine) screening tests now."} ;; "blood routine screening tests"
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_10e9_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's leukocyte count (white blood cell count) is recorded now in units of 10^9 per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's leukocyte (white blood cell) count measured now, in units of 10^9 per liter."} ;; "leukocyte count"
(declare-const patient_neutrophil_percent_differential_count_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's neutrophil percentage is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's neutrophil percentage measured now."} ;; "neutrophil percentage"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_undergone_hematology_screening_test_now
             (>= patient_white_blood_cell_count_value_recorded_now_withunit_10e9_per_liter 10.0)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's blood routine screening tests show leukocyte count ≥ 10.0 × 10^9 per liter."

(assert
(! (not (and patient_has_undergone_hematology_screening_test_now
             (>= patient_neutrophil_percent_differential_count_value_recorded_now_withunit_percent 80.0)))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's blood routine screening tests show neutrophil percentage ≥ 80%."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_suppurative_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of suppurative tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of suppurative tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suppurative tonsillitis.","meaning":"Boolean indicating whether the patient currently has suppurative tonsillitis."} ;; "the patient has suppurative tonsillitis"
(declare-const patient_coughs_purulent_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently coughs and the sputum is purulent.","when_to_set_to_false":"Set to false if the patient currently does not cough purulent sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently coughs purulent sputum.","meaning":"Boolean indicating whether the patient currently coughs purulent sputum."} ;; "the patient coughs purulent sputum"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_suppurative_tonsillitis_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suppurative tonsillitis."

(assert
  (! (not patient_coughs_purulent_sputum_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient coughs purulent sputum."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_hematological_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hematological disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hematological disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hematological disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hematological disease."} ;; "hematological disease"

(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"

(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured FEV1/FVC ratio percentage if a current measurement is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current FEV1/FVC ratio."} ;; "forced expiratory volume in one second/forced vital capacity < 70%"

(declare-const patient_forced_expired_volume_in_one_second_predicted_value_percent_recorded_now Real) ;; {"when_to_set_to_value":"Set to the measured FEV1 as a percentage of the predicted value if a current measurement is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current FEV1 as a percentage of the predicted value."} ;; "forced expiratory volume in one second/predicted value < 50%"

(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory failure.","meaning":"Boolean indicating whether the patient currently has respiratory failure."} ;; "respiratory failure"

(declare-const patient_has_finding_of_right_ventricular_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has right ventricular failure.","when_to_set_to_false":"Set to false if the patient currently does not have right ventricular failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has right ventricular failure.","meaning":"Boolean indicating whether the patient currently has right ventricular failure."} ;; "right heart failure"

(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of liver disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of liver disease."} ;; "hepatic disease"

(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_multiple_of_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured ALT value in multiples of the upper limit of normal if a current measurement is available.","when_to_set_to_null":"Set to null if no current measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase level in multiples of the upper limit of normal."} ;; "alanine aminotransferase ≥ triple upper limit of normal"

(declare-const patient_aspartate_aminotransferase_value_recorded_now_withunit_multiple_of_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured AST value in multiples of the upper limit of normal if a current measurement is available.","when_to_set_to_null":"Set to null if no current measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase level in multiples of the upper limit of normal."} ;; "aspartate aminotransferase ≥ triple upper limit of normal"

(declare-const patient_has_diagnosis_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of kidney disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of kidney disease."} ;; "renal disease"

(declare-const patient_creatinine_measurement_serum_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured serum creatinine value in mg/dL if a current measurement is available.","when_to_set_to_null":"Set to null if no current measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine level in milligrams per deciliter."} ;; "serum creatinine > 2 milligrams per deciliter"

(declare-const patient_has_diagnosis_of_chronic_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic congestive heart failure."} ;; "chronic congestive heart failure"

(declare-const patient_has_diagnosis_of_chronic_congestive_heart_failure_nyha_class_ii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic congestive heart failure classified as NYHA class II.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic congestive heart failure classified as NYHA class II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic congestive heart failure classified as NYHA class II.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic congestive heart failure classified as NYHA class II."} ;; "New York Heart Association class II"

(declare-const patient_has_diagnosis_of_chronic_congestive_heart_failure_nyha_class_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic congestive heart failure classified as NYHA class III.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic congestive heart failure classified as NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic congestive heart failure classified as NYHA class III.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic congestive heart failure classified as NYHA class III."} ;; "New York Heart Association class III"

(declare-const patient_has_diagnosis_of_chronic_congestive_heart_failure_nyha_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic congestive heart failure classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic congestive heart failure classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic congestive heart failure classified as NYHA class IV.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic congestive heart failure classified as NYHA class IV."} ;; "New York Heart Association class IV"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples for chronic obstructive pulmonary disease
(assert
(! (=> (or
        (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent 70) ;; "forced expiratory volume in one second/forced vital capacity < 70%"
        (< patient_forced_expired_volume_in_one_second_predicted_value_percent_recorded_now 50) ;; "forced expiratory volume in one second/predicted value < 50%"
        patient_has_finding_of_respiratory_failure_now ;; "respiratory failure"
        patient_has_finding_of_right_ventricular_failure_now) ;; "right heart failure"
    patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
:named REQ4_AUXILIARY0)) ;; "chronic obstructive pulmonary disease ((forced expiratory volume in one second/forced vital capacity < 70%) OR (forced expiratory volume in one second/predicted value < 50%) OR (respiratory failure) OR (right heart failure))"

;; Non-exhaustive examples for hepatic disease
(assert
(! (=> (or
        (>= patient_alanine_aminotransferase_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 3) ;; "alanine aminotransferase ≥ triple upper limit of normal"
        (>= patient_aspartate_aminotransferase_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 3)) ;; "aspartate aminotransferase ≥ triple upper limit of normal"
    patient_has_diagnosis_of_disease_of_liver_now)
:named REQ4_AUXILIARY1)) ;; "hepatic disease ((alanine aminotransferase ≥ triple upper limit of normal) OR (aspartate aminotransferase ≥ triple upper limit of normal))"

;; Non-exhaustive example for renal disease
(assert
(! (=> (> patient_creatinine_measurement_serum_value_recorded_now_withunit_milligrams_per_deciliter 2)
    patient_has_diagnosis_of_kidney_disease_now)
:named REQ4_AUXILIARY2)) ;; "renal disease (serum creatinine > 2 milligrams per deciliter)"

;; Non-exhaustive examples for chronic congestive heart failure
(assert
(! (=> (or
        patient_has_diagnosis_of_chronic_congestive_heart_failure_nyha_class_ii_now ;; "New York Heart Association class II"
        patient_has_diagnosis_of_chronic_congestive_heart_failure_nyha_class_iii_now ;; "New York Heart Association class III"
        patient_has_diagnosis_of_chronic_congestive_heart_failure_nyha_class_iv_now) ;; "New York Heart Association class IV"
    patient_has_diagnosis_of_chronic_congestive_heart_failure_now)
:named REQ4_AUXILIARY3)) ;; "chronic congestive heart failure (New York Heart Association class II OR New York Heart Association class III OR New York Heart Association class IV)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_hematological_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying primary disorders with non-exhaustive examples (hematological disease)."

(assert
(! (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying primary disorders with non-exhaustive examples (chronic obstructive pulmonary disease ((forced expiratory volume in one second/forced vital capacity < 70%) OR (forced expiratory volume in one second/predicted value < 50%) OR (respiratory failure) OR (right heart failure)))."

(assert
(! (not patient_has_diagnosis_of_disease_of_liver_now)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying primary disorders with non-exhaustive examples (hepatic disease ((alanine aminotransferase ≥ triple upper limit of normal) OR (aspartate aminotransferase ≥ triple upper limit of normal)))."

(assert
(! (not patient_has_diagnosis_of_kidney_disease_now)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying primary disorders with non-exhaustive examples (renal disease (serum creatinine > 2 milligrams per deciliter))."

(assert
(! (not patient_has_diagnosis_of_chronic_congestive_heart_failure_now)
:named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying primary disorders with non-exhaustive examples (chronic congestive heart failure (New York Heart Association class II OR New York Heart Association class III OR New York Heart Association class IV))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_allergy_to_study_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to the study medication.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to the study medication.","meaning":"Boolean indicating whether the patient currently has an allergy to the study medication."} ;; "The patient is excluded if the patient is allergic to the study medication."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_allergy_to_study_medication_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is allergic to the study medication."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "the patient is a woman"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently able to become pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently able to become pregnant.","when_to_set_to_null":"Set to null if the patient's ability to become pregnant is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently able to become pregnant."} ;; "the patient may possibly become pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_has_urine_pregnancy_test_result_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a urine pregnancy test result available.","when_to_set_to_false":"Set to false if the patient currently does not have a urine pregnancy test result available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a urine pregnancy test result available.","meaning":"Boolean indicating whether the patient currently has a urine pregnancy test result available."} ;; "urine pregnancy test result available"
(declare-const patient_has_urine_pregnancy_test_result_now@@result_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current urine pregnancy test result is positive.","when_to_set_to_false":"Set to false if the patient's current urine pregnancy test result is not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current urine pregnancy test result is positive.","meaning":"Boolean indicating whether the patient's current urine pregnancy test result is positive."} ;; "urine pregnancy test result is positive"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's body mass index (BMI) recorded at the current time, in kilograms per square meter.","when_to_set_to_null":"Set to null if the patient's body mass index (BMI) value at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's body mass index (BMI) recorded at the current time, in kilograms per square meter."} ;; "body mass index ≥ 25 kilograms per square meter"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} ;; "obesity"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Lactating woman with positive urine pregnancy test
(assert
(! (=> (and patient_sex_is_female_now
            patient_is_lactating_now
            patient_has_urine_pregnancy_test_result_now@@result_is_positive)
        (and patient_sex_is_female_now
             patient_is_lactating_now
             patient_has_urine_pregnancy_test_result_now))
:named REQ6_AUXILIARY0)) ;; "the patient is a woman who is lactating with a positive urine pregnancy test"

;; BMI-based definition of obesity
(assert
(! (=> (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25)
        patient_has_finding_of_obesity_now)
:named REQ6_AUXILIARY1)) ;; "obesity (body mass index ≥ 25 kilograms per square meter)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: woman who is pregnant
(assert
(! (not (and patient_sex_is_female_now
             patient_is_pregnant_now))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

;; Exclusion: woman who may possibly become pregnant
(assert
(! (not (and patient_sex_is_female_now
             patient_is_able_to_be_pregnant_now))
:named REQ6_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a woman who may possibly become pregnant."

;; Exclusion: woman who is lactating with a positive urine pregnancy test
(assert
(! (not (and patient_sex_is_female_now
             patient_is_lactating_now
             patient_has_urine_pregnancy_test_result_now@@result_is_positive))
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is lactating with a positive urine pregnancy test."

;; Exclusion: patient has obesity (BMI ≥ 25)
(assert
(! (not patient_has_finding_of_obesity_now)
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has obesity (body mass index ≥ 25 kilograms per square meter)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "immunodeficiency"
(declare-const patient_has_taken_immune_inhibitor_in_last_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any immune inhibitor during the last 3 months.","when_to_set_to_false":"Set to false if the patient has not taken any immune inhibitor during the last 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any immune inhibitor during the last 3 months.","meaning":"Boolean indicating whether the patient has taken any immune inhibitor during the last 3 months."} ;; "the patient has taken immune inhibitors during the last 3 months"
(declare-const patient_has_finding_of_malignant_tumor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of malignant tumor.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of malignant tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of malignant tumor.","meaning":"Boolean indicating whether the patient currently has a malignant tumor."} ;; "malignant tumor"
(declare-const patient_has_undergone_organ_transplantation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone organ transplantation.","when_to_set_to_false":"Set to false if the patient has not currently undergone organ transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone organ transplantation.","meaning":"Boolean indicating whether the patient has currently undergone organ transplantation."} ;; "organ transplantation"
(declare-const patient_has_undergone_bone_marrow_transplantation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone bone marrow transplantation.","when_to_set_to_false":"Set to false if the patient has not currently undergone bone marrow transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone bone marrow transplantation.","meaning":"Boolean indicating whether the patient has currently undergone bone marrow transplantation."} ;; "bone marrow transplantation"
(declare-const patient_has_finding_of_acquired_immunodeficiency_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of acquired immunodeficiency syndrome (AIDS).","meaning":"Boolean indicating whether the patient currently has acquired immunodeficiency syndrome (AIDS)."} ;; "acquired immunodeficiency syndrome"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_malignant_tumor_now
           patient_has_undergone_organ_transplantation_now
           patient_has_undergone_bone_marrow_transplantation_now
           patient_has_finding_of_acquired_immunodeficiency_syndrome_now)
        patient_has_finding_of_immunodeficiency_disorder_now)
   :named REQ7_AUXILIARY0)) ;; "immunodeficiency with non-exhaustive examples ((malignant tumor) OR (organ transplantation) OR (bone marrow transplantation) OR (acquired immunodeficiency syndrome))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_acquired_immunodeficiency_syndrome_now
       patient_has_finding_of_immunodeficiency_disorder_now)
   :named REQ7_AUXILIARY1)) ;; "acquired immunodeficiency syndrome is a type of immunodeficiency disorder"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_now)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunodeficiency with non-exhaustive examples..."

(assert
(! (not patient_has_taken_immune_inhibitor_in_last_3_months)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken immune inhibitors during the last 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_suspicion_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected of alcohol abuse.","when_to_set_to_false":"Set to false if the patient is currently not suspected of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected of alcohol abuse.","meaning":"Boolean indicating whether the patient is currently suspected of alcohol abuse."} ;; "the patient is suspected of alcohol abuse"
(declare-const patient_has_suspicion_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected of drug abuse.","when_to_set_to_false":"Set to false if the patient is currently not suspected of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected of drug abuse.","meaning":"Boolean indicating whether the patient is currently suspected of drug abuse."} ;; "the patient is suspected of drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse."} ;; "the patient has a history of alcohol abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug abuse.","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse.","meaning":"Boolean indicating whether the patient has a history of drug abuse."} ;; "the patient has a history of drug abuse"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_suspicion_of_alcohol_abuse_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected of alcohol abuse."

(assert
(! (not patient_has_suspicion_of_finding_relating_to_drug_misuse_behavior_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected of drug abuse."

(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory)
:named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_undergone_clinical_trial_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical trial at any time within the past three months.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical trial within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical trial within the past three months.","meaning":"Boolean indicating whether the patient has undergone a clinical trial within the past three months."} ;; "has participated in another clinical trial within three months before study randomization."
(declare-const patient_has_undergone_clinical_trial_inthepast3months@@temporalcontext_within3months_before_study_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial participation occurred within the past three months and specifically before study randomization.","when_to_set_to_false":"Set to false if the clinical trial participation did not occur within the past three months before study randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial participation occurred within the past three months before study randomization.","meaning":"Boolean indicating whether the clinical trial participation occurred within the past three months before study randomization."} ;; "within three months before study randomization"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_clinical_trial_inthepast3months@@temporalcontext_within3months_before_study_randomization
      patient_has_undergone_clinical_trial_inthepast3months)
:named REQ9_AUXILIARY0)) ;; "within three months before study randomization"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_undergone_clinical_trial_inthepast3months@@temporalcontext_within3months_before_study_randomization)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in another clinical trial within three months before study randomization."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_acute_respiratory_infections_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute respiratory infection within the past two weeks before the test.","when_to_set_to_false":"Set to false if the patient has not had an acute respiratory infection within the past two weeks before the test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute respiratory infection within the past two weeks before the test.","meaning":"Boolean indicating whether the patient has had an acute respiratory infection within the past two weeks."} ;; "within two weeks before the test, the patient has had acute respiratory infection"

(declare-const patient_has_finding_of_otitis_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had otitis within the past two weeks before the test.","when_to_set_to_false":"Set to false if the patient has not had otitis within the past two weeks before the test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had otitis within the past two weeks before the test.","meaning":"Boolean indicating whether the patient has had otitis within the past two weeks."} ;; "within two weeks before the test, the patient has had otitis"

(declare-const patient_has_finding_of_nasosinusitis_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had nasosinusitis within the past two weeks before the test.","when_to_set_to_false":"Set to false if the patient has not had nasosinusitis within the past two weeks before the test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had nasosinusitis within the past two weeks before the test.","meaning":"Boolean indicating whether the patient has had nasosinusitis within the past two weeks before the test."} ;; "within two weeks before the test, the patient has had nasosinusitis"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_acute_respiratory_infections_inthepast2weeks)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if within two weeks before the test, the patient has had acute respiratory infection."

(assert
(! (not patient_has_finding_of_otitis_inthepast2weeks)
:named REQ10_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if within two weeks before the test, the patient has had otitis."

(assert
(! (not patient_has_finding_of_nasosinusitis_inthepast2weeks)
:named REQ10_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if within two weeks before the test, the patient has had nasosinusitis."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_undergone_influenza_vaccination_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone influenza vaccination at any time prior to the present (before screening).","when_to_set_to_false":"Set to false if the patient has never undergone influenza vaccination prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone influenza vaccination prior to the present.","meaning":"Boolean indicating whether the patient has ever undergone influenza vaccination at any time prior to the present."} ;; "the patient has already been vaccinated with influenza vaccine"
(declare-const patient_will_undergo_influenza_vaccination_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or expected to undergo influenza vaccination at any time in the future (after screening).","when_to_set_to_false":"Set to false if the patient is not scheduled or expected to undergo influenza vaccination in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo influenza vaccination in the future.","meaning":"Boolean indicating whether the patient will undergo influenza vaccination at any time in the future (after the present/screening)."} ;; "the patient will receive influenza vaccine"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or patient_has_undergone_influenza_vaccination_inthehistory
            patient_will_undergo_influenza_vaccination_inthefuture))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has already been vaccinated with influenza vaccine) OR (the patient will receive influenza vaccine))."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_not_suitable_for_enrollment_based_on_investigator_discretion_now Bool) ;; {"when_to_set_to_true":"Set to true if, at the current time, the investigator has determined that the patient is not suitable for enrollment for other reasons, based on their discretion.","when_to_set_to_false":"Set to false if, at the current time, the investigator has determined that the patient is suitable for enrollment and no other reasons for exclusion exist based on their discretion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator has determined the patient is not suitable for enrollment for other reasons, based on their discretion.","meaning":"Boolean indicating whether, at the current time, the investigator has determined that the patient is not suitable for enrollment for other reasons, based on their discretion."} ;; "based on the investigator's discretion, the patient is not suitable for enrollment for other reasons."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_not_suitable_for_enrollment_based_on_investigator_discretion_now)
    :named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if, based on the investigator's discretion, the patient is not suitable for enrollment for other reasons."
