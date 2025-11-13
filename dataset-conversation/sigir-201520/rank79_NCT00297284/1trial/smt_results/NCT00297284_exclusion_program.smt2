;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_modified_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Modified Mini Mental Status score is recorded at the current time.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's Modified Mini Mental Status score measured at the current time."} ;; "Modified Mini Mental Status score"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_modified_mini_mental_state_examination_score_value_recorded_now_withunit_score 77))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has global cognitive impairment as measured by a Modified Mini Mental Status score less than seventy-seven."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cardiac arrhythmia at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cardiac arrhythmia.","meaning":"Boolean indicating whether the patient has a history of cardiac arrhythmia."} ;; "arrhythmia"
(declare-const patient_has_diagnosis_of_left_ventricular_hypertrophy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with left ventricular hypertrophy at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with left ventricular hypertrophy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient has a history of left ventricular hypertrophy."} ;; "left ventricular hypertrophy"
(declare-const patient_has_diagnosis_of_mitral_valve_prolapse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with mitral valve prolapse at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with mitral valve prolapse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with mitral valve prolapse.","meaning":"Boolean indicating whether the patient has a history of mitral valve prolapse."} ;; "mitral valve prolapse"
(declare-const patient_has_diagnosis_of_mitral_valve_prolapse_inthehistory@@with_mitral_valve_prolapse_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's mitral valve prolapse diagnosis is associated with mitral valve prolapse syndrome.","when_to_set_to_false":"Set to false if the patient's mitral valve prolapse diagnosis is not associated with mitral valve prolapse syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's mitral valve prolapse diagnosis is associated with mitral valve prolapse syndrome.","meaning":"Boolean indicating whether the patient's mitral valve prolapse diagnosis is associated with mitral valve prolapse syndrome."} ;; "mitral valve prolapse with mitral valve prolapse syndrome"
(declare-const patient_has_diagnosis_of_j_b_barlow_s_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with mitral valve prolapse syndrome at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with mitral valve prolapse syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with mitral valve prolapse syndrome.","meaning":"Boolean indicating whether the patient has a history of mitral valve prolapse syndrome."} ;; "mitral valve prolapse syndrome"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the cardiovascular system at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient has a history of cardiovascular disease."} ;; "cardiovascular disease"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular disease diagnosis is considered significant.","when_to_set_to_false":"Set to false if the patient's cardiovascular disease diagnosis is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiovascular disease diagnosis is significant.","meaning":"Boolean indicating whether the patient's cardiovascular disease diagnosis is significant."} ;; "significant cardiovascular disease"
(declare-const patient_ejection_fraction_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the value of the patient's ejection fraction (in percent) recorded at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's ejection fraction value is.","meaning":"Numeric value indicating the patient's ejection fraction (in percent) recorded at any point in their history."} ;; "reduced ejection fraction"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for mitral valve prolapse
(assert
(! (=> patient_has_diagnosis_of_mitral_valve_prolapse_inthehistory@@with_mitral_valve_prolapse_syndrome
     patient_has_diagnosis_of_mitral_valve_prolapse_inthehistory)
:named REQ1_AUXILIARY0)) ;; "mitral valve prolapse with mitral valve prolapse syndrome"

;; Qualifier variable implies corresponding stem variable for significant cardiovascular disease
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@significant
     patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
:named REQ1_AUXILIARY1)) ;; "significant cardiovascular disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: history of arrhythmia
(assert
(! (not patient_has_diagnosis_of_cardiac_arrhythmia_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of arrhythmia."

;; Exclusion: known history of left ventricular hypertrophy
(assert
(! (not patient_has_diagnosis_of_left_ventricular_hypertrophy_inthehistory)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of left ventricular hypertrophy."

;; Exclusion: history of mitral valve prolapse with mitral valve prolapse syndrome
(assert
(! (not (and patient_has_diagnosis_of_mitral_valve_prolapse_inthehistory
             patient_has_diagnosis_of_mitral_valve_prolapse_inthehistory@@with_mitral_valve_prolapse_syndrome))
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of mitral valve prolapse with mitral valve prolapse syndrome."

;; Exclusion: history of other significant cardiovascular disease with a reduced ejection fraction
(assert
(! (not (and patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory@@significant
             (< patient_ejection_fraction_value_recorded_inthehistory_withunit_percent 50)))
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of other significant cardiovascular disease with a reduced ejection fraction."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's creatinine clearance (in milliliters per minute) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's creatinine clearance (in milliliters per minute) recorded now."} ;; "creatinine clearance"
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"
(declare-const patient_is_dialysis_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a dialysis patient.","when_to_set_to_false":"Set to false if the patient is currently not a dialysis patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a dialysis patient.","meaning":"Boolean indicating whether the patient is currently a dialysis patient."} ;; "dialysis patient"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: renal insufficiency defined as creatinine clearance < 30 ml/min
(assert
(! (= patient_has_finding_of_renal_insufficiency_now
(< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30))
:named REQ2_AUXILIARY0)) ;; "renal insufficiency defined as creatinine clearance less than thirty milliliters per minute"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have renal insufficiency OR be a dialysis patient
(assert
(! (not (or patient_has_finding_of_renal_insufficiency_now
            patient_is_dialysis_patient_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has renal insufficiency defined as creatinine clearance less than thirty milliliters per minute) OR (the patient is a dialysis patient)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's liver disease is known (previously diagnosed or documented).","when_to_set_to_false":"Set to false if the patient's liver disease is not known (not previously diagnosed or documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's liver disease is known.","meaning":"Boolean indicating whether the patient's liver disease is known."} ;; "known liver disease"
(declare-const patient_has_finding_of_liver_function_tests_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal liver function test results.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal liver function test results.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function test results.","meaning":"Boolean indicating whether the patient currently has abnormal liver function test results."} ;; "abnormal liver function test result"
(declare-const patient_has_finding_of_liver_function_tests_abnormal_now@@greater_than_two_times_upper_limit_of_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal liver function test result is greater than two times the upper limit of normal.","when_to_set_to_false":"Set to false if the patient's abnormal liver function test result is not greater than two times the upper limit of normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abnormal liver function test result is greater than two times the upper limit of normal.","meaning":"Boolean indicating whether the patient's abnormal liver function test result is greater than two times the upper limit of normal."} ;; "abnormal liver function test result greater than two times the upper limit of normal"
(declare-const patient_liver_function_test_transaminase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current transaminase level in U/L if available.","when_to_set_to_null":"Set to null if the patient's current transaminase level is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current transaminase level in U/L."} ;; "abnormal transaminase level"
(declare-const liver_function_test_transaminase_upper_limit_of_normal_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for transaminase level in U/L if available.","when_to_set_to_null":"Set to null if the upper limit of normal for transaminase level is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for transaminase level in U/L."} ;; "upper limit of normal for transaminase"
(declare-const patient_liver_function_test_gamma_glutamyl_transpeptidase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current gamma-glutamyl transpeptidase level in U/L if available.","when_to_set_to_null":"Set to null if the patient's current gamma-glutamyl transpeptidase level is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current gamma-glutamyl transpeptidase level in U/L."} ;; "abnormal gamma-glutamyl transpeptidase level"
(declare-const liver_function_test_gamma_glutamyl_transpeptidase_upper_limit_of_normal_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for gamma-glutamyl transpeptidase level in U/L if available.","when_to_set_to_null":"Set to null if the upper limit of normal for gamma-glutamyl transpeptidase level is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for gamma-glutamyl transpeptidase level in U/L."} ;; "upper limit of normal for gamma-glutamyl transpeptidase"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive example: active hepatitis implies known liver disease
(declare-const patient_has_finding_of_active_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have active hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active hepatitis.","meaning":"Boolean indicating whether the patient currently has active hepatitis."} ;; "active hepatitis"
(assert
(! (=> patient_has_finding_of_active_hepatitis_now
      patient_has_finding_of_disease_of_liver_now@@known)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (active hepatitis)"

;; Qualifier variable implies stem variable for liver disease
(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@known
      patient_has_finding_of_disease_of_liver_now)
:named REQ3_AUXILIARY1)) ;; "known liver disease"

;; Non-exhaustive example: abnormal transaminase or GGT implies abnormal LFT >2x ULN
(declare-const patient_has_finding_of_liver_function_test_transaminase_abnormal_greater_than_two_times_upper_limit_of_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current transaminase level is abnormal and greater than two times the upper limit of normal.","when_to_set_to_false":"Set to false if the patient's current transaminase level is not abnormal or not greater than two times the upper limit of normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current transaminase level is abnormal and greater than two times the upper limit of normal.","meaning":"Boolean indicating whether the patient's current transaminase level is abnormal and greater than two times the upper limit of normal."} ;; "abnormal transaminase level"
(assert
(! (= patient_has_finding_of_liver_function_test_transaminase_abnormal_greater_than_two_times_upper_limit_of_normal_now
      (and (>= patient_liver_function_test_transaminase_value_recorded_now_withunit_u_per_l 0)
           (>= liver_function_test_transaminase_upper_limit_of_normal_value_withunit_u_per_l 0)
           (> patient_liver_function_test_transaminase_value_recorded_now_withunit_u_per_l
              (* 2 liver_function_test_transaminase_upper_limit_of_normal_value_withunit_u_per_l))))
:named REQ3_AUXILIARY2)) ;; "abnormal transaminase level greater than two times the upper limit of normal"

(declare-const patient_has_finding_of_liver_function_test_gamma_glutamyl_transpeptidase_abnormal_greater_than_two_times_upper_limit_of_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current gamma-glutamyl transpeptidase level is abnormal and greater than two times the upper limit of normal.","when_to_set_to_false":"Set to false if the patient's current gamma-glutamyl transpeptidase level is not abnormal or not greater than two times the upper limit of normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current gamma-glutamyl transpeptidase level is abnormal and greater than two times the upper limit of normal.","meaning":"Boolean indicating whether the patient's current gamma-glutamyl transpeptidase level is abnormal and greater than two times the upper limit of normal."} ;; "abnormal gamma-glutamyl transpeptidase level"
(assert
(! (= patient_has_finding_of_liver_function_test_gamma_glutamyl_transpeptidase_abnormal_greater_than_two_times_upper_limit_of_normal_now
      (and (>= patient_liver_function_test_gamma_glutamyl_transpeptidase_value_recorded_now_withunit_u_per_l 0)
           (>= liver_function_test_gamma_glutamyl_transpeptidase_upper_limit_of_normal_value_withunit_u_per_l 0)
           (> patient_liver_function_test_gamma_glutamyl_transpeptidase_value_recorded_now_withunit_u_per_l
              (* 2 liver_function_test_gamma_glutamyl_transpeptidase_upper_limit_of_normal_value_withunit_u_per_l))))
:named REQ3_AUXILIARY3)) ;; "abnormal gamma-glutamyl transpeptidase level greater than two times the upper limit of normal"

(assert
(! (=> (or patient_has_finding_of_liver_function_test_transaminase_abnormal_greater_than_two_times_upper_limit_of_normal_now
           patient_has_finding_of_liver_function_test_gamma_glutamyl_transpeptidase_abnormal_greater_than_two_times_upper_limit_of_normal_now)
      patient_has_finding_of_liver_function_tests_abnormal_now@@greater_than_two_times_upper_limit_of_normal)
:named REQ3_AUXILIARY4)) ;; "with non-exhaustive examples (abnormal transaminase level, abnormal gamma-glutamyl transpeptidase level)"

;; Qualifier variable implies stem variable for abnormal LFTs
(assert
(! (=> patient_has_finding_of_liver_function_tests_abnormal_now@@greater_than_two_times_upper_limit_of_normal
      patient_has_finding_of_liver_function_tests_abnormal_now)
:named REQ3_AUXILIARY5)) ;; "abnormal liver function test result greater than two times the upper limit of normal"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now@@known)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known liver disease with non-exhaustive examples (active hepatitis)."

(assert
(! (not patient_has_finding_of_liver_function_tests_abnormal_now@@greater_than_two_times_upper_limit_of_normal)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any abnormal liver function test result greater than two times the upper limit of normal with non-exhaustive examples (abnormal transaminase level, abnormal gamma-glutamyl transpeptidase level)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of systemic lupus erythematosus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of systemic lupus erythematosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of systemic lupus erythematosus."} ;; "systemic lupus erythematosus"

(declare-const patient_has_finding_of_disorder_of_the_central_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the central nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the central nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the central nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder of the central nervous system."} ;; "central nervous system disease"

(declare-const patient_has_finding_of_disorder_of_the_central_nervous_system_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the central nervous system is active.","when_to_set_to_false":"Set to false if the patient's current disorder of the central nervous system is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is active.","meaning":"Boolean indicating whether the patient's current disorder of the central nervous system is active."} ;; "active central nervous system disease"

(declare-const patient_has_finding_of_sle_glomerulonephritis_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has SLE glomerulonephritis syndrome (lupus nephritis).","when_to_set_to_false":"Set to false if the patient currently does not have SLE glomerulonephritis syndrome (lupus nephritis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has SLE glomerulonephritis syndrome (lupus nephritis).","meaning":"Boolean indicating whether the patient currently has SLE glomerulonephritis syndrome (lupus nephritis)."} ;; "lupus nephritis"

(declare-const patient_has_finding_of_sle_glomerulonephritis_syndrome_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current SLE glomerulonephritis syndrome (lupus nephritis) is active.","when_to_set_to_false":"Set to false if the patient's current SLE glomerulonephritis syndrome (lupus nephritis) is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is active.","meaning":"Boolean indicating whether the patient's current SLE glomerulonephritis syndrome (lupus nephritis) is active."} ;; "active lupus nephritis"

(declare-const patient_has_finding_of_disorder_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the skin.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the skin.","meaning":"Boolean indicating whether the patient currently has a disorder of the skin."} ;; "skin disease"

(declare-const patient_has_finding_of_disorder_of_skin_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the skin is active.","when_to_set_to_false":"Set to false if the patient's current disorder of the skin is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is active.","meaning":"Boolean indicating whether the patient's current disorder of the skin is active."} ;; "active skin disease"

(declare-const patient_has_finding_of_disorder_of_skin_now@@ulcerative Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the skin is ulcerative.","when_to_set_to_false":"Set to false if the patient's current disorder of the skin is not ulcerative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is ulcerative.","meaning":"Boolean indicating whether the patient's current disorder of the skin is ulcerative."} ;; "ulcerative skin disease"

(declare-const patient_has_finding_of_systemic_lupus_erythematosus_related_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic lupus erythematosus-related syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a systemic lupus erythematosus-related syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a systemic lupus erythematosus-related syndrome.","meaning":"Boolean indicating whether the patient currently has a systemic lupus erythematosus-related syndrome."} ;; "systemic lupus erythematosus-associated conditions"

(declare-const patient_has_finding_of_systemic_lupus_erythematosus_related_syndrome_now@@involving_major_organ_systems Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current systemic lupus erythematosus-related syndrome involves major organ systems.","when_to_set_to_false":"Set to false if the patient's current systemic lupus erythematosus-related syndrome does not involve major organ systems.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the syndrome involves major organ systems.","meaning":"Boolean indicating whether the patient's current systemic lupus erythematosus-related syndrome involves major organ systems."} ;; "systemic lupus erythematosus-associated conditions involving major organ systems"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_the_central_nervous_system_now@@active
      patient_has_finding_of_disorder_of_the_central_nervous_system_now)
    :named REQ4_AUXILIARY0)) ;; "active central nervous system disease"

(assert
(! (=> patient_has_finding_of_sle_glomerulonephritis_syndrome_now@@active
      patient_has_finding_of_sle_glomerulonephritis_syndrome_now)
    :named REQ4_AUXILIARY1)) ;; "active lupus nephritis"

(assert
(! (=> patient_has_finding_of_disorder_of_skin_now@@active
      patient_has_finding_of_disorder_of_skin_now)
    :named REQ4_AUXILIARY2)) ;; "active skin disease"

(assert
(! (=> patient_has_finding_of_disorder_of_skin_now@@ulcerative
      patient_has_finding_of_disorder_of_skin_now)
    :named REQ4_AUXILIARY3)) ;; "ulcerative skin disease"

(assert
(! (=> patient_has_finding_of_systemic_lupus_erythematosus_related_syndrome_now@@involving_major_organ_systems
      patient_has_finding_of_systemic_lupus_erythematosus_related_syndrome_now)
    :named REQ4_AUXILIARY4)) ;; "systemic lupus erythematosus-associated conditions involving major organ systems"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_diagnosis_of_systemic_lupus_erythematosus_now
             patient_has_finding_of_disorder_of_the_central_nervous_system_now@@active))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "significant and serious systemic lupus erythematosus activity defined as active central nervous system disease"

(assert
(! (not (and patient_has_diagnosis_of_systemic_lupus_erythematosus_now
             patient_has_finding_of_sle_glomerulonephritis_syndrome_now@@active))
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "significant and serious systemic lupus erythematosus activity defined as active lupus nephritis"

(assert
(! (not (and patient_has_diagnosis_of_systemic_lupus_erythematosus_now
             patient_has_finding_of_disorder_of_skin_now@@active
             patient_has_finding_of_disorder_of_skin_now@@ulcerative))
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "significant and serious systemic lupus erythematosus activity defined as active ulcerative skin disease"

(assert
(! (not (and patient_has_diagnosis_of_systemic_lupus_erythematosus_now
             patient_has_finding_of_systemic_lupus_erythematosus_related_syndrome_now@@involving_major_organ_systems))
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "other active systemic lupus erythematosus-associated conditions involving major organ systems at the discretion of the investigator"

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_nursing_mother_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a nursing mother as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not a nursing mother as documented or reported.","when_to_set_to_null":"Set to null if the patient's current nursing mother status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently a nursing mother."} ;; "the patient is a nursing mother"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is a nursing mother"
(declare-const patient_is_unwilling_to_use_barrier_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to use barrier contraception as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently willing to use barrier contraception as documented or reported.","when_to_set_to_null":"Set to null if the patient's willingness to use barrier contraception is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently unwilling to use barrier contraception."} ;; "the patient is unwilling to use barrier contraception"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Being a nursing mother implies breastfeeding
(assert
(! (=> patient_is_nursing_mother_now patient_is_breastfeeding_now)
:named REQ5_AUXILIARY0)) ;; "the patient is a nursing mother"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT be pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is pregnant"

;; Exclusion: patient must NOT be a nursing mother
(assert
(! (not patient_is_nursing_mother_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is a nursing mother"

;; Exclusion: patient must NOT be unwilling to use barrier contraception
(assert
(! (not patient_is_unwilling_to_use_barrier_contraception_now)
:named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is unwilling to use barrier contraception"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychotic disorder (psychosis).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psychotic disorder (psychosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psychotic disorder (psychosis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychotic disorder (psychosis)."} ;; "diagnosis of active psychosis"
(declare-const patient_has_diagnosis_of_psychotic_disorder_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychotic disorder (psychosis) and the diagnosis is active.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of psychotic disorder (psychosis) but the diagnosis is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of psychotic disorder (psychosis) is active.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychotic disorder (psychosis) and the diagnosis is active."} ;; "diagnosis of active psychosis"
(declare-const patient_has_diagnosis_of_attention_deficit_hyperactivity_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of attention deficit hyperactivity disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of attention deficit hyperactivity disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of attention deficit hyperactivity disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of attention deficit hyperactivity disorder."} ;; "diagnosis of attention deficit hyperactivity disorder"
(declare-const patient_has_diagnosis_of_attention_deficit_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of attention deficit disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of attention deficit disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of attention deficit disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of attention deficit disorder."} ;; "diagnosis of attention deficit disorder"
(declare-const patient_has_diagnosis_of_attention_deficit_hyperactivity_disorder_predominantly_inattentive_type_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of attention deficit hyperactivity disorder, predominantly inattentive type.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of attention deficit hyperactivity disorder, predominantly inattentive type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of attention deficit hyperactivity disorder, predominantly inattentive type.","meaning":"Boolean indicating whether the patient currently has a diagnosis of attention deficit hyperactivity disorder, predominantly inattentive type."} ;; "diagnosis of attention deficit disorder (inattentive type)"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for "active" status implies stem variable for psychotic disorder
(assert
(! (=> patient_has_diagnosis_of_psychotic_disorder_now@@active_status
       patient_has_diagnosis_of_psychotic_disorder_now)
   :named REQ6_AUXILIARY0)) ;; "diagnosis of active psychosis" qualifier implies diagnosis of psychotic disorder

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have a diagnosis of active psychosis
(assert
(! (not patient_has_diagnosis_of_psychotic_disorder_now@@active_status)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of active psychosis."

;; Exclusion: patient must NOT have a diagnosis of attention deficit hyperactivity disorder
(assert
(! (not patient_has_diagnosis_of_attention_deficit_hyperactivity_disorder_now)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of attention deficit hyperactivity disorder."

;; Exclusion: patient must NOT have a diagnosis of attention deficit disorder
(assert
(! (not (or patient_has_diagnosis_of_attention_deficit_disorder_now
            patient_has_diagnosis_of_attention_deficit_hyperactivity_disorder_predominantly_inattentive_type_now))
   :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of attention deficit disorder."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_triazolam_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to triazolam.","when_to_set_to_false":"Set to false if the patient is currently not exposed to triazolam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to triazolam.","meaning":"Boolean indicating whether the patient is currently exposed to triazolam."} ;; "triazolam"
(declare-const patient_is_exposed_to_phenobarbital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to phenobarbital.","when_to_set_to_false":"Set to false if the patient is currently not exposed to phenobarbital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to phenobarbital.","meaning":"Boolean indicating whether the patient is currently exposed to phenobarbital."} ;; "phenobarbital"
(declare-const patient_is_exposed_to_cyclosporine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cyclosporine A.","when_to_set_to_false":"Set to false if the patient is currently not exposed to cyclosporine A.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cyclosporine A.","meaning":"Boolean indicating whether the patient is currently exposed to cyclosporine A."} ;; "cyclosporine A"
(declare-const patient_is_exposed_to_theophylline_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to theophylline.","when_to_set_to_false":"Set to false if the patient is currently not exposed to theophylline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to theophylline.","meaning":"Boolean indicating whether the patient is currently exposed to theophylline."} ;; "theophylline"
(declare-const patient_is_exposed_to_carbamazepine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to carbamazepine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to carbamazepine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to carbamazepine.","meaning":"Boolean indicating whether the patient is currently exposed to carbamazepine."} ;; "carbamazepine"
(declare-const patient_is_exposed_to_diazepam_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to diazepam.","when_to_set_to_false":"Set to false if the patient is currently not exposed to diazepam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to diazepam.","meaning":"Boolean indicating whether the patient is currently exposed to diazepam."} ;; "diazepam"
(declare-const patient_is_exposed_to_phenytoin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to phenytoin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to phenytoin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to phenytoin.","meaning":"Boolean indicating whether the patient is currently exposed to phenytoin."} ;; "phenytoin"
(declare-const patient_is_exposed_to_mephenytoin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to mephenytoin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to mephenytoin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to mephenytoin.","meaning":"Boolean indicating whether the patient is currently exposed to mephenytoin."} ;; "mephenytoin"
(declare-const patient_is_exposed_to_rifampin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to rifampin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to rifampin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to rifampin.","meaning":"Boolean indicating whether the patient is currently exposed to rifampin."} ;; "rifampin"
(declare-const patient_is_exposed_to_ketoconazole_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ketoconazole.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ketoconazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ketoconazole.","meaning":"Boolean indicating whether the patient is currently exposed to ketoconazole."} ;; "ketoconazole"
(declare-const patient_is_exposed_to_itraconazole_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to itraconazole.","when_to_set_to_false":"Set to false if the patient is currently not exposed to itraconazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to itraconazole.","meaning":"Boolean indicating whether the patient is currently exposed to itraconazole."} ;; "itraconazole"
(declare-const patient_is_exposed_to_modafinil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to modafinil.","when_to_set_to_false":"Set to false if the patient is currently not exposed to modafinil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to modafinil.","meaning":"Boolean indicating whether the patient is currently exposed to modafinil."} ;; "modafinil"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Exhaustive subcategories: contraindicated medication use is exactly the union of the listed drugs
(declare-const patient_is_currently_using_medication_contraindicated_with_modafinil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any medication contraindicated with modafinil (i.e., any of the listed drugs).","when_to_set_to_false":"Set to false if the patient is currently not using any medication contraindicated with modafinil (i.e., none of the listed drugs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any medication contraindicated with modafinil.","meaning":"Boolean indicating whether the patient is currently using any medication contraindicated with modafinil (i.e., any of the listed drugs: triazolam, phenobarbital, cyclosporine A, theophylline, carbamazepine, diazepam, phenytoin, mephenytoin, rifampin, ketoconazole, itraconazole)."} ;; "currently using medications contraindicated with the use of modafinil with exhaustive subcategories (triazolam, phenobarbital, cyclosporine A, theophylline, carbamazepine, diazepam, phenytoin, mephenytoin, rifampin, ketoconazole, itraconazole)"

(assert
(! (= patient_is_currently_using_medication_contraindicated_with_modafinil_now
     (or patient_is_exposed_to_triazolam_now
         patient_is_exposed_to_phenobarbital_now
         patient_is_exposed_to_cyclosporine_now
         patient_is_exposed_to_theophylline_now
         patient_is_exposed_to_carbamazepine_now
         patient_is_exposed_to_diazepam_now
         patient_is_exposed_to_phenytoin_now
         patient_is_exposed_to_mephenytoin_now
         patient_is_exposed_to_rifampin_now
         patient_is_exposed_to_ketoconazole_now
         patient_is_exposed_to_itraconazole_now))
   :named REQ7_AUXILIARY0)) ;; "with exhaustive subcategories (triazolam, phenobarbital, cyclosporine A, theophylline, carbamazepine, diazepam, phenytoin, mephenytoin, rifampin, ketoconazole, itraconazole)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_currently_using_medication_contraindicated_with_modafinil_now)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using medications contraindicated with the use of modafinil with exhaustive subcategories (triazolam, phenobarbital, cyclosporine A, theophylline, carbamazepine, diazepam, phenytoin, mephenytoin, rifampin, ketoconazole, itraconazole)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_cage_questionnaire_affirmative_response_count_now Real) ;; {"when_to_set_to_value":"Set to the number of affirmative responses the patient currently has to the CAGE questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many affirmative responses the patient currently has to the CAGE questionnaire.","meaning":"Numeric variable indicating the number of affirmative responses the patient currently has to the CAGE questionnaire."} ;; "two affirmative responses to the CAGE questionnaire"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "alcohol abuse"
(declare-const patient_has_finding_of_illicit_medication_use_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of illicit medication use (illegal drug abuse).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of illicit medication use (illegal drug abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has illicit medication use (illegal drug abuse).","meaning":"Boolean indicating whether the patient currently has illicit medication use (illegal drug abuse)."} ;; "illegal drug abuse"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: illegal drug abuse is defined as two affirmative responses to the CAGE questionnaire
(assert
(! (= patient_has_finding_of_illicit_medication_use_now
(>= patient_cage_questionnaire_affirmative_response_count_now 2))
:named REQ8_AUXILIARY0)) ;; "illegal drug abuse defined as two affirmative responses to the CAGE questionnaire"

;; Definition: alcohol abuse is defined as two affirmative responses to the CAGE questionnaire
(assert
(! (= patient_has_finding_of_alcohol_abuse_now
(>= patient_cage_questionnaire_affirmative_response_count_now 2))
:named REQ8_AUXILIARY1)) ;; "alcohol abuse defined as two affirmative responses to the CAGE questionnaire"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_illicit_medication_use_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has illegal drug abuse defined as two affirmative responses to the CAGE questionnaire."

(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alcohol abuse defined as two affirmative responses to the CAGE questionnaire."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_modafinil_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to modafinil at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been exposed to modafinil prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to modafinil prior to now.","meaning":"Boolean indicating whether the patient has ever been exposed to modafinil at any time in the past."} ;; "prior use of modafinil"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_exposed_to_modafinil_inthehistory)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior use of modafinil."
