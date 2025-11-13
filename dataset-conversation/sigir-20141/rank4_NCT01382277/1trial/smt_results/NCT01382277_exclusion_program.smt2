;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of acute myocardial infarction within the past six months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of acute myocardial infarction within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of acute myocardial infarction within the past six months.","meaning":"Boolean indicating whether the patient has had a diagnosis of acute myocardial infarction within the past six months."} ;; "acute myocardial infarction within six months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_acute_myocardial_infarction_inthepast6months)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had acute myocardial infarction within six months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention at any time in the past."} ;; "percutaneous coronary intervention"

(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within6months Bool) ;; {"when_to_set_to_true":"Set to true if the percutaneous coronary intervention was performed within the last six months.","when_to_set_to_false":"Set to false if the percutaneous coronary intervention was not performed within the last six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention was performed within the last six months.","meaning":"Boolean indicating whether the percutaneous coronary intervention was performed within the last six months."} ;; "percutaneous coronary intervention therapy within six months"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass grafting at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass grafting at any time in the past."} ;; "coronary artery bypass grafting"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months Bool) ;; {"when_to_set_to_true":"Set to true if the coronary artery bypass grafting was performed within the last six months.","when_to_set_to_false":"Set to false if the coronary artery bypass grafting was not performed within the last six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery bypass grafting was performed within the last six months.","meaning":"Boolean indicating whether the coronary artery bypass grafting was performed within the last six months."} ;; "coronary artery bypass grafting therapy within six months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within6months
      patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
:named REQ1_AUXILIARY0)) ;; "percutaneous coronary intervention therapy within six months"

(assert
(! (=> patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months
      patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ1_AUXILIARY1)) ;; "coronary artery bypass grafting therapy within six months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within6months)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received percutaneous coronary intervention therapy within six months."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received coronary artery bypass grafting therapy within six months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_will_undergo_percutaneous_coronary_intervention_inthefuture3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is anticipated to undergo percutaneous coronary intervention within the next three months.","when_to_set_to_false":"Set to false if the patient is not anticipated to undergo percutaneous coronary intervention within the next three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is anticipated to undergo percutaneous coronary intervention within the next three months.","meaning":"Boolean indicating whether the patient is anticipated to undergo percutaneous coronary intervention within the next three months."} ;; "the patient is anticipated to receive percutaneous coronary intervention therapy in the following three months"
(declare-const patient_will_undergo_coronary_artery_bypass_graft_inthefuture3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is anticipated to undergo coronary artery bypass grafting within the next three months.","when_to_set_to_false":"Set to false if the patient is not anticipated to undergo coronary artery bypass grafting within the next three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is anticipated to undergo coronary artery bypass grafting within the next three months.","meaning":"Boolean indicating whether the patient is anticipated to undergo coronary artery bypass grafting within the next three months."} ;; "the patient is anticipated to receive coronary artery bypass grafting therapy in the following three months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_will_undergo_percutaneous_coronary_intervention_inthefuture3months)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is anticipated to receive percutaneous coronary intervention therapy in the following three months."

(assert
(! (not patient_will_undergo_coronary_artery_bypass_graft_inthefuture3months)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is anticipated to receive coronary artery bypass grafting therapy in the following three months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_troponin_i_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric troponin I measurement recorded now is available, with the appropriate unit (e.g., ng/mL).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's troponin I measurement recorded now."} ;; "troponin I level"
(declare-const patient_troponin_t_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric troponin T measurement recorded now is available, with the appropriate unit (e.g., ng/mL).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's troponin T measurement recorded now."} ;; "troponin T level"
(declare-const troponin_i_upper_limit_of_normal_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for troponin I, with the appropriate unit (e.g., ng/mL).","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value representing the upper limit of normal for troponin I."} ;; "upper limit of normal for troponin I"
(declare-const troponin_t_upper_limit_of_normal_value_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for troponin T, with the appropriate unit (e.g., ng/mL).","when_to_set_to_null":"Set to null if the reference value is unavailable or indeterminate.","meaning":"Numeric value representing the upper limit of normal for troponin T."} ;; "upper limit of normal for troponin T"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (> patient_troponin_i_measurement_value_recorded_now_withunit_unit troponin_i_upper_limit_of_normal_value_withunit_unit))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has troponin I level greater than the upper limit of normal."

(assert
(! (not (> patient_troponin_t_measurement_value_recorded_now_withunit_unit troponin_t_upper_limit_of_normal_value_withunit_unit))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has troponin T level greater than the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "cardiac failure"

(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is classified as NYHA class III.","when_to_set_to_false":"Set to false if the patient's current heart failure is not classified as NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is NYHA class III.","meaning":"Boolean indicating whether the patient's current heart failure is NYHA class III."} ;; "cardiac failure New York Heart Association class III"

(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient's current heart failure is not classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is NYHA class IV.","meaning":"Boolean indicating whether the patient's current heart failure is NYHA class IV."} ;; "cardiac failure New York Heart Association class IV"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_iii
      patient_has_finding_of_heart_failure_now)
:named REQ4_AUXILIARY0)) ;; "cardiac failure New York Heart Association class III"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_iv
      patient_has_finding_of_heart_failure_now)
:named REQ4_AUXILIARY1)) ;; "cardiac failure New York Heart Association class IV"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_class_iii)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac failure New York Heart Association class III."

(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_class_iv)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac failure New York Heart Association class IV."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const coronary_artery_left_main_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if the degree of stenosis in the patient's coronary artery left main is recorded at the current time.","when_to_set_to_null":"Set to null if the percentage of stenosis in the patient's coronary artery left main is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the percentage of stenosis in the patient's coronary artery left main, recorded at the current time, with unit percent."} ;; "coronary artery left main stenosis greater than fifty percent"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (> coronary_artery_left_main_stenosis_value_recorded_now_withunit_percent 50))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary artery left main stenosis greater than fifty percent."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_can_undergo_coronary_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs (is a candidate for) coronary angiography, regardless of urgency or context.","when_to_set_to_false":"Set to false if the patient currently does not need (is not a candidate for) coronary angiography, regardless of urgency or context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs coronary angiography.","meaning":"Boolean indicating whether the patient currently needs coronary angiography, regardless of urgency or context."} ;; "coronary angiography"
(declare-const patient_can_undergo_coronary_angiography_now@@emergency_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient's need for coronary angiography is specifically in an emergency context.","when_to_set_to_false":"Set to false if the patient's need for coronary angiography is not in an emergency context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the need for coronary angiography is in an emergency context.","meaning":"Boolean indicating whether the patient's need for coronary angiography is specifically in an emergency context."} ;; "emergency coronary angiography"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_can_undergo_coronary_angiography_now@@emergency_context
      patient_can_undergo_coronary_angiography_now)
