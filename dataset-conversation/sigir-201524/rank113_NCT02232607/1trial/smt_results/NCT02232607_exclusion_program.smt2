;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in their history."} ;; "myocardial infarction"

(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within_3_months_prior_to_enrolment_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the three months prior to enrolment in the study.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the three months prior to enrolment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the three months prior to enrolment in the study.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the three months prior to enrolment in the study."} ;; "myocardial infarction within three months prior to enrolment in the study"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within_3_months_prior_to_enrolment_in_study
       patient_has_finding_of_myocardial_infarction_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "myocardial infarction within three months prior to enrolment in the study" implies "myocardial infarction in history"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within_3_months_prior_to_enrolment_in_study)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had myocardial infarction within three months prior to enrolment in the study."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const months_since_last_coronary_angioplasty_prior_to_enrolment_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent percutaneous transluminal coronary angioplasty prior to enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months have passed since the patient's most recent percutaneous transluminal coronary angioplasty prior to enrolment.","meaning":"Numeric value representing the number of months since the patient's most recent percutaneous transluminal coronary angioplasty prior to enrolment."} ;; "number of months since the patient's most recent percutaneous transluminal coronary angioplasty prior to enrolment"
(declare-const months_since_last_coronary_artery_bypass_graft_prior_to_enrolment_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent coronary artery bypass graft surgery prior to enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months have passed since the patient's most recent coronary artery bypass graft surgery prior to enrolment.","meaning":"Numeric value representing the number of months since the patient's most recent coronary artery bypass graft surgery prior to enrolment."} ;; "number of months since the patient's most recent coronary artery bypass graft surgery prior to enrolment"
(declare-const patient_has_undergone_coronary_angioplasty_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous transluminal coronary angioplasty at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous transluminal coronary angioplasty at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous transluminal coronary angioplasty.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous transluminal coronary angioplasty in the past."} ;; "ever undergone percutaneous transluminal coronary angioplasty"
(declare-const patient_has_undergone_coronary_angioplasty_within_6_months_prior_to_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous transluminal coronary angioplasty within six months prior to enrolment.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous transluminal coronary angioplasty within six months prior to enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous transluminal coronary angioplasty within six months prior to enrolment.","meaning":"Boolean indicating whether the patient has undergone percutaneous transluminal coronary angioplasty within six months prior to enrolment."} ;; "undergone percutaneous transluminal coronary angioplasty within six months prior to enrolment"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery in the past."} ;; "ever undergone coronary artery bypass graft surgery"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_within_6_months_prior_to_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass graft surgery within six months prior to enrolment.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass graft surgery within six months prior to enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass graft surgery within six months prior to enrolment.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass graft surgery within six months prior to enrolment."} ;; "undergone coronary artery bypass graft surgery within six months prior to enrolment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Define the "within 6 months" variables in terms of the numeric months-since variables and history
(assert
(! (= patient_has_undergone_coronary_angioplasty_within_6_months_prior_to_enrolment
(and patient_has_undergone_coronary_angioplasty_inthehistory
(<= months_since_last_coronary_angioplasty_prior_to_enrolment_value_recorded_in_months 6)))
:named REQ1_AUXILIARY0)) ;; "patient has had percutaneous transluminal coronary angioplasty within six months prior to enrolment"

(assert
(! (= patient_has_undergone_coronary_artery_bypass_graft_within_6_months_prior_to_enrolment
(and patient_has_undergone_coronary_artery_bypass_graft_inthehistory
(<= months_since_last_coronary_artery_bypass_graft_prior_to_enrolment_value_recorded_in_months 6)))
:named REQ1_AUXILIARY1)) ;; "patient has had coronary artery bypass surgery within six months prior to enrolment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_coronary_angioplasty_within_6_months_prior_to_enrolment)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had percutaneous transluminal coronary angioplasty within six months prior to enrolment."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_within_6_months_prior_to_enrolment)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had coronary artery bypass surgery within six months prior to enrolment."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_other_angina_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any other type of angina (excluding variant angina and unstable angina) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any other type of angina (excluding variant angina and unstable angina) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any other type of angina (excluding variant angina and unstable angina).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any other type of angina (excluding variant angina and unstable angina) in their history."} ;; "other types of angina"
(declare-const patient_has_diagnosis_of_prinzmetal_angina_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with Prinzmetal angina (variant angina) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with Prinzmetal angina (variant angina) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with Prinzmetal angina (variant angina).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of Prinzmetal angina (variant angina) in their history."} ;; "variant angina"
(declare-const patient_has_diagnosis_of_preinfarction_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with preinfarction syndrome (unstable angina) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with preinfarction syndrome (unstable angina) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with preinfarction syndrome (unstable angina).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of preinfarction syndrome (unstable angina) in their history."} ;; "unstable angina"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_prinzmetal_angina_inthehistory
          patient_has_diagnosis_of_preinfarction_syndrome_inthehistory)
     patient_has_diagnosis_of_other_angina_inthehistory)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (variant angina, unstable angina)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_other_angina_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other types of angina with non-exhaustive examples (variant angina, unstable angina)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poorly controlled hypertension (uncontrolled hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have poorly controlled hypertension (uncontrolled hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled hypertension.","meaning":"Boolean indicating whether the patient currently has poorly controlled hypertension (uncontrolled hypertension)."} ;; "uncontrolled hypertension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimetres_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current systolic blood pressure in millimetres of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimetres of mercury (mmHg)."} ;; "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimetres_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current diastolic blood pressure in millimetres of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimetres of mercury (mmHg)."} ;; "diastolic blood pressure"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: uncontrolled hypertension = (systolic BP > 180 mmHg) OR (diastolic BP > 100 mmHg)
(assert
(! (= patient_has_finding_of_poor_hypertension_control_now
     (or (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimetres_of_mercury 180)
         (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimetres_of_mercury 100)))
   :named REQ3_AUXILIARY0)) ;; "uncontrolled hypertension defined as (systolic blood pressure > 180 millimetres of mercury) OR (diastolic blood pressure > 100 millimetres of mercury)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled hypertension defined as (systolic blood pressure > 180 millimetres of mercury) OR (diastolic blood pressure > 100 millimetres of mercury)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_resting_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's resting heart rate is recorded now in beats per minute.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's resting heart rate measured now, in beats per minute."} ;; "resting heart rate"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (< patient_resting_heart_rate_value_recorded_now_withunit_beats_per_minute 50))
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has resting heart rate < 50 beats per minute."

