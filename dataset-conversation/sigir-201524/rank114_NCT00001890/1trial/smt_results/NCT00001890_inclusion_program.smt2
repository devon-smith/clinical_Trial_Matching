;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_postmenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently postmenopausal.","when_to_set_to_false":"Set to false if the patient is currently not postmenopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently postmenopausal.","meaning":"Boolean indicating whether the patient is currently postmenopausal."}  ;; "To be included, the patient must be a postmenopausal woman."
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."}  ;; "To be included, the patient must be a postmenopausal woman."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "To be included, the patient must be age ≤ 65 years."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be a postmenopausal woman (i.e., postmenopausal AND female)
(assert
  (! (and patient_is_postmenopausal_now
          patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a postmenopausal woman."

;; Component 1: Patient must be age ≤ 65 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≤ 65 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_menstruation_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's last menstruation, if this value is recorded now.","when_to_set_to_null":"Set to null if the time since last menstruation is not recorded now or is indeterminate.","meaning":"Numeric value representing the time in months since the patient's last menstruation (menses), recorded now."}  ;; "time since last date of menses ≥ 12 months"
(declare-const patient_plasma_estradiol_measurement_value_recorded_now_withunit_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured plasma estradiol concentration in picograms per milliliter if recorded now.","when_to_set_to_null":"Set to null if the plasma estradiol concentration is not recorded now or is indeterminate.","meaning":"Numeric value representing the patient's plasma estradiol concentration in picograms per milliliter, recorded now."}  ;; "plasma estradiol concentration < 50 picograms per milliliter"
(declare-const patient_follicle_stimulating_hormone_measurement_value_recorded_now_withunit_international_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured follicle-stimulating hormone concentration in international units per liter if recorded now.","when_to_set_to_null":"Set to null if the follicle-stimulating hormone concentration is not recorded now or is indeterminate.","meaning":"Numeric value representing the patient's follicle-stimulating hormone concentration in international units per liter, recorded now."}  ;; "follicle-stimulating hormone concentration > 50 international units per liter"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: time since last date of menses ≥ 12 months
(assert
  (! (>= patient_menstruation_value_recorded_now_withunit_months 12.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have time since last date of menses ≥ 12 months."

;; Component 1: plasma estradiol concentration < 50 picograms per milliliter
(assert
  (! (< patient_plasma_estradiol_measurement_value_recorded_now_withunit_picograms_per_milliliter 50.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have plasma estradiol concentration < 50 picograms per milliliter."

;; Component 2: follicle-stimulating hormone concentration > 50 international units per liter
(assert
  (! (> patient_follicle_stimulating_hormone_measurement_value_recorded_now_withunit_international_units_per_liter 50.0)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have follicle-stimulating hormone concentration > 50 international units per liter."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary arteriosclerosis (coronary artery disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary arteriosclerosis (coronary artery disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary arteriosclerosis (coronary artery disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary arteriosclerosis (coronary artery disease)."} ;; "coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of coronary arteriosclerosis (coronary artery disease).","when_to_set_to_false":"Set to false if the patient does not have a documented history of coronary arteriosclerosis (coronary artery disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of coronary arteriosclerosis (coronary artery disease).","meaning":"Boolean indicating whether the patient has a history of coronary arteriosclerosis (coronary artery disease)."} ;; "history of coronary artery disease"
(declare-const patient_has_finding_of_coronary_artery_disease_by_cardiovascular_physical_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical evidence of coronary artery disease as determined by cardiovascular physical examination now.","when_to_set_to_false":"Set to false if the patient currently does not have clinical evidence of coronary artery disease as determined by cardiovascular physical examination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical evidence of coronary artery disease as determined by cardiovascular physical examination now.","meaning":"Boolean indicating whether the patient currently has clinical evidence of coronary artery disease as determined by cardiovascular physical examination now."} ;; "cardiovascular physical examination"
(declare-const patient_has_finding_of_coronary_artery_disease_by_electrocardiogram_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical evidence of coronary artery disease as determined by electrocardiogram now.","when_to_set_to_false":"Set to false if the patient currently does not have clinical evidence of coronary artery disease as determined by electrocardiogram now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical evidence of coronary artery disease as determined by electrocardiogram now.","meaning":"Boolean indicating whether the patient currently has clinical evidence of coronary artery disease as determined by electrocardiogram now."} ;; "electrocardiogram"
(declare-const patient_has_undergone_cardiovascular_physical_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a cardiovascular physical examination now.","when_to_set_to_false":"Set to false if the patient has not undergone a cardiovascular physical examination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a cardiovascular physical examination now.","meaning":"Boolean indicating whether the patient has undergone a cardiovascular physical examination now."} ;; "cardiovascular physical examination"
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiographic procedure (electrocardiogram) now.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiographic procedure (electrocardiogram) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiographic procedure (electrocardiogram) now.","meaning":"Boolean indicating whether the patient has undergone an electrocardiographic procedure (electrocardiogram) now."} ;; "electrocardiogram"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: clinical evidence of coronary artery disease as determined by (history OR cardiovascular physical exam OR ECG)
(assert
  (! (= patient_has_diagnosis_of_coronary_arteriosclerosis_now
        (or patient_has_finding_of_coronary_arteriosclerosis_inthehistory
            patient_has_finding_of_coronary_artery_disease_by_cardiovascular_physical_examination_now
            patient_has_finding_of_coronary_artery_disease_by_electrocardiogram_now))
     :named REQ2_AUXILIARY0)) ;; "clinical evidence of coronary artery disease as determined by (history of coronary artery disease OR cardiovascular physical examination OR electrocardiogram)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion: patient must NOT have clinical evidence of coronary artery disease as determined by (history OR cardiovascular physical exam OR ECG)
(assert
  (! (not patient_has_diagnosis_of_coronary_arteriosclerosis_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have clinical evidence of coronary artery disease as determined by (history of coronary artery disease OR cardiovascular physical examination OR electrocardiogram)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_hormone_replacement_therapy_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone hormone replacement therapy at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone hormone replacement therapy within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone hormone replacement therapy within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone hormone replacement therapy within the past 6 months."} ;; "To be included, the patient must NOT have used hormone replacement therapy within the past 6 months."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_undergone_hormone_replacement_therapy_inthepast6months)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have used hormone replacement therapy within the past 6 months."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_acetaminophen_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to acetaminophen within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not been exposed to acetaminophen within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to acetaminophen within the past 1 month.","meaning":"Boolean indicating whether the patient has been exposed to acetaminophen within the past 1 month."}  ;; "except acetaminophen use is allowed."
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament (medication) within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament (medication) within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament (medication) within the past 1 month.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament (medication) within the past 1 month."}  ;; "any medication (over-the-counter medication OR prescribed medication) within 1 month"
(declare-const patient_is_exposed_to_nutritional_supplement_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any nutritional supplement within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not been exposed to any nutritional supplement within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any nutritional supplement within the past 1 month.","meaning":"Boolean indicating whether the patient has been exposed to any nutritional supplement within the past 1 month."}  ;; "dietary supplement ... within 1 month"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must NOT have used (dietary supplement OR any medication) within 1 month, except acetaminophen use is allowed.
(assert
  (! (not (or patient_is_exposed_to_nutritional_supplement_inthepast1months
              (and patient_is_exposed_to_drug_or_medicament_inthepast1months
                   (not patient_is_exposed_to_acetaminophen_inthepast1months))))
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must NOT have used (dietary supplement OR any medication (over-the-counter medication OR prescribed medication)) within 1 month, except acetaminophen use is allowed."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_alcoholism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding or diagnosis of alcoholism at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a finding or diagnosis of alcoholism in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding or diagnosis of alcoholism in their medical history.","meaning":"Boolean indicating whether the patient has ever had a finding or diagnosis of alcoholism in their medical history."}  ;; "history of alcoholism"
(declare-const patient_has_finding_of_drinking_binge_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding or diagnosis of binge drinking at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a finding or diagnosis of binge drinking in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding or diagnosis of binge drinking in their medical history.","meaning":"Boolean indicating whether the patient has ever had a finding or diagnosis of binge drinking in their medical history."}  ;; "history of binge drinking"

;; ===================== Constraint Assertions (REQ 5) =====================
;; To be included, the patient must NOT have (history of alcoholism OR history of binge drinking).
(assert
  (! (not (or patient_has_finding_of_alcoholism_inthehistory
              patient_has_finding_of_drinking_binge_inthehistory))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (history of alcoholism OR history of binge drinking)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."}  ;; "diabetes mellitus"
(declare-const patient_has_known_abnormal_glucose_intolerance_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known abnormal glucose intolerance test result.","when_to_set_to_false":"Set to false if the patient currently does not have a known abnormal glucose intolerance test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known abnormal glucose intolerance test result.","meaning":"Boolean indicating whether the patient currently has a known abnormal glucose intolerance test result."}  ;; "known abnormal glucose intolerance test"

;; ===================== Constraint Assertions (REQ 6) =====================
;; To be included, the patient must NOT have (diabetes mellitus OR known abnormal glucose intolerance test).
(assert
  (! (not (or patient_has_diagnosis_of_diabetes_mellitus_now
              patient_has_known_abnormal_glucose_intolerance_test_now))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with angina pectoris at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with angina pectoris at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with angina pectoris.","meaning":"Boolean indicating whether the patient has ever been diagnosed with angina pectoris in their medical history."}  ;; "history of angina"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever been diagnosed with cerebrovascular accident (stroke) in their medical history."}  ;; "history of stroke"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction in their medical history."}  ;; "history of myocardial infarction"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must NOT have (history of stroke OR history of angina OR history of myocardial infarction).
(assert
  (! (not (or patient_has_diagnosis_of_cerebrovascular_accident_inthehistory
              patient_has_diagnosis_of_angina_pectoris_inthehistory
              patient_has_diagnosis_of_myocardial_infarction_inthehistory))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (history of stroke OR history of angina OR history of myocardial infarction)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with deep venous thrombosis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with deep venous thrombosis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with deep venous thrombosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of deep venous thrombosis in their history."}  ;; "history of deep venous thrombosis"
(declare-const patient_has_diagnosis_of_pulmonary_embolism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with pulmonary embolism at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with pulmonary embolism at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with pulmonary embolism.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of pulmonary embolism in their history."}  ;; "history of pulmonary embolism"

;; ===================== Constraint Assertions (REQ 8) =====================
;; To be included, the patient must NOT have (history of deep venous thrombosis OR history of pulmonary embolism).
(assert
  (! (not (or patient_has_diagnosis_of_deep_venous_thrombosis_inthehistory
              patient_has_diagnosis_of_pulmonary_embolism_inthehistory))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the inclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has a history of malignant neoplastic disease (cancer)."} ;; "history of cancer"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with squamous cell carcinoma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with squamous cell carcinoma at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with squamous cell carcinoma.","meaning":"Boolean indicating whether the patient has a history of squamous cell carcinoma."} ;; "squamous cell carcinoma"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_inthehistory@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of squamous cell carcinoma includes evidence that the carcinoma has been treated.","when_to_set_to_false":"Set to false if the patient's history of squamous cell carcinoma does not include evidence of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the squamous cell carcinoma has been treated.","meaning":"Boolean indicating whether the patient's history of squamous cell carcinoma is qualified by having been treated."} ;; "treated squamous cell carcinoma"
(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with basal cell carcinoma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with basal cell carcinoma at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with basal cell carcinoma.","meaning":"Boolean indicating whether the patient has a history of basal cell carcinoma."} ;; "basal cell carcinoma"
(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_inthehistory@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of basal cell carcinoma includes evidence that the carcinoma has been treated.","when_to_set_to_false":"Set to false if the patient's history of basal cell carcinoma does not include evidence of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the basal cell carcinoma has been treated.","meaning":"Boolean indicating whether the patient's history of basal cell carcinoma is qualified by having been treated."} ;; "treated basal cell carcinoma"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_inthehistory@@treated
         patient_has_diagnosis_of_squamous_cell_carcinoma_inthehistory)
     :named REQ9_AUXILIARY0)) ;; "treated squamous cell carcinoma" implies "squamous cell carcinoma"

(assert
  (! (=> patient_has_diagnosis_of_basal_cell_carcinoma_inthehistory@@treated
         patient_has_diagnosis_of_basal_cell_carcinoma_inthehistory)
     :named REQ9_AUXILIARY1)) ;; "treated basal cell carcinoma" implies "basal cell carcinoma"

;; ===================== Constraint Assertions (REQ 9) =====================
;; To be included, the patient must NOT have history of cancer, except (treated squamous cell carcinoma OR treated basal cell carcinoma).
(assert
  (! (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
         patient_has_diagnosis_of_squamous_cell_carcinoma_inthehistory@@treated
         patient_has_diagnosis_of_basal_cell_carcinoma_inthehistory@@treated)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (history of cancer), except (treated squamous cell carcinoma OR treated basal cell carcinoma)."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or evidence of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or evidence of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or evidence of liver disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis or evidence of liver disease."}  ;; "evidence of liver disease"
(declare-const patient_liver_enzyme_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of liver function enzyme concentration recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current concentration of liver function enzymes, recorded now, with units as appropriate."}  ;; "liver function enzyme concentration"
(declare-const patient_liver_enzyme_upper_limit_of_normal_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for liver function enzyme concentration, with units matching the patient's measurement, if available.","when_to_set_to_null":"Set to null if the upper limit of normal is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for liver function enzyme concentration, with units as appropriate."}  ;; "upper limit of normal for liver function enzyme concentration"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Definition in the requirement: evidence of liver disease is defined as liver function enzyme concentration > 2 × upper limit of normal
(assert
  (! (= patient_has_diagnosis_of_disease_of_liver_now
        (> patient_liver_enzyme_value_recorded_now_withunit_unit
           (* 2 patient_liver_enzyme_upper_limit_of_normal_value_withunit_unit)))
     :named REQ10_AUXILIARY0)) ;; "liver disease (defined as liver function enzyme concentration > 2 × upper limit of normal)"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Inclusion: patient must NOT have evidence of liver disease
(assert
  (! (not patient_has_diagnosis_of_disease_of_liver_now)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have evidence of liver disease (defined as liver function enzyme concentration > 2 × upper limit of normal)."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current creatinine concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine concentration in milligrams per deciliter."}  ;; "creatinine concentration > 1.6 milligrams per deciliter"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired renal function (renal impairment).","when_to_set_to_false":"Set to false if the patient currently does not have impaired renal function (renal impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired renal function.","meaning":"Boolean indicating whether the patient currently has impaired renal function (renal impairment)."}  ;; "impaired renal function"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definition in the requirement: impaired renal function is defined as creatinine concentration > 1.6 mg/dl
(assert
  (! (= patient_has_finding_of_renal_impairment_now
        (> patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter 1.6))
     :named REQ11_AUXILIARY0)) ;; "impaired renal function (defined as creatinine concentration > 1.6 milligrams per deciliter)"

;; ===================== Constraint Assertions (REQ 11) =====================
;; To be included, the patient must NOT have impaired renal function
(assert
  (! (not patient_has_finding_of_renal_impairment_now)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have impaired renal function (defined as creatinine concentration > 1.6 milligrams per deciliter)."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_autoimmune_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any autoimmune disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any autoimmune disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any autoimmune disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with any autoimmune disease in their medical history."} ;; "autoimmune disease"
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with systemic lupus erythematosus at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with systemic lupus erythematosus at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient has ever been diagnosed with systemic lupus erythematosus in their medical history."} ;; "systemic lupus erythematosus"
(declare-const patient_has_diagnosis_of_rheumatoid_arthritis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with rheumatoid arthritis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with rheumatoid arthritis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with rheumatoid arthritis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with rheumatoid arthritis in their medical history."} ;; "rheumatoid arthritis"
(declare-const patient_has_diagnosis_of_thyroiditis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with thyroiditis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with thyroiditis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with thyroiditis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with thyroiditis in their medical history."} ;; "thyroiditis"
(declare-const patient_has_diagnosis_of_raynaud_s_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with Raynaud's disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with Raynaud's disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with Raynaud's disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with Raynaud's disease in their medical history."} ;; "Raynaud's disease"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples imply the umbrella term (autoimmune disease)
(assert
  (! (=> (or patient_has_diagnosis_of_systemic_lupus_erythematosus_inthehistory
             patient_has_diagnosis_of_rheumatoid_arthritis_inthehistory
             patient_has_diagnosis_of_thyroiditis_inthehistory
             patient_has_diagnosis_of_raynaud_s_disease_inthehistory)
         patient_has_diagnosis_of_autoimmune_disease_inthehistory)
     :named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples (systemic lupus erythematosus OR rheumatoid arthritis OR thyroiditis OR Raynaud's disease)"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Component 0: To be included, the patient must NOT have a diagnosis of autoimmune disease
(assert
  (! (not patient_has_diagnosis_of_autoimmune_disease_inthehistory)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have a diagnosis of autoimmune disease"

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_has_finding_of_intermittent_vaginal_bleeding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of intermittent vaginal bleeding at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of intermittent vaginal bleeding at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of intermittent vaginal bleeding in their history.","meaning":"Boolean indicating whether the patient has ever had a finding of intermittent vaginal bleeding at any time in their history."} ;; "the patient must NOT have a history of intermittent vaginal bleeding."
(declare-const patient_has_finding_of_vaginal_bleeding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of vaginal bleeding at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of vaginal bleeding at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of vaginal bleeding in their history.","meaning":"Boolean indicating whether the patient has ever had a finding of vaginal bleeding at any time in their history."} ;; "the patient must NOT have a history of intermittent vaginal bleeding."

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Intermittent vaginal bleeding is a type of vaginal bleeding in the history (non-exhaustive, but implied by wording)
(assert
  (! (=> patient_has_finding_of_intermittent_vaginal_bleeding_inthehistory
         patient_has_finding_of_vaginal_bleeding_inthehistory)
     :named REQ13_AUXILIARY0)) ;; "intermittent vaginal bleeding" implies "vaginal bleeding" in the history

;; ===================== Constraint Assertions (REQ 13) =====================
;; To be included, the patient must NOT have a history of intermittent vaginal bleeding
(assert
  (! (not patient_has_finding_of_intermittent_vaginal_bleeding_inthehistory)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have a history of intermittent vaginal bleeding."

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_serum_triglyceride_levels_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum triglyceride concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum triglyceride concentration in milligrams per deciliter."}  ;; "serum triglyceride concentration"

;; ===================== Constraint Assertions (REQ 14) =====================
;; To be included, the patient must NOT have serum triglyceride concentration > 400 milligrams per deciliter.
(assert
  (! (not (> patient_serum_triglyceride_levels_finding_value_recorded_now_withunit_milligrams_per_deciliter 400.0))
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS))