:named REQ6_AUXILIARY0)) ;; "emergency context implies need for coronary angiography"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_can_undergo_coronary_angiography_now@@emergency_context)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs emergency coronary angiography."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has a finding of cardiac arrhythmia."} ;; "arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac arrhythmia is serious.","when_to_set_to_false":"Set to false if the patient's current cardiac arrhythmia is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac arrhythmia is serious.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is serious."} ;; "serious arrhythmia"
(declare-const patient_has_finding_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of tachycardia.","meaning":"Boolean indicating whether the patient currently has a finding of tachycardia."} ;; "tachycardia"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@serious
       patient_has_finding_of_cardiac_arrhythmia_now)
   :named REQ7_AUXILIARY0)) ;; "serious arrhythmia" implies "arrhythmia"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have serious arrhythmia
(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_now@@serious)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious arrhythmia."

;; Exclusion: patient must NOT have tachycardia
(assert
(! (not patient_has_finding_of_tachycardia_now)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tachycardia."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_secondary_hyperlipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding or diagnosis of secondary hyperlipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding or diagnosis of secondary hyperlipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hyperlipidemia.","meaning":"Boolean indicating whether the patient currently has secondary hyperlipidemia."} ;; "secondary hyperlipidemia"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_secondary_hyperlipidemia_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hyperlipidemia."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_familial_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of familial hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of familial hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of familial hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of familial hypercholesterolemia."} ;; "familial hypercholesterolemia"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_familial_hypercholesterolemia_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has familial hypercholesterolemia."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of hypertension.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of hypertension."} ;; "hypertension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a current systolic blood pressure measurement in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a current diastolic blood pressure measurement in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: uncontrolled severe hypertension defined as (systolic blood pressure ≥ 200 mmHg) OR (diastolic blood pressure ≥ 110 mmHg)
(assert
(! (not (and patient_has_finding_of_hypertensive_disorder_now
             (or (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 200)
                 (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 110))))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled severe hypertension defined as (systolic blood pressure ≥ 200 millimeters of mercury) OR (diastolic blood pressure ≥ 110 millimeters of mercury)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's glycated hemoglobin (HbA1c) in percent is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current glycated hemoglobin (HbA1c) in percent."} ;; "glycated hemoglobin"
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poorly controlled diabetes mellitus (uncontrolled diabetes).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poorly controlled diabetes mellitus (uncontrolled diabetes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has poorly controlled diabetes mellitus."} ;; "uncontrolled diabetes mellitus"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definition: uncontrolled diabetes mellitus = (glycated hemoglobin ≥ 9.5 percent)
(assert
(! (= patient_has_finding_of_diabetic_poor_control_now
    (>= patient_glycosylated_hemoglobin_value_recorded_now_withunit_percent 9.5))
:named REQ11_AUXILIARY0)) ;; "defined as (glycated hemoglobin ≥ 9.5 percent)"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_diabetic_poor_control_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled diabetes mellitus defined as (glycated hemoglobin ≥ 9.5 percent)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_triglyceride_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current triglyceride level in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current triglyceride level in milligrams per deciliter."} ;; "triglyceride level ≥ 500 milligrams per deciliter (5.65 millimoles per liter)"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (>= patient_triglyceride_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 500))
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has triglyceride level ≥ 500 milligrams per deciliter (5.65 millimoles per liter)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disease of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disease of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disease of the liver.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disease of the liver."} ;; "hepatic disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disease of the liver and the disease is active.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of disease of the liver but the disease is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease of the liver is active.","meaning":"Boolean indicating whether the patient's current diagnosis of disease of the liver is active."} ;; "active hepatic disease"
(declare-const patient_has_finding_of_decreased_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of decreased liver function.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of decreased liver function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of decreased liver function.","meaning":"Boolean indicating whether the patient currently has a finding of decreased liver function."} ;; "hepatic function impairment"
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current alanine aminotransferase level is recorded in units of times the upper limit of normal.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase measurement in units of times the upper limit of normal."} ;; "alanine aminotransferase level ≥ 3 times the upper limit of normal"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@active
       patient_has_diagnosis_of_disease_of_liver_now)
   :named REQ13_AUXILIARY0)) ;; "active hepatic disease" implies "hepatic disease"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_now@@active)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active hepatic disease."

