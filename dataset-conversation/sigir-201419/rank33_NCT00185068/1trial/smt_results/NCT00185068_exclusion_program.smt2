;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_hypertensive_encephalopathy_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of hypertensive encephalopathy within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of hypertensive encephalopathy within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of hypertensive encephalopathy within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of hypertensive encephalopathy within the past 6 months."} ;; "hypertensive encephalopathy within the past 6 months"

(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of stroke (cerebrovascular accident) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of stroke (cerebrovascular accident) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of stroke (cerebrovascular accident) within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of stroke (cerebrovascular accident) within the past 6 months."} ;; "stroke within the past 6 months"

(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of transient ischemic attack within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of transient ischemic attack within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of transient ischemic attack within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of transient ischemic attack within the past 6 months."} ;; "transient ischemic attack within the past 6 months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_hypertensive_encephalopathy_inthepast6months)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had hypertensive encephalopathy within the past 6 months."

(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthepast6months)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had stroke within the past 6 months."

(assert
(! (not patient_has_diagnosis_of_transient_cerebral_ischemia_inthepast6months)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had transient ischemic attack within the past 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of myocardial infarction within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of myocardial infarction within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of myocardial infarction within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of myocardial infarction within the past 6 months."} ;; "history of myocardial infarction within the past 6 months"
(declare-const patient_has_undergone_percutaneous_transluminal_coronary_revascularization_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous transluminal coronary revascularization within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous transluminal coronary revascularization within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous transluminal coronary revascularization within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone percutaneous transluminal coronary revascularization within the past 6 months."} ;; "history of percutaneous transluminal coronary revascularization within the past 6 months"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass graft within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass graft within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass graft within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass graft within the past 6 months."} ;; "history of coronary artery bypass graft within the past 6 months"
(declare-const patient_has_diagnosis_of_angina_pectoris_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of angina pectoris within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of angina pectoris within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of angina pectoris within the past 6 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of angina pectoris within the past 6 months."} ;; "history of unstable angina pectoris within the past 6 months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthepast6months)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had history of myocardial infarction within the past 6 months."

(assert
(! (not patient_has_undergone_percutaneous_transluminal_coronary_revascularization_inthepast6months)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had history of percutaneous transluminal coronary revascularization within the past 6 months."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthepast6months)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had history of coronary artery bypass graft within the past 6 months."

(assert
(! (not patient_has_diagnosis_of_angina_pectoris_inthepast6months)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had history of unstable angina pectoris within the past 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's diastolic blood pressure measured in mmHg at the present time.","when_to_set_to_null":"Set to null if the patient's diastolic blood pressure value at the present time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's diastolic blood pressure in mmHg measured now."} ;; "diastolic blood pressure greater than or equal to 110 millimeters of mercury"
(declare-const systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's systolic blood pressure measured in mmHg at the present time.","when_to_set_to_null":"Set to null if the patient's systolic blood pressure value at the present time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's systolic blood pressure in mmHg measured now."} ;; "systolic blood pressure greater than 200 millimeters of mercury"
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a hypertensive disorder (hypertension) now."} ;; "hypertension"

(declare-const patient_has_finding_of_hypertensive_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of severe hypertensive disorder (severe hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of severe hypertensive disorder (severe hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of severe hypertensive disorder (severe hypertension).","meaning":"Boolean indicating whether the patient currently has a severe hypertensive disorder (severe hypertension) now."} ;; "severe hypertension"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: severe hypertension = (diastolic BP >= 110 mmHg) OR (systolic BP > 200 mmHg)
(assert
(! (= patient_has_finding_of_hypertensive_disorder_now@@severe
(or (>= diastolic_blood_pressure_value_recorded_now_withunit_mmhg 110)
    (> systolic_blood_pressure_value_recorded_now_withunit_mmhg 200)))
:named REQ2_AUXILIARY0)) ;; "defined as (diastolic blood pressure greater than or equal to 110 millimeters of mercury) OR (systolic blood pressure greater than 200 millimeters of mercury)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@severe
      patient_has_finding_of_hypertensive_disorder_now)
:named REQ2_AUXILIARY1)) ;; "severe hypertension" implies "hypertensive disorder"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_hypertensive_disorder_now@@severe)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypertension, defined as diastolic blood pressure greater than or equal to 110 millimeters of mercury OR systolic blood pressure greater than 200 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_secondary_hypertension_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with secondary hypertension at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with secondary hypertension at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with secondary hypertension.","meaning":"Boolean indicating whether the patient has a history of secondary hypertension."} ;; "history of secondary hypertension"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with kidney disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with kidney disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with kidney disease.","meaning":"Boolean indicating whether the patient has a history of kidney disease."} ;; "history of renal disease"
(declare-const patient_has_diagnosis_of_pheochromocytoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with pheochromocytoma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with pheochromocytoma at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with pheochromocytoma.","meaning":"Boolean indicating whether the patient has a history of pheochromocytoma."} ;; "history of phaeochromocytoma"
(declare-const patient_has_diagnosis_of_pituitary_dependent_hypercortisolism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with pituitary-dependent hypercortisolism (Cushing's disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with pituitary-dependent hypercortisolism (Cushing's disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with pituitary-dependent hypercortisolism (Cushing's disease).","meaning":"Boolean indicating whether the patient has a history of pituitary-dependent hypercortisolism (Cushing's disease)."} ;; "history of Cushing's disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_kidney_disease_inthehistory
          patient_has_diagnosis_of_pheochromocytoma_inthehistory
          patient_has_diagnosis_of_pituitary_dependent_hypercortisolism_inthehistory)
    patient_has_diagnosis_of_secondary_hypertension_inthehistory)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((history of renal disease) OR (history of phaeochromocytoma) OR (history of Cushing's disease))."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_secondary_hypertension_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of secondary hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus."} ;; "type I diabetes mellitus"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has type I diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_bradycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bradycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bradycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bradycardia.","meaning":"Boolean indicating whether the patient currently has bradycardia."} ;; "bradycardia"
(declare-const patient_has_finding_of_bradycardia_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bradycardia is symptomatic.","when_to_set_to_false":"Set to false if the patient's bradycardia is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bradycardia is symptomatic.","meaning":"Boolean indicating whether the patient's bradycardia is symptomatic."} ;; "symptomatic bradycardia"
(declare-const patient_has_finding_of_bradycardia_now@@at_rest Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bradycardia occurs at rest.","when_to_set_to_false":"Set to false if the patient's bradycardia does not occur at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bradycardia occurs at rest.","meaning":"Boolean indicating whether the patient's bradycardia occurs at rest."} ;; "resting bradycardia"
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac valvular disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac valvular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiac valvular disease.","meaning":"Boolean indicating whether the patient currently has cardiac valvular disease."} ;; "cardiac valvular disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@hemodynamically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac valvular disease is hemodynamically significant.","when_to_set_to_false":"Set to false if the patient's cardiac valvular disease is not hemodynamically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac valvular disease is hemodynamically significant.","meaning":"Boolean indicating whether the patient's cardiac valvular disease is hemodynamically significant."} ;; "hemodynamically significant cardiac valvular disease"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bradycardia_now@@symptomatic
       patient_has_finding_of_bradycardia_now)
    :named REQ5_AUXILIARY0)) ;; "symptomatic bradycardia"

(assert
(! (=> patient_has_finding_of_bradycardia_now@@at_rest
       patient_has_finding_of_bradycardia_now)
    :named REQ5_AUXILIARY1)) ;; "resting bradycardia"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@hemodynamically_significant
       patient_has_finding_of_heart_valve_disorder_now)
    :named REQ5_AUXILIARY2)) ;; "hemodynamically significant cardiac valvular disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_has_finding_of_bradycardia_now@@symptomatic
             patient_has_finding_of_bradycardia_now@@at_rest))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "evidence of symptomatic resting bradycardia"

(assert
(! (not patient_has_finding_of_congestive_heart_failure_now)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "evidence of congestive heart failure"

(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@hemodynamically_significant)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "evidence of hemodynamically significant cardiac valvular disease"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_heart_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any degree of heart block.","when_to_set_to_false":"Set to false if the patient currently does not have any degree of heart block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart block.","meaning":"Boolean indicating whether the patient currently has heart block (any degree) now."} ;; "presence of heart block"
(declare-const patient_has_finding_of_heart_block_now@@greater_than_first_degree Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart block and the degree is greater than first degree.","when_to_set_to_false":"Set to false if the patient currently has heart block but the degree is first degree or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the degree of heart block is greater than first degree.","meaning":"Boolean indicating whether the patient currently has heart block and the degree is greater than first degree."} ;; "presence of heart block greater than first degree"
(declare-const patient_has_finding_of_sinoatrial_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sinoatrial block.","when_to_set_to_false":"Set to false if the patient currently does not have sinoatrial block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinoatrial block.","meaning":"Boolean indicating whether the patient currently has sinoatrial block now."} ;; "presence of sinoatrial block"
(declare-const patient_has_finding_of_wolff_parkinson_white_pattern_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Wolff-Parkinson-White syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have Wolff-Parkinson-White syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Wolff-Parkinson-White syndrome.","meaning":"Boolean indicating whether the patient currently has Wolff-Parkinson-White syndrome now."} ;; "presence of Wolff-Parkinson-White syndrome"
(declare-const patient_has_finding_of_sick_sinus_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sick sinus syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have sick sinus syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sick sinus syndrome.","meaning":"Boolean indicating whether the patient currently has sick sinus syndrome now."} ;; "presence of sick sinus syndrome"
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has atrial fibrillation now."} ;; "presence of atrial fibrillation"
(declare-const patient_has_finding_of_atrial_flutter_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrial flutter.","when_to_set_to_false":"Set to false if the patient currently does not have atrial flutter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial flutter.","meaning":"Boolean indicating whether the patient currently has atrial flutter now."} ;; "presence of atrial flutter"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_block_now@@greater_than_first_degree
      patient_has_finding_of_heart_block_now)
   :named REQ6_AUXILIARY0)) ;; "presence of heart block greater than first degree" implies "presence of heart block"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_heart_block_now@@greater_than_first_degree)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "presence of heart block greater than first degree"
(assert
(! (not patient_has_finding_of_sinoatrial_block_now)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "presence of sinoatrial block"
(assert
(! (not patient_has_finding_of_wolff_parkinson_white_pattern_now)
   :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "presence of Wolff-Parkinson-White syndrome"
(assert
(! (not patient_has_finding_of_sick_sinus_syndrome_now)
   :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "presence of sick sinus syndrome"
(assert
(! (not patient_has_finding_of_atrial_fibrillation_now)
   :named REQ6_COMPONENT4_OTHER_REQUIREMENTS)) ;; "presence of atrial fibrillation"
(assert
(! (not patient_has_finding_of_atrial_flutter_now)
   :named REQ6_COMPONENT5_OTHER_REQUIREMENTS)) ;; "presence of atrial flutter"

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_laboratory_test_value_considered_clinically_significant_by_investigator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one laboratory test value that is considered clinically significant by the investigator.","when_to_set_to_false":"Set to false if the patient currently does not have any laboratory test value considered clinically significant by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any laboratory test value considered clinically significant by the investigator.","meaning":"Boolean indicating whether the patient currently has any laboratory test value considered clinically significant by the investigator."} ;; "laboratory test values considered clinically significant by the investigator"

(declare-const patient_has_laboratory_test_value_considered_clinically_significant_by_investigator_now@@considered_clinically_significant_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the laboratory test value is considered clinically significant by the investigator.","when_to_set_to_false":"Set to false if the laboratory test value is not considered clinically significant by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the laboratory test value is considered clinically significant by the investigator.","meaning":"Boolean indicating whether the laboratory test value is considered clinically significant by the investigator."} ;; "considered clinically significant by the investigator"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_laboratory_test_value_considered_clinically_significant_by_investigator_now@@considered_clinically_significant_by_investigator
     patient_has_laboratory_test_value_considered_clinically_significant_by_investigator_now)
:named REQ7_AUXILIARY0)) ;; "laboratory test values considered clinically significant by the investigator"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_laboratory_test_value_considered_clinically_significant_by_investigator_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has laboratory test values considered clinically significant by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or evidence of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or evidence of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or evidence of liver disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis or evidence of liver disease."} ;; "evidence of liver disease"

(declare-const patient_aspartate_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of serum glutamic-oxaloacetic transaminase (AST/SGOT) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum glutamic-oxaloacetic transaminase (AST/SGOT) measurement."} ;; "serum glutamic-oxaloacetic transaminase"

(declare-const patient_serum_glutamic_oxaloacetic_transaminase_upper_limit_of_normal_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal if available for the patient's current serum glutamic-oxaloacetic transaminase (AST/SGOT) measurement.","when_to_set_to_null":"Set to null if the reference value is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for the patient's current serum glutamic-oxaloacetic transaminase (AST/SGOT) measurement, in the same unit as the measurement."} ;; "upper limit of normal for serum glutamic-oxaloacetic transaminase"

(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of serum glutamic-pyruvic transaminase (ALT/SGPT) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum glutamic-pyruvic transaminase (ALT/SGPT) measurement."} ;; "serum glutamic-pyruvic transaminase"

(declare-const patient_serum_glutamic_pyruvic_transaminase_upper_limit_of_normal_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal if available for the patient's current serum glutamic-pyruvic transaminase (ALT/SGPT) measurement.","when_to_set_to_null":"Set to null if the reference value is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for the patient's current serum glutamic-pyruvic transaminase (ALT/SGPT) measurement, in the same unit as the measurement."} ;; "upper limit of normal for serum glutamic-pyruvic transaminase"

(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of total bilirubin is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current total bilirubin measurement."} ;; "total bilirubin"

(declare-const patient_bilirubin_total_upper_limit_of_normal_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal if available for the patient's current total bilirubin measurement.","when_to_set_to_null":"Set to null if the reference value is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for the patient's current total bilirubin measurement, in the same unit as the measurement."} ;; "upper limit of normal for total bilirubin"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: evidence of liver disease as indicated by at least one abnormal lab value
(assert
(! (= patient_has_diagnosis_of_disease_of_liver_now
     (or
       (> patient_aspartate_aminotransferase_measurement_value_recorded_now_withunit_unit
          (* 3 patient_serum_glutamic_oxaloacetic_transaminase_upper_limit_of_normal_value_recorded_now_withunit_unit))
       (> patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
          (* 3 patient_serum_glutamic_pyruvic_transaminase_upper_limit_of_normal_value_recorded_now_withunit_unit))
       (> patient_bilirubin_total_measurement_value_recorded_now_withunit_unit
          (* 3 patient_bilirubin_total_upper_limit_of_normal_value_recorded_now_withunit_unit))
     ))
:named REQ8_AUXILIARY0)) ;; "evidence of liver disease as indicated by at least one of the following: (serum glutamic-oxaloacetic transaminase > 3x ULN) OR (serum glutamic-pyruvic transaminase > 3x ULN) OR (total bilirubin > 3x ULN)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of liver disease as indicated by at least one of the following: (serum glutamic-oxaloacetic transaminase greater than 3 times the upper limit of normal) OR (serum glutamic-pyruvic transaminase greater than 3 times the upper limit of normal) OR (total bilirubin greater than 3 times the upper limit of normal)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant neoplastic disease (malignancy) at any time during the past five years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant neoplastic disease (malignancy) at any time during the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant neoplastic disease (malignancy) during the past five years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant neoplastic disease (malignancy) during the past five years."} ;; "malignancy during the past five years"

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excluding_if_all_are_squamous_cell_carcinoma_of_the_skin_or_basal_cell_carcinoma_of_the_skin Bool) ;; {"when_to_set_to_true":"Set to true if all malignant neoplastic diseases (malignancies) diagnosed in the past five years are squamous cell carcinoma of the skin or basal cell carcinoma of the skin.","when_to_set_to_false":"Set to false if any malignant neoplastic disease diagnosed in the past five years is not squamous cell carcinoma of the skin or basal cell carcinoma of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether all malignancies in the past five years are squamous cell carcinoma of the skin or basal cell carcinoma of the skin.","meaning":"Boolean indicating whether all malignancies diagnosed in the past five years are squamous cell carcinoma of the skin or basal cell carcinoma of the skin."} ;; "EXCEPT if all such malignancies are squamous cell carcinoma of the skin OR basal cell carcinoma of the skin"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
             (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excluding_if_all_are_squamous_cell_carcinoma_of_the_skin_or_basal_cell_carcinoma_of_the_skin)))
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any malignancy during the past five years, EXCEPT if all such malignancies are squamous cell carcinoma of the skin OR basal cell carcinoma of the skin."
