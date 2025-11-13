;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_can_undergo_cardiovascular_stress_test_using_treadmill_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo a cardiovascular stress test using treadmill (i.e., has no contraindication to the procedure).","when_to_set_to_false":"Set to false if the patient cannot currently undergo a cardiovascular stress test using treadmill (i.e., has a contraindication to the procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a cardiovascular stress test using treadmill.","meaning":"Boolean indicating whether the patient can currently undergo a cardiovascular stress test using treadmill."} ;; "contraindication to perform treadmill exercise tolerance test"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_can_undergo_cardiovascular_stress_test_using_treadmill_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to perform treadmill exercise tolerance test."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_st_segment_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ST-segment depression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ST-segment depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST-segment depression.","meaning":"Boolean indicating whether the patient currently has ST-segment depression."} ;; "ST-segment depression"
(declare-const patient_has_finding_of_st_segment_depression_now@@pre_exercise_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ST-segment depression occurs in the pre-exercise context.","when_to_set_to_false":"Set to false if the patient's current ST-segment depression does not occur in the pre-exercise context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ST-segment depression occurs in the pre-exercise context.","meaning":"Boolean indicating whether the patient's current ST-segment depression occurs in the pre-exercise context."} ;; "pre-exercise ST-segment depression"
(declare-const patient_has_finding_of_st_segment_depression_now@@present_in_any_lead Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ST-segment depression is present in any lead.","when_to_set_to_false":"Set to false if the patient's current ST-segment depression is not present in any lead.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ST-segment depression is present in any lead.","meaning":"Boolean indicating whether the patient's current ST-segment depression is present in any lead."} ;; "in any lead"
(declare-const st_segment_depression_magnitude_value_pre_exercise_present_in_any_lead_now_in_millimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value (in millimeters) of the patient's current pre-exercise ST-segment depression present in any lead.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the magnitude of the patient's current pre-exercise ST-segment depression present in any lead is.","meaning":"Numeric value indicating the magnitude (in millimeters) of the patient's current pre-exercise ST-segment depression present in any lead."} ;; "of at least one millimeter"
(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left bundle branch block.","meaning":"Boolean indicating whether the patient currently has left bundle branch block."} ;; "left bundle branch block"
(declare-const patient_is_on_digoxin_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on digoxin therapy.","when_to_set_to_false":"Set to false if the patient is currently not on digoxin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on digoxin therapy.","meaning":"Boolean indicating whether the patient is currently on digoxin therapy."} ;; "on digoxin therapy"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular hypertrophy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular hypertrophy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient currently has left ventricular hypertrophy."} ;; "left ventricular hypertrophy"
(declare-const patient_has_finding_of_wolff_parkinson_white_pattern_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Wolff-Parkinson-White syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Wolff-Parkinson-White syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Wolff-Parkinson-White syndrome.","meaning":"Boolean indicating whether the patient currently has Wolff-Parkinson-White syndrome."} ;; "Wolff-Parkinson-White syndrome"
(declare-const patient_has_other_factors_that_could_interfere_with_exercise_electrocardiograph_interpretation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other factors that could interfere with exercise electrocardiograph interpretation.","when_to_set_to_false":"Set to false if the patient currently does not have other factors that could interfere with exercise electrocardiograph interpretation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other factors that could interfere with exercise electrocardiograph interpretation.","meaning":"Boolean indicating whether the patient currently has other factors that could interfere with exercise electrocardiograph interpretation."} ;; "other factors that could interfere with exercise electrocardiograph interpretation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_st_segment_depression_now@@pre_exercise_context
      patient_has_finding_of_st_segment_depression_now)
:named REQ1_AUXILIARY0)) ;; "pre-exercise context"

(assert
(! (=> patient_has_finding_of_st_segment_depression_now@@present_in_any_lead
      patient_has_finding_of_st_segment_depression_now)
:named REQ1_AUXILIARY1)) ;; "present in any lead"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: pre-exercise ST-segment depression of at least one millimeter in any lead
(assert
(! (not (and patient_has_finding_of_st_segment_depression_now@@pre_exercise_context
             patient_has_finding_of_st_segment_depression_now@@present_in_any_lead
             (>= st_segment_depression_magnitude_value_pre_exercise_present_in_any_lead_now_in_millimeters 1)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "pre-exercise ST-segment depression of at least one millimeter in any lead"

;; Exclusion: left bundle branch block
(assert
(! (not patient_has_finding_of_left_bundle_branch_block_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "left bundle branch block"

;; Exclusion: on digoxin therapy
(assert
(! (not patient_is_on_digoxin_therapy_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "on digoxin therapy"

;; Exclusion: left ventricular hypertrophy
(assert
(! (not patient_has_finding_of_left_ventricular_hypertrophy_now)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "left ventricular hypertrophy"

;; Exclusion: Wolff-Parkinson-White syndrome
(assert
(! (not patient_has_finding_of_wolff_parkinson_white_pattern_now)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "Wolff-Parkinson-White syndrome"

;; Exclusion: other factors that could interfere with exercise electrocardiograph interpretation
(assert
(! (not patient_has_other_factors_that_could_interfere_with_exercise_electrocardiograph_interpretation_now)
:named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "other factors that could interfere with exercise electrocardiograph interpretation"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has a finding of cardiac arrhythmia."} ;; "arrhythmias"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of cardiac arrhythmia and the arrhythmia is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a finding of cardiac arrhythmia but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arrhythmia is clinically significant.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is clinically significant."} ;; "clinically significant arrhythmias"
(declare-const patient_has_finding_of_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a finding of atrioventricular block."} ;; "atrioventricular conduction block"
(declare-const patient_has_finding_of_atrioventricular_block_now@@greater_than_first_degree Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of atrioventricular block and the block is greater than first degree.","when_to_set_to_false":"Set to false if the patient currently has a finding of atrioventricular block but it is first degree or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the block is greater than first degree.","meaning":"Boolean indicating whether the patient's current atrioventricular block is greater than first degree."} ;; "atrioventricular conduction block greater than first degree"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@clinically_significant
      patient_has_finding_of_cardiac_arrhythmia_now)
   :named REQ2_AUXILIARY0)) ;; "clinically significant arrhythmias"

(assert
(! (=> patient_has_finding_of_atrioventricular_block_now@@greater_than_first_degree
      patient_has_finding_of_atrioventricular_block_now)
   :named REQ2_AUXILIARY1)) ;; "atrioventricular conduction block greater than first degree"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_cardiac_arrhythmia_now@@clinically_significant
            patient_has_finding_of_atrioventricular_block_now@@greater_than_first_degree))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has clinically significant arrhythmias) OR (the patient has atrioventricular conduction block greater than first degree))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has comorbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have comorbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has comorbid conditions.","meaning":"Boolean indicating whether the patient currently has comorbid conditions."} ;; "comorbidities"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has comorbid conditions that are clinically significant.","when_to_set_to_false":"Set to false if the patient currently has comorbid conditions that are not clinically significant, or does not have comorbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's comorbid conditions are clinically significant.","meaning":"Boolean indicating whether the patient's comorbid conditions are clinically significant."} ;; "clinically significant comorbidities"
(declare-const patient_has_finding_of_hepatic_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic dysfunction.","meaning":"Boolean indicating whether the patient currently has hepatic dysfunction."} ;; "hepatic dysfunction"
(declare-const patient_has_finding_of_renal_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have renal dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal dysfunction.","meaning":"Boolean indicating whether the patient currently has renal dysfunction."} ;; "renal dysfunction"
(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension."} ;; "pulmonary hypertension"
(declare-const patient_has_finding_of_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_history_of_cerebral_hemorrhage Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of cerebral hemorrhage.","when_to_set_to_false":"Set to false if the patient does not have a history of cerebral hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebral hemorrhage.","meaning":"Boolean indicating whether the patient has a history of cerebral hemorrhage."} ;; "history of cerebral hemorrhage"
(declare-const patient_has_finding_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a seizure disorder.","meaning":"Boolean indicating whether the patient currently has a seizure disorder."} ;; "seizure disorders"
(declare-const patient_has_finding_of_seizure_disorder_now@@required_anticonvulsant_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current seizure disorder required anticonvulsant medication.","when_to_set_to_false":"Set to false if the patient's current seizure disorder did not require anticonvulsant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current seizure disorder required anticonvulsant medication.","meaning":"Boolean indicating whether the patient's current seizure disorder required anticonvulsant medication."} ;; "seizure disorders that required anticonvulsant medication"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples: listed comorbidities are examples of clinically significant comorbidities
(assert
(! (=> (or patient_has_finding_of_hepatic_dysfunction_now
          patient_has_finding_of_renal_dysfunction_now
          patient_has_finding_of_pulmonary_hypertension_now
          patient_has_finding_of_chronic_obstructive_pulmonary_disease_now
          patient_has_finding_of_history_of_cerebral_hemorrhage
          patient_has_finding_of_seizure_disorder_now@@required_anticonvulsant_medication)
    patient_has_finding_of_co_morbid_conditions_now@@clinically_significant)
:named REQ3_AUXILIARY0)) ;; "including hepatic dysfunction, renal dysfunction, pulmonary hypertension, chronic obstructive pulmonary disease, history of cerebral hemorrhage, or seizure disorders that required anticonvulsant medication"

;; Qualifier variable implies stem variable for comorbid conditions
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@clinically_significant
       patient_has_finding_of_co_morbid_conditions_now)
:named REQ3_AUXILIARY1)) ;; "clinically significant comorbidities"

;; Qualifier variable implies stem variable for seizure disorder
(assert
(! (=> patient_has_finding_of_seizure_disorder_now@@required_anticonvulsant_medication
       patient_has_finding_of_seizure_disorder_now)
:named REQ3_AUXILIARY2)) ;; "seizure disorders that required anticonvulsant medication"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@clinically_significant)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant comorbidities, including hepatic dysfunction, renal dysfunction, pulmonary hypertension, chronic obstructive pulmonary disease, history of cerebral hemorrhage, or seizure disorders that required anticonvulsant medication."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with congestive heart failure at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with congestive heart failure.","meaning":"Boolean indicating whether the patient has ever been diagnosed with congestive heart failure."} ;; "the patient has a history of congestive heart failure"

(declare-const patient_has_diagnosis_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with angina pectoris at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with angina pectoris.","meaning":"Boolean indicating whether the patient has ever been diagnosed with angina pectoris."} ;; "the patient has a history of unstable angina"

(declare-const patient_has_diagnosis_of_heart_valve_disorder_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart valve disorder is severe.","when_to_set_to_false":"Set to false if the patient's heart valve disorder is not severe.","when_to_set_to_null":"Set to null if severity is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's heart valve disorder is severe."} ;; "the patient has severe valvular disease"

(declare-const patient_has_diagnosis_of_heart_valve_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart valve disorder at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart valve disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart valve disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with heart valve disorder."} ;; "valvular disease"

(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive disorder is severe.","when_to_set_to_false":"Set to false if the patient's hypertensive disorder is not severe.","when_to_set_to_null":"Set to null if severity is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's hypertensive disorder is severe."} ;; "the patient has severe hypertension"

(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hypertensive disorder at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hypertensive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hypertensive disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with hypertensive disorder."} ;; "hypertension"

(declare-const patient_has_diagnosis_of_anemia_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anemia is severe.","when_to_set_to_false":"Set to false if the patient's anemia is not severe.","when_to_set_to_null":"Set to null if severity is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's anemia is severe."} ;; "the patient has severe anemia"

(declare-const patient_has_diagnosis_of_anemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with anemia at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with anemia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with anemia."} ;; "anemia"

(declare-const patient_has_diagnosis_of_aneurysm_inthehistory@@dissecting Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aneurysm is dissecting.","when_to_set_to_false":"Set to false if the patient's aneurysm is not dissecting.","when_to_set_to_null":"Set to null if dissection status is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's aneurysm is dissecting."} ;; "the patient has suspected dissecting aneurysm" or "the patient has known dissecting aneurysm"

(declare-const patient_has_diagnosis_of_aneurysm_inthehistory@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aneurysm is suspected.","when_to_set_to_false":"Set to false if the patient's aneurysm is not suspected.","when_to_set_to_null":"Set to null if suspicion is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's aneurysm is suspected."} ;; "the patient has suspected dissecting aneurysm"

(declare-const patient_has_diagnosis_of_aneurysm_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aneurysm is known.","when_to_set_to_false":"Set to false if the patient's aneurysm is not known.","when_to_set_to_null":"Set to null if known status is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's aneurysm is known."} ;; "the patient has known dissecting aneurysm"

(declare-const patient_has_diagnosis_of_aneurysm_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with aneurysm at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with aneurysm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with aneurysm.","meaning":"Boolean indicating whether the patient has ever been diagnosed with aneurysm."} ;; "aneurysm"

(declare-const patient_has_diagnosis_of_acute_myocarditis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with acute myocarditis at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with acute myocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with acute myocarditis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with acute myocarditis."} ;; "the patient has acute myocarditis"

(declare-const patient_has_diagnosis_of_acute_pericarditis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with acute pericarditis at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with acute pericarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with acute pericarditis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with acute pericarditis."} ;; "the patient has acute pericarditis"

(declare-const patient_has_diagnosis_of_thrombophlebitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with thrombophlebitis at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with thrombophlebitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with thrombophlebitis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with thrombophlebitis."} ;; "the patient has thrombophlebitis"

(declare-const patient_has_diagnosis_of_pulmonary_embolism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with pulmonary embolism at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with pulmonary embolism.","meaning":"Boolean indicating whether the patient has ever been diagnosed with pulmonary embolism."} ;; "the patient has pulmonary embolism"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within3months_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction occurred within three months before study entry.","when_to_set_to_false":"Set to false if the patient's myocardial infarction did not occur within three months before study entry.","when_to_set_to_null":"Set to null if timing is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred within three months before study entry."} ;; "the patient has recent myocardial infarction within three months of study entry"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction."} ;; "myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_heart_valve_disorder_inthehistory@@severe
       patient_has_diagnosis_of_heart_valve_disorder_inthehistory)
   :named REQ4_AUXILIARY0)) ;; "severe valvular disease"

(assert
(! (=> patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@severe
       patient_has_diagnosis_of_hypertensive_disorder_inthehistory)
   :named REQ4_AUXILIARY1)) ;; "severe hypertension"

(assert
(! (=> patient_has_diagnosis_of_anemia_inthehistory@@severe
       patient_has_diagnosis_of_anemia_inthehistory)
   :named REQ4_AUXILIARY2)) ;; "severe anemia"

(assert
(! (=> patient_has_diagnosis_of_aneurysm_inthehistory@@dissecting
       patient_has_diagnosis_of_aneurysm_inthehistory)
   :named REQ4_AUXILIARY3)) ;; "dissecting aneurysm"

(assert
(! (=> patient_has_diagnosis_of_aneurysm_inthehistory@@suspected
       patient_has_diagnosis_of_aneurysm_inthehistory)
   :named REQ4_AUXILIARY4)) ;; "suspected dissecting aneurysm"

(assert
(! (=> patient_has_diagnosis_of_aneurysm_inthehistory@@known
       patient_has_diagnosis_of_aneurysm_inthehistory)
   :named REQ4_AUXILIARY5)) ;; "known dissecting aneurysm"

(assert
(! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within3months_before_study_entry
       patient_has_diagnosis_of_myocardial_infarction_inthehistory)
   :named REQ4_AUXILIARY6)) ;; "recent myocardial infarction within three months of study entry"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_congestive_heart_failure_inthehistory)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of congestive heart failure."

(assert
(! (not patient_has_diagnosis_of_angina_pectoris_inthehistory)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of unstable angina."

(assert
(! (not patient_has_diagnosis_of_heart_valve_disorder_inthehistory@@severe)
   :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe valvular disease."

(assert
(! (not patient_has_diagnosis_of_hypertensive_disorder_inthehistory@@severe)
   :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypertension."

(assert
(! (not patient_has_diagnosis_of_anemia_inthehistory@@severe)
   :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe anemia."

(assert
(! (not patient_has_diagnosis_of_aneurysm_inthehistory@@suspected)
   :named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected dissecting aneurysm."

(assert
(! (not patient_has_diagnosis_of_aneurysm_inthehistory@@known)
   :named REQ4_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known dissecting aneurysm."

(assert
(! (not patient_has_diagnosis_of_acute_myocarditis_inthehistory)
   :named REQ4_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute myocarditis."

(assert
(! (not patient_has_diagnosis_of_acute_pericarditis_inthehistory)
   :named REQ4_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute pericarditis."

(assert
(! (not patient_has_diagnosis_of_thrombophlebitis_inthehistory)
   :named REQ4_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thrombophlebitis."

(assert
(! (not patient_has_diagnosis_of_pulmonary_embolism_inthehistory)
   :named REQ4_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary embolism."

(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within3months_before_study_entry)
   :named REQ4_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent myocardial infarction within three months of study entry."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a blood coagulation disorder (bleeding diathesis) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a blood coagulation disorder (bleeding diathesis) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a blood coagulation disorder (bleeding diathesis).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a blood coagulation disorder (bleeding diathesis) at any time in the past."} ;; "the patient has a history of bleeding diathesis"
(declare-const patient_is_undergoing_warfarin_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing warfarin therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing warfarin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing warfarin therapy.","meaning":"Boolean indicating whether the patient is currently undergoing warfarin therapy."} ;; "the patient is on warfarin therapy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_diagnosis_of_blood_coagulation_disorder_inthehistory)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of bleeding diathesis"

(assert
  (! (not patient_is_undergoing_warfarin_therapy_now)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is on warfarin therapy"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cardiac_pacemaker_in_situ_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac pacemaker in situ (implanted pacemaker).","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac pacemaker in situ (implanted pacemaker).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac pacemaker in situ.","meaning":"Boolean indicating whether the patient currently has a cardiac pacemaker in situ (implanted pacemaker)."} ;; "implanted pacemaker"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_cardiac_pacemaker_in_situ_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an implanted pacemaker."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_aspirin_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone aspirin therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone aspirin therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone aspirin therapy.","meaning":"Boolean indicating whether the patient has ever undergone aspirin therapy at any time in the past."} ;; "aspirin therapy"
(declare-const patient_has_undergone_aspirin_therapy_inthehistory@@temporalcontext_within14days_before_signing_of_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient started aspirin therapy within fourteen days before the signing of informed consent.","when_to_set_to_false":"Set to false if the patient did not start aspirin therapy within fourteen days before the signing of informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient started aspirin therapy within fourteen days before the signing of informed consent.","meaning":"Boolean indicating whether the patient started aspirin therapy within fourteen days before the signing of informed consent."} ;; "the patient started aspirin therapy less than fourteen days prior to the signing of informed consent"
(declare-const patient_has_undergone_statin_prophylaxis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone statin therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone statin therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone statin therapy.","meaning":"Boolean indicating whether the patient has ever undergone statin therapy at any time in the past."} ;; "statin therapy"
(declare-const patient_has_undergone_statin_prophylaxis_inthehistory@@temporalcontext_within14days_before_signing_of_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient started statin therapy within fourteen days before the signing of informed consent.","when_to_set_to_false":"Set to false if the patient did not start statin therapy within fourteen days before the signing of informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient started statin therapy within fourteen days before the signing of informed consent.","meaning":"Boolean indicating whether the patient started statin therapy within fourteen days before the signing of informed consent."} ;; "the patient started statin therapy less than fourteen days prior to the signing of informed consent"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable for aspirin therapy
(assert
(! (=> patient_has_undergone_aspirin_therapy_inthehistory@@temporalcontext_within14days_before_signing_of_informed_consent
      patient_has_undergone_aspirin_therapy_inthehistory)
:named REQ7_AUXILIARY0)) ;; "the patient started aspirin therapy less than fourteen days prior to the signing of informed consent"

;; Qualifier variable implies corresponding stem variable for statin therapy
(assert
(! (=> patient_has_undergone_statin_prophylaxis_inthehistory@@temporalcontext_within14days_before_signing_of_informed_consent
      patient_has_undergone_statin_prophylaxis_inthehistory)
:named REQ7_AUXILIARY1)) ;; "the patient started statin therapy less than fourteen days prior to the signing of informed consent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_undergone_aspirin_therapy_inthehistory@@temporalcontext_within14days_before_signing_of_informed_consent)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient started aspirin therapy less than fourteen days prior to the signing of informed consent"

(assert
(! (not patient_has_undergone_statin_prophylaxis_inthehistory@@temporalcontext_within14days_before_signing_of_informed_consent)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient started statin therapy less than fourteen days prior to the signing of informed consent"

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently known not to be lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_nitrate_salt_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nitrate salts.","when_to_set_to_false":"Set to false if the patient is currently not exposed to nitrate salts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nitrate salts.","meaning":"Boolean indicating whether the patient is currently exposed to nitrate salts."} ;; "nitrate"
(declare-const patient_is_exposed_to_nitrate_salt_now@@part_of_existing_chronic_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to nitrate salts is part of an existing chronic regimen.","when_to_set_to_false":"Set to false if the patient's current exposure to nitrate salts is not part of an existing chronic regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is part of an existing chronic regimen.","meaning":"Boolean indicating whether the patient's current exposure to nitrate salts is part of an existing chronic regimen."} ;; "existing chronic nitrate regimen"
(declare-const patient_is_taking_nitroglycerin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nitroglycerin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a nitroglycerin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a nitroglycerin-containing product.","meaning":"Boolean indicating whether the patient is currently taking a nitroglycerin-containing product."} ;; "nitroglycerin"
(declare-const patient_is_taking_nitroglycerin_containing_product_now@@long_acting Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current use of nitroglycerin-containing product is long-acting.","when_to_set_to_false":"Set to false if the patient's current use of nitroglycerin-containing product is not long-acting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nitroglycerin-containing product is long-acting.","meaning":"Boolean indicating whether the patient's current use of nitroglycerin-containing product is long-acting."} ;; "long-acting nitroglycerin therapy"
(declare-const patient_is_taking_nitroglycerin_containing_product_now@@short_acting Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current use of nitroglycerin-containing product is short-acting.","when_to_set_to_false":"Set to false if the patient's current use of nitroglycerin-containing product is not short-acting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nitroglycerin-containing product is short-acting.","meaning":"Boolean indicating whether the patient's current use of nitroglycerin-containing product is short-acting."} ;; "short-acting nitroglycerin therapy"
(declare-const patient_is_unable_to_discontinue_existing_chronic_nitrate_regimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to discontinue their existing chronic nitrate regimen.","when_to_set_to_false":"Set to false if the patient is currently able to discontinue their existing chronic nitrate regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to discontinue their existing chronic nitrate regimen.","meaning":"Boolean indicating whether the patient is currently unable to discontinue their existing chronic nitrate regimen."} ;; "unable to discontinue existing chronic nitrate regimen"
(declare-const patient_is_undergoing_beta_adrenergic_receptor_blocking_agent_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing beta-adrenergic receptor blocking agent therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing beta-adrenergic receptor blocking agent therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing beta-adrenergic receptor blocking agent therapy.","meaning":"Boolean indicating whether the patient is currently undergoing beta-adrenergic receptor blocking agent therapy."} ;; "beta-blocker therapy"
(declare-const patient_is_undergoing_beta_adrenergic_receptor_blocking_agent_therapy_now@@only_one_therapy_allowed Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing only one beta-blocker therapy as allowed.","when_to_set_to_false":"Set to false if the patient is undergoing more than one beta-blocker therapy or none is allowed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether only one beta-blocker therapy is allowed.","meaning":"Boolean indicating whether the patient's current beta-blocker therapy is the only such therapy allowed."} ;; "only one beta-blocker therapy"
(declare-const patient_is_undergoing_calcium_channel_blocker_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing calcium channel blocker therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing calcium channel blocker therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing calcium channel blocker therapy.","meaning":"Boolean indicating whether the patient is currently undergoing calcium channel blocker therapy."} ;; "calcium channel blocker therapy"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_nitrate_salt_now@@part_of_existing_chronic_regimen
      patient_is_exposed_to_nitrate_salt_now)
:named REQ9_AUXILIARY0)) ;; "existing chronic nitrate regimen"

(assert
(! (=> patient_is_taking_nitroglycerin_containing_product_now@@long_acting
      patient_is_taking_nitroglycerin_containing_product_now)
:named REQ9_AUXILIARY1)) ;; "long-acting nitroglycerin therapy"

(assert
(! (=> patient_is_taking_nitroglycerin_containing_product_now@@short_acting
      patient_is_taking_nitroglycerin_containing_product_now)
:named REQ9_AUXILIARY2)) ;; "short-acting nitroglycerin therapy"

(assert
(! (=> patient_is_undergoing_beta_adrenergic_receptor_blocking_agent_therapy_now@@only_one_therapy_allowed
      patient_is_undergoing_beta_adrenergic_receptor_blocking_agent_therapy_now)
:named REQ9_AUXILIARY3)) ;; "only one beta-blocker therapy"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: unable to discontinue existing chronic nitrate regimen and unable to allow only short-acting nitroglycerin therapy and one beta-blocker therapy or calcium channel blocker therapy
(assert
(! (not
      (and patient_is_unable_to_discontinue_existing_chronic_nitrate_regimen_now
           (not
             (and
               patient_is_taking_nitroglycerin_containing_product_now@@short_acting
               (or patient_is_undergoing_beta_adrenergic_receptor_blocking_agent_therapy_now@@only_one_therapy_allowed
                   patient_is_undergoing_calcium_channel_blocker_therapy_now)))))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is unable to discontinue existing chronic nitrate regimen (for example, long-acting nitroglycerin therapy) and allow only short-acting nitroglycerin therapy and one beta-blocker therapy or calcium channel blocker therapy."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_undergone_clinical_trial_inthepast90days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical trial within the past 90 days.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical trial within the past 90 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical trial within the past 90 days.","meaning":"Boolean indicating whether the patient has undergone a clinical trial within the past 90 days."} ;; "participated in any other clinical trial within ninety days prior to the initial visit"

(declare-const patient_has_undergone_clinical_trial_inthepast90days@@temporalcontext_within90days_before_initial_visit Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial occurred within 90 days before the initial visit.","when_to_set_to_false":"Set to false if the clinical trial did not occur within 90 days before the initial visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial occurred within 90 days before the initial visit.","meaning":"Boolean indicating whether the clinical trial occurred within 90 days before the initial visit."} ;; "within ninety days prior to the initial visit"

(declare-const patient_has_received_investigational_drug_within_90_days_before_initial_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received an investigational drug within ninety days prior to the initial visit.","when_to_set_to_false":"Set to false if the patient has not received an investigational drug within ninety days prior to the initial visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received an investigational drug within ninety days prior to the initial visit.","meaning":"Boolean indicating whether the patient has received an investigational drug within ninety days prior to the initial visit."} ;; "received an investigational drug within ninety days prior to the initial visit"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_clinical_trial_inthepast90days@@temporalcontext_within90days_before_initial_visit
      patient_has_undergone_clinical_trial_inthepast90days)
:named REQ10_AUXILIARY0)) ;; "participated in any other clinical trial within ninety days prior to the initial visit"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or patient_has_undergone_clinical_trial_inthepast90days@@temporalcontext_within90days_before_initial_visit
            patient_has_received_investigational_drug_within_90_days_before_initial_visit))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient participated in any other clinical trial within ninety days prior to the initial visit) OR (the patient received an investigational drug within ninety days prior to the initial visit)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_unable_to_comply_with_trial_requirements_investigator_opinion_now Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the investigator, the patient is currently unable to comply fully with the trial requirements.","when_to_set_to_false":"Set to false if, in the opinion of the investigator, the patient is currently able to comply fully with the trial requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the investigator, the patient is currently unable to comply fully with the trial requirements.","meaning":"Boolean indicating whether, in the opinion of the investigator, the patient is currently unable to comply fully with the trial requirements."} ;; "in the opinion of the investigator, the patient is unable to comply fully with the trial requirements"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_unable_to_comply_with_trial_requirements_investigator_opinion_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, in the opinion of the investigator, the patient is unable to comply fully with the trial requirements."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_participated_in_this_study_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this study.","when_to_set_to_false":"Set to false if the patient has not previously participated in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this study.","meaning":"Boolean indicating whether the patient has previously participated in this study."} ;; "The patient is excluded if the patient previously participated in this study."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_participated_in_this_study_in_the_past)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient previously participated in this study."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_alcoholism_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcoholism within the past two years.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcoholism within the past two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcoholism within the past two years.","meaning":"Boolean indicating whether the patient has a history of alcoholism within the past two years."} ;; "recent history of alcoholism within the last two years"

(declare-const patient_has_finding_of_psychoactive_substance_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of psychoactive substance dependence (drug dependence) at any time.","when_to_set_to_false":"Set to false if the patient does not have a documented history of psychoactive substance dependence (drug dependence) at any time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of psychoactive substance dependence (drug dependence) at any time.","meaning":"Boolean indicating whether the patient has a history of psychoactive substance dependence (drug dependence) at any time."} ;; "known drug dependence"

(declare-const patient_has_finding_of_psychoactive_substance_dependence_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of psychoactive substance dependence (drug dependence) is known (documented or established).","when_to_set_to_false":"Set to false if the patient's history of psychoactive substance dependence (drug dependence) is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of psychoactive substance dependence (drug dependence) is known.","meaning":"Boolean indicating whether the patient's history of psychoactive substance dependence (drug dependence) is known."} ;; "known drug dependence"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_psychoactive_substance_dependence_inthehistory@@known
       patient_has_finding_of_psychoactive_substance_dependence_inthehistory)
   :named REQ13_AUXILIARY0)) ;; "known drug dependence"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_alcoholism_inthepast2years)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history of alcoholism within the last two years."

(assert
(! (not patient_has_finding_of_psychoactive_substance_dependence_inthehistory@@known)
   :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known drug dependence."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_family_member_of_study_site_staff Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a family member of the study site staff.","when_to_set_to_false":"Set to false if the patient is not a family member of the study site staff.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a family member of the study site staff.","meaning":"Boolean indicating whether the patient is a family member of the study site staff."} ;; "the patient is a family member of the study site staff"
(declare-const patient_is_relative_of_study_site_staff Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a relative of the study site staff.","when_to_set_to_false":"Set to false if the patient is not a relative of the study site staff.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a relative of the study site staff.","meaning":"Boolean indicating whether the patient is a relative of the study site staff."} ;; "the patient is a relative of the study site staff"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_family_member_of_study_site_staff)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a family member of the study site staff."

(assert
(! (not patient_is_relative_of_study_site_staff)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a relative of the study site staff."
