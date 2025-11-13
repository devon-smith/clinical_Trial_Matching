;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_using_prescription_medication_that_might_influence_study_outcome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using prescription medication that might influence the outcome of the study.","when_to_set_to_false":"Set to false if the patient is currently not using prescription medication that might influence the outcome of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using prescription medication that might influence the outcome of the study.","meaning":"Boolean indicating whether the patient is currently using prescription medication that might influence the outcome of the study."} ;; "using prescription medication that might influence the outcome of the study"

(declare-const patient_is_using_prescription_medication_that_influences_body_weight_regulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using prescription medication that influences body weight regulation.","when_to_set_to_false":"Set to false if the patient is currently not using prescription medication that influences body weight regulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using prescription medication that influences body weight regulation.","meaning":"Boolean indicating whether the patient is currently using prescription medication that influences body weight regulation."} ;; "medication that influences body weight regulation"

(declare-const patient_is_using_prescription_medication_of_systemic_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using prescription medication that is a systemic steroid.","when_to_set_to_false":"Set to false if the patient is currently not using prescription medication that is a systemic steroid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using prescription medication that is a systemic steroid.","meaning":"Boolean indicating whether the patient is currently using prescription medication that is a systemic steroid."} ;; "systemic use of steroid" (as prescription medication)

(declare-const patient_is_undergoing_administration_of_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing systemic administration of steroid.","when_to_set_to_false":"Set to false if the patient is currently not undergoing systemic administration of steroid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing systemic administration of steroid.","meaning":"Boolean indicating whether the patient is currently undergoing systemic administration of steroid."} ;; "systemic use of steroid"

(declare-const patient_has_disease_that_might_influence_study_outcome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suffering from a disease that might influence the outcome of the study.","when_to_set_to_false":"Set to false if the patient is currently not suffering from a disease that might influence the outcome of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suffering from a disease that might influence the outcome of the study.","meaning":"Boolean indicating whether the patient is currently suffering from a disease that might influence the outcome of the study."} ;; "suffering from diseases that might influence the outcome of the study"

(declare-const patient_has_disease_that_influences_body_weight_regulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suffering from a disease that influences body weight regulation.","when_to_set_to_false":"Set to false if the patient is currently not suffering from a disease that influences body weight regulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suffering from a disease that influences body weight regulation.","meaning":"Boolean indicating whether the patient is currently suffering from a disease that influences body weight regulation."} ;; "diseases that influence body weight regulation"

(declare-const patient_has_diagnosis_of_malabsorption_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malabsorption.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malabsorption.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malabsorption.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malabsorption."} ;; "malabsorption"

(declare-const patient_has_diagnosis_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypothyroidism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypothyroidism."} ;; "hypothyroidism"

(declare-const patient_has_diagnosis_of_hypothyroidism_now@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypothyroidism and the condition is untreated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hypothyroidism and the condition is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypothyroidism is untreated.","meaning":"Boolean indicating whether the patient's current hypothyroidism is untreated."} ;; "untreated hypothyroidism"

(declare-const patient_has_diagnosis_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hyperthyroidism."} ;; "hyperthyroidism"

(declare-const patient_has_diagnosis_of_hyperthyroidism_now@@untreated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hyperthyroidism and the condition is untreated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hyperthyroidism and the condition is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hyperthyroidism is untreated.","meaning":"Boolean indicating whether the patient's current hyperthyroidism is untreated."} ;; "untreated hyperthyroidism"

(declare-const patient_has_diagnosis_of_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of an eating disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of an eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of an eating disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of an eating disorder."} ;; "eating disorder"

(declare-const patient_has_obesity_related_cardiovascular_risk_factor_that_might_influence_study_outcome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suffering from an obesity-related cardiovascular risk factor that might influence the outcome of the study.","when_to_set_to_false":"Set to false if the patient is currently not suffering from an obesity-related cardiovascular risk factor that might influence the outcome of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suffering from an obesity-related cardiovascular risk factor that might influence the outcome of the study.","meaning":"Boolean indicating whether the patient is currently suffering from an obesity-related cardiovascular risk factor that might influence the outcome of the study."} ;; "obesity-related cardiovascular risk factors that might influence the outcome of the study"

(declare-const patient_has_diagnosis_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart disease."} ;; "heart disease"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure > 160 millimeters of mercury"

(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current diastolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure > 100 millimeters of mercury"

(declare-const patient_blood_glucose_concentration_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current blood glucose concentration in millimoles per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood glucose concentration in millimoles per liter."} ;; "blood glucose concentration > 6.1 millimoles per liter"

(declare-const patient_blood_cholesterol_concentration_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current blood cholesterol concentration in millimoles per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood cholesterol concentration in millimoles per liter."} ;; "blood cholesterol concentration > 7 millimoles per liter"

(declare-const patient_blood_triglyceride_concentration_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current blood triglyceride concentration in millimoles per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood triglyceride concentration in millimoles per liter."} ;; "blood triglyceride concentration > 3 millimoles per liter"

;; ===================== Auxiliary Assertions (REQ 0) =====================

;; Non-exhaustive example: systemic use of steroid implies prescription medication that influences body weight regulation
(assert
(! (=> patient_is_using_prescription_medication_of_systemic_steroid_now
      patient_is_using_prescription_medication_that_influences_body_weight_regulation_now)
:named REQ0_AUXILIARY0)) ;; "medication that influences body weight regulation with non-exhaustive examples (systemic use of steroid)"

;; Non-exhaustive example: systemic use of steroid (as prescription medication) implies systemic administration of steroid
(assert
(! (=> patient_is_using_prescription_medication_of_systemic_steroid_now
      patient_is_undergoing_administration_of_steroid_now)
:named REQ0_AUXILIARY1)) ;; "systemic use of steroid"

;; Non-exhaustive example: prescription medication that influences body weight regulation implies prescription medication that might influence study outcome
(assert
(! (=> patient_is_using_prescription_medication_that_influences_body_weight_regulation_now
      patient_is_using_prescription_medication_that_might_influence_study_outcome_now)
:named REQ0_AUXILIARY2)) ;; "prescription medication that influences body weight regulation with non-exhaustive examples (systemic use of steroid)"

;; Non-exhaustive example: disease that influences body weight regulation implies disease that might influence study outcome
(assert
(! (=> patient_has_disease_that_influences_body_weight_regulation_now
      patient_has_disease_that_might_influence_study_outcome_now)
:named REQ0_AUXILIARY3)) ;; "diseases that influence body weight regulation with non-exhaustive examples (malabsorption, untreated hypothyroidism, untreated hyperthyroidism, eating disorder)"

;; Non-exhaustive examples: malabsorption, untreated hypothyroidism, untreated hyperthyroidism, eating disorder imply disease that influences body weight regulation
(assert
(! (=> (or patient_has_diagnosis_of_malabsorption_now
          patient_has_diagnosis_of_hypothyroidism_now@@untreated
          patient_has_diagnosis_of_hyperthyroidism_now@@untreated
          patient_has_diagnosis_of_eating_disorder_now)
      patient_has_disease_that_influences_body_weight_regulation_now)
:named REQ0_AUXILIARY4)) ;; "malabsorption, untreated hypothyroidism, untreated hyperthyroidism, eating disorder"

;; Untreated hypothyroidism implies hypothyroidism
(assert
(! (=> patient_has_diagnosis_of_hypothyroidism_now@@untreated
      patient_has_diagnosis_of_hypothyroidism_now)
:named REQ0_AUXILIARY5)) ;; "untreated hypothyroidism"

;; Untreated hyperthyroidism implies hyperthyroidism
(assert
(! (=> patient_has_diagnosis_of_hyperthyroidism_now@@untreated
      patient_has_diagnosis_of_hyperthyroidism_now)
:named REQ0_AUXILIARY6)) ;; "untreated hyperthyroidism"

;; Non-exhaustive example: obesity-related cardiovascular risk factor implies condition that might influence study outcome
(assert
(! (=> patient_has_obesity_related_cardiovascular_risk_factor_that_might_influence_study_outcome_now
      true) ;; This is a placeholder; see constraint assertion for actual use
:named REQ0_AUXILIARY7)) ;; "obesity-related cardiovascular risk factors with non-exhaustive examples (...)"

;; Non-exhaustive examples: heart disease, SBP > 160, DBP > 100, glucose > 6.1, cholesterol > 7, triglyceride > 3 imply obesity-related cardiovascular risk factor
(assert
(! (=> (or patient_has_diagnosis_of_heart_disease_now
          (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160)
          (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100)
          (> patient_blood_glucose_concentration_value_recorded_now_withunit_millimoles_per_liter 6.1)
          (> patient_blood_cholesterol_concentration_value_recorded_now_withunit_millimoles_per_liter 7)
          (> patient_blood_triglyceride_concentration_value_recorded_now_withunit_millimoles_per_liter 3))
      patient_has_obesity_related_cardiovascular_risk_factor_that_might_influence_study_outcome_now)
:named REQ0_AUXILIARY8)) ;; "heart disease, systolic blood pressure > 160 mmHg, diastolic blood pressure > 100 mmHg, blood glucose concentration > 6.1 mmol/L, blood cholesterol concentration > 7 mmol/L, or blood triglyceride concentration > 3 mmol/L"

;; ===================== Constraint Assertions (REQ 0) =====================

;; Exclusion: patient is using prescription medication that might influence the outcome of the study
(assert
(! (not patient_is_using_prescription_medication_that_might_influence_study_outcome_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is using prescription medication that might influence the outcome of the study..."

;; Exclusion: patient is suffering from diseases that might influence the outcome of the study
(assert
(! (not patient_has_disease_that_might_influence_study_outcome_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from diseases that might influence the outcome of the study..."

;; Exclusion: patient is suffering from conditions that might influence the outcome of the study (obesity-related cardiovascular risk factors)
(assert
(! (not patient_has_obesity_related_cardiovascular_risk_factor_that_might_influence_study_outcome_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from conditions that might influence the outcome of the study with non-exhaustive examples (obesity-related cardiovascular risk factors...)"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_alcohol_intake_above_recommended_sensible_limits_value_recorded_now_withunit_alcoholic_units_per_week Real) ;; {"when_to_set_to_value":"Set to the measured or reported number of alcoholic units consumed per week by the patient, recorded now.","when_to_set_to_null":"Set to null if the patient's weekly alcohol consumption is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current weekly alcohol intake in alcoholic units."} ;; "marked alcohol consumption of more than 21 alcoholic units per week" / "marked alcohol consumption of more than 14 alcoholic units per week"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "the patient is male"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or
         (and patient_sex_is_male_now
              (> patient_alcohol_intake_above_recommended_sensible_limits_value_recorded_now_withunit_alcoholic_units_per_week 21))
         (and patient_sex_is_female_now
              (> patient_alcohol_intake_above_recommended_sensible_limits_value_recorded_now_withunit_alcoholic_units_per_week 14))
      ))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is male AND the patient has marked alcohol consumption of more than 21 alcoholic units per week) OR (the patient is female AND the patient has marked alcohol consumption of more than 14 alcoholic units per week))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patients_physical_activity_is_positive_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to have a change in physical activity during the study period (inthefuture).","when_to_set_to_false":"Set to false if the patient is not expected to have any change in physical activity during the study period (inthefuture).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will have a change in physical activity during the study period.","meaning":"Boolean indicating whether the patient will have a change in physical activity during the study period (inthefuture)."} ;; "physical activity"
(declare-const patients_physical_activity_is_positive_inthefuture@@change_is_planned Bool) ;; {"when_to_set_to_true":"Set to true if the change in physical activity during the study is planned.","when_to_set_to_false":"Set to false if the change in physical activity during the study is not planned.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the change in physical activity during the study is planned.","meaning":"Boolean indicating whether the change in physical activity during the study is planned."} ;; "planned major change in physical activity"
(declare-const patients_physical_activity_is_positive_inthefuture@@change_is_major Bool) ;; {"when_to_set_to_true":"Set to true if the change in physical activity during the study is major.","when_to_set_to_false":"Set to false if the change in physical activity during the study is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the change in physical activity during the study is major.","meaning":"Boolean indicating whether the change in physical activity during the study is major."} ;; "major change in physical activity"
(declare-const patients_physical_activity_is_positive_inthefuture@@change_might_interfere_with_study_outcome_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the change in physical activity during the study might interfere with the study outcome as judged by the investigator.","when_to_set_to_false":"Set to false if the change in physical activity during the study does not or is not judged to interfere with the study outcome by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the change in physical activity during the study might interfere with the study outcome as judged by the investigator.","meaning":"Boolean indicating whether the change in physical activity during the study might interfere with the study outcome as judged by the investigator."} ;; "to an extent that might interfere with the study outcome as judged by the investigator"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patients_physical_activity_is_positive_inthefuture@@change_is_planned
      patients_physical_activity_is_positive_inthefuture)
:named REQ2_AUXILIARY0)) ;; "planned major change in physical activity during the study"

(assert
(! (=> patients_physical_activity_is_positive_inthefuture@@change_is_major
      patients_physical_activity_is_positive_inthefuture)
:named REQ2_AUXILIARY1)) ;; "major change in physical activity during the study"

(assert
(! (=> patients_physical_activity_is_positive_inthefuture@@change_might_interfere_with_study_outcome_as_judged_by_investigator
      patients_physical_activity_is_positive_inthefuture)
:named REQ2_AUXILIARY2)) ;; "change in physical activity might interfere with the study outcome as judged by the investigator"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patients_physical_activity_is_positive_inthefuture@@change_is_planned
             patients_physical_activity_is_positive_inthefuture@@change_is_major
             patients_physical_activity_is_positive_inthefuture@@change_might_interfere_with_study_outcome_as_judged_by_investigator))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has planned major change in physical activity during the study to an extent that might interfere with the study outcome as judged by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_whole_blood_unit_collection_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone whole blood unit collection within the past 2 months prior to the study.","when_to_set_to_false":"Set to false if the patient has not undergone whole blood unit collection within the past 2 months prior to the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone whole blood unit collection within the past 2 months prior to the study.","meaning":"Boolean indicating whether the patient has undergone whole blood unit collection within the past 2 months prior to the study."} ;; "donated blood within the past 2 months prior to the study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_whole_blood_unit_collection_inthepast2months)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has donated blood within the past 2 months prior to the study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_weight_change_value_recorded_inthepast2months_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's weight change in kilograms if such a measurement is recorded within the 2 months prior to the study.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate for the 2 months prior to the study.","meaning":"Numeric value representing the patient's weight change, in kilograms, recorded within the 2 months prior to the study."} ;; "weight change of more than 3 kilograms within 2 months prior to the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (> (abs patient_weight_change_value_recorded_inthepast2months_withunit_kilograms) 3))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a weight change of more than 3 kilograms within 2 months prior to the study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of psychiatric disease (mental disorder).","when_to_set_to_false":"Set to false if the patient does not have a history of psychiatric disease (mental disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of psychiatric disease (mental disorder).","meaning":"Boolean indicating whether the patient has a history of psychiatric disease (mental disorder)."} ;; "psychiatric disease (mental disorder) (based on medical history only)"
(declare-const patient_has_finding_of_mental_disorder_inthehistory@@based_on_medical_history_only Bool) ;; {"when_to_set_to_true":"Set to true if the determination of psychiatric disease in the patient's history is based only on medical history.","when_to_set_to_false":"Set to false if the determination is based on sources other than medical history (e.g., current symptoms, physical exam, or other documentation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the determination is based only on medical history.","meaning":"Boolean indicating whether the determination of psychiatric disease in the patient's history is based solely on medical history."} ;; "psychiatric disease (based on medical history only)"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_inthehistory@@based_on_medical_history_only
      patient_has_finding_of_mental_disorder_inthehistory)
:named REQ5_AUXILIARY0)) ;; "psychiatric disease (based on medical history only)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_inthehistory@@based_on_medical_history_only)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychiatric disease (based on medical history only)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_pregnant_inthefuture12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning or expected to become pregnant at any time within the next 12 months.","when_to_set_to_false":"Set to false if the patient is not planning or expected to become pregnant within the next 12 months.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is planning or expected to become pregnant within the next 12 months.","meaning":"Boolean value indicating whether the patient is expected or planning to be pregnant at any time within the next 12 months."} ;; "the patient is planning to become pregnant within the next 12 months"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

(assert
(! (not patient_is_pregnant_inthefuture12months)
:named REQ6_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is planning to become pregnant within the next 12 months."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} ;; "obesity"
(declare-const patient_has_finding_of_obesity_now@@treated_by_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current obesity has been treated by surgery.","when_to_set_to_false":"Set to false if the patient's current obesity has not been treated by surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current obesity has been treated by surgery.","meaning":"Boolean indicating whether the patient's current obesity has been treated by surgery."} ;; "obesity treated by surgery"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_obesity_now@@treated_by_surgery
      patient_has_finding_of_obesity_now)
   :named REQ7_AUXILIARY0)) ;; "obesity treated by surgery" implies "obesity"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_obesity_now@@treated_by_surgery)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has obesity treated by surgery."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const months_since_last_participation_in_other_clinical_study Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient last participated in any other clinical study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months have passed since the patient last participated in any other clinical study.","meaning":"Numeric value indicating the number of months since the patient last participated in any other clinical study."} ;; "number of months since the patient last participated in any other clinical study"

(declare-const patient_has_participated_in_other_clinical_study_within_last_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any other clinical study within the last 3 months.","when_to_set_to_false":"Set to false if the patient has not participated in any other clinical study within the last 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any other clinical study within the last 3 months.","meaning":"Boolean indicating whether the patient has participated in any other clinical study within the last 3 months."} ;; "has participated in other clinical study within the last 3 months"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: patient_has_participated_in_other_clinical_study_within_last_3_months = (months_since_last_participation_in_other_clinical_study < 3)
(assert
(! (= patient_has_participated_in_other_clinical_study_within_last_3_months
     (< months_since_last_participation_in_other_clinical_study 3))
:named REQ8_AUXILIARY0)) ;; "has participated in other clinical study within the last 3 months"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_participated_in_other_clinical_study_within_last_3_months)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in other clinical study within the last 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding relating to drug misuse behavior.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding relating to drug misuse behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding relating to drug misuse behavior.","meaning":"Boolean indicating whether the patient currently has a clinical finding relating to drug misuse behavior."} ;; "drug abuse"

(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@based_on_clinical_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the determination that the patient currently has a finding relating to drug misuse behavior is based on clinical judgment.","when_to_set_to_false":"Set to false if the determination is not based on clinical judgment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the determination is based on clinical judgment.","meaning":"Boolean indicating whether the finding relating to drug misuse behavior is determined based on clinical judgment."} ;; "based on clinical judgment"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@based_on_clinical_judgment
      patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
   :named REQ9_AUXILIARY0)) ;; "based on clinical judgment"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@based_on_clinical_judgment)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has drug abuse (based on clinical judgment)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} ;; "unable to give informed consent"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_able_to_give_informed_consent_now)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to give informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_calorie_restricted_diet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to engage in a calorie-restricted diet.","when_to_set_to_false":"Set to false if the patient is currently unable to engage in a calorie-restricted diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to engage in a calorie-restricted diet.","meaning":"Boolean indicating whether the patient is currently able to engage in a calorie-restricted diet."} ;; "low-calorie diet"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_calorie_restricted_diet_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to engage in a low-calorie diet."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_body_weight_value_recorded_before_weight_loss_period_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's body weight in kilograms, recorded before the weight-loss period.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight in kilograms measured before the weight-loss period."} ;; "body weight before the weight-loss period"
(declare-const patient_body_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's body weight in kilograms, recorded after the weight-loss period.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight in kilograms measured after the weight-loss period."} ;; "body weight after the weight-loss period"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (> (/ (- patient_body_weight_value_recorded_before_weight_loss_period_withunit_kg patient_body_weight_value_recorded_now_withunit_kg)
              patient_body_weight_value_recorded_before_weight_loss_period_withunit_kg)
           0.08))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to lose more than eight percent of body weight after the weight-loss period."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_on_special_diet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently following a special diet (e.g., vegetarian, Atkins, or other special diets).","when_to_set_to_false":"Set to false if the patient is currently not following any special diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently following a special diet.","meaning":"Boolean indicating whether the patient is currently following a special diet."} ;; "special diet"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_on_special_diet_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is following a special diet with non-exhaustive examples (vegetarian diet, Atkins diet, or other special diet)."
