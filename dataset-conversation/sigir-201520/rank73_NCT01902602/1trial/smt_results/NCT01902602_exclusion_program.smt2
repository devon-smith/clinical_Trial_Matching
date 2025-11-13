;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"

(declare-const patient_has_finding_of_diabetes_mellitus_now@@with_derailed_glycemic_control Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus and the glycemic control is derailed.","when_to_set_to_false":"Set to false if the patient currently has diabetes mellitus but the glycemic control is not derailed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the glycemic control is derailed in the context of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus with derailed glycemic control."} ;; "diabetes mellitus with derailed glycemic control"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_diabetes_mellitus_now@@with_derailed_glycemic_control
      patient_has_finding_of_diabetes_mellitus_now)
   :named REQ0_AUXILIARY0)) ;; "with derailed glycemic control" implies "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_diabetes_mellitus_now@@with_derailed_glycemic_control)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus with derailed glycemic control."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"
(declare-const patient_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the patient's current creatinine clearance value in milliliters per minute if available.","when_to_set_to_null":"Set to null if the patient's current creatinine clearance value in milliliters per minute is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current creatinine clearance in milliliters per minute."} ;; "renal creatinine clearance less than 50 milliliters per minute"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_finding_of_renal_impairment_now
             (< patient_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 50)))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal impairment with renal creatinine clearance less than 50 milliliters per minute."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer), regardless of whether it is treated or untreated.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} ;; "cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer) and the cancer is untreated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malignant neoplastic disease (cancer) and the cancer is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cancer is untreated.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease (cancer) is untreated."} ;; "untreated cancer"
(declare-const patient_has_tumor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tumor.","when_to_set_to_false":"Set to false if the patient currently does not have a tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tumor.","meaning":"Boolean indicating whether the patient currently has a tumor."} ;; "tumor"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for untreated cancer implies cancer diagnosis
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@untreated
      patient_has_diagnosis_of_malignant_neoplastic_disease_now)
    :named REQ2_AUXILIARY0)) ;; "untreated cancer" implies "cancer"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have untreated cancer
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@untreated)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has untreated cancer."

