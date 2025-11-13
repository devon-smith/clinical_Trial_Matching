;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with congestive heart failure at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with congestive heart failure at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with congestive heart failure.","meaning":"Boolean indicating whether the patient has ever been diagnosed with congestive heart failure at any time in their medical history."} ;; "the patient has a history of congestive heart failure"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction at any time in their medical history."} ;; "the patient has a history of myocardial infarction"

(declare-const patient_has_history_of_coronary_revascularization_within_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary revascularization within the most recent 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone coronary revascularization within the most recent 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary revascularization within the most recent 6 months.","meaning":"Boolean indicating whether the patient has a history of coronary revascularization that occurred within the most recent 6 months."} ;; "the patient has a history of coronary revascularization within the recent 6 months"

(declare-const time_since_most_recent_coronary_revascularization_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent coronary revascularization procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's most recent coronary revascularization procedure occurred.","meaning":"Numeric variable indicating the number of months since the patient's most recent coronary revascularization procedure."} ;; "within the recent 6 months"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient_has_history_of_coronary_revascularization_within_6_months is true iff time_since_most_recent_coronary_revascularization_in_months <= 6
(assert
(! (= patient_has_history_of_coronary_revascularization_within_6_months
     (<= time_since_most_recent_coronary_revascularization_in_months 6))
:named REQ0_AUXILIARY0)) ;; "the patient has a history of coronary revascularization within the recent 6 months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_congestive_heart_failure_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of congestive heart failure"

(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of myocardial infarction"

(assert
(! (not patient_has_history_of_coronary_revascularization_within_6_months)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has a history of coronary revascularization within the recent 6 months"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_taking_calcium_channel_blocker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a calcium channel blocker.","when_to_set_to_false":"Set to false if the patient is currently not taking a calcium channel blocker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a calcium channel blocker.","meaning":"Boolean indicating whether the patient is currently taking a calcium channel blocker."} ;; "calcium channel blocker"
(declare-const patient_is_taking_calcium_channel_blocker_now@@for_treatment_of_angina_pectoris Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a calcium channel blocker for the purpose of treatment of angina pectoris.","when_to_set_to_false":"Set to false if the patient is currently taking a calcium channel blocker but not for the purpose of treatment of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the calcium channel blocker is being taken for the purpose of treatment of angina pectoris.","meaning":"Boolean indicating whether the patient is currently taking a calcium channel blocker for the purpose of treatment of angina pectoris."} ;; "for the purpose of treatment of angina pectoris"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_is_taking_calcium_channel_blocker_now@@for_treatment_of_angina_pectoris
      patient_is_taking_calcium_channel_blocker_now)
:named REQ1_AUXILIARY0)) ;; "for the purpose of treatment of angina pectoris" implies "calcium channel blocker"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_taking_calcium_channel_blocker_now@@for_treatment_of_angina_pectoris)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking a calcium channel blocker for the purpose of treatment of angina pectoris."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a current cardiac ejection fraction measurement is available.","when_to_set_to_null":"Set to null if no current measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current cardiac ejection fraction."} ;; "ejection fraction"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent 40))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a reduced ejection fraction (ejection fraction < 40%)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_second_degree_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of second-degree atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of second-degree atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of second-degree atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of second-degree atrioventricular block."} ;; "second-degree atrioventricular block"
(declare-const patient_has_finding_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of complete (third-degree) atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of complete (third-degree) atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of complete (third-degree) atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of complete (third-degree) atrioventricular block."} ;; "third-degree atrioventricular block"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_second_degree_atrioventricular_block_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has second-degree atrioventricular block."

(assert
(! (not patient_has_finding_of_complete_atrioventricular_block_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has third-degree atrioventricular block."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value for the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current diastolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value for the patient's current diastolic blood pressure in mmHg."} ;; "diastolic blood pressure"
(declare-const patient_has_finding_of_severe_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have severe hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe hypertension.","meaning":"Boolean indicating whether the patient currently has severe hypertension."} ;; "severe hypertension"
(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hypertension.","meaning":"Boolean indicating whether the patient currently has secondary hypertension."} ;; "secondary hypertension"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition of severe hypertension per requirement: (systolic BP > 200 mmHg OR diastolic BP > 110 mmHg)
(assert
(! (= patient_has_finding_of_severe_hypertension_now
     (or (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 200)
         (> patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 110)))
   :named REQ4_AUXILIARY0)) ;; "severe hypertension (systolic blood pressure > 200 mmHg OR diastolic blood pressure > 110 mmHg)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have severe hypertension
(assert
(! (not patient_has_finding_of_severe_hypertension_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypertension (systolic blood pressure > 200 mmHg OR diastolic blood pressure > 110 mmHg)."

;; Exclusion: patient must NOT have secondary hypertension
(assert
(! (not patient_has_finding_of_secondary_hypertension_now)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past 6 months.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within the past 6 months."} ;; "stroke within the recent 6 months"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast6months)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke within the recent 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine concentration in mg/dl is recorded at the present time.","when_to_set_to_null":"Set to null if no current serum creatinine concentration measurement in mg/dl is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum creatinine concentration in mg/dl."} ;; "serum creatinine concentration"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 2.5))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine concentration > 2.5 mg/dl."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_survival_time_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the estimated number of years the patient is expected to survive due to other conditions, as assessed at the current time.","when_to_set_to_null":"Set to null if no such estimate is available or cannot be determined at the current time.","meaning":"Numeric value representing the patient's estimated survival time in years due to other conditions, as assessed now."} ;; "estimated survival duration"
(declare-const patient_survival_time_value_recorded_now_withunit_years@@due_to_other_conditions Bool) ;; {"when_to_set_to_true":"Set to true if the estimated survival time value is specifically due to other conditions (not the index disease).","when_to_set_to_false":"Set to false if the estimated survival time value is not due to other conditions or is due to the index disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the estimate is due to other conditions.","meaning":"Boolean indicating whether the estimated survival time value is due to other conditions (not the index disease)."} ;; "due to other conditions"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and patient_survival_time_value_recorded_now_withunit_years@@due_to_other_conditions
             (< patient_survival_time_value_recorded_now_withunit_years 3)))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has estimated survival duration < 3 years due to other conditions."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is a pregnant woman"
(declare-const patient_is_possibly_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is possibly pregnant at the current time (e.g., there is suspicion or uncertainty about current pregnancy status, but not confirmed).","when_to_set_to_false":"Set to false if the patient is not possibly pregnant at the current time (e.g., pregnancy is ruled out or confirmed not pregnant).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is possibly pregnant at the current time.","meaning":"Boolean indicating whether the patient is possibly pregnant at the current time."} ;; "the patient is a possibly pregnant woman"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to become pregnant at the current time (e.g., is female, of reproductive age, and has not had sterilization or menopause).","when_to_set_to_false":"Set to false if the patient is not able to become pregnant at the current time (e.g., is male, postmenopausal, or has had sterilization).","when_to_set_to_null":"Set to null if the patient's ability to become pregnant at the current time is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is able to become pregnant at the current time."} ;; "the patient is a possibly pregnant woman"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_is_pregnant_now
            patient_is_possibly_pregnant_now))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a pregnant woman) OR (the patient is a possibly pregnant woman))."