(assert
(! (not (> patient_resting_heart_rate_value_recorded_now_withunit_beats_per_minute 100))
:named REQ4_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has resting heart rate > 100 beats per minute."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of valvular heart disease (heart valve disorder), regardless of severity.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of valvular heart disease (heart valve disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of valvular heart disease (heart valve disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of valvular heart disease (heart valve disorder), regardless of severity."} ;; "valvular heart disease"
(declare-const patient_has_diagnosis_of_heart_valve_disorder_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of valvular heart disease (heart valve disorder) and the disease is significant in severity.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of valvular heart disease (heart valve disorder) but the disease is not significant in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's valvular heart disease is significant in severity.","meaning":"Boolean indicating whether the patient's current valvular heart disease is significant in severity."} ;; "significant valvular heart disease"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_heart_valve_disorder_now@@is_significant
      patient_has_diagnosis_of_heart_valve_disorder_now)
:named REQ5_AUXILIARY0)) ;; "significant valvular heart disease" implies "valvular heart disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_heart_valve_disorder_now@@is_significant)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant valvular heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"

(declare-const patient_has_finding_of_heart_failure_now@@classified_as_new_york_heart_association_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart failure is classified as New York Heart Association Class III.","when_to_set_to_false":"Set to false if the patient's heart failure is not classified as New York Heart Association Class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure is classified as New York Heart Association Class III.","meaning":"Boolean indicating whether the patient's heart failure is classified as New York Heart Association Class III."} ;; "heart failure classified as New York Heart Association Class III"

(declare-const patient_has_finding_of_heart_failure_now@@classified_as_new_york_heart_association_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart failure is classified as New York Heart Association Class IV.","when_to_set_to_false":"Set to false if the patient's heart failure is not classified as New York Heart Association Class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure is classified as New York Heart Association Class IV.","meaning":"Boolean indicating whether the patient's heart failure is classified as New York Heart Association Class IV."} ;; "heart failure classified as New York Heart Association Class IV"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_now@@classified_as_new_york_heart_association_class_iii
      patient_has_finding_of_heart_failure_now)
:named REQ6_AUXILIARY0)) ;; "heart failure classified as New York Heart Association Class III"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@classified_as_new_york_heart_association_class_iv
      patient_has_finding_of_heart_failure_now)
:named REQ6_AUXILIARY1)) ;; "heart failure classified as New York Heart Association Class IV"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@classified_as_new_york_heart_association_class_iii)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure classified as New York Heart Association Class III."

(assert
(! (not patient_has_finding_of_heart_failure_now@@classified_as_new_york_heart_association_class_iv)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure classified as New York Heart Association Class IV."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive lung disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive lung disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive lung disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive lung disease (COPD)."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"
(declare-const patient_has_diagnosis_of_asthma_now@@clinical_symptoms_requiring_regular_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma and the asthma presents with clinical symptoms requiring regular medication.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of asthma but does not have clinical symptoms requiring regular medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's asthma presents with clinical symptoms requiring regular medication.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma and the asthma presents with clinical symptoms requiring regular medication."} ;; "asthma with clinical symptoms requiring regular medication"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_asthma_now@@clinical_symptoms_requiring_regular_medication
      patient_has_diagnosis_of_asthma_now)
:named REQ7_AUXILIARY0)) ;; "asthma with clinical symptoms requiring regular medication"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic obstructive pulmonary disease."