(assert
(! (not patient_has_finding_of_decreased_liver_function_now)
   :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic function impairment."

(assert
(! (not (>= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal 3))
   :named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alanine aminotransferase level ≥ 3 times the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_micromoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine level is recorded now in micromoles per liter.","when_to_set_to_null":"Set to null if no current measurement in micromoles per liter is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine level in micromoles per liter."} ;; "serum creatinine level > 177 micromoles per liter (2.0 milligrams per deciliter)."
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine level is recorded now in milligrams per deciliter.","when_to_set_to_null":"Set to null if no current measurement in milligrams per deciliter is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine level in milligrams per deciliter."} ;; "serum creatinine level > 177 micromoles per liter (2.0 milligrams per deciliter)."

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have serum creatinine level > 177 micromoles per liter OR > 2.0 milligrams per deciliter
(assert
(! (not (or
          (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_micromoles_per_liter 177)
          (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 2.0)
        ))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine level > 177 micromoles per liter (2.0 milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_muscle_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has muscle pain (myalgia).","when_to_set_to_false":"Set to false if the patient currently does not have muscle pain (myalgia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has muscle pain (myalgia).","meaning":"Boolean indicating whether the patient currently has muscle pain (myalgia)."} ;; "myalgia"
(declare-const creatine_kinase_level_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's blood creatine kinase level measured at the present time, in units of U/L.","when_to_set_to_null":"Set to null if the patient's blood creatine kinase level at the present time is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's blood creatine kinase level measured at the present time, in units of U/L."} ;; "blood creatine kinase level"
(declare-const creatine_kinase_upper_limit_of_normal_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the upper limit of normal for blood creatine kinase level, in units of U/L, as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the upper limit of normal for blood creatine kinase level is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the upper limit of normal for blood creatine kinase level, in units of U/L, as defined by the laboratory reference range."} ;; "upper limit of normal for blood creatine kinase level"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not patient_has_finding_of_muscle_pain_now)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myalgia."

(assert
  (! (not (>= creatine_kinase_level_value_recorded_now_withunit_u_per_l
              (* 5 creatine_kinase_upper_limit_of_normal_value_withunit_u_per_l)))
     :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has blood creatine kinase level ≥ 5 times the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_10_9_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current white blood cell count in 10^9 per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current white blood cell count in 10^9 per liter."} ;; "white blood cell count < 4 × 10⁹ per liter"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_10_9_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current platelet count in 10^9 per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current platelet count in 10^9 per liter."} ;; "platelet count < 100 × 10⁹ per liter"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (or (< patient_white_blood_cell_count_value_recorded_now_withunit_10_9_per_liter 4)
            (< patient_platelet_count_finding_value_recorded_now_withunit_10_9_per_liter 100)))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has white blood cell count < 4 × 10⁹ per liter) OR (the patient has platelet count < 100 × 10⁹ per liter)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_participating_in_course_of_this_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in the course of plan of this study.","when_to_set_to_false":"Set to false if the patient is currently not participating in the course of plan of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in the course of plan of this study.","meaning":"Boolean indicating whether the patient is currently participating in the course of plan of this study."} ;; "the patient is participating in the course of plan of this study"
(declare-const patient_is_participating_in_procedure_of_this_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in the procedure of this study.","when_to_set_to_false":"Set to false if the patient is currently not participating in the procedure of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in the procedure of this study.","meaning":"Boolean indicating whether the patient is currently participating in the procedure of this study."} ;; "the patient is participating in the procedure of this study"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (or patient_is_participating_in_course_of_this_study_now
            patient_is_participating_in_procedure_of_this_study_now))
   :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is participating in the course of plan of this study) OR (the patient is participating in the procedure of this study)."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_participated_in_study_treatment_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in the study treatment at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never previously participated in the study treatment prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in the study treatment.","meaning":"Boolean indicating whether the patient has previously participated in the study treatment."} ;; "The patient is excluded if the patient has previously participated in the study treatment."

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_participated_in_study_treatment_in_the_past)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously participated in the study treatment."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const number_of_other_clinical_studies_participated_in_past_3_months Real) ;; {"when_to_set_to_value":"Set to the number of other clinical studies the patient has participated in within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many other clinical studies the patient has participated in within the past 3 months.","meaning":"Numeric value indicating the number of other clinical studies the patient has participated in within the past 3 months."} ;; "number of other clinical studies the patient has participated in within the past 3 months"
(declare-const patient_has_participated_in_clinical_study_in_past_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any other clinical study within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not participated in any other clinical study within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any other clinical study within the past 3 months.","meaning":"Boolean indicating whether the patient has participated in any other clinical study within the past 3 months."} ;; "has participated in other clinical studies in the past 3 months"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Boolean variable is true iff the number of other clinical studies participated in past 3 months is at least 1
(assert
(! (= patient_has_participated_in_clinical_study_in_past_3_months
     (> number_of_other_clinical_studies_participated_in_past_3_months 0))
:named REQ19_AUXILIARY0)) ;; "has participated in other clinical studies in the past 3 months"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_participated_in_clinical_study_in_past_3_months)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in other clinical studies in the past 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be currently pregnant.","when_to_set_to_false":"Set to false if the patient is confirmed to not be currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is confirmed to not be currently breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have child-bearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed to not have child-bearing potential.","when_to_set_to_null":"Set to null if the patient's child-bearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has child-bearing potential."} ;; "the patient is a woman with child-bearing potential"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any method for contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any method for contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any method for contraception.","meaning":"Boolean indicating whether the patient is currently using any method for contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@achieved_by_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's contraception is currently achieved by drugs.","when_to_set_to_false":"Set to false if the patient's contraception is currently not achieved by drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's contraception is currently achieved by drugs.","meaning":"Boolean indicating whether the patient's contraception is currently achieved by drugs."} ;; "contraception achieved by drugs"
(declare-const patient_has_finding_of_contraception_now@@achieved_by_devices Bool) ;; {"when_to_set_to_true":"Set to true if the patient's contraception is currently achieved by devices.","when_to_set_to_false":"Set to false if the patient's contraception is currently not achieved by devices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's contraception is currently achieved by devices.","meaning":"Boolean indicating whether the patient's contraception is currently achieved by devices."} ;; "contraception achieved by devices"
(declare-const patient_has_positive_urine_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive urine pregnancy test (human chorionic gonadotropin).","when_to_set_to_false":"Set to false if the patient currently does not have a positive urine pregnancy test (human chorionic gonadotropin).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive urine pregnancy test (human chorionic gonadotropin).","meaning":"Boolean observable indicating whether the patient currently has a positive urine pregnancy test (human chorionic gonadotropin)."} ;; "positive urine pregnancy test (human chorionic gonadotropin)"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's sex is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female."} ;; "the patient is a woman"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variables imply corresponding stem variable for contraception
(assert
(! (=> patient_has_finding_of_contraception_now@@achieved_by_drugs
      patient_has_finding_of_contraception_now)
:named REQ20_AUXILIARY0)) ;; "contraception achieved by drugs implies contraception"

(assert
(! (=> patient_has_finding_of_contraception_now@@achieved_by_devices
      patient_has_finding_of_contraception_now)
:named REQ20_AUXILIARY1)) ;; "contraception achieved by devices implies contraception"

;; ===================== Constraint Assertions (REQ 20) =====================
;; Exclusion: patient is currently pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; Exclusion: patient is currently breast-feeding
(assert
(! (not patient_is_breastfeeding_now)
:named REQ20_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; Exclusion: patient is a woman with child-bearing potential AND (did not use drugs for contraception OR did not use devices for contraception)
(assert
(! (not (and patient_has_childbearing_potential_now
             (or (not patient_has_finding_of_contraception_now@@achieved_by_drugs)
                 (not patient_has_finding_of_contraception_now@@achieved_by_devices))))
:named REQ20_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is a woman with child-bearing potential) AND ((the patient did not use drugs for contraception) OR (the patient did not use devices for contraception))."

;; Exclusion: patient is a woman AND has a positive urine pregnancy test
(assert
(! (not (and patient_sex_is_female_now
             patient_has_positive_urine_pregnancy_test_now))
:named REQ20_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman) AND (the patient has a positive urine pregnancy test (human chorionic gonadotropin))."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (malignant tumor) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (malignant tumor) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (malignant tumor).","meaning":"Boolean indicating whether the patient has ever been diagnosed with malignant neoplastic disease (malignant tumor) at any time in the past."} ;; "malignant tumor"
(declare-const patient_has_history_of_malignant_tumor_has_recovered_more_than_10_years_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of malignant tumor and has recovered from the malignant tumor more than 10 years prior to screening.","when_to_set_to_false":"Set to false if the patient has a history of malignant tumor and has not recovered more than 10 years prior to screening, or has not recovered at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recovered from malignant tumor more than 10 years prior to screening.","meaning":"Boolean indicating whether the patient has a history of malignant tumor and has recovered from the malignant tumor more than 10 years prior to screening."} ;; "recovered from malignant tumor more than ten years prior to screening"
(declare-const patient_has_history_of_malignant_tumor_only_basal_cell_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's only malignant tumor in history is basal cell carcinoma.","when_to_set_to_false":"Set to false if the patient has a history of malignant tumor and it is not exclusively basal cell carcinoma, or if there are other types of malignant tumors in history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's only malignant tumor in history is basal cell carcinoma.","meaning":"Boolean indicating whether the patient's only malignant tumor in history is basal cell carcinoma."} ;; "only basal cell carcinoma"
(declare-const patient_has_history_of_malignant_tumor_only_squamous_cell_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's only malignant tumor in history is squamous cell carcinoma.","when_to_set_to_false":"Set to false if the patient has a history of malignant tumor and it is not exclusively squamous cell carcinoma, or if there are other types of malignant tumors in history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's only malignant tumor in history is squamous cell carcinoma.","meaning":"Boolean indicating whether the patient's only malignant tumor in history is squamous cell carcinoma."} ;; "only squamous cell carcinoma"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's sex is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female."} ;; "the patient is a woman"
(declare-const patient_has_history_of_cervical_atypical_hyperplasia Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of cervical atypical hyperplasia.","when_to_set_to_false":"Set to false if the patient does not have a history of cervical atypical hyperplasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cervical atypical hyperplasia.","meaning":"Boolean indicating whether the patient has a history of cervical atypical hyperplasia."} ;; "history of cervical atypical hyperplasia"
(declare-const patient_has_three_consecutive_cervical_smear_tests_normal_prior_to_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has three consecutive cervical smear tests that are normal prior to enrolment.","when_to_set_to_false":"Set to false if the patient does not have three consecutive cervical smear tests that are normal prior to enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has three consecutive cervical smear tests that are normal prior to enrolment.","meaning":"Boolean indicating whether the patient has three consecutive cervical smear tests that are normal prior to enrolment."} ;; "three consecutive cervical smear tests that are normal prior to enrolment"
(declare-const patient_has_undergone_cytopathology_procedure_preparation_of_smear_genital_source_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a cervical smear test at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a cervical smear test at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a cervical smear test.","meaning":"Boolean indicating whether the patient has ever undergone a cervical smear test at any time in the past."} ;; "cervical smear test"

;; ===================== Constraint Assertions (REQ 21) =====================
;; Exclusion: history of malignant tumor, unless recovered >10 years prior to screening, or only basal cell carcinoma, or only squamous cell carcinoma
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
     (not (or patient_has_history_of_malignant_tumor_has_recovered_more_than_10_years_prior_to_screening
              patient_has_history_of_malignant_tumor_only_basal_cell_carcinoma
              patient_has_history_of_malignant_tumor_only_squamous_cell_carcinoma))))
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of malignant tumor AND NOT ((the patient has recovered from malignant tumor more than ten years prior to screening) OR (the patient has only basal cell carcinoma) OR (the patient has only squamous cell carcinoma)))."

;; Exclusion: female with history of cervical atypical hyperplasia, unless 3 consecutive cervical smear tests are normal prior to enrolment
(assert
(! (not (and patient_sex_is_female_now
             patient_has_history_of_cervical_atypical_hyperplasia
             (not patient_has_three_consecutive_cervical_smear_tests_normal_prior_to_enrolment)))
:named REQ21_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((the patient is a female) AND (the patient has a history of cervical atypical hyperplasia) AND NOT (the patient has three consecutive cervical smear tests that are normal prior to enrolment))."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse that occurred within the past five years.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse within the past five years.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse within the past five years."} ;; "the patient has a history of alcohol abuse in the recent five years"
(declare-const patient_has_finding_of_drug_abuse_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug abuse that occurred within the past five years.","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug abuse within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse within the past five years.","meaning":"Boolean indicating whether the patient has a history of drug abuse within the past five years."} ;; "the patient has a history of drug abuse in the recent five years"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast5years)
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse in the recent five years."

(assert
(! (not patient_has_finding_of_drug_abuse_inthepast5years)
:named REQ22_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse in the recent five years."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_physical_health_problems_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical health problem.","when_to_set_to_false":"Set to false if the patient currently does not have a physical health problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical health problem.","meaning":"Boolean indicating whether the patient currently has a physical health problem."} ;; "physical condition"
(declare-const patient_has_finding_of_physical_health_problems_now@@unstable_and_would_compromise_safety_or_participation_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physical health problem is unstable and, in the opinion of the investigator, would compromise the safety of the patient or participation in the study.","when_to_set_to_false":"Set to false if the patient's physical health problem is not unstable or, in the opinion of the investigator, would not compromise safety or participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physical health problem is unstable and, in the opinion of the investigator, would compromise safety or participation.","meaning":"Boolean indicating whether the patient's physical health problem is unstable and, in the opinion of the investigator, would compromise safety or participation in the study."} ;; "unstable physical condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study"
(declare-const patient_has_finding_of_serious_physical_health_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious physical health problem.","when_to_set_to_false":"Set to false if the patient currently does not have a serious physical health problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious physical health problem.","meaning":"Boolean indicating whether the patient currently has a serious physical health problem."} ;; "serious physical condition"
(declare-const patient_has_finding_of_serious_physical_health_problem_now@@would_compromise_safety_or_participation_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the investigator, the patient's serious physical health problem would compromise the safety of the patient or participation in the study.","when_to_set_to_false":"Set to false if, in the opinion of the investigator, the patient's serious physical health problem would not compromise the safety of the patient or participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the investigator, the patient's serious physical health problem would compromise safety or participation.","meaning":"Boolean indicating whether, in the opinion of the investigator, the patient's serious physical health problem would compromise safety or participation in the study."} ;; "serious physical condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study"
(declare-const patient_has_finding_of_psychological_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychological condition.","when_to_set_to_false":"Set to false if the patient currently does not have a psychological condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychological condition.","meaning":"Boolean indicating whether the patient currently has a psychological condition."} ;; "psychological condition"
(declare-const patient_has_finding_of_psychological_condition_now@@unstable_and_would_compromise_safety_or_participation_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's psychological condition is unstable and, in the opinion of the investigator, would compromise the safety of the patient or participation in the study.","when_to_set_to_false":"Set to false if the patient's psychological condition is not unstable or, in the opinion of the investigator, would not compromise safety or participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's psychological condition is unstable and, in the opinion of the investigator, would compromise safety or participation.","meaning":"Boolean indicating whether the patient's psychological condition is unstable and, in the opinion of the investigator, would compromise safety or participation in the study."} ;; "unstable psychological condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study"
(declare-const patient_has_finding_of_serious_psychological_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious psychological condition.","when_to_set_to_false":"Set to false if the patient currently does not have a serious psychological condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious psychological condition.","meaning":"Boolean indicating whether the patient currently has a serious psychological condition."} ;; "serious psychological condition"
(declare-const patient_has_finding_of_serious_psychological_condition_now@@would_compromise_safety_or_participation_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the investigator, the patient's serious psychological condition would compromise the safety of the patient or participation in the study.","when_to_set_to_false":"Set to false if, in the opinion of the investigator, the patient's serious psychological condition would not compromise the safety of the patient or participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the investigator, the patient's serious psychological condition would compromise safety or participation.","meaning":"Boolean indicating whether, in the opinion of the investigator, the patient's serious psychological condition would compromise safety or participation in the study."} ;; "serious psychological condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_physical_health_problems_now@@unstable_and_would_compromise_safety_or_participation_investigator_opinion
      patient_has_finding_of_physical_health_problems_now)
    :named REQ23_AUXILIARY0)) ;; "unstable physical condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study"

(assert
(! (=> patient_has_finding_of_serious_physical_health_problem_now@@would_compromise_safety_or_participation_investigator_opinion
      patient_has_finding_of_serious_physical_health_problem_now)
    :named REQ23_AUXILIARY1)) ;; "serious physical condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study"

(assert
(! (=> patient_has_finding_of_psychological_condition_now@@unstable_and_would_compromise_safety_or_participation_investigator_opinion
      patient_has_finding_of_psychological_condition_now)
    :named REQ23_AUXILIARY2)) ;; "unstable psychological condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study"

(assert
(! (=> patient_has_finding_of_serious_psychological_condition_now@@would_compromise_safety_or_participation_investigator_opinion
      patient_has_finding_of_serious_psychological_condition_now)
    :named REQ23_AUXILIARY3)) ;; "serious psychological condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_has_finding_of_serious_physical_health_problem_now@@would_compromise_safety_or_participation_investigator_opinion)
    :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious physical condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study."

(assert
(! (not patient_has_finding_of_physical_health_problems_now@@unstable_and_would_compromise_safety_or_participation_investigator_opinion)
    :named REQ23_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any unstable physical condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study."

(assert
(! (not patient_has_finding_of_serious_psychological_condition_now@@would_compromise_safety_or_participation_investigator_opinion)
    :named REQ23_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious psychological condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study."

(assert
(! (not patient_has_finding_of_psychological_condition_now@@unstable_and_would_compromise_safety_or_participation_investigator_opinion)
    :named REQ23_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any unstable psychological condition that, in the opinion of the investigator, would compromise the safety of the patient or the participation in this study."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_is_taking_erythromycin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing erythromycin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing erythromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing erythromycin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing erythromycin."} ;; "erythromycin"
(declare-const patient_is_taking_clarithromycin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing clarithromycin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing clarithromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing clarithromycin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing clarithromycin."} ;; "clarithromycin"
(declare-const patient_is_exposed_to_erythromycin_ethylsuccinate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to erythromycin ethylsuccinate.","when_to_set_to_false":"Set to false if the patient is currently not exposed to erythromycin ethylsuccinate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to erythromycin ethylsuccinate.","meaning":"Boolean indicating whether the patient is currently exposed to erythromycin ethylsuccinate."} ;; "erythromycin ethylsuccinate"
(declare-const patient_is_exposed_to_sulfaphenazole_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to sulfaphenazole.","when_to_set_to_false":"Set to false if the patient is currently not exposed to sulfaphenazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to sulfaphenazole.","meaning":"Boolean indicating whether the patient is currently exposed to sulfaphenazole."} ;; "sulfaphenazole"
(declare-const patient_is_taking_fluconazole_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing fluconazole.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing fluconazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing fluconazole.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing fluconazole."} ;; "fluconazole"
(declare-const patient_is_taking_ketoconazole_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing ketoconazole.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing ketoconazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing ketoconazole.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing ketoconazole."} ;; "ketoconazole"
(declare-const patient_is_taking_itraconazole_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing itraconazole.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing itraconazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing itraconazole.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing itraconazole."} ;; "itraconazole"
(declare-const patient_is_exposed_to_niacin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to niacin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to niacin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to niacin.","meaning":"Boolean indicating whether the patient is currently exposed to niacin."} ;; "niacin"
(declare-const patient_is_taking_niacin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing niacin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing niacin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing niacin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing niacin."} ;; "vitamins containing niacin"
(declare-const patient_is_exposed_to_protease_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any protease inhibitor.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any protease inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any protease inhibitor.","meaning":"Boolean indicating whether the patient is currently exposed to any protease inhibitor."} ;; "protease inhibitor"
(declare-const patient_is_taking_probucol_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing probucol.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing probucol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing probucol.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing probucol."} ;; "probucol"
(declare-const patient_is_taking_clofibrate_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing clofibrate.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing clofibrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing clofibrate.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing clofibrate."} ;; "clofibrate"
(declare-const patient_is_taking_cholestyramine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing cholestyramine.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing cholestyramine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing cholestyramine.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing cholestyramine."} ;; "cholestyramine"
(declare-const patient_is_exposed_to_colestipol_hydrochloride_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to colestipol hydrochloride.","when_to_set_to_false":"Set to false if the patient is currently not exposed to colestipol hydrochloride.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to colestipol hydrochloride.","meaning":"Boolean indicating whether the patient is currently exposed to colestipol hydrochloride."} ;; "colestipol hydrochloride"
(declare-const patient_is_taking_ezetimibe_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing ezetimibe.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing ezetimibe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing ezetimibe.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing ezetimibe."} ;; "ezetimibe"
(declare-const patient_is_taking_fenofibrate_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing fenofibrate.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing fenofibrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing fenofibrate.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing fenofibrate."} ;; "fenofibrate"
(declare-const patient_is_exposed_to_gemfibrozil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to gemfibrozil.","when_to_set_to_false":"Set to false if the patient is currently not exposed to gemfibrozil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to gemfibrozil.","meaning":"Boolean indicating whether the patient is currently exposed to gemfibrozil."} ;; "gemfibrozil"
(declare-const patient_is_taking_atorvastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing atorvastatin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing atorvastatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing atorvastatin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing atorvastatin."} ;; "atorvastatin"
(declare-const patient_is_taking_atorvastatin_containing_product_now@@not_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the medicinal product containing atorvastatin is not the study medication.","when_to_set_to_false":"Set to false if the medicinal product containing atorvastatin is the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medicinal product containing atorvastatin is the study medication.","meaning":"Boolean indicating that the medicinal product containing atorvastatin is not the study medication."} ;; "atorvastatin (except study medication)"
(declare-const patient_is_taking_lovastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing lovastatin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing lovastatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing lovastatin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing lovastatin."} ;; "lovastatin"
(declare-const patient_is_taking_pravastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing pravastatin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing pravastatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing pravastatin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing pravastatin."} ;; "pravastatin"
(declare-const patient_is_taking_rosuvastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing rosuvastatin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing rosuvastatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing rosuvastatin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing rosuvastatin."} ;; "rosuvastatin"
(declare-const patient_is_taking_rosuvastatin_containing_product_now@@not_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the medicinal product containing rosuvastatin is not the study medication.","when_to_set_to_false":"Set to false if the medicinal product containing rosuvastatin is the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medicinal product containing rosuvastatin is the study medication.","meaning":"Boolean indicating that the medicinal product containing rosuvastatin is not the study medication."} ;; "rosuvastatin (except study medication)"
(declare-const patient_is_taking_simvastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing simvastatin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing simvastatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing simvastatin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing simvastatin."} ;; "simvastatin"
(declare-const patient_is_taking_fluvastatin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing fluvastatin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing fluvastatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing fluvastatin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing fluvastatin."} ;; "fluvastatin"
(declare-const patient_is_exposed_to_fish_oil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to fish oil.","when_to_set_to_false":"Set to false if the patient is currently not exposed to fish oil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to fish oil.","meaning":"Boolean indicating whether the patient is currently exposed to fish oil."} ;; "fish oil"
(declare-const patient_is_taking_lipid_lowering_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any lipid-lowering supplement.","when_to_set_to_false":"Set to false if the patient is currently not taking any lipid-lowering supplement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any lipid-lowering supplement.","meaning":"Boolean indicating whether the patient is currently taking any lipid-lowering supplement."} ;; "lipid-lowering supplement"
(declare-const patient_is_taking_lipid_lowering_food_additive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any lipid-lowering food additive.","when_to_set_to_false":"Set to false if the patient is currently not taking any lipid-lowering food additive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any lipid-lowering food additive.","meaning":"Boolean indicating whether the patient is currently taking any lipid-lowering food additive."} ;; "lipid-lowering food additive"
(declare-const patient_is_taking_cyclosporine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing cyclosporine.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing cyclosporine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing cyclosporine.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing cyclosporine."} ;; "cyclosporine"
(declare-const patient_niacin_value_recorded_now_withunit_milligrams Real) ;; {"when_to_set_to_value":"Set to the measured dose in milligrams if the patient is currently consuming food additives containing niacin and the dose is known.","when_to_set_to_null":"Set to null if the dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the dose of niacin present in food additives currently consumed by the patient, measured in milligrams."} ;; "food additives containing niacin"
(declare-const patient_niacin_containing_product_value_recorded_now_withunit_milligrams Real) ;; {"when_to_set_to_value":"Set to the measured dose in milligrams if the patient is currently consuming food additives containing nicotinic acid and the dose is known.","when_to_set_to_null":"Set to null if the dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the dose of nicotinic acid present in food additives currently consumed by the patient, measured in milligrams."} ;; "food additives containing nicotinic acid"

;; ===================== Auxiliary Assertions (REQ 24) =====================
;; Non-exhaustive examples for niacin/nicotinic acid: vitamins containing niacin, vitamins containing nicotinic acid, food additives containing niacin, food additives containing nicotinic acid > 50 mg
(assert
(! (=> (or (> patient_niacin_value_recorded_now_withunit_milligrams 50)
           (> patient_niacin_containing_product_value_recorded_now_withunit_milligrams 50)
           patient_is_taking_niacin_containing_product_now)
     patient_is_exposed_to_niacin_now)
:named REQ24_AUXILIARY0)) ;; "niacin, nicotinic acid (with non-exhaustive examples (vitamins containing niacin, vitamins containing nicotinic acid, food additives containing niacin, food additives containing nicotinic acid > fifty milligrams))"

;; Qualifier variables for atorvastatin and rosuvastatin: not study medication
(assert
(! (=> patient_is_taking_atorvastatin_containing_product_now@@not_study_medication
     patient_is_taking_atorvastatin_containing_product_now)
:named REQ24_AUXILIARY1)) ;; "atorvastatin (except study medication)"

(assert
(! (=> patient_is_taking_rosuvastatin_containing_product_now@@not_study_medication
     patient_is_taking_rosuvastatin_containing_product_now)
:named REQ24_AUXILIARY2)) ;; "rosuvastatin (except study medication)"

;; ===================== Constraint Assertions (REQ 24) =====================
;; Exhaustive subcategories: prohibited concomitant medication is exactly the union of all listed items
(declare-const patient_is_using_prohibited_concomitant_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any prohibited concomitant medication as defined by the exhaustive list in the requirement.","when_to_set_to_false":"Set to false if the patient is currently not using any prohibited concomitant medication as defined by the exhaustive list in the requirement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any prohibited concomitant medication as defined by the exhaustive list.","meaning":"Boolean indicating whether the patient is currently using any prohibited concomitant medication as defined by the exhaustive list in the requirement."} ;; "uses concomitant medication prohibited in this study with exhaustive subcategories..."

(assert
(! (= patient_is_using_prohibited_concomitant_medication_now
  (or patient_is_taking_erythromycin_containing_product_now
      patient_is_taking_clarithromycin_containing_product_now
      patient_is_exposed_to_erythromycin_ethylsuccinate_now
      patient_is_exposed_to_sulfaphenazole_now
      patient_is_taking_fluconazole_containing_product_now
      patient_is_taking_ketoconazole_containing_product_now
      patient_is_taking_itraconazole_containing_product_now
      patient_is_exposed_to_niacin_now
      patient_is_exposed_to_protease_inhibitor_now
      patient_is_taking_probucol_containing_product_now
      patient_is_taking_clofibrate_containing_product_now
      patient_is_taking_cholestyramine_containing_product_now
      patient_is_exposed_to_colestipol_hydrochloride_now
      patient_is_taking_ezetimibe_containing_product_now
      patient_is_taking_fenofibrate_containing_product_now
      patient_is_exposed_to_gemfibrozil_now
      (and patient_is_taking_atorvastatin_containing_product_now
           patient_is_taking_atorvastatin_containing_product_now@@not_study_medication)
      patient_is_taking_lovastatin_containing_product_now
      patient_is_taking_pravastatin_containing_product_now
      (and patient_is_taking_rosuvastatin_containing_product_now
           patient_is_taking_rosuvastatin_containing_product_now@@not_study_medication)
      patient_is_taking_simvastatin_containing_product_now
      patient_is_taking_fluvastatin_containing_product_now
      patient_is_exposed_to_fish_oil_now
      patient_is_taking_lipid_lowering_supplement_now
      patient_is_taking_lipid_lowering_food_additive_now
      patient_is_taking_cyclosporine_containing_product_now))
:named REQ24_AUXILIARY3)) ;; "uses concomitant medication prohibited in this study with exhaustive subcategories..."

(assert
(! (not patient_is_using_prohibited_concomitant_medication_now)
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses concomitant medication prohibited in this study with exhaustive subcategories..."
