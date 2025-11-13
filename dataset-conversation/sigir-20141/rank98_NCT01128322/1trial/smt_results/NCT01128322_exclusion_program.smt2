;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} ;; "hypertension"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension) and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hypertensive disorder (hypertension) and the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the patient's hypertensive disorder (hypertension) is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension) and the severity is severe."} ;; "severe hypertension"
(declare-const patient_sitting_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's mean seated cuff diastolic blood pressure (mmHg) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's mean seated cuff diastolic blood pressure (mmHg) measured now."} ;; "mean seated cuff diastolic blood pressure"
(declare-const patient_sitting_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's mean seated cuff systolic blood pressure (mmHg) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's mean seated cuff systolic blood pressure (mmHg) measured now."} ;; "mean seated cuff systolic blood pressure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: severe hypertension = (mean seated cuff diastolic BP >= 116 mmHg) OR (mean seated cuff systolic BP >= 200 mmHg)
(assert
(! (= patient_has_diagnosis_of_hypertensive_disorder_now@@severity_severe
(or (>= patient_sitting_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 116)
    (>= patient_sitting_systolic_blood_pressure_value_recorded_now_withunit_mmhg 200)))
:named REQ0_AUXILIARY0)) ;; "severe hypertension defined as ((mean seated cuff diastolic blood pressure >= 116 mmHg) OR (mean seated cuff systolic blood pressure >= 200 mmHg))"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_hypertensive_disorder_now@@severity_severe
      patient_has_diagnosis_of_hypertensive_disorder_now)
:named REQ0_AUXILIARY1)) ;; "severe hypertension" implies "hypertension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_hypertensive_disorder_now@@severity_severe)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypertension defined as ((mean seated cuff diastolic blood pressure >= 116 mmHg) OR (mean seated cuff systolic blood pressure >= 200 mmHg))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary hypertension."} ;; "secondary hypertension"
(declare-const patient_has_diagnosis_of_secondary_hypertension_now@@known_status Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of secondary hypertension is known (confirmed and documented).","when_to_set_to_false":"Set to false if the diagnosis of secondary hypertension is not known (not confirmed or not documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of secondary hypertension is known.","meaning":"Boolean indicating whether the diagnosis of secondary hypertension is known."} ;; "known secondary hypertension"
(declare-const patient_has_diagnosis_of_secondary_hypertension_now@@suspected_status Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of secondary hypertension is suspected (not confirmed, but considered possible based on clinical evidence).","when_to_set_to_false":"Set to false if the diagnosis of secondary hypertension is not suspected (not considered possible).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of secondary hypertension is suspected.","meaning":"Boolean indicating whether the diagnosis of secondary hypertension is suspected."} ;; "suspected secondary hypertension"
(declare-const patient_has_diagnosis_of_aortic_coarctation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aortic coarctation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of aortic coarctation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of aortic coarctation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of aortic coarctation."} ;; "aortic coarctation"
(declare-const patient_has_diagnosis_of_primary_hyperaldosteronism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary hyperaldosteronism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary hyperaldosteronism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary hyperaldosteronism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary hyperaldosteronism."} ;; "primary hyperaldosteronism"
(declare-const patient_has_diagnosis_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of renal artery stenosis."} ;; "renal artery stenosis"
(declare-const patient_has_diagnosis_of_pheochromocytoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pheochromocytoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pheochromocytoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pheochromocytoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pheochromocytoma."} ;; "pheochromocytoma"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_secondary_hypertension_now@@known_status
      patient_has_diagnosis_of_secondary_hypertension_now)
:named REQ1_AUXILIARY0)) ;; "known secondary hypertension"

(assert
(! (=> patient_has_diagnosis_of_secondary_hypertension_now@@suspected_status
      patient_has_diagnosis_of_secondary_hypertension_now)
:named REQ1_AUXILIARY1)) ;; "suspected secondary hypertension"

;; Non-exhaustive examples imply suspected secondary hypertension
(assert
(! (=> (or patient_has_diagnosis_of_aortic_coarctation_now
           patient_has_diagnosis_of_primary_hyperaldosteronism_now
           patient_has_diagnosis_of_renal_artery_stenosis_now
           patient_has_diagnosis_of_pheochromocytoma_now)
      patient_has_diagnosis_of_secondary_hypertension_now@@suspected_status)
:named REQ1_AUXILIARY2)) ;; "with non-exhaustive examples (aortic coarctation, primary hyperaldosteronism, renal artery stenosis, pheochromocytoma)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have known secondary hypertension
(assert
(! (not patient_has_diagnosis_of_secondary_hypertension_now@@known_status)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known secondary hypertension."

;; Exclusion: patient must NOT have suspected secondary hypertension (with non-exhaustive examples)
(assert
(! (not patient_has_diagnosis_of_secondary_hypertension_now@@suspected_status)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected secondary hypertension with non-exhaustive examples (aortic coarctation, primary hyperaldosteronism, renal artery stenosis, pheochromocytoma)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"
(declare-const patient_has_finding_of_heart_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease and the heart disease is severe.","when_to_set_to_false":"Set to false if the patient currently has heart disease but it is not severe, or does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart disease is severe.","meaning":"Boolean indicating whether the patient's heart disease is severe."} ;; "severe heart disease"
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of angina.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has angina.","meaning":"Boolean indicating whether the patient currently has angina."} ;; "angina"
(declare-const patient_has_finding_of_angina_pectoris_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina and the angina is unstable.","when_to_set_to_false":"Set to false if the patient currently has angina but it is not unstable, or does not have angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's angina is unstable.","meaning":"Boolean indicating whether the patient's angina is unstable."} ;; "unstable angina"
(declare-const patient_has_finding_of_myocardial_infarction_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of myocardial infarction within the past three months.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of myocardial infarction within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past three months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past three months."} ;; "myocardial infarction within the past three months"
(declare-const patient_has_finding_of_arrhythmia_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of arrhythmia within the past three months.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of arrhythmia within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had arrhythmia within the past three months.","meaning":"Boolean indicating whether the patient has had arrhythmia within the past three months."} ;; "arrhythmia within the past three months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: severe heart disease = (heart failure NYHA class 3 OR heart failure NYHA class 4)
;; We need to introduce two new variables for NYHA class 3 and class 4 heart failure
(declare-const patient_has_finding_of_heart_failure_nyha_class_3_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure New York Heart Association functional class 3.","when_to_set_to_false":"Set to false if the patient currently does not have heart failure NYHA class 3.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure NYHA class 3.","meaning":"Boolean indicating whether the patient currently has heart failure NYHA class 3."} ;; "heart failure New York Heart Association functional class 3"
(declare-const patient_has_finding_of_heart_failure_nyha_class_4_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure New York Heart Association functional class 4.","when_to_set_to_false":"Set to false if the patient currently does not have heart failure NYHA class 4.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure NYHA class 4.","meaning":"Boolean indicating whether the patient currently has heart failure NYHA class 4."} ;; "heart failure New York Heart Association functional class 4"

;; Severe heart disease is defined as (heart failure NYHA class 3 OR heart failure NYHA class 4)
(assert
(! (= patient_has_finding_of_heart_disease_now@@severe
(or patient_has_finding_of_heart_failure_nyha_class_3_now
    patient_has_finding_of_heart_failure_nyha_class_4_now))
:named REQ2_AUXILIARY0)) ;; "severe heart disease defined as ((heart failure New York Heart Association functional class 3) OR (heart failure New York Heart Association functional class 4))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_disease_now@@severe
      patient_has_finding_of_heart_disease_now)
:named REQ2_AUXILIARY1)) ;; "severe heart disease"

(assert
(! (=> patient_has_finding_of_angina_pectoris_now@@unstable
      patient_has_finding_of_angina_pectoris_now)
:named REQ2_AUXILIARY2)) ;; "unstable angina"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have any of the following:
;; (severe heart disease) OR (unstable angina) OR (myocardial infarction within the past three months) OR (arrhythmia within the past three months)
(assert
(! (not (or patient_has_finding_of_heart_disease_now@@severe
            patient_has_finding_of_angina_pectoris_now@@unstable
            patient_has_finding_of_myocardial_infarction_inthepast3months
            patient_has_finding_of_arrhythmia_inthepast3months))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has severe heart disease defined as ((heart failure New York Heart Association functional class 3) OR (heart failure New York Heart Association functional class 4))) OR (the patient has unstable angina) OR (the patient has myocardial infarction within the past three months) OR (the patient has arrhythmia within the past three months))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_cerebrovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of cerebrovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of cerebrovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of cerebrovascular disease.","meaning":"Boolean indicating whether the patient currently has cerebrovascular disease."} ;; "cerebrovascular disease"
(declare-const patient_has_finding_of_cerebral_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of cerebral infarction within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of cerebral infarction within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebral infarction within the past 6 months.","meaning":"Boolean indicating whether the patient has had a cerebral infarction within the past 6 months."} ;; "cerebral infarction within 6 months"
(declare-const patient_has_finding_of_cerebral_hemorrhage_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of cerebral hemorrhage within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of cerebral hemorrhage within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebral hemorrhage within the past 6 months.","meaning":"Boolean indicating whether the patient has had a cerebral hemorrhage within the past 6 months."} ;; "cerebral hemorrhage within 6 months"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_cerebral_infarction_inthepast6months
           patient_has_finding_of_cerebral_hemorrhage_inthepast6months)
       patient_has_finding_of_cerebrovascular_disease_now)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((cerebral infarction within 6 months) OR (cerebral hemorrhage within 6 months))."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_disease_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cerebrovascular disease with non-exhaustive examples ((cerebral infarction within 6 months) OR (cerebral hemorrhage within 6 months))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Type 1 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Type 1 diabetes mellitus."} ;; "Type I diabetes mellitus"

(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Type 2 diabetes mellitus."} ;; "Type II diabetes mellitus"

(declare-const patient_has_finding_of_poor_glycemic_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor glycemic control.","when_to_set_to_false":"Set to false if the patient currently does not have poor glycemic control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor glycemic control.","meaning":"Boolean indicating whether the patient currently has poor glycemic control."} ;; "poor glucose control"

(declare-const patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of glycosylated hemoglobin (percent) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's glycosylated hemoglobin (percent) measured now."} ;; "glucosylated hemoglobin"

(declare-const patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent@@measured_in_fasting_state Bool) ;; {"when_to_set_to_true":"Set to true if the glycosylated hemoglobin measurement was taken in the fasting state.","when_to_set_to_false":"Set to false if the measurement was not taken in the fasting state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken in the fasting state.","meaning":"Boolean indicating whether the glycosylated hemoglobin measurement was taken in the fasting state."} ;; "fasting glucosylated hemoglobin"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: poor glucose control = fasting glucosylated hemoglobin > 8 percent
(assert
(! (= patient_has_finding_of_poor_glycemic_control_now
     (and patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent@@measured_in_fasting_state
          (> patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent 8)))
   :named REQ4_AUXILIARY0)) ;; "poor glucose control defined as fasting glucosylated hemoglobin greater than 8 percent"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: Type I diabetes mellitus
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Type I diabetes mellitus."

;; Exclusion: Type II diabetes mellitus AND poor glucose control (as defined)
(assert
(! (not (and patient_has_diagnosis_of_type_2_diabetes_mellitus_now
             patient_has_finding_of_poor_glycemic_control_now))
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Type II diabetes mellitus and the patient has poor glucose control defined as fasting glucosylated hemoglobin greater than 8 percent."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_retinal_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a retinal disorder (retinopathy).","when_to_set_to_false":"Set to false if the patient currently does not have a retinal disorder (retinopathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a retinal disorder (retinopathy).","meaning":"Boolean indicating whether the patient currently has a retinal disorder (retinopathy)."} ;; "retinopathy"
(declare-const patient_has_finding_of_retinal_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current retinal disorder (retinopathy) is severe.","when_to_set_to_false":"Set to false if the patient's current retinal disorder (retinopathy) is not severe.","when_to_set_to_null":"Set to null if severity is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current retinal disorder (retinopathy) is severe."} ;; "severe retinopathy"
(declare-const patient_has_finding_of_retinal_disorder_now@@malignant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current retinal disorder (retinopathy) is malignant.","when_to_set_to_false":"Set to false if the patient's current retinal disorder (retinopathy) is not malignant.","when_to_set_to_null":"Set to null if malignancy is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's current retinal disorder (retinopathy) is malignant."} ;; "malignant retinopathy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_retinal_disorder_now@@severe
      patient_has_finding_of_retinal_disorder_now)
:named REQ5_AUXILIARY0)) ;; "the patient has known severe retinopathy"

(assert
(! (=> patient_has_finding_of_retinal_disorder_now@@malignant
      patient_has_finding_of_retinal_disorder_now)
:named REQ5_AUXILIARY1)) ;; "the patient has known malignant retinopathy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_retinal_disorder_now@@severe)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known severe retinopathy."

(assert
(! (not patient_has_finding_of_retinal_disorder_now@@malignant)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known malignant retinopathy."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const alanine_aminotransferase_upper_normal_limit_value_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the upper normal limit for ALT in U/L at the current time.","when_to_set_to_null":"Set to null if the upper normal limit for ALT in U/L at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the upper normal limit for alanine aminotransferase (ALT) at the current time, measured in units per liter (U/L)."} ;; "upper normal limit for alanine aminotransferase"
(declare-const alanine_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current ALT level in U/L.","when_to_set_to_null":"Set to null if the patient's current ALT level in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current alanine aminotransferase (ALT) level, measured in units per liter (U/L)."} ;; "alanine aminotransferase greater than upper normal limit times 2"
(declare-const aspartate_aminotransferase_upper_normal_limit_value_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the upper normal limit for AST in U/L at the current time.","when_to_set_to_null":"Set to null if the upper normal limit for AST in U/L at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the upper normal limit for aspartate aminotransferase (AST) at the current time, measured in units per liter (U/L)."} ;; "upper normal limit for aspartate aminotransferase"
(declare-const aspartate_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current AST level in U/L.","when_to_set_to_null":"Set to null if the patient's current AST level in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current aspartate aminotransferase (AST) level, measured in units per liter (U/L)."} ;; "aspartate aminotransferase greater than upper normal limit times 2"
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic dysfunction (abnormal liver function).","when_to_set_to_false":"Set to false if the patient currently does not have hepatic dysfunction (abnormal liver function).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic dysfunction (abnormal liver function).","meaning":"Boolean indicating whether the patient currently has hepatic dysfunction (abnormal liver function)."} ;; "hepatic dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal dysfunction (renal impairment).","when_to_set_to_false":"Set to false if the patient currently does not have renal dysfunction (renal impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal dysfunction (renal impairment).","meaning":"Boolean indicating whether the patient currently has renal dysfunction (renal impairment)."} ;; "renal dysfunction"
(declare-const serum_creatinine_upper_normal_limit_value_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the numeric value of the upper normal limit for serum creatinine in mg/dL at the current time.","when_to_set_to_null":"Set to null if the upper normal limit for serum creatinine in mg/dL at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the upper normal limit for serum creatinine at the current time, measured in milligrams per deciliter (mg/dL)."} ;; "upper normal limit for serum creatinine"
(declare-const serum_creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current serum creatinine level in mg/dL.","when_to_set_to_null":"Set to null if the patient's current serum creatinine level in mg/dL is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current serum creatinine level, measured in milligrams per deciliter (mg/dL)."} ;; "serum creatinine greater than upper normal limit times 1.5"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Hepatic dysfunction definition: AST > 2x upper normal limit OR ALT > 2x upper normal limit
(assert
(! (= patient_has_finding_of_abnormal_liver_function_now
     (or
       (> aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
          (* 2 aspartate_aminotransferase_upper_normal_limit_value_now_withunit_u_per_l))
       (> alanine_aminotransferase_value_recorded_now_withunit_u_per_l
          (* 2 alanine_aminotransferase_upper_normal_limit_value_now_withunit_u_per_l))))
   :named REQ6_AUXILIARY0)) ;; "hepatic dysfunction defined as ((aspartate aminotransferase greater than upper normal limit times 2) OR (alanine aminotransferase greater than upper normal limit times 2))"

;; Renal dysfunction definition: serum creatinine > 1.5x upper normal limit
(assert
(! (= patient_has_finding_of_renal_impairment_now
     (> serum_creatinine_value_recorded_now_withunit_mg_per_dl
        (* 1.5 serum_creatinine_upper_normal_limit_value_now_withunit_mg_per_dl)))
   :named REQ6_AUXILIARY1)) ;; "renal dysfunction defined as (serum creatinine greater than upper normal limit times 1.5)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_abnormal_liver_function_now)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic dysfunction defined as ((aspartate aminotransferase greater than upper normal limit times 2) OR (alanine aminotransferase greater than upper normal limit times 2))."

(assert
(! (not patient_has_finding_of_renal_impairment_now)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal dysfunction defined as (serum creatinine greater than upper normal limit times 1.5)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_acute_inflammatory_status_needing_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute inflammatory status that requires treatment.","when_to_set_to_false":"Set to false if the patient currently does not have acute inflammatory status that requires treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute inflammatory status that requires treatment.","meaning":"Boolean indicating whether the patient currently has acute inflammatory status that requires treatment."} ;; "the patient has acute inflammatory status needing treatment"
(declare-const patient_has_chronic_inflammatory_status_needing_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic inflammatory status that requires treatment.","when_to_set_to_false":"Set to false if the patient currently does not have chronic inflammatory status that requires treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic inflammatory status that requires treatment.","meaning":"Boolean indicating whether the patient currently has chronic inflammatory status that requires treatment."} ;; "the patient has chronic inflammatory status needing treatment"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_acute_inflammatory_status_needing_treatment_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute inflammatory status needing treatment."

(assert
  (! (not patient_has_chronic_inflammatory_status_needing_treatment_now)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic inflammatory status needing treatment."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to hypotensive agents (antihypertensive drugs).","when_to_set_to_false":"Set to false if the patient is currently not exposed to hypotensive agents (antihypertensive drugs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to hypotensive agents (antihypertensive drugs).","meaning":"Boolean indicating whether the patient is currently exposed to hypotensive agents (antihypertensive drugs)."} ;; "antihypertensive drugs"
(declare-const patient_is_exposed_to_hypotensive_agent_now@@additional_exposure_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to hypotensive agents (antihypertensive drugs) is additional and occurs during the study period.","when_to_set_to_false":"Set to false if the patient's exposure to hypotensive agents is not additional or does not occur during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is additional and occurs during the study period.","meaning":"Boolean indicating whether the patient's exposure to hypotensive agents is additional and occurs during the study period."} ;; "needs additional antihypertensive drugs during the study"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_hypotensive_agent_now@@additional_exposure_during_study
       patient_is_exposed_to_hypotensive_agent_now)
   :named REQ8_AUXILIARY0)) ;; "patient needs additional antihypertensive drugs during the study" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_exposed_to_hypotensive_agent_now@@additional_exposure_during_study)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs additional antihypertensive drugs during the study."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament (medication) now.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any drug or medicament (medication) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament (medication) now.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament (medication) now."} ;; "medications"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the medication the patient is currently exposed to is concomitant (administered together with the study intervention).","when_to_set_to_false":"Set to false if the medication is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication is concomitant.","meaning":"Boolean indicating whether the medication is concomitant with the study intervention."} ;; "concomitant medications"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@known_to_affect_blood_pressure Bool) ;; {"when_to_set_to_true":"Set to true if the medication the patient is currently exposed to is known to affect blood pressure.","when_to_set_to_false":"Set to false if the medication is not known to affect blood pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication is known to affect blood pressure.","meaning":"Boolean indicating whether the medication is known to affect blood pressure."} ;; "medications known to affect blood pressure"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@needed_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the medication the patient is currently exposed to is needed during the study period.","when_to_set_to_false":"Set to false if the medication is not needed during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication is needed during the study period.","meaning":"Boolean indicating whether the medication is needed during the study period."} ;; "medications needed during the study period"

(declare-const patient_needs_concomitant_medication_known_to_affect_blood_pressure_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient needs concomitant medications that are known to affect blood pressure during the study period.","when_to_set_to_false":"Set to false if the patient does not need concomitant medications that are known to affect blood pressure during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient needs concomitant medications that are known to affect blood pressure during the study period.","meaning":"Boolean indicating whether the patient needs concomitant medications that are known to affect blood pressure during the study period."} ;; "needs concomitant medications known to affect blood pressure during the study"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: patient_needs_concomitant_medication_known_to_affect_blood_pressure_during_study is true iff the patient is exposed to a drug/medicament that is concomitant, known to affect blood pressure, and needed during the study
(assert
(! (= patient_needs_concomitant_medication_known_to_affect_blood_pressure_during_study
     (and patient_is_exposed_to_drug_or_medicament_now@@concomitant
          patient_is_exposed_to_drug_or_medicament_now@@known_to_affect_blood_pressure
          patient_is_exposed_to_drug_or_medicament_now@@needed_during_study))
   :named REQ9_AUXILIARY0)) ;; "needs concomitant medications known to affect blood pressure during the study"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@concomitant
       patient_is_exposed_to_drug_or_medicament_now)
   :named REQ9_AUXILIARY1)) ;; "concomitant medications"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@known_to_affect_blood_pressure
       patient_is_exposed_to_drug_or_medicament_now)
   :named REQ9_AUXILIARY2)) ;; "medications known to affect blood pressure"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@needed_during_study
       patient_is_exposed_to_drug_or_medicament_now)
   :named REQ9_AUXILIARY3)) ;; "medications needed during the study period"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_needs_concomitant_medication_known_to_affect_blood_pressure_during_study)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient needs concomitant medications known to affect blood pressure during the study)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_angioedema_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of angioedema at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of angioedema in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had angioedema.","meaning":"Boolean indicating whether the patient has ever had angioedema in their medical history."} ;; "angioedema"
(declare-const patient_has_finding_of_angioedema_inthehistory@@related_to_angiotensin_converting_enzyme_inhibitor Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angioedema in their history was related to angiotensin-converting enzyme inhibitor exposure.","when_to_set_to_false":"Set to false if the patient's angioedema in their history was not related to angiotensin-converting enzyme inhibitor exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angioedema was related to angiotensin-converting enzyme inhibitor exposure.","meaning":"Boolean indicating whether the patient's historical angioedema was related to angiotensin-converting enzyme inhibitor exposure."} ;; "the patient has a history of angioedema related to angiotensin-converting enzyme inhibitor"
(declare-const patient_has_finding_of_angioedema_inthehistory@@related_to_angiotensin_ii_receptor_blocker Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angioedema in their history was related to angiotensin II receptor blocker exposure.","when_to_set_to_false":"Set to false if the patient's angioedema in their history was not related to angiotensin II receptor blocker exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angioedema was related to angiotensin II receptor blocker exposure.","meaning":"Boolean indicating whether the patient's historical angioedema was related to angiotensin II receptor blocker exposure."} ;; "the patient has a history of angioedema related to angiotensin II receptor blocker"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_angioedema_inthehistory@@related_to_angiotensin_converting_enzyme_inhibitor
      patient_has_finding_of_angioedema_inthehistory)
   :named REQ10_AUXILIARY0)) ;; "the patient has a history of angioedema related to angiotensin-converting enzyme inhibitor"

(assert
(! (=> patient_has_finding_of_angioedema_inthehistory@@related_to_angiotensin_ii_receptor_blocker
      patient_has_finding_of_angioedema_inthehistory)
   :named REQ10_AUXILIARY1)) ;; "the patient has a history of angioedema related to angiotensin II receptor blocker"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_angioedema_inthehistory@@related_to_angiotensin_converting_enzyme_inhibitor)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of angioedema related to angiotensin-converting enzyme inhibitor."

(assert
(! (not patient_has_finding_of_angioedema_inthehistory@@related_to_angiotensin_ii_receptor_blocker)
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of angioedema related to angiotensin II receptor blocker."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity condition documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity condition documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity condition in their history.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity condition in their history."} ;; "hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the hypersensitivity condition in the patient's history is known (confirmed, not suspected or uncertain).","when_to_set_to_false":"Set to false if the hypersensitivity condition in the patient's history is not known (suspected, uncertain, or not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition in the patient's history is known.","meaning":"Boolean indicating whether the hypersensitivity condition in the patient's history is known."} ;; "known hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@related_to_either_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the hypersensitivity condition in the patient's history is related to either study drug.","when_to_set_to_false":"Set to false if the hypersensitivity condition in the patient's history is not related to either study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition in the patient's history is related to either study drug.","meaning":"Boolean indicating whether the hypersensitivity condition in the patient's history is related to either study drug."} ;; "hypersensitivity related to either study drug"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@known
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ11_AUXILIARY0)) ;; "known hypersensitivity"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@related_to_either_study_drug
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ11_AUXILIARY1)) ;; "hypersensitivity related to either study drug"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@related_to_either_study_drug)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity related to either study drug."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_psychoactive_substance_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of psychoactive substance dependence (drug dependency) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of psychoactive substance dependence (drug dependency) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of psychoactive substance dependence (drug dependency).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of psychoactive substance dependence (drug dependency) in their history."} ;; "drug dependency"
(declare-const patient_has_diagnosis_of_alcohol_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of alcohol dependence (alcohol dependency) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of alcohol dependence (alcohol dependency) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of alcohol dependence (alcohol dependency).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of alcohol dependence (alcohol dependency) in their history."} ;; "alcohol dependency"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (or patient_has_diagnosis_of_psychoactive_substance_dependence_inthehistory
            patient_has_diagnosis_of_alcohol_dependence_inthehistory))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of drug dependency) OR (the patient has a history of alcohol dependency)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_active_inflammatory_bowel_syndrome_within_12_months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had active inflammatory bowel syndrome within twelve months prior to screening.","when_to_set_to_false":"Set to false if the patient has not had active inflammatory bowel syndrome within twelve months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had active inflammatory bowel syndrome within twelve months prior to screening.","meaning":"Boolean indicating whether the patient has had active inflammatory bowel syndrome within twelve months prior to screening."} ;; "active inflammatory bowel syndrome within twelve months prior to screening"