;; Exclusion: patient must NOT have a tumor
(assert
(! (not patient_has_tumor_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a patient with a tumor."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_thyroid_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thyroid dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thyroid dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of thyroid dysfunction.","meaning":"Boolean indicating whether the patient currently has thyroid dysfunction."} ;; "thyroid dysfunction"
(declare-const patient_has_finding_of_thyroid_dysfunction_now@@with_non_adjusted_thyroid_hormone_levels Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thyroid dysfunction and the thyroid hormone levels are not adjusted.","when_to_set_to_false":"Set to false if the patient currently has thyroid dysfunction but the thyroid hormone levels are adjusted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thyroid hormone levels are adjusted in the context of thyroid dysfunction.","meaning":"Boolean indicating whether the patient's thyroid dysfunction is with non-adjusted thyroid hormone levels."} ;; "thyroid dysfunction with non-adjusted thyroid hormone levels"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_thyroid_dysfunction_now@@with_non_adjusted_thyroid_hormone_levels
      patient_has_finding_of_thyroid_dysfunction_now)
:named REQ3_AUXILIARY0)) ;; "thyroid dysfunction with non-adjusted thyroid hormone levels" implies "thyroid dysfunction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_thyroid_dysfunction_now@@with_non_adjusted_thyroid_hormone_levels)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thyroid dysfunction with non-adjusted thyroid hormone levels."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index (in kilograms per square meter) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 35))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body mass index greater than 35 kilograms per square meter."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's current left ventricular ejection fraction (LVEF) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current left ventricular ejection fraction (LVEF)."} ;; "left ventricular ejection fraction"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 35))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a left ventricular ejection fraction less than 35 percent."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease."} ;; "peripheral arterial vascular disease"
(declare-const ankle_brachial_index_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current ankle-brachial index measurement, recorded as a ratio (e.g., 0.9, 1.2).","when_to_set_to_null":"Set to null if the patient's current ankle-brachial index measurement is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current ankle-brachial index measurement, recorded as a ratio."} ;; "ankle-brachial index measurement"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have peripheral arterial vascular disease with ankle-brachial index measurement greater than Stage II.
;; Note: Stage II in the context of ankle-brachial index (ABI) is typically defined as ABI < 0.9 for disease; "greater than Stage II" implies ABI >= 0.9 (i.e., less severe or no disease). However, the requirement excludes patients with peripheral arterial vascular disease AND ABI measurement greater than Stage II (i.e., ABI >= 0.9). We encode this as stated.
(assert
(! (not (and patient_has_finding_of_peripheral_arterial_occlusive_disease_now
             (>= ankle_brachial_index_value_recorded_now_withunit_ratio 0.9)))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has peripheral arterial vascular disease with ankle-brachial index measurement greater than Stage II."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const cardiac_valve_regurgitation_stage_value_recorded_now_withunit_stage Real) ;; {"when_to_set_to_value":"Set to the numeric stage value if the patient's current cardiac valve regurgitation stage is documented.","when_to_set_to_null":"Set to null if the patient's current cardiac valve regurgitation stage is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the stage of cardiac valve regurgitation currently present in the patient, with unit 'stage'."} ;; "cardiac valve regurgitation greater than Stage I"
(declare-const patient_has_finding_of_heart_valve_regurgitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac (heart) valve regurgitation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac (heart) valve regurgitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac (heart) valve regurgitation.","meaning":"Boolean indicating whether the patient currently has cardiac (heart) valve regurgitation."} ;; "cardiac valve regurgitation"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (and patient_has_finding_of_heart_valve_regurgitation_now
               (> cardiac_valve_regurgitation_stage_value_recorded_now_withunit_stage 1)))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac valve regurgitation greater than Stage I."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_abdominal_aortic_aneurysm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abdominal aortic aneurysm.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of abdominal aortic aneurysm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of abdominal aortic aneurysm.","meaning":"Boolean indicating whether the patient currently has a diagnosis of abdominal aortic aneurysm."} ;; "abdominal aortic aneurysm"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_abdominal_aortic_aneurysm_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an abdominal aortic aneurysm."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder due to infection (infectious disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder due to infection (infectious disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder due to infection (infectious disease).","meaning":"Boolean indicating whether the patient currently has a disorder due to infection (infectious disease) at the present time."} ;; "infectious disease"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infectious disease."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body temperature in degrees Celsius."} ;; "body temperature"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now
             (> patient_body_temperature_value_recorded_now_withunit_celsius 38.5)))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute febrile infectious disease and body temperature > 38.5 degrees Celsius."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_chronic_obstructive_pulmonary_disease_stage_value_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the current stage of chronic obstructive pulmonary disease for the patient.","when_to_set_to_null":"Set to null if the stage is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current stage of chronic obstructive pulmonary disease for the patient, recorded as an integer."} ;; "chronic obstructive pulmonary disease at stage III or higher"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_bronchial_asthma_stage_value_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the current stage of bronchial asthma for the patient.","when_to_set_to_null":"Set to null if the stage is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current stage of bronchial asthma for the patient, recorded as an integer."} ;; "bronchial asthma at stage III or higher"
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchial asthma.","when_to_set_to_false":"Set to false if the patient currently does not have bronchial asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchial asthma.","meaning":"Boolean indicating whether the patient currently has bronchial asthma."} ;; "bronchial asthma"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> (>= patient_chronic_obstructive_pulmonary_disease_stage_value_now_withunit_integer 3)
       patient_has_finding_of_chronic_obstructive_lung_disease_now)
:named REQ11_AUXILIARY0)) ;; "chronic obstructive pulmonary disease at stage III or higher"

