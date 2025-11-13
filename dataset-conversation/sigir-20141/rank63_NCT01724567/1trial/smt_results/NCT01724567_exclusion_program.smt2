;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "Diabetes Mellitus"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_diabetes_mellitus_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Diabetes Mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_plasma_fasting_glucose_measurement_value_recorded_inthehistory_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the value(s) of fasting plasma glucose measurement(s) recorded at any time in the patient's history, in millimoles per liter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value(s) representing the patient's fasting plasma glucose measurement(s) in millimoles per liter, recorded at any time in the patient's history."} ;; "fasting plasma glucose measurement"

(declare-const patient_plasma_fasting_glucose_measurement_value_recorded_inthehistory_withunit_millimoles_per_liter@@is_repeated_measurement Bool) ;; {"when_to_set_to_true":"Set to true if there are two or more fasting plasma glucose measurements recorded in the patient's history.","when_to_set_to_false":"Set to false if there is only one or no such measurement recorded.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement is repeated.","meaning":"Boolean indicating whether the patient's fasting plasma glucose measurement(s) are repeated (i.e., two or more measurements exist)."} ;; "repeated fasting plasma glucose measurement"

(declare-const patient_hemoglobin_a1c_measurement_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the value(s) of hemoglobin A1c measurement(s) recorded at any time in the patient's history, in percent.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value(s) representing the patient's hemoglobin A1c measurement(s) in percent, recorded at any time in the patient's history."} ;; "hemoglobin A1c measurement"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient has repeated fasting plasma glucose measurement ≥ 7 mmol/L
(assert
(! (not (and patient_plasma_fasting_glucose_measurement_value_recorded_inthehistory_withunit_millimoles_per_liter@@is_repeated_measurement
             (>= patient_plasma_fasting_glucose_measurement_value_recorded_inthehistory_withunit_millimoles_per_liter 7)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has repeated fasting plasma glucose measurement ≥ 7 millimoles per liter."

;; Exclusion: patient has hemoglobin A1c measurement > 7 percent
(assert
(! (not (> patient_hemoglobin_a1c_measurement_value_recorded_inthehistory_withunit_percent 7))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemoglobin A1c measurement > 7 percent."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_valve_disease_severe_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe valve disease.","when_to_set_to_false":"Set to false if the patient currently does not have severe valve disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe valve disease.","meaning":"Boolean indicating whether the patient currently has severe valve disease."} ;; "the patient has severe valve disease"
(declare-const patient_has_finding_of_valve_disease_moderate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate valve disease.","when_to_set_to_false":"Set to false if the patient currently does not have moderate valve disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate valve disease.","meaning":"Boolean indicating whether the patient currently has moderate valve disease."} ;; "the patient has moderate valve disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_valve_disease_severe_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe valve disease."

(assert
(! (not patient_has_finding_of_valve_disease_moderate_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate valve disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_main_stem_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has main stem stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have main stem stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has main stem stenosis.","meaning":"Boolean indicating whether the patient currently has main stem stenosis."} ;; "The patient is excluded if the patient has main stem stenosis."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_main_stem_stenosis_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has main stem stenosis."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's cardiac ejection fraction in percent is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current cardiac ejection fraction in percent."} ;; "ejection fraction"
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is severe.","when_to_set_to_false":"Set to false if the patient's current heart failure is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is severe.","meaning":"Boolean indicating whether the patient's current heart failure is severe."} ;; "severe heart failure"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: severe heart failure with ejection fraction < 35 percent
(assert
(! (= patient_has_finding_of_heart_failure_now@@severe
(and patient_has_finding_of_heart_failure_now
(< patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent 35)))
:named REQ4_AUXILIARY0)) ;; "severe heart failure with ejection fraction < 35 percent."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_now@@severe
patient_has_finding_of_heart_failure_now)
:named REQ4_AUXILIARY1)) ;; "severe heart failure" implies "heart failure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@severe)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe heart failure with ejection fraction < 35 percent."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disability.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disability.","meaning":"Boolean indicating whether the patient currently has a clinical finding of disability."} ;; "disability"

(declare-const patient_has_finding_of_disability_now@@is_physical Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disability is physical.","when_to_set_to_false":"Set to false if the patient's current disability is not physical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disability is physical.","meaning":"Boolean indicating whether the patient's current disability is physical."} ;; "physical disability"

(declare-const patient_has_finding_of_disability_now@@is_mental Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disability is mental.","when_to_set_to_false":"Set to false if the patient's current disability is not mental.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disability is mental.","meaning":"Boolean indicating whether the patient's current disability is mental."} ;; "mental disability"

(declare-const patient_has_finding_of_disability_now@@expected_to_prevent_completion_of_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disability is expected to prevent completion of intervention.","when_to_set_to_false":"Set to false if the patient's current disability is not expected to prevent completion of intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disability is expected to prevent completion of intervention.","meaning":"Boolean indicating whether the patient's current disability is expected to prevent completion of intervention."} ;; "disability which is expected to prevent completion of intervention"

(declare-const patient_has_finding_of_disability_now@@is_mental@@expected_to_prevent_completion_of_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disability is expected to prevent completion of intervention.","when_to_set_to_false":"Set to false if the patient's current mental disability is not expected to prevent completion of intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current mental disability is expected to prevent completion of intervention.","meaning":"Boolean indicating whether the patient's current mental disability is expected to prevent completion of intervention."} ;; "mental disability which is expected to prevent completion of intervention"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disability_now@@is_physical
       patient_has_finding_of_disability_now)
   :named REQ5_AUXILIARY0)) ;; "physical disability"

(assert
(! (=> patient_has_finding_of_disability_now@@is_mental
       patient_has_finding_of_disability_now)
   :named REQ5_AUXILIARY1)) ;; "mental disability"

(assert
(! (=> patient_has_finding_of_disability_now@@expected_to_prevent_completion_of_intervention
       patient_has_finding_of_disability_now)
   :named REQ5_AUXILIARY2)) ;; "disability which is expected to prevent completion of intervention"

(assert
(! (=> patient_has_finding_of_disability_now@@is_mental@@expected_to_prevent_completion_of_intervention
       (and patient_has_finding_of_disability_now@@is_mental
            patient_has_finding_of_disability_now@@expected_to_prevent_completion_of_intervention))
   :named REQ5_AUXILIARY3)) ;; "mental disability which is expected to prevent completion of intervention"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: physical disability expected to prevent completion of intervention
(assert
(! (not (and patient_has_finding_of_disability_now@@is_physical
             patient_has_finding_of_disability_now@@expected_to_prevent_completion_of_intervention))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has physical disability which is expected to prevent completion of intervention."

;; Exclusion: mental disability expected to prevent completion of intervention
(assert
(! (not patient_has_finding_of_disability_now@@is_mental@@expected_to_prevent_completion_of_intervention)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mental disability which is expected to prevent completion of intervention."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a current FEV1 (% of expected) measurement is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current forced expiratory volume in one second (FEV1) as a percent of expected."} ;; "forced expiratory volume in one second"
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"
(declare-const patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of severe chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of severe chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of severe chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe chronic obstructive pulmonary disease."} ;; "severe chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: severe COPD (with FEV1 < 50% of expected) or asthma
(assert
(! (not (or
          (and patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_now
               (< patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent 50))
          patient_has_diagnosis_of_asthma_now))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe chronic obstructive pulmonary disease (forced expiratory volume in one second < 50 percent of expected)) OR (the patient has asthma)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer), regardless of whether it is active or inactive.","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (cancer) now."} ;; "cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant neoplastic disease (cancer) is active.","when_to_set_to_false":"Set to false if the patient's current malignant neoplastic disease (cancer) is not active (e.g., in remission, inactive, or cured).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current malignant neoplastic disease (cancer) is active.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease (cancer) is active."} ;; "active cancer"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable (active) implies the stem variable (malignant neoplastic disease)
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@active
       patient_has_finding_of_malignant_neoplastic_disease_now)
   :named REQ7_AUXILIARY0)) ;; "active cancer" implies "cancer"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now@@active)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active cancer."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of glomerular filtration rate in milliliters per hour recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current glomerular filtration rate in milliliters per hour."} ;; "glomerular filtration rate < 40 milliliters per hour"

(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease now."} ;; "kidney disease"

(declare-const patient_has_finding_of_kidney_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe kidney disease now.","when_to_set_to_false":"Set to false if the patient currently has kidney disease now but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease is severe.","meaning":"Boolean indicating whether the patient currently has severe kidney disease now."} ;; "severe kidney disease"

(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease now."} ;; "liver disease"

(declare-const patient_has_finding_of_disease_of_liver_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe liver disease now.","when_to_set_to_false":"Set to false if the patient currently has liver disease now but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's liver disease is severe.","meaning":"Boolean indicating whether the patient currently has severe liver disease now."} ;; "severe liver disease"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: severe kidney disease = (kidney disease now) AND (glomerular filtration rate < 40 milliliters per hour)
(assert
(! (= patient_has_finding_of_kidney_disease_now@@severe
(and patient_has_finding_of_kidney_disease_now
(< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_hour 40)))
:named REQ8_AUXILIARY0)) ;; "severe kidney disease (glomerular filtration rate < 40 milliliters per hour)"

;; Qualifier variable implies corresponding stem variable for kidney disease
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@severe
patient_has_finding_of_kidney_disease_now)
:named REQ8_AUXILIARY1)) ;; "severe kidney disease implies kidney disease"

;; Qualifier variable implies corresponding stem variable for liver disease
(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@severe
patient_has_finding_of_disease_of_liver_now)
:named REQ8_AUXILIARY2)) ;; "severe liver disease implies liver disease"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have severe kidney disease (glomerular filtration rate < 40 milliliters per hour)
(assert
(! (not patient_has_finding_of_kidney_disease_now@@severe)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe kidney disease (glomerular filtration rate < 40 milliliters per hour)."

;; Exclusion: patient must NOT have severe liver disease
(assert
(! (not patient_has_finding_of_disease_of_liver_now@@severe)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe liver disease."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_ischemia_during_exercise_tolerance_test@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ischemia during an exercise tolerance test is severe.","when_to_set_to_false":"Set to false if the patient's ischemia during an exercise tolerance test is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ischemia during an exercise tolerance test is severe.","meaning":"Boolean indicating whether the patient's ischemia during an exercise tolerance test is severe."} ;; "severe ischemia during exercise test"
(declare-const patient_has_finding_of_ischemia_during_exercise_tolerance_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ischemia during an exercise tolerance test.","when_to_set_to_false":"Set to false if the patient does not have ischemia during an exercise tolerance test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ischemia during an exercise tolerance test.","meaning":"Boolean indicating whether the patient has ischemia during an exercise tolerance test."} ;; "ischemia during exercise test"
(declare-const patient_has_finding_of_cardiac_arrhythmia_inthehistory@@during_exercise_tolerance_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had cardiac arrhythmia during an exercise tolerance test at any time in their history.","when_to_set_to_false":"Set to false if the patient has not had cardiac arrhythmia during an exercise tolerance test at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had cardiac arrhythmia during an exercise tolerance test at any time in their history.","meaning":"Boolean indicating whether the patient has had cardiac arrhythmia during an exercise tolerance test at any time in their history."} ;; "arrhythmias during exercise test"
(declare-const patient_has_finding_of_cardiac_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had cardiac arrhythmia at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had cardiac arrhythmia at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had cardiac arrhythmia at any time in their history.","meaning":"Boolean indicating whether the patient has had cardiac arrhythmia at any time in their history."} ;; "arrhythmias"
(declare-const patient_has_undergone_exercise_tolerance_test_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an exercise tolerance test at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone an exercise tolerance test at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an exercise tolerance test.","meaning":"Boolean indicating whether the patient has ever undergone an exercise tolerance test at any time in their history."} ;; "exercise test"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable for ischemia
(assert
(! (=> patient_has_finding_of_ischemia_during_exercise_tolerance_test@@severe
      patient_has_finding_of_ischemia_during_exercise_tolerance_test)
    :named REQ9_AUXILIARY0)) ;; "severe ischemia during exercise test"

;; Qualifier variable implies corresponding stem variable for arrhythmia
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_inthehistory@@during_exercise_tolerance_test
      patient_has_finding_of_cardiac_arrhythmia_inthehistory)
    :named REQ9_AUXILIARY1)) ;; "arrhythmias during exercise test"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_finding_of_ischemia_during_exercise_tolerance_test@@severe
            patient_has_finding_of_cardiac_arrhythmia_inthehistory@@during_exercise_tolerance_test))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe ischemia during exercise test) OR (the patient has arrhythmias during exercise test)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_second_degree_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of second degree atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of second degree atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of second degree atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a diagnosis of second degree atrioventricular block."} ;; "second degree atrioventricular block"
(declare-const patient_has_diagnosis_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of third degree (complete) atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of third degree (complete) atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of third degree (complete) atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a diagnosis of third degree (complete) atrioventricular block."} ;; "third degree atrioventricular block"
(declare-const patient_has_protection_by_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has protection by a pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have protection by a pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has protection by a pacemaker.","meaning":"Boolean indicating whether the patient currently has protection by a pacemaker."} ;; "protection by pacemaker"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: (second degree AV block AND NOT protected by pacemaker) OR (third degree AV block AND NOT protected by pacemaker)
(assert
(! (not (or (and patient_has_diagnosis_of_second_degree_atrioventricular_block_now
                 (not patient_has_protection_by_pacemaker_now))
            (and patient_has_diagnosis_of_complete_atrioventricular_block_now
                 (not patient_has_protection_by_pacemaker_now))))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "(the patient has second degree atrioventricular block AND the patient does NOT have protection by pacemaker) OR (the patient has third degree atrioventricular block AND the patient does NOT have protection by pacemaker)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const organised_training_frequency_value_recorded_prior_to_inclusion_withunit_times_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient participated in organised training prior to inclusion.","when_to_set_to_null":"Set to null if the frequency of organised training prior to inclusion is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the frequency (times per week) of organised training participation prior to inclusion."} ;; "participated in organised training more than two times per week prior to inclusion"
(declare-const organised_training_frequency_value_recorded_prior_to_inclusion_withunit_times_per_week@@prior_to_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the frequency value refers specifically to the period prior to inclusion.","when_to_set_to_false":"Set to false if the frequency value does not refer to the period prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the frequency value refers to the period prior to inclusion.","meaning":"Boolean indicating whether the frequency value of organised training participation is qualified by the period prior to inclusion."} ;; "prior to inclusion"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (and organised_training_frequency_value_recorded_prior_to_inclusion_withunit_times_per_week@@prior_to_inclusion
             (> organised_training_frequency_value_recorded_prior_to_inclusion_withunit_times_per_week 2)))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in organised training more than two times per week prior to inclusion."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_weight_decreased_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had weight loss in the three months prior to inclusion.","when_to_set_to_false":"Set to false if the patient has not had weight loss in the three months prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had weight loss in the three months prior to inclusion.","meaning":"Boolean indicating whether the patient has had weight loss in the three months prior to inclusion."} ;; "weight loss in the three months prior to inclusion"
(declare-const patient_has_finding_of_weight_increased_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had weight gain in the three months prior to inclusion.","when_to_set_to_false":"Set to false if the patient has not had weight gain in the three months prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had weight gain in the three months prior to inclusion.","meaning":"Boolean indicating whether the patient has had weight gain in the three months prior to inclusion."} ;; "weight gain in the three months prior to inclusion"
(declare-const patient_weight_loss_value_recorded_inthepast3months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the percentage value of the patient's weight loss recorded in the three months prior to inclusion.","when_to_set_to_null":"Set to null if the percentage of the patient's weight loss in the three months prior to inclusion is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percentage of the patient's weight loss in the three months prior to inclusion."} ;; "weight loss > five percent in the three months prior to inclusion"
(declare-const patient_weight_gain_value_recorded_inthepast3months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the percentage value of the patient's weight gain recorded in the three months prior to inclusion.","when_to_set_to_null":"Set to null if the percentage of the patient's weight gain in the three months prior to inclusion is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percentage of the patient's weight gain in the three months prior to inclusion."} ;; "weight gain > five percent in the three months prior to inclusion"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: significant weight loss (>5%) in the 3 months prior to inclusion
(assert
(! (not (and patient_has_finding_of_weight_decreased_inthepast3months
             (> patient_weight_loss_value_recorded_inthepast3months_withunit_percent 5)))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had significant weight loss (weight loss > five percent) in the three months prior to inclusion."

;; Exclusion: significant weight gain (>5%) in the 3 months prior to inclusion
(assert
(! (not (and patient_has_finding_of_weight_increased_inthepast3months
             (> patient_weight_gain_value_recorded_inthepast3months_withunit_percent 5)))
   :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had significant weight gain (weight gain > five percent) in the three months prior to inclusion."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_able_to_comprehend_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to comprehend written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to comprehend written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comprehend written informed consent.","meaning":"Boolean indicating whether the patient is currently able to comprehend written informed consent."} ;; "the patient is NOT able to comprehend written informed consent"
(declare-const patient_is_able_to_comprehend_oral_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to comprehend oral informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to comprehend oral informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comprehend oral informed consent.","meaning":"Boolean indicating whether the patient is currently able to comprehend oral informed consent."} ;; "the patient is NOT able to comprehend oral informed consent"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (and (not patient_is_able_to_comprehend_written_informed_consent_now)
             (not patient_is_able_to_comprehend_oral_informed_consent_now)))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is NOT able to comprehend written informed consent) AND (the patient is NOT able to comprehend oral informed consent)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_undergoing_hormone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving (undergoing) hormone therapy at the present time.","when_to_set_to_false":"Set to false if the patient is not currently receiving (undergoing) hormone therapy at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving hormone therapy.","meaning":"Boolean indicating whether the patient is currently undergoing hormone therapy."} ;; "hormone treatment"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_undergoing_hormone_therapy_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving hormone treatment."