(assert
(! (not patient_has_diagnosis_of_asthma_now@@clinical_symptoms_requiring_regular_medication)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma with clinical symptoms requiring regular medication."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has a cardiac arrhythmia."} ;; "arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac arrhythmia and the arrhythmia is significant.","when_to_set_to_false":"Set to false if the patient currently has a cardiac arrhythmia but it is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arrhythmia is significant.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is significant."} ;; "significant arrhythmia"
(declare-const patient_has_finding_of_wolff_parkinson_white_pattern_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Wolff Parkinson-White pattern.","when_to_set_to_false":"Set to false if the patient currently does not have Wolff Parkinson-White pattern.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Wolff Parkinson-White pattern.","meaning":"Boolean indicating whether the patient currently has Wolff Parkinson-White pattern."} ;; "Wolff Parkinson-White syndrome"
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has atrial fibrillation."} ;; "atrial fibrillation"
(declare-const patient_has_finding_of_atrial_flutter_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrial flutter.","when_to_set_to_false":"Set to false if the patient currently does not have atrial flutter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial flutter.","meaning":"Boolean indicating whether the patient currently has atrial flutter."} ;; "atrial flutter"
(declare-const patient_has_finding_of_sick_sinus_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sick sinus syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have sick sinus syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sick sinus syndrome.","meaning":"Boolean indicating whether the patient currently has sick sinus syndrome."} ;; "sick sinus syndrome"
(declare-const patient_has_finding_of_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have an atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an atrioventricular block.","meaning":"Boolean indicating whether the patient currently has an atrioventricular block."} ;; "atrioventricular heart block"
(declare-const patient_has_finding_of_atrioventricular_block_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an atrioventricular block and the block is significant.","when_to_set_to_false":"Set to false if the patient currently has an atrioventricular block but it is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the atrioventricular block is significant.","meaning":"Boolean indicating whether the patient's current atrioventricular block is significant."} ;; "significant atrioventricular heart block"
(declare-const patient_has_finding_of_intraventricular_conduction_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intraventricular conduction defect.","when_to_set_to_false":"Set to false if the patient currently does not have an intraventricular conduction defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intraventricular conduction defect.","meaning":"Boolean indicating whether the patient currently has an intraventricular conduction defect."} ;; "intraventricular conduction defect"
(declare-const patient_has_finding_of_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bundle branch block.","meaning":"Boolean indicating whether the patient currently has bundle branch block."} ;; "bundle branch block"
(declare-const patient_has_finding_of_ventricular_pre_excitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ventricular pre-excitation.","when_to_set_to_false":"Set to false if the patient currently does not have ventricular pre-excitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventricular pre-excitation.","meaning":"Boolean indicating whether the patient currently has ventricular pre-excitation."} ;; "ventricular pre-excitation"
(declare-const patient_has_finding_of_pacemaker_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pacemaker present.","when_to_set_to_false":"Set to false if the patient currently does not have a pacemaker present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pacemaker present.","meaning":"Boolean indicating whether the patient currently has a pacemaker present."} ;; "presence of a pacemaker"
(declare-const patient_has_finding_of_implanted_automatic_defibrillator_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted automatic defibrillator present.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted automatic defibrillator present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted automatic defibrillator present.","meaning":"Boolean indicating whether the patient currently has an implanted automatic defibrillator present."} ;; "presence of an implanted automatic defibrillator"
(declare-const patient_has_finding_of_hypokalemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypokalemia.","when_to_set_to_false":"Set to false if the patient currently does not have hypokalemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypokalemia.","meaning":"Boolean indicating whether the patient currently has hypokalemia."} ;; "hypokalaemia"
(declare-const patient_has_finding_of_hypokalemia_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypokalemia and the hypokalemia is uncorrected.","when_to_set_to_false":"Set to false if the patient currently has hypokalemia but it is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypokalemia is uncorrected.","meaning":"Boolean indicating whether the patient's current hypokalemia is uncorrected."} ;; "uncorrected hypokalaemia"
(declare-const patient_serum_potassium_value_recorded_now_withunit_millimoles_per_litre Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current serum potassium in millimoles per litre is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum potassium in millimoles per litre (mmol/L)."} ;; "potassium < 3.5 millimoles per litre"
(declare-const patient_qrs_duration_value_recorded_now_in_seconds Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current QRS duration in seconds is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current QRS duration in seconds."} ;; "QRS duration > 0.12 seconds"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_wolff_parkinson_white_pattern_now
          patient_has_finding_of_atrial_fibrillation_now
          patient_has_finding_of_atrial_flutter_now
          patient_has_finding_of_sick_sinus_syndrome_now
          patient_has_finding_of_atrioventricular_block_now@@significant
          patient_has_finding_of_intraventricular_conduction_defect_now
          patient_has_finding_of_ventricular_pre_excitation_now
          patient_has_finding_of_bundle_branch_block_now
          patient_has_finding_of_pacemaker_present_now
          patient_has_finding_of_implanted_automatic_defibrillator_present_now
          patient_has_finding_of_hypokalemia_now@@uncorrected)
    patient_has_finding_of_cardiac_arrhythmia_now@@significant)
:named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples ((Wolff Parkinson-White syndrome) OR (atrial fibrillation) OR (atrial flutter) OR (sick sinus syndrome) OR (significant atrioventricular heart block) OR (intraventricular conduction defect defined as QRS duration > 0.12 seconds) OR (ventricular pre-excitation) OR (bundle branch block) OR (presence of a pacemaker) OR (presence of an implanted automatic defibrillator) OR (uncorrected hypokalaemia defined as potassium < 3.5 millimoles per litre))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@significant
      patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ8_AUXILIARY1)) ;; "significant arrhythmia"

(assert
(! (=> patient_has_finding_of_atrioventricular_block_now@@significant
      patient_has_finding_of_atrioventricular_block_now)
:named REQ8_AUXILIARY2)) ;; "significant atrioventricular heart block"

(assert
(! (=> patient_has_finding_of_hypokalemia_now@@uncorrected
      patient_has_finding_of_hypokalemia_now)
:named REQ8_AUXILIARY3)) ;; "uncorrected hypokalaemia"

;; Definitional equality for "intraventricular conduction defect defined as QRS duration > 0.12 seconds"
(assert
(! (= patient_has_finding_of_intraventricular_conduction_defect_now
      (> patient_qrs_duration_value_recorded_now_in_seconds 0.12))
:named REQ8_AUXILIARY4)) ;; "intraventricular conduction defect defined as QRS duration > 0.12 seconds"

;; Definitional equality for "uncorrected hypokalaemia defined as potassium < 3.5 millimoles per litre"
(assert
(! (= patient_has_finding_of_hypokalemia_now@@uncorrected
      (< patient_serum_potassium_value_recorded_now_withunit_millimoles_per_litre 3.5))
:named REQ8_AUXILIARY5)) ;; "uncorrected hypokalaemia defined as potassium < 3.5 millimoles per litre"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_now@@significant)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant arrhythmia with non-exhaustive examples ((Wolff Parkinson-White syndrome) OR (atrial fibrillation) OR (atrial flutter) OR (sick sinus syndrome) OR (significant atrioventricular heart block) OR (intraventricular conduction defect defined as QRS duration > 0.12 seconds) OR (ventricular pre-excitation) OR (bundle branch block) OR (presence of a pacemaker) OR (presence of an implanted automatic defibrillator) OR (uncorrected hypokalaemia defined as potassium < 3.5 millimoles per litre))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus (insulin dependent diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus."} ;; "insulin dependent diabetes mellitus"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has insulin dependent diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const alanine_aminotransferase_upper_limit_of_reference_range_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the upper limit of the reference range for ALT (U/L).","when_to_set_to_null":"Set to null if the upper limit of the reference range for ALT is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of the reference range for alanine aminotransferase (ALT), in units of U/L."} ;; "upper limit of reference range for alanine aminotransferase (ALT)"
(declare-const alanine_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of ALT (U/L) measured now.","when_to_set_to_null":"Set to null if the ALT value measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric laboratory value for alanine aminotransferase (ALT) measured now, in units of U/L."} ;; "alanine aminotransferase measured now"
(declare-const aspartate_aminotransferase_upper_limit_of_reference_range_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the upper limit of the reference range for AST (U/L).","when_to_set_to_null":"Set to null if the upper limit of the reference range for AST is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of the reference range for aspartate aminotransferase (AST), in units of U/L."} ;; "upper limit of reference range for aspartate aminotransferase (AST)"
(declare-const aspartate_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of AST (U/L) measured now.","when_to_set_to_null":"Set to null if the AST value measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric laboratory value for aspartate aminotransferase (AST) measured now, in units of U/L."} ;; "aspartate aminotransferase measured now"
(declare-const patient_has_finding_of_significant_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant liver disease, defined as either aspartate aminotransferase (AST) or alanine aminotransferase (ALT) greater than 2 times the upper limit of the reference range.","when_to_set_to_false":"Set to false if the patient currently does not have significant liver disease, i.e., both AST and ALT are less than or equal to 2 times the upper limit of the reference range.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant liver disease.","meaning":"Boolean indicating whether the patient currently has significant liver disease, as defined by laboratory criteria."} ;; "significant liver disease (defined as (aspartate aminotransferase > 2 × upper limit of reference range) OR (alanine aminotransferase > 2 × upper limit of reference range))"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Definition: significant liver disease = (AST > 2 × ULN) OR (ALT > 2 × ULN)
(assert
(! (= patient_has_finding_of_significant_liver_disease_now
     (or
       (> aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
          (* 2 aspartate_aminotransferase_upper_limit_of_reference_range_value_withunit_u_per_l))
       (> alanine_aminotransferase_value_recorded_now_withunit_u_per_l
          (* 2 alanine_aminotransferase_upper_limit_of_reference_range_value_withunit_u_per_l))))
   :named REQ10_AUXILIARY0)) ;; "significant liver disease (defined as (aspartate aminotransferase > 2 × upper limit of reference range) OR (alanine aminotransferase > 2 × upper limit of reference range))"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_significant_liver_disease_now)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant liver disease (defined as (aspartate aminotransferase > 2 × upper limit of reference range) OR (alanine aminotransferase > 2 × upper limit of reference range))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const creatinine_upper_limit_of_reference_range_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the upper limit of the reference range for creatinine at the present time, in mg/dL.","when_to_set_to_null":"Set to null if the upper limit of the reference range for creatinine at the present time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the upper limit of the reference range for creatinine at the present time, in mg/dL."} ;; "upper limit of reference range for creatinine"
(declare-const creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the patient's creatinine value measured at the present time, in mg/dL.","when_to_set_to_null":"Set to null if the patient's creatinine value at the present time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's creatinine level measured at the present time, in mg/dL."} ;; "creatinine > 1.5 × upper limit of reference range"
(declare-const patient_has_finding_of_significant_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant renal disease.","when_to_set_to_false":"Set to false if the patient currently does not have significant renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant renal disease.","meaning":"Boolean indicating whether the patient currently has significant renal disease."} ;; "significant renal disease (defined as creatinine > 1.5 × upper limit of reference range)"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definition: significant renal disease = creatinine > 1.5 × upper limit of reference range
(assert
(! (= patient_has_finding_of_significant_renal_disease_now
     (> creatinine_value_recorded_now_withunit_mg_per_dl
        (* 1.5 creatinine_upper_limit_of_reference_range_now_withunit_mg_per_dl)))
   :named REQ11_AUXILIARY0)) ;; "defined as creatinine > 1.5 × upper limit of reference range"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_significant_renal_disease_now)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant renal disease (defined as creatinine > 1.5 × upper limit of reference range)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_patient_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical condition.","when_to_set_to_false":"Set to false if the patient currently does not have any clinical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinical condition.","meaning":"Boolean indicating whether the patient currently has any clinical condition."} ;; "clinical condition"
(declare-const patient_has_finding_of_patient_condition_finding_now@@precludes_safe_fulfilment_of_protocol_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical condition and, in the opinion of the investigator, the condition would preclude the safe fulfilment of the protocol.","when_to_set_to_false":"Set to false if the patient currently has any clinical condition and, in the opinion of the investigator, the condition would not preclude the safe fulfilment of the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the condition would preclude the safe fulfilment of the protocol.","meaning":"Boolean indicating whether the patient currently has any clinical condition and, in the opinion of the investigator, the condition would preclude the safe fulfilment of the protocol."} ;; "which, in the opinion of the investigator, would preclude the safe fulfilment of the protocol"
(declare-const patient_has_finding_of_patient_condition_finding_now@@precludes_safe_administration_of_trial_medication_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical condition and, in the opinion of the investigator, the condition would preclude the safe administration of trial medication.","when_to_set_to_false":"Set to false if the patient currently has any clinical condition and, in the opinion of the investigator, the condition would not preclude the safe administration of trial medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the condition would preclude the safe administration of trial medication.","meaning":"Boolean indicating whether the patient currently has any clinical condition and, in the opinion of the investigator, the condition would preclude the safe administration of trial medication."} ;; "which, in the opinion of the investigator, would preclude the safe administration of trial medication"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_patient_condition_finding_now@@precludes_safe_fulfilment_of_protocol_investigator_opinion
      patient_has_finding_of_patient_condition_finding_now)
:named REQ12_AUXILIARY0)) ;; "which, in the opinion of the investigator, would preclude the safe fulfilment of the protocol"

(assert
(! (=> patient_has_finding_of_patient_condition_finding_now@@precludes_safe_administration_of_trial_medication_investigator_opinion
      patient_has_finding_of_patient_condition_finding_now)
:named REQ12_AUXILIARY1)) ;; "which, in the opinion of the investigator, would preclude the safe administration of trial medication"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_patient_condition_finding_now@@precludes_safe_fulfilment_of_protocol_investigator_opinion)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinical condition (which, in the opinion of the investigator, would preclude the safe fulfilment of the protocol)."

(assert
(! (not patient_has_finding_of_patient_condition_finding_now@@precludes_safe_administration_of_trial_medication_investigator_opinion)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinical condition (which, in the opinion of the investigator, would preclude the safe administration of trial medication)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_can_undergo_exercise_tolerance_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo an exercise tolerance test (exercise testing).","when_to_set_to_false":"Set to false if the patient cannot currently undergo an exercise tolerance test (exercise testing).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo an exercise tolerance test (exercise testing).","meaning":"Boolean indicating whether the patient can currently undergo an exercise tolerance test (exercise testing)."} ;; "exercise testing"
(declare-const patient_can_undergo_exercise_tolerance_test_now@@inability_due_to_extra_cardiac_reasons Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to undergo exercise tolerance testing now is due to extra-cardiac reasons.","when_to_set_to_false":"Set to false if the patient's inability to undergo exercise tolerance testing now is not due to extra-cardiac reasons.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inability is due to extra-cardiac reasons.","meaning":"Boolean indicating whether the inability to undergo exercise tolerance testing now is due to extra-cardiac reasons."} ;; "unable to perform repeated exercise testing due to extra-cardiac reasons"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable is false (inability to perform test due to extra-cardiac reasons means cannot perform test)
(assert
(! (=> patient_can_undergo_exercise_tolerance_test_now@@inability_due_to_extra_cardiac_reasons
(not patient_can_undergo_exercise_tolerance_test_now))
:named REQ13_AUXILIARY0)) ;; "unable to perform repeated exercise testing due to extra-cardiac reasons"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_can_undergo_exercise_tolerance_test_now@@inability_due_to_extra_cardiac_reasons)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to perform repeated exercise testing due to extra-cardiac reasons."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a beta-adrenergic receptor antagonist.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a beta-adrenergic receptor antagonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a beta-adrenergic receptor antagonist.","meaning":"Boolean indicating whether the patient is currently exposed to a beta-adrenergic receptor antagonist."} ;; "beta-adrenergic receptor blocker"
(declare-const patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now@@as_concomitant_treatment_with_other_anti_anginal_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to a beta-adrenergic receptor antagonist is as part of concomitant treatment with any other anti-anginal medication.","when_to_set_to_false":"Set to false if the patient's current exposure to a beta-adrenergic receptor antagonist is not as part of concomitant treatment with any other anti-anginal medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is as part of concomitant treatment with any other anti-anginal medication.","meaning":"Boolean indicating whether the patient's current exposure to a beta-adrenergic receptor antagonist is as part of concomitant treatment with any other anti-anginal medication."} ;; "beta-adrenergic receptor blocker as concomitant treatment with any other anti-anginal medication"
(declare-const patient_is_exposed_to_calcium_channel_blocker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a calcium channel blocker.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a calcium channel blocker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a calcium channel blocker.","meaning":"Boolean indicating whether the patient is currently exposed to a calcium channel blocker."} ;; "calcium channel blocker"
(declare-const patient_is_exposed_to_calcium_channel_blocker_now@@as_concomitant_treatment_with_other_anti_anginal_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to a calcium channel blocker is as part of concomitant treatment with any other anti-anginal medication.","when_to_set_to_false":"Set to false if the patient's current exposure to a calcium channel blocker is not as part of concomitant treatment with any other anti-anginal medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is as part of concomitant treatment with any other anti-anginal medication.","meaning":"Boolean indicating whether the patient's current exposure to a calcium channel blocker is as part of concomitant treatment with any other anti-anginal medication."} ;; "calcium channel blocker as concomitant treatment with any other anti-anginal medication"
(declare-const patient_is_exposed_to_nitrate_salt_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a nitrate salt.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a nitrate salt.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a nitrate salt.","meaning":"Boolean indicating whether the patient is currently exposed to a nitrate salt."} ;; "nitrate salt"
(declare-const patient_is_exposed_to_nitrate_salt_now@@as_concomitant_treatment_with_other_anti_anginal_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to a nitrate salt is as part of concomitant treatment with any other anti-anginal medication.","when_to_set_to_false":"Set to false if the patient's current exposure to a nitrate salt is not as part of concomitant treatment with any other anti-anginal medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is as part of concomitant treatment with any other anti-anginal medication.","meaning":"Boolean indicating whether the patient's current exposure to a nitrate salt is as part of concomitant treatment with any other anti-anginal medication."} ;; "nitrate salt as concomitant treatment with any other anti-anginal medication"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_calcium_channel_blocker_now@@as_concomitant_treatment_with_other_anti_anginal_medication
           patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now@@as_concomitant_treatment_with_other_anti_anginal_medication
           patient_is_exposed_to_nitrate_salt_now@@as_concomitant_treatment_with_other_anti_anginal_medication)
     (or patient_is_exposed_to_calcium_channel_blocker_now@@as_concomitant_treatment_with_other_anti_anginal_medication
         patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now@@as_concomitant_treatment_with_other_anti_anginal_medication
         patient_is_exposed_to_nitrate_salt_now@@as_concomitant_treatment_with_other_anti_anginal_medication))
:named REQ14_AUXILIARY0)) ;; "with non-exhaustive examples ((calcium channel blocker) OR (beta-adrenergic receptor blocker) OR (long-acting nitrate)), whether or not prescribed for this indication."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_calcium_channel_blocker_now@@as_concomitant_treatment_with_other_anti_anginal_medication
      patient_is_exposed_to_calcium_channel_blocker_now)
:named REQ14_AUXILIARY1)) ;; "patient_is_exposed_to_calcium_channel_blocker_now@@as_concomitant_treatment_with_other_anti_anginal_medication implies patient_is_exposed_to_calcium_channel_blocker_now"

(assert
(! (=> patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now@@as_concomitant_treatment_with_other_anti_anginal_medication
      patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now)
:named REQ14_AUXILIARY2)) ;; "patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now@@as_concomitant_treatment_with_other_anti_anginal_medication implies patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now"

(assert
(! (=> patient_is_exposed_to_nitrate_salt_now@@as_concomitant_treatment_with_other_anti_anginal_medication
      patient_is_exposed_to_nitrate_salt_now)
:named REQ14_AUXILIARY3)) ;; "patient_is_exposed_to_nitrate_salt_now@@as_concomitant_treatment_with_other_anti_anginal_medication implies patient_is_exposed_to_nitrate_salt_now"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (or patient_is_exposed_to_calcium_channel_blocker_now@@as_concomitant_treatment_with_other_anti_anginal_medication
            patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now@@as_concomitant_treatment_with_other_anti_anginal_medication
            patient_is_exposed_to_nitrate_salt_now@@as_concomitant_treatment_with_other_anti_anginal_medication))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concomitant treatment with any other anti-anginal medication with non-exhaustive examples ((calcium channel blocker) OR (beta-adrenergic receptor blocker) OR (long-acting nitrate)), whether or not prescribed for this indication."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_exposed_to_antiarrhythmic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antiarrhythmic agents.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antiarrhythmic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antiarrhythmic agents.","meaning":"Boolean indicating whether the patient is currently exposed to antiarrhythmic agents."} ;; "anti-arrhythmic medication"
(declare-const patient_is_exposed_to_antiarrhythmic_agent_now@@concomitant_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to antiarrhythmic agents is as part of concomitant treatment.","when_to_set_to_false":"Set to false if the patient's current exposure to antiarrhythmic agents is not as part of concomitant treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is as concomitant treatment.","meaning":"Boolean indicating whether the patient's current exposure to antiarrhythmic agents is as concomitant treatment."} ;; "anti-arrhythmic medication as concomitant treatment"
(declare-const patient_is_exposed_to_digitalis_glycoside_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to digitalis glycosides.","when_to_set_to_false":"Set to false if the patient is currently not exposed to digitalis glycosides.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to digitalis glycosides.","meaning":"Boolean indicating whether the patient is currently exposed to digitalis glycosides."} ;; "digitalis"
(declare-const patient_is_exposed_to_digitalis_glycoside_now@@concomitant_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to digitalis glycosides is as part of concomitant treatment.","when_to_set_to_false":"Set to false if the patient's current exposure to digitalis glycosides is not as part of concomitant treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is as concomitant treatment.","meaning":"Boolean indicating whether the patient's current exposure to digitalis glycosides is as concomitant treatment."} ;; "digitalis as concomitant treatment"
(declare-const patient_is_exposed_to_tricyclic_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to tricyclic antidepressants.","when_to_set_to_false":"Set to false if the patient is currently not exposed to tricyclic antidepressants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to tricyclic antidepressants.","meaning":"Boolean indicating whether the patient is currently exposed to tricyclic antidepressants."} ;; "tricyclic antidepressant"
(declare-const patient_is_exposed_to_tricyclic_antidepressant_now@@concomitant_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to tricyclic antidepressants is as part of concomitant treatment.","when_to_set_to_false":"Set to false if the patient's current exposure to tricyclic antidepressants is not as part of concomitant treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is as concomitant treatment.","meaning":"Boolean indicating whether the patient's current exposure to tricyclic antidepressants is as concomitant treatment."} ;; "tricyclic antidepressant as concomitant treatment"
(declare-const patient_is_exposed_to_other_agent_known_to_affect_st_segment_morphology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any other agent known to affect ST-segment morphology.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any other agent known to affect ST-segment morphology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any other agent known to affect ST-segment morphology.","meaning":"Boolean indicating whether the patient is currently exposed to any other agent known to affect ST-segment morphology."} ;; "other agent known to affect ST-segment morphology"
(declare-const patient_is_exposed_to_other_agent_known_to_affect_st_segment_morphology_now@@concomitant_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to any other agent known to affect ST-segment morphology is as part of concomitant treatment.","when_to_set_to_false":"Set to false if the patient's current exposure to any other agent known to affect ST-segment morphology is not as part of concomitant treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is as concomitant treatment.","meaning":"Boolean indicating whether the patient's current exposure to any other agent known to affect ST-segment morphology is as concomitant treatment."} ;; "other agent known to affect ST-segment morphology as concomitant treatment"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Non-exhaustive examples: antiarrhythmic, digitalis, tricyclic antidepressant are examples of "other agent known to affect ST-segment morphology"
(assert
(! (=> (or patient_is_exposed_to_antiarrhythmic_agent_now
          patient_is_exposed_to_digitalis_glycoside_now
          patient_is_exposed_to_tricyclic_antidepressant_now)
    patient_is_exposed_to_other_agent_known_to_affect_st_segment_morphology_now)
:named REQ15_AUXILIARY0)) ;; "with non-exhaustive examples ((anti-arrhythmic medication) OR (digitalis) OR (tricyclic antidepressant))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_antiarrhythmic_agent_now@@concomitant_treatment
    patient_is_exposed_to_antiarrhythmic_agent_now)
:named REQ15_AUXILIARY1)) ;; "anti-arrhythmic medication as concomitant treatment"

(assert
(! (=> patient_is_exposed_to_digitalis_glycoside_now@@concomitant_treatment
    patient_is_exposed_to_digitalis_glycoside_now)
:named REQ15_AUXILIARY2)) ;; "digitalis as concomitant treatment"

(assert
(! (=> patient_is_exposed_to_tricyclic_antidepressant_now@@concomitant_treatment
    patient_is_exposed_to_tricyclic_antidepressant_now)
:named REQ15_AUXILIARY3)) ;; "tricyclic antidepressant as concomitant treatment"

(assert
(! (=> patient_is_exposed_to_other_agent_known_to_affect_st_segment_morphology_now@@concomitant_treatment
    patient_is_exposed_to_other_agent_known_to_affect_st_segment_morphology_now)
:named REQ15_AUXILIARY4)) ;; "other agent known to affect ST-segment morphology as concomitant treatment"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion: patient must NOT be receiving concomitant treatment with any of the listed agents
(assert
(! (not (or patient_is_exposed_to_antiarrhythmic_agent_now@@concomitant_treatment
            patient_is_exposed_to_digitalis_glycoside_now@@concomitant_treatment
            patient_is_exposed_to_tricyclic_antidepressant_now@@concomitant_treatment
            patient_is_exposed_to_other_agent_known_to_affect_st_segment_morphology_now@@concomitant_treatment))
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concomitant treatment with (anti-arrhythmic medication) OR (digitalis) OR (tricyclic antidepressant) OR (other agent known to affect ST-segment morphology)"

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity condition.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity condition.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity condition."} ;; "hypersensitivity"

(declare-const patient_has_finding_of_hypersensitivity_condition_now@@to_any_component_of_investigational_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity condition is to any of the components of the investigational drug.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity condition is not to any of the components of the investigational drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to any of the components of the investigational drug.","meaning":"Boolean indicating whether the patient's current hypersensitivity condition is to any of the components of the investigational drug."} ;; "hypersensitivity to any of the components of the investigational drug"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@to_any_component_of_investigational_drug
       patient_has_finding_of_hypersensitivity_condition_now)
   :named REQ16_AUXILIARY0)) ;; "hypersensitivity to any of the components of the investigational drug" implies "hypersensitivity"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_now@@to_any_component_of_investigational_drug)
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to any of the components of the investigational drug."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a woman of child bearing potential"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
    :named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."

(assert
(! (not patient_has_childbearing_potential_now)
    :named REQ17_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman of child bearing potential."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_undergone_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever participated in any clinical trial at any time in the past.","when_to_set_to_false":"Set to false if the patient has never participated in any clinical trial at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever participated in any clinical trial.","meaning":"Boolean indicating whether the patient has ever participated in any clinical trial."} ;; "clinical trial"
(declare-const patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within_2_months_of_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any clinical trial within 2 months of enrolment.","when_to_set_to_false":"Set to false if the patient has not participated in any clinical trial within 2 months of enrolment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any clinical trial within 2 months of enrolment.","meaning":"Boolean indicating whether the patient has participated in any clinical trial within 2 months of enrolment."} ;; "participated in any other clinical trial within 2 months of enrolment"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within_2_months_of_enrolment
      patient_has_undergone_clinical_trial_inthehistory)
:named REQ18_AUXILIARY0)) ;; "participated in any other clinical trial within 2 months of enrolment"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within_2_months_of_enrolment)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in any other clinical trial within 2 months of enrolment."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_drug_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of drug abuse at any point in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of drug abuse at any point in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had drug abuse.","meaning":"Boolean indicating whether the patient has a history of drug abuse at any time in the past."} ;; "the patient has a history of drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of alcohol abuse at any point in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of alcohol abuse at any point in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse at any time in the past."} ;; "the patient has a history of alcohol abuse"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_drug_abuse_inthehistory)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse."

(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse."