(declare-const patient_has_finding_of_difficulty_in_voiding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has difficulty in voiding.","when_to_set_to_false":"Set to false if the patient currently does not have difficulty in voiding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty in voiding.","meaning":"Boolean indicating whether the patient currently has difficulty in voiding."} ;; "difficulty in voiding"
(declare-const patient_has_finding_of_gastritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastritis.","when_to_set_to_false":"Set to false if the patient currently does not have gastritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastritis.","meaning":"Boolean indicating whether the patient currently has gastritis."} ;; "currently active gastritis"
(declare-const patient_has_finding_of_gastrointestinal_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastrointestinal hemorrhage (bleeding).","when_to_set_to_false":"Set to false if the patient currently does not have gastrointestinal hemorrhage (bleeding).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastrointestinal hemorrhage (bleeding).","meaning":"Boolean indicating whether the patient currently has gastrointestinal hemorrhage (bleeding)."} ;; "ulcers of gastrointestinal bleeding"
(declare-const patient_has_finding_of_impaired_pancreatic_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired pancreatic function.","when_to_set_to_false":"Set to false if the patient currently does not have impaired pancreatic function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired pancreatic function.","meaning":"Boolean indicating whether the patient currently has impaired pancreatic function."} ;; "impaired pancreatic function"
(declare-const patient_has_finding_of_pancreatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pancreatitis.","when_to_set_to_false":"Set to false if the patient currently does not have pancreatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pancreatitis.","meaning":"Boolean indicating whether the patient currently has pancreatitis."} ;; "pancreatitis"
(declare-const patient_has_finding_of_rectal_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has rectal hemorrhage (bleeding).","when_to_set_to_false":"Set to false if the patient currently does not have rectal hemorrhage (bleeding).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rectal hemorrhage (bleeding).","meaning":"Boolean indicating whether the patient currently has rectal hemorrhage (bleeding)."} ;; "ulcers of rectal bleeding"
(declare-const patient_has_finding_of_urinary_tract_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has urinary tract obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have urinary tract obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has urinary tract obstruction.","meaning":"Boolean indicating whether the patient currently has urinary tract obstruction."} ;; "obstructions of the urinary tract"
(declare-const patient_has_undergone_bypass_gastroenterostomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a gastroenterostomy (bypass) procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a gastroenterostomy (bypass) procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a gastroenterostomy (bypass) procedure.","meaning":"Boolean indicating whether the patient has ever undergone a gastroenterostomy (bypass) procedure."} ;; "gastroenterostomy, bypass"
(declare-const patient_has_undergone_gastrectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a gastrectomy procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a gastrectomy procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a gastrectomy procedure.","meaning":"Boolean indicating whether the patient has ever undergone a gastrectomy procedure."} ;; "gastrectomy"
(declare-const patient_has_undergone_gastrointestinal_tract_surgery_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone gastrointestinal tract surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone gastrointestinal tract surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone gastrointestinal tract surgery.","meaning":"Boolean indicating whether the patient has ever undergone gastrointestinal tract surgery at any time in the past."} ;; "gastrointestinal tract surgery"
(declare-const patients_excretory_function_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's excretory function is currently abnormal (i.e., significantly altered).","when_to_set_to_false":"Set to false if the patient's excretory function is currently normal (i.e., not significantly altered).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's excretory function is currently abnormal.","meaning":"Boolean indicating whether the patient's excretory function is currently abnormal."} ;; "excretion"
(declare-const patients_general_metabolic_function_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's general metabolic function is currently abnormal (i.e., significantly altered).","when_to_set_to_false":"Set to false if the patient's general metabolic function is currently normal (i.e., not significantly altered).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's general metabolic function is currently abnormal.","meaning":"Boolean indicating whether the patient's general metabolic function is currently abnormal."} ;; "metabolism"

;; ===================== Additional umbrella variables for surgical and medical conditions =====================
(declare-const patient_has_surgical_condition_altering_absorption_distribution_metabolism_or_excretion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any surgical condition that might significantly alter the absorption, distribution, metabolism, or excretion of investigational products.","when_to_set_to_false":"Set to false if the patient does not currently have any such surgical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any such surgical condition.","meaning":"Boolean indicating whether the patient currently has any surgical condition that might significantly alter the absorption, distribution, metabolism, or excretion of investigational products."} ;; "any surgical condition which might significantly alter the absorption, distribution, metabolism, or excretion of investigational products"
(declare-const patient_has_medical_condition_altering_absorption_distribution_metabolism_or_excretion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any medical condition that might significantly alter the absorption, distribution, metabolism, or excretion of investigational products.","when_to_set_to_false":"Set to false if the patient does not currently have any such medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any such medical condition.","meaning":"Boolean indicating whether the patient currently has any medical condition that might significantly alter the absorption, distribution, metabolism, or excretion of investigational products."} ;; "any medical condition which might significantly alter the absorption, distribution, metabolism, or excretion of investigational products"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive examples for surgical condition umbrella
(assert
(! (=> (or patient_has_undergone_gastrointestinal_tract_surgery_in_the_history
          patient_has_undergone_gastrectomy_inthehistory
          patient_has_undergone_bypass_gastroenterostomy_inthehistory
          patient_has_finding_of_active_inflammatory_bowel_syndrome_within_12_months_prior_to_screening
          patient_has_finding_of_gastritis_now
          patient_has_finding_of_gastrointestinal_hemorrhage_now
          patient_has_finding_of_rectal_hemorrhage_now
          patient_has_finding_of_impaired_pancreatic_function_now
          patient_has_finding_of_pancreatitis_now
          patient_has_finding_of_urinary_tract_obstruction_now
          patient_has_finding_of_difficulty_in_voiding_now
          patients_excretory_function_is_abnormal_now
          patients_general_metabolic_function_is_abnormal_now)
    patient_has_surgical_condition_altering_absorption_distribution_metabolism_or_excretion_now)
:named REQ13_AUXILIARY0)) ;; "with non-exhaustive examples (gastrointestinal tract surgery with non-exhaustive examples (gastrectomy, gastroenterostomy, bypass), active inflammatory bowel syndrome within twelve months prior to screening, currently active gastritis, ulcers of gastrointestinal bleeding, ulcers of rectal bleeding, impaired pancreatic function with non-exhaustive examples (pancreatitis), obstructions of the urinary tract, difficulty in voiding)"

;; Non-exhaustive examples for medical condition umbrella
(assert
(! (=> (or patient_has_undergone_gastrointestinal_tract_surgery_in_the_history
          patient_has_undergone_gastrectomy_inthehistory
          patient_has_undergone_bypass_gastroenterostomy_inthehistory
          patient_has_finding_of_active_inflammatory_bowel_syndrome_within_12_months_prior_to_screening
          patient_has_finding_of_gastritis_now
          patient_has_finding_of_gastrointestinal_hemorrhage_now
          patient_has_finding_of_rectal_hemorrhage_now
          patient_has_finding_of_impaired_pancreatic_function_now
          patient_has_finding_of_pancreatitis_now
          patient_has_finding_of_urinary_tract_obstruction_now
          patient_has_finding_of_difficulty_in_voiding_now
          patients_excretory_function_is_abnormal_now
          patients_general_metabolic_function_is_abnormal_now)
    patient_has_medical_condition_altering_absorption_distribution_metabolism_or_excretion_now)
:named REQ13_AUXILIARY1)) ;; "with non-exhaustive examples (gastrointestinal tract surgery with non-exhaustive examples (gastrectomy, gastroenterostomy, bypass), active inflammatory bowel syndrome within twelve months prior to screening, currently active gastritis, ulcers of gastrointestinal bleeding, ulcers of rectal bleeding, impaired pancreatic function with non-exhaustive examples (pancreatitis), obstructions of the urinary tract, difficulty in voiding)"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_surgical_condition_altering_absorption_distribution_metabolism_or_excretion_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "any surgical condition which might significantly alter the absorption, distribution, metabolism, or excretion of investigational products"

(assert
(! (not patient_has_medical_condition_altering_absorption_distribution_metabolism_or_excretion_now)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "any medical condition which might significantly alter the absorption, distribution, metabolism, or excretion of investigational products"

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_cannot_swallow_investigational_products_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently cannot swallow investigational products.","when_to_set_to_false":"Set to false if the patient currently can swallow investigational products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently cannot swallow investigational products.","meaning":"Boolean indicating whether the patient currently cannot swallow investigational products."} ;; "cannot swallow investigational products"
(declare-const patients_ability_to_swallow_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to swallow.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to swallow.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to swallow.","meaning":"Boolean indicating whether the patient currently has the ability to swallow."} ;; "swallow"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; The patient cannot swallow investigational products if and only if the patient's ability to swallow is not positive
(assert
(! (= patient_cannot_swallow_investigational_products_now
   (not patients_ability_to_swallow_is_positive_now))
:named REQ14_AUXILIARY0)) ;; "cannot swallow investigational products"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_cannot_swallow_investigational_products_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient cannot swallow investigational products."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_received_administration_of_other_study_drugs_within_4_weeks_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received administration of other study drugs at any time within the four weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not received administration of other study drugs within the four weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received administration of other study drugs within the four weeks prior to randomization.","meaning":"Boolean indicating whether the patient has received administration of other study drugs within four weeks prior to randomization."} ;; "administration of other study drugs within four weeks prior to randomization"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_received_administration_of_other_study_drugs_within_4_weeks_prior_to_randomization)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had administration of other study drugs within four weeks prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown or not documented.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."} ;; "the patient is a premenopausal woman (last menstruation less than one year)"
(declare-const patient_last_menstruation_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the number of years since the patient's last menstruation, as recorded at the current time.","when_to_set_to_null":"Set to null if the number of years since the patient's last menstruation is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of years since the patient's last menstruation, recorded at the current time."} ;; "last menstruation less than one year"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@adequate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and the contraception is considered adequate.","when_to_set_to_false":"Set to false if the patient is currently using contraception but it is not considered adequate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception used is adequate.","meaning":"Boolean indicating whether the contraception currently used by the patient is adequate."} ;; "adequate contraception"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or not documented.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or not documented.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Adequate contraception implies contraception
(assert
(! (=> patient_has_finding_of_contraception_now@@adequate
       patient_has_finding_of_contraception_now)
   :named REQ16_AUXILIARY0)) ;; "contraception" and "adequate contraception"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: (premenopausal woman (last menstruation < 1 year) AND not using adequate contraception)
(assert
(! (not (and patient_sex_is_female_now
             (< patient_last_menstruation_value_recorded_now_withunit_years 1)
             (not patient_has_finding_of_contraception_now@@adequate)))
   :named REQ16_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is a premenopausal woman (last menstruation less than one year) and the patient is not using adequate contraception"

;; Exclusion: patient is pregnant
(assert
(! (not patient_is_pregnant_now)
   :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is pregnant"

;; Exclusion: patient is breast-feeding
(assert
(! (not patient_is_breastfeeding_now)
   :named REQ16_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is breast-feeding"

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant neoplastic disease (malignancy) within the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant neoplastic disease (malignancy) within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant neoplastic disease (malignancy) within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant neoplastic disease (malignancy) within the past five years."} ;; "malignancy within the past five years"
(declare-const patient_has_diagnosis_of_leukemia_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of leukemia within the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of leukemia within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of leukemia within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of leukemia within the past five years."} ;; "leukemia within the past five years"
(declare-const patient_has_diagnosis_of_malignant_lymphoma_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant lymphoma within the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant lymphoma within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant lymphoma within the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant lymphoma within the past five years."} ;; "lymphoma within the past five years"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Non-exhaustive examples: leukemia or lymphoma are examples of malignancy
(assert
(! (=> (or patient_has_diagnosis_of_leukemia_inthepast5years
          patient_has_diagnosis_of_malignant_lymphoma_inthepast5years)
     patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years)
:named REQ17_AUXILIARY0)) ;; "including leukemia or lymphoma within the past five years"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malignancy including leukemia or lymphoma within the past five years."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const investigator_judges_patient_should_be_excluded Bool) ;; {"when_to_set_to_true":"Set to true if, in the investigator's judgment, the patient should be excluded from the study.","when_to_set_to_false":"Set to false if, in the investigator's judgment, the patient should not be excluded from the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the investigator's judgment, the patient should be excluded from the study.","meaning":"Boolean indicating whether, in the investigator's judgment, the patient should be excluded from the study."} ;; "in the investigator's judgment, the patient should be excluded"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not investigator_judges_patient_should_be_excluded)
:named REQ18_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if, in the investigator's judgment, the patient should be excluded."