(assert
(! (=> (>= patient_bronchial_asthma_stage_value_now_withunit_integer 3)
       patient_has_finding_of_asthma_now)
:named REQ11_AUXILIARY1)) ;; "bronchial asthma at stage III or higher"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or (>= patient_chronic_obstructive_pulmonary_disease_stage_value_now_withunit_integer 3)
            (>= patient_bronchial_asthma_stage_value_now_withunit_integer 3)))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has chronic obstructive pulmonary disease at stage III or higher) OR (the patient has bronchial asthma at stage III or higher)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const nyha_classification_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value corresponding to the patient's current NYHA classification (e.g., 1, 2, 3, or 4) if known and documented now.","when_to_set_to_null":"Set to null if the patient's current NYHA classification is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current NYHA classification as an integer."} ;; "New York Heart Association classification > Stage III"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."} ;; "dyspnea"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (and patient_has_finding_of_dyspnea_now
             (> nyha_classification_value_recorded_now_withunit_integer 3)))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dyspnea with New York Heart Association classification > Stage III."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast12weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident within the past 12 weeks.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident within the past 12 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident within the past 12 weeks.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident within the past 12 weeks."} ;; "cerebrovascular accident less than 12 weeks ago"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast12weeks)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a cerebrovascular accident less than 12 weeks ago."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_acute_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute hepatic failure.","meaning":"Boolean indicating whether the patient currently has acute hepatic failure."} ;; "acute hepatic failure"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_acute_hepatic_failure_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute hepatic failure."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_acute_apoplexy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute apoplexy.","when_to_set_to_false":"Set to false if the patient currently does not have acute apoplexy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute apoplexy.","meaning":"Boolean indicating whether the patient currently has acute apoplexy."} ;; "The patient is excluded if the patient has acute apoplexy."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not patient_has_finding_of_acute_apoplexy_now)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute apoplexy."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_poisoning_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poisoning.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poisoning.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of poisoning.","meaning":"Boolean indicating whether the patient currently has poisoning."} ;; "poisoning"
(declare-const patient_has_finding_of_poisoning_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's poisoning is severe.","when_to_set_to_false":"Set to false if the patient's poisoning is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's poisoning is severe.","meaning":"Boolean indicating whether the patient's poisoning is severe."} ;; "severe poisoning"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_poisoning_now@@severe
      patient_has_finding_of_poisoning_now)
   :named REQ16_AUXILIARY0)) ;; "severe poisoning" implies "poisoning"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_poisoning_now@@severe)
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe poisoning."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychoactive substance use disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psychoactive substance use disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psychoactive substance use disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychoactive substance use disorder."} ;; "substance use disorder"
(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_now@@due_to_drug_addiction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of psychoactive substance use disorder is due to drug addiction.","when_to_set_to_false":"Set to false if the patient's current diagnosis of psychoactive substance use disorder is not due to drug addiction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of psychoactive substance use disorder is due to drug addiction.","meaning":"Boolean indicating whether the patient's current diagnosis of psychoactive substance use disorder is due to drug addiction."} ;; "substance use disorder due to drug addiction"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_psychoactive_substance_use_disorder_now@@due_to_drug_addiction
      patient_has_diagnosis_of_psychoactive_substance_use_disorder_now)
:named REQ17_AUXILIARY0)) ;; "substance use disorder due to drug addiction"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_diagnosis_of_psychoactive_substance_use_disorder_now@@due_to_drug_addiction)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has substance use disorder due to drug addiction."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has the clinical finding of hyperthyroidism."} ;; "hyperthyroidism"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_hyperthyroidism_now)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hyperthyroidism."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure) at the present time."} ;; "hypotension"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_low_blood_pressure_now)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypotension."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_hypocalcemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypocalcemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypocalcemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypocalcemia.","meaning":"Boolean indicating whether the patient currently has hypocalcemia."} ;; "hypocalcemia"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_has_finding_of_hypocalcemia_now)
    :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypocalcemia."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_hypoglycemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoglycemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoglycemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoglycemia.","meaning":"Boolean indicating whether the patient currently has hypoglycemia."} ;; "hypoglycemia"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not patient_has_finding_of_hypoglycemia_now)
    :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypoglycemia."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_allergy_to_ozone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to ozone.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to ozone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to ozone.","meaning":"Boolean indicating whether the patient currently has an allergy to ozone."} ;; "allergy to ozone"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
  (! (not patient_has_allergy_to_ozone_now)
     :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to ozone."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any blood coagulation disorder.","when_to_set_to_false":"Set to false if the patient currently does not have any blood coagulation disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any blood coagulation disorder.","meaning":"Boolean indicating whether the patient currently has any blood coagulation disorder."} ;; "coagulation disorder"
(declare-const patient_has_finding_of_hemophilia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hemophilia.","when_to_set_to_false":"Set to false if the patient currently does not have hemophilia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemophilia.","meaning":"Boolean indicating whether the patient currently has hemophilia."} ;; "hemophilia"

;; ===================== Auxiliary Assertions (REQ 24) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_finding_of_hemophilia_now
      patient_has_finding_of_blood_coagulation_disorder_now)
   :named REQ24_AUXILIARY0)) ;; "with non-exhaustive examples (hemophilia)"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
   :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coagulation disorder with non-exhaustive examples (hemophilia)."
