;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_exercise_physically_impossible_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical inability to exercise.","when_to_set_to_false":"Set to false if the patient currently does not have a physical inability to exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical inability to exercise.","meaning":"Boolean indicating whether the patient currently has a physical inability to exercise."} ;; "inability to exercise"

(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has co-morbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have co-morbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has co-morbid conditions.","meaning":"Boolean indicating whether the patient currently has co-morbid conditions."} ;; "co-morbidities"

(declare-const patient_has_finding_of_co_morbid_conditions_now@@interferes_with_exercise_tolerance_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has co-morbid conditions and those conditions interfere with the ability to perform required exercise tolerance testing.","when_to_set_to_false":"Set to false if the patient currently has co-morbid conditions but those conditions do not interfere with the ability to perform required exercise tolerance testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's co-morbid conditions interfere with the ability to perform required exercise tolerance testing.","meaning":"Boolean indicating whether the patient's co-morbid conditions interfere with the ability to perform required exercise tolerance testing."} ;; "exercise limitation due to other co-morbidities that may interfere with ability to perform required exercise tolerance testing"

(declare-const patient_has_finding_of_morbid_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has morbid obesity.","when_to_set_to_false":"Set to false if the patient currently does not have morbid obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has morbid obesity.","meaning":"Boolean indicating whether the patient currently has morbid obesity."} ;; "morbid obesity"

(declare-const patient_has_finding_of_significant_chronic_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant chronic lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have significant chronic lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant chronic lung disease.","meaning":"Boolean indicating whether the patient currently has significant chronic lung disease."} ;; "significant chronic lung disease"

(declare-const patient_has_finding_of_prior_hospitalization_for_acute_exacerbation_of_chronic_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a history of prior hospitalization for acute exacerbation of chronic lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have a history of prior hospitalization for acute exacerbation of chronic lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a history of prior hospitalization for acute exacerbation of chronic lung disease.","meaning":"Boolean indicating whether the patient currently has a history of prior hospitalization for acute exacerbation of chronic lung disease."} ;; "prior hospitalization for acute exacerbation of chronic lung disease"

(declare-const patient_has_finding_of_home_oxygen_use_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses home oxygen.","when_to_set_to_false":"Set to false if the patient currently does not use home oxygen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses home oxygen.","meaning":"Boolean indicating whether the patient currently uses home oxygen."} ;; "home oxygen use"

(declare-const patient_has_finding_of_chronic_oral_steroid_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on chronic oral steroid therapy.","when_to_set_to_false":"Set to false if the patient is not currently on chronic oral steroid therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on chronic oral steroid therapy.","meaning":"Boolean indicating whether the patient is currently on chronic oral steroid therapy."} ;; "chronic oral steroid therapy that can limit exercise capacity"

(declare-const patient_has_finding_of_osteoarthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has osteoarthritis.","when_to_set_to_false":"Set to false if the patient currently does not have osteoarthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has osteoarthritis.","meaning":"Boolean indicating whether the patient currently has osteoarthritis."} ;; "osteoarthritis"

(declare-const patient_has_finding_of_peripheral_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral artery disease.","meaning":"Boolean indicating whether the patient currently has peripheral artery disease."} ;; "peripheral artery disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term (exercise limitation due to co-morbidities interfering with exercise tolerance testing)
(assert
(! (=> (or patient_has_finding_of_morbid_obesity_now
          patient_has_finding_of_significant_chronic_lung_disease_now
          patient_has_finding_of_prior_hospitalization_for_acute_exacerbation_of_chronic_lung_disease_now
          patient_has_finding_of_home_oxygen_use_now
          patient_has_finding_of_chronic_oral_steroid_therapy_now
          patient_has_finding_of_osteoarthritis_now
          patient_has_finding_of_peripheral_artery_disease_now)
    patient_has_finding_of_co_morbid_conditions_now@@interferes_with_exercise_tolerance_testing)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (morbid obesity, significant chronic lung disease, prior hospitalization for acute exacerbation of chronic lung disease, home oxygen use, chronic oral steroid therapy that can limit exercise capacity, osteoarthritis, peripheral artery disease)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@interferes_with_exercise_tolerance_testing
    patient_has_finding_of_co_morbid_conditions_now)
:named REQ0_AUXILIARY1)) ;; "co-morbidities that interfere with ability to perform required exercise tolerance testing"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have inability to exercise
(assert
(! (not patient_has_finding_of_exercise_physically_impossible_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to exercise."

;; Exclusion: patient must NOT have exercise limitation due to co-morbidities interfering with exercise tolerance testing
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@interferes_with_exercise_tolerance_testing)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has exercise limitation due to other co-morbidities that may interfere with ability to perform required exercise tolerance testing with non-exhaustive examples (morbid obesity, significant chronic lung disease, prior hospitalization for acute exacerbation of chronic lung disease, home oxygen use, chronic oral steroid therapy that can limit exercise capacity, osteoarthritis, peripheral artery disease)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_absolute_contraindication_to_exercise_tolerance_testing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any absolute contraindication to exercise tolerance testing.","when_to_set_to_false":"Set to false if the patient currently does not have any absolute contraindication to exercise tolerance testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any absolute contraindication to exercise tolerance testing.","meaning":"Boolean indicating whether the patient currently has any absolute contraindication to exercise tolerance testing."} ;; "any absolute contraindication to exercise tolerance testing"

(declare-const patient_has_undergone_exercise_tolerance_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an exercise tolerance test at the present time.","when_to_set_to_false":"Set to false if the patient has not undergone an exercise tolerance test at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an exercise tolerance test at the present time.","meaning":"Boolean indicating whether the patient has undergone an exercise tolerance test now."} ;; "exercise tolerance testing"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_absolute_contraindication_to_exercise_tolerance_testing_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any absolute contraindication to exercise tolerance testing."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has electrocardiographic abnormalities.","when_to_set_to_false":"Set to false if the patient currently does not have electrocardiographic abnormalities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has electrocardiographic abnormalities.","meaning":"Boolean indicating whether the patient currently has electrocardiographic abnormalities."} ;; "electrocardiographic abnormalities"

(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@interferes_with_electrocardiogram_interpretation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's electrocardiographic abnormalities interfere with electrocardiogram interpretation.","when_to_set_to_false":"Set to false if the patient's electrocardiographic abnormalities do not interfere with electrocardiogram interpretation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's electrocardiographic abnormalities interfere with electrocardiogram interpretation.","meaning":"Boolean indicating whether the patient's electrocardiographic abnormalities interfere with electrocardiogram interpretation."} ;; "interfere with electrocardiogram interpretation"

(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@may_cause_false_positive_stress_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient's electrocardiographic abnormalities may cause a false positive stress test.","when_to_set_to_false":"Set to false if the patient's electrocardiographic abnormalities do not cause a false positive stress test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's electrocardiographic abnormalities may cause a false positive stress test.","meaning":"Boolean indicating whether the patient's electrocardiographic abnormalities may cause a false positive stress test."} ;; "may cause a false positive stress test"

(declare-const patient_has_finding_of_horizontal_or_downsloping_st_segment_depression_at_rest_in_any_standard_electrocardiogram_lead_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has horizontal or down-sloping ST segment depression at rest in any standard electrocardiogram lead.","when_to_set_to_false":"Set to false if the patient currently does not have horizontal or down-sloping ST segment depression at rest in any standard electrocardiogram lead.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has horizontal or down-sloping ST segment depression at rest in any standard electrocardiogram lead.","meaning":"Boolean indicating whether the patient currently has horizontal or down-sloping ST segment depression at rest in any standard electrocardiogram lead."} ;; "horizontal or down-sloping ST segment depression at rest in any standard electrocardiogram lead"

(declare-const patient_has_finding_of_horizontal_or_downsloping_st_segment_depression_at_rest_in_any_standard_electrocardiogram_lead_now@@st_segment_depression_value_recorded_now_in_millimeter Bool) ;; {"when_to_set_to_true":"Set to true if the value of ST segment depression in millimeters is recorded now.","when_to_set_to_false":"Set to false if the value of ST segment depression in millimeters is not recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the value of ST segment depression in millimeters is recorded now.","meaning":"Boolean indicating whether the value of ST segment depression in millimeters is recorded now."} ;; "horizontal or down-sloping ST segment depression ≥ 1 millimeter at rest in any standard electrocardiogram lead"

(declare-const st_segment_depression_value_recorded_now_in_millimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the ST segment depression in millimeters recorded now.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the ST segment depression in millimeters recorded now."} ;; "ST segment depression value in millimeters"

(declare-const patient_has_finding_of_lown_ganong_levine_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Lown-Ganong-Levine syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have Lown-Ganong-Levine syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Lown-Ganong-Levine syndrome.","meaning":"Boolean indicating whether the patient currently has Lown-Ganong-Levine syndrome."} ;; "Lown-Ganong-Levine syndrome"

(declare-const patient_has_finding_of_wolff_parkinson_white_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Wolff-Parkinson-White syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have Wolff-Parkinson-White syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Wolff-Parkinson-White syndrome.","meaning":"Boolean indicating whether the patient currently has Wolff-Parkinson-White syndrome."} ;; "Wolff-Parkinson-White syndrome"

(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left bundle branch block.","meaning":"Boolean indicating whether the patient currently has left bundle branch block."} ;; "left bundle branch block"

(declare-const patient_has_finding_of_left_ventricular_hypertrophy_with_repolarization_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular hypertrophy with repolarization abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular hypertrophy with repolarization abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular hypertrophy with repolarization abnormality.","meaning":"Boolean indicating whether the patient currently has left ventricular hypertrophy with repolarization abnormality."} ;; "left ventricular hypertrophy with repolarization abnormality"

(declare-const patient_has_finding_of_ventricular_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a ventricular pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a ventricular pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a ventricular pacemaker.","meaning":"Boolean indicating whether the patient currently has a ventricular pacemaker."} ;; "ventricular pacemaker"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or
        (and patient_has_finding_of_horizontal_or_downsloping_st_segment_depression_at_rest_in_any_standard_electrocardiogram_lead_now
             patient_has_finding_of_horizontal_or_downsloping_st_segment_depression_at_rest_in_any_standard_electrocardiogram_lead_now@@st_segment_depression_value_recorded_now_in_millimeter
             (>= st_segment_depression_value_recorded_now_in_millimeter 1))
        patient_has_finding_of_lown_ganong_levine_syndrome_now
        patient_has_finding_of_wolff_parkinson_white_syndrome_now
        patient_has_finding_of_left_bundle_branch_block_now
        patient_has_finding_of_left_ventricular_hypertrophy_with_repolarization_abnormality_now
        patient_has_finding_of_ventricular_pacemaker_now)
    (or patient_has_finding_of_electrocardiogram_abnormal_now@@interferes_with_electrocardiogram_interpretation
        patient_has_finding_of_electrocardiogram_abnormal_now@@may_cause_false_positive_stress_test))
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((horizontal or down-sloping ST segment depression ≥ 1 millimeter at rest in any standard electrocardiogram lead), Lown-Ganong-Levine syndrome, Wolff-Parkinson-White syndrome, left bundle branch block, left ventricular hypertrophy with repolarization abnormality, ventricular pacemaker)."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@interferes_with_electrocardiogram_interpretation
      patient_has_finding_of_electrocardiogram_abnormal_now)
:named REQ2_AUXILIARY1)) ;; "interferes with electrocardiogram interpretation"

(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@may_cause_false_positive_stress_test
      patient_has_finding_of_electrocardiogram_abnormal_now)
:named REQ2_AUXILIARY2)) ;; "may cause a false positive stress test"

;; Qualifier variable for ST segment depression value
(assert
(! (=> patient_has_finding_of_horizontal_or_downsloping_st_segment_depression_at_rest_in_any_standard_electrocardiogram_lead_now@@st_segment_depression_value_recorded_now_in_millimeter
      patient_has_finding_of_horizontal_or_downsloping_st_segment_depression_at_rest_in_any_standard_electrocardiogram_lead_now)
:named REQ2_AUXILIARY3)) ;; "horizontal or down-sloping ST segment depression ≥ 1 millimeter at rest in any standard electrocardiogram lead"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_electrocardiogram_abnormal_now@@interferes_with_electrocardiogram_interpretation
            patient_has_finding_of_electrocardiogram_abnormal_now@@may_cause_false_positive_stress_test))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has electrocardiographic abnormalities or other abnormalities that interfere with electrocardiogram interpretation or may cause a false positive stress test with non-exhaustive examples ...)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_decompensated_cardiac_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decompensated heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decompensated heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of decompensated heart failure.","meaning":"Boolean indicating whether the patient currently has decompensated heart failure."} ;; "decompensated heart failure"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_decompensated_cardiac_failure_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has decompensated heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart valve disorder (valvular heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart valve disorder (valvular heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart valve disorder (valvular heart disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart valve disorder (valvular heart disease)."} ;; "valvular heart disease"
(declare-const patient_has_diagnosis_of_heart_valve_disorder_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart valve disorder (valvular heart disease) and the disorder is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of heart valve disorder (valvular heart disease) but the disorder is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart valve disorder is clinically significant.","meaning":"Boolean indicating whether the patient's current heart valve disorder is clinically significant."} ;; "clinically significant valvular heart disease"
(declare-const patient_has_diagnosis_of_congenital_cardiac_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital cardiac defect.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congenital cardiac defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congenital cardiac defect.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congenital cardiac defect."} ;; "congenital cardiac defect"
(declare-const patient_has_diagnosis_of_congenital_cardiac_defect_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital cardiac defect and the defect is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of congenital cardiac defect but the defect is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the congenital cardiac defect is clinically significant.","meaning":"Boolean indicating whether the patient's current congenital cardiac defect is clinically significant."} ;; "clinically significant congenital cardiac defect"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_heart_valve_disorder_now@@clinically_significant
      patient_has_diagnosis_of_heart_valve_disorder_now)
   :named REQ4_AUXILIARY0)) ;; "clinically significant valvular heart disease"

(assert
(! (=> patient_has_diagnosis_of_congenital_cardiac_defect_now@@clinically_significant
      patient_has_diagnosis_of_congenital_cardiac_defect_now)
   :named REQ4_AUXILIARY1)) ;; "clinically significant congenital cardiac defect"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_diagnosis_of_heart_valve_disorder_now@@clinically_significant
            patient_has_diagnosis_of_congenital_cardiac_defect_now@@clinically_significant))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has clinically significant valvular heart disease) OR (the patient has clinically significant congenital cardiac defects)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of acute coronary syndrome within the past 2 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of acute coronary syndrome within the past 2 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of acute coronary syndrome within the past 2 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of acute coronary syndrome within the past 2 months."} ;; "acute coronary syndrome within the prior 2 months"

(declare-const patient_has_undergone_myocardial_revascularization_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone myocardial revascularization within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone myocardial revascularization within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone myocardial revascularization within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone myocardial revascularization within the past 6 months."} ;; "coronary revascularization within the prior 6 months"

(declare-const patient_will_undergo_myocardial_revascularization_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to undergo myocardial revascularization in the future (i.e., during the study period).","when_to_set_to_false":"Set to false if the patient is not planned to undergo myocardial revascularization in the future (i.e., during the study period).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to undergo myocardial revascularization in the future (i.e., during the study period).","meaning":"Boolean indicating whether the patient is planned to undergo myocardial revascularization in the future."} ;; "planned coronary revascularization during the study period"

(declare-const patient_will_undergo_myocardial_revascularization_inthefuture@@planned_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the planned future myocardial revascularization is scheduled to occur during the study period.","when_to_set_to_false":"Set to false if the planned future myocardial revascularization is not scheduled to occur during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned future myocardial revascularization is scheduled to occur during the study period.","meaning":"Boolean indicating whether the planned future myocardial revascularization is scheduled to occur during the study period."} ;; "planned coronary revascularization during the study period"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_will_undergo_myocardial_revascularization_inthefuture@@planned_during_study_period
      patient_will_undergo_myocardial_revascularization_inthefuture)
   :named REQ5_AUXILIARY0)) ;; "planned coronary revascularization during the study period"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_acute_coronary_syndrome_inthepast2months)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had acute coronary syndrome within the prior 2 months."

(assert
(! (not patient_has_undergone_myocardial_revascularization_inthepast6months)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had coronary revascularization within the prior 6 months."

(assert
(! (not patient_will_undergo_myocardial_revascularization_inthefuture@@planned_during_study_period)
   :named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has planned coronary revascularization during the study period."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within the past 6 months prior to screening.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past 6 months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past 6 months prior to screening.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within the past 6 months prior to screening."} ;; "stroke within 6 months prior to screening"

(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a transient cerebral ischemia (transient ischemic attack) within the past 6 months prior to screening.","when_to_set_to_false":"Set to false if the patient has not had a transient cerebral ischemia (transient ischemic attack) within the past 6 months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a transient cerebral ischemia (transient ischemic attack) within the past 6 months prior to screening.","meaning":"Boolean indicating whether the patient has had a transient cerebral ischemia (transient ischemic attack) within the past 6 months prior to screening."} ;; "transient ischemic attack within 6 months prior to screening"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_has_finding_of_cerebrovascular_accident_inthepast6months
            patient_has_finding_of_transient_cerebral_ischemia_inthepast6months))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had stroke within 6 months prior to screening) OR (the patient has had transient ischemic attack within 6 months prior to screening)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_history_of_serious_ventricular_dysrhythmias Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of serious ventricular dysrhythmias.","when_to_set_to_false":"Set to false if the patient does not have a documented history of serious ventricular dysrhythmias.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of serious ventricular dysrhythmias.","meaning":"Boolean indicating whether the patient has a history of serious ventricular dysrhythmias."} ;; "the patient has a history of serious ventricular dysrhythmias"

(declare-const patient_has_diagnosis_of_ventricular_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with ventricular arrhythmia at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with ventricular arrhythmia at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with ventricular arrhythmia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of ventricular arrhythmia in their history."} ;; "ventricular arrhythmia"

(declare-const patient_has_diagnosis_of_ventricular_arrhythmia_inthehistory@@life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of ventricular arrhythmia was life-threatening.","when_to_set_to_false":"Set to false if the patient's history of ventricular arrhythmia was not life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of ventricular arrhythmia was life-threatening.","meaning":"Boolean indicating whether the patient's history of ventricular arrhythmia was life-threatening."} ;; "life-threatening ventricular arrhythmia"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_ventricular_arrhythmia_inthehistory@@life_threatening
      patient_has_diagnosis_of_ventricular_arrhythmia_inthehistory)
:named REQ7_AUXILIARY0)) ;; "the patient has a history of life-threatening ventricular arrhythmia"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_history_of_serious_ventricular_dysrhythmias
            patient_has_diagnosis_of_ventricular_arrhythmia_inthehistory@@life_threatening))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of serious ventricular dysrhythmias) OR (the patient has a history of life-threatening ventricular arrhythmia)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atrial fibrillation."} ;; "atrial fibrillation"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_atrial_fibrillation_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrial fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_qt_interval_duration_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's corrected QT interval duration in seconds is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's corrected QT interval duration in seconds measured now."} ;; "QT interval"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (> patient_qt_interval_duration_value_recorded_now_withunit_seconds 0.5))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has corrected QT interval > 0.5 seconds."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_hypertrophic_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertrophic cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertrophic cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertrophic cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertrophic cardiomyopathy."} ;; "hypertrophic cardiomyopathy"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_hypertrophic_cardiomyopathy_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypertrophic cardiomyopathy."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled (poorly controlled) hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled (poorly controlled) hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled hypertension.","meaning":"Boolean indicating whether the patient currently has uncontrolled (poorly controlled) hypertension."} ;; "uncontrolled hypertension"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's systolic blood pressure in millimeters of mercury recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measured now in millimeters of mercury."} ;; "systolic blood pressure"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_while_seated Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken while the patient was seated.","when_to_set_to_false":"Set to false if the measurement was not taken while seated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken while seated.","meaning":"Boolean indicating whether the systolic blood pressure measurement was taken while the patient was seated."} ;; "seated systolic blood pressure"

(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's diastolic blood pressure in millimeters of mercury recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's diastolic blood pressure measured now in millimeters of mercury."} ;; "diastolic blood pressure"

(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_while_seated Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken while the patient was seated.","when_to_set_to_false":"Set to false if the measurement was not taken while seated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken while seated.","meaning":"Boolean indicating whether the diastolic blood pressure measurement was taken while the patient was seated."} ;; "seated diastolic blood pressure"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definition: uncontrolled hypertension is present if seated systolic BP > 180 mmHg OR seated diastolic BP > 110 mmHg
(assert
(! (= patient_has_finding_of_poor_hypertension_control_now
(or (and patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_while_seated
         (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 180))
    (and patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_while_seated
         (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 110))))
:named REQ11_AUXILIARY0)) ;; "uncontrolled hypertension defined as (seated systolic blood pressure > 180 millimeters of mercury) OR (seated diastolic blood pressure > 110 millimeters of mercury)"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has uncontrolled hypertension defined as (seated systolic blood pressure > 180 millimeters of mercury) OR (seated diastolic blood pressure > 110 millimeters of mercury)))."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
;; Variable already declared in previous SMT program:
;; (declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's systolic blood pressure in millimeters of mercury recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measured now in millimeters of mercury."} ;; "systolic blood pressure"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90))
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure < 90 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_inability_to_discontinue_current_antianginal_medications_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to discontinue current antianginal medications.","when_to_set_to_false":"Set to false if the patient is currently able to discontinue current antianginal medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to discontinue current antianginal medications.","meaning":"Boolean indicating whether the patient currently has an inability to discontinue current antianginal medications."} ;; "inability to discontinue current antianginal medications"
(declare-const patient_has_inability_to_discontinue_current_antianginal_medications_now@@and_remain_on_one_allowed_antianginal_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to discontinue current antianginal medications and this inability is in the context of remaining on only one allowed antianginal therapy.","when_to_set_to_false":"Set to false if the patient is currently able to discontinue current antianginal medications and remain on only one allowed antianginal therapy, or if the inability is not in the context of remaining on only one allowed antianginal therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inability to discontinue current antianginal medications is in the context of remaining on only one allowed antianginal therapy.","meaning":"Boolean indicating whether the patient currently has an inability to discontinue current antianginal medications in the context of remaining on only one allowed antianginal therapy."} ;; "inability to discontinue current antianginal medications and remain on one allowed antianginal therapy"
(declare-const patient_is_undergoing_antianginal_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antianginal therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing antianginal therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antianginal therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antianginal therapy."} ;; "antianginal therapy"
(declare-const patient_is_undergoing_antianginal_therapy_now@@only_one_allowed_antianginal_therapy_may_be_continued Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing only one allowed antianginal therapy (i.e., all other antianginal medications have been discontinued except for one permitted therapy).","when_to_set_to_false":"Set to false if the patient is currently undergoing more than one antianginal therapy or is not limited to only one allowed therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether only one allowed antianginal therapy is being continued.","meaning":"Boolean indicating whether only one allowed antianginal therapy is being continued by the patient."} ;; "only one allowed antianginal therapy may be continued"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_inability_to_discontinue_current_antianginal_medications_now@@and_remain_on_one_allowed_antianginal_therapy
       patient_has_inability_to_discontinue_current_antianginal_medications_now)
   :named REQ13_AUXILIARY0)) ;; "inability to discontinue current antianginal medications and remain on one allowed antianginal therapy" implies "inability to discontinue current antianginal medications"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_undergoing_antianginal_therapy_now@@only_one_allowed_antianginal_therapy_may_be_continued
       patient_is_undergoing_antianginal_therapy_now)
   :named REQ13_AUXILIARY1)) ;; "only one allowed antianginal therapy may be continued" implies "antianginal therapy"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_inability_to_discontinue_current_antianginal_medications_now@@and_remain_on_one_allowed_antianginal_therapy)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has inability to discontinue current antianginal medications and remain on one allowed antianginal therapy."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any impairment.","when_to_set_to_false":"Set to false if the patient currently does not have any impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any impairment.","meaning":"Boolean indicating whether the patient currently has impairment."} ;; "impairment"
(declare-const patient_has_finding_of_impairment_now@@hepatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impairment is hepatic.","when_to_set_to_false":"Set to false if the patient's impairment is not hepatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impairment is hepatic.","meaning":"Boolean indicating whether the patient's impairment is hepatic."} ;; "hepatic impairment"
(declare-const patient_has_finding_of_impairment_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impairment is clinically significant.","when_to_set_to_false":"Set to false if the patient's impairment is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impairment is clinically significant.","meaning":"Boolean indicating whether the patient's impairment is clinically significant."} ;; "clinically significant impairment"
(declare-const patient_has_finding_of_impairment_now@@hepatic@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic impairment that is clinically significant.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic impairment that is clinically significant, or if the hepatic impairment is not clinically significant, or if the impairment is not hepatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic impairment that is clinically significant.","meaning":"Boolean indicating whether the patient currently has hepatic impairment that is clinically significant."} ;; "clinically significant hepatic impairment"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_impairment_now@@hepatic
      patient_has_finding_of_impairment_now)
    :named REQ14_AUXILIARY0)) ;; "hepatic impairment"

(assert
(! (=> patient_has_finding_of_impairment_now@@clinically_significant
      patient_has_finding_of_impairment_now)
    :named REQ14_AUXILIARY1)) ;; "clinically significant impairment"

(assert
(! (=> patient_has_finding_of_impairment_now@@hepatic@@clinically_significant
      (and patient_has_finding_of_impairment_now@@hepatic
           patient_has_finding_of_impairment_now@@clinically_significant))
    :named REQ14_AUXILIARY2)) ;; "clinically significant hepatic impairment"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_impairment_now@@hepatic@@clinically_significant)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant hepatic impairment."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine renal clearance is recorded now in milliliters per minute.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's creatinine renal clearance measured now, in milliliters per minute."} ;; "creatinine clearance < 30 milliliters per minute"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not (< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30))
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine clearance < 30 milliliters per minute."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_taken_ranolazine_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken any ranolazine-containing product at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never taken any ranolazine-containing product at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any ranolazine-containing product.","meaning":"Boolean indicating whether the patient has ever taken any ranolazine-containing product in their history."} ;; "ranolazine"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_taken_ranolazine_containing_product_inthehistory)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior treatment with ranolazine."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_entered_into_drug_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever participated in another investigational drug clinical trial at any time in the past.","when_to_set_to_false":"Set to false if the patient has never participated in another investigational drug clinical trial at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever participated in another investigational drug clinical trial.","meaning":"Boolean indicating whether the patient has ever participated in another investigational drug clinical trial."} ;; "investigational drug study"
(declare-const patient_has_finding_of_entered_into_drug_clinical_trial_inthehistory@@temporalcontext_within_1_month_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in another investigational drug clinical trial occurred within 1 month prior to the screening visit.","when_to_set_to_false":"Set to false if the patient's participation in another investigational drug clinical trial did not occur within 1 month prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in another investigational drug clinical trial occurred within 1 month prior to the screening visit.","meaning":"Boolean indicating whether the patient's participation in another investigational drug clinical trial occurred within 1 month prior to screening."} ;; "investigational drug study within 1 month prior to screening"
(declare-const patient_has_finding_of_entered_into_device_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever participated in another investigational device clinical trial at any time in the past.","when_to_set_to_false":"Set to false if the patient has never participated in another investigational device clinical trial at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever participated in another investigational device clinical trial.","meaning":"Boolean indicating whether the patient has ever participated in another investigational device clinical trial."} ;; "investigational device study"
(declare-const patient_has_finding_of_entered_into_device_clinical_trial_inthehistory@@temporalcontext_within_1_month_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in another investigational device clinical trial occurred within 1 month prior to the screening visit.","when_to_set_to_false":"Set to false if the patient's participation in another investigational device clinical trial did not occur within 1 month prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in another investigational device clinical trial occurred within 1 month prior to the screening visit.","meaning":"Boolean indicating whether the patient's participation in another investigational device clinical trial occurred within 1 month prior to screening."} ;; "investigational device study within 1 month prior to screening"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_entered_into_drug_clinical_trial_inthehistory@@temporalcontext_within_1_month_before_screening
      patient_has_finding_of_entered_into_drug_clinical_trial_inthehistory)
    :named REQ17_AUXILIARY0)) ;; "the patient has participated in another investigational drug study within 1 month prior to screening"

(assert
(! (=> patient_has_finding_of_entered_into_device_clinical_trial_inthehistory@@temporalcontext_within_1_month_before_screening
      patient_has_finding_of_entered_into_device_clinical_trial_inthehistory)
    :named REQ17_AUXILIARY1)) ;; "the patient has participated in another investigational device study within 1 month prior to screening"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (or patient_has_finding_of_entered_into_drug_clinical_trial_inthehistory@@temporalcontext_within_1_month_before_screening
            patient_has_finding_of_entered_into_device_clinical_trial_inthehistory@@temporalcontext_within_1_month_before_screening))
    :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has participated in another investigational drug study within 1 month prior to screening) OR (the patient has participated in another investigational device study within 1 month prior to screening))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently documented as not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is currently female."} ;; "the patient is female"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Link alternate breastfeeding variable to main variable (if both are present, they should be equivalent)
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ18_AUXILIARY0)) ;; "the patient is breastfeeding" and "breastfeeding"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Exclusion: patient must NOT be both female AND breastfeeding
(assert
(! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is female) AND (the patient is breastfeeding))."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_positive_serum_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive pregnancy test performed on serum.","when_to_set_to_false":"Set to false if the patient currently does not have a positive pregnancy test performed on serum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive pregnancy test performed on serum.","meaning":"Boolean indicating whether the patient currently has a positive pregnancy test performed on serum."} ;; "positive serum pregnancy test"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a positive serum pregnancy test.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a negative serum pregnancy test or other reliable evidence.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "positive serum pregnancy test"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; A positive serum pregnancy test implies the patient is currently pregnant
(assert
(! (=> patient_has_positive_serum_pregnancy_test_now
       patient_is_pregnant_now)
   :named REQ19_AUXILIARY0)) ;; "positive serum pregnancy test"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_positive_serum_pregnancy_test_now)
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive serum pregnancy test."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cytochrome P450 3A enzyme inhibitors.","when_to_set_to_false":"Set to false if the patient is currently not exposed to cytochrome P450 3A enzyme inhibitors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cytochrome P450 3A enzyme inhibitors.","meaning":"Boolean indicating whether the patient is currently exposed to cytochrome P450 3A enzyme inhibitors."} ;; "cytochrome P450 3A"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@potent_inhibitor Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a potent inhibitor of cytochrome P450 3A enzyme.","when_to_set_to_false":"Set to false if the patient is currently exposed to a non-potent inhibitor or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inhibitor is potent.","meaning":"Boolean indicating whether the patient is currently exposed to a potent inhibitor of cytochrome P450 3A enzyme."} ;; "potent inhibitors of cytochrome P450 3A"
(declare-const patient_is_exposed_to_ketoconazole_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ketoconazole.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ketoconazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ketoconazole.","meaning":"Boolean indicating whether the patient is currently exposed to ketoconazole."} ;; "ketoconazole"
(declare-const patient_is_exposed_to_ketoconazole_now@@potent_inhibitor_of_cytochrome_p450_cyp3a_enzyme Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ketoconazole and it is being used as a potent inhibitor of cytochrome P450 3A enzyme.","when_to_set_to_false":"Set to false if the patient is currently exposed to ketoconazole but it is not being used as a potent inhibitor of cytochrome P450 3A enzyme, or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ketoconazole is being used as a potent inhibitor of cytochrome P450 3A enzyme.","meaning":"Boolean indicating whether the patient is currently exposed to ketoconazole as a potent inhibitor of cytochrome P450 3A enzyme."} ;; "ketoconazole as potent inhibitor"
(declare-const patient_is_exposed_to_itraconazole_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to itraconazole.","when_to_set_to_false":"Set to false if the patient is currently not exposed to itraconazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to itraconazole.","meaning":"Boolean indicating whether the patient is currently exposed to itraconazole."} ;; "itraconazole"
(declare-const patient_is_exposed_to_itraconazole_now@@potent_inhibitor_of_cytochrome_p450_cyp3a_enzyme Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to itraconazole and it is being used as a potent inhibitor of cytochrome P450 3A enzyme.","when_to_set_to_false":"Set to false if the patient is currently exposed to itraconazole but it is not being used as a potent inhibitor of cytochrome P450 3A enzyme, or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether itraconazole is being used as a potent inhibitor of cytochrome P450 3A enzyme.","meaning":"Boolean indicating whether the patient is currently exposed to itraconazole as a potent inhibitor of cytochrome P450 3A enzyme."} ;; "itraconazole as potent inhibitor"
(declare-const patient_is_exposed_to_clarithromycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to clarithromycin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to clarithromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to clarithromycin.","meaning":"Boolean indicating whether the patient is currently exposed to clarithromycin."} ;; "clarithromycin"
(declare-const patient_is_exposed_to_nefazodone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nefazodone.","when_to_set_to_false":"Set to false if the patient is currently not exposed to nefazodone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nefazodone.","meaning":"Boolean indicating whether the patient is currently exposed to nefazodone."} ;; "nefazodone"
(declare-const patient_is_exposed_to_nelfinavir_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nelfinavir.","when_to_set_to_false":"Set to false if the patient is currently not exposed to nelfinavir.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nelfinavir.","meaning":"Boolean indicating whether the patient is currently exposed to nelfinavir."} ;; "nelfinavir"
(declare-const patient_is_exposed_to_ritonavir_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ritonavir.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ritonavir.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ritonavir.","meaning":"Boolean indicating whether the patient is currently exposed to ritonavir."} ;; "ritonavir"
(declare-const patient_is_exposed_to_indinavir_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to indinavir.","when_to_set_to_false":"Set to false if the patient is currently not exposed to indinavir.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to indinavir.","meaning":"Boolean indicating whether the patient is currently exposed to indinavir."} ;; "indinavir"
(declare-const patient_is_exposed_to_saquinavir_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to saquinavir.","when_to_set_to_false":"Set to false if the patient is currently not exposed to saquinavir.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to saquinavir.","meaning":"Boolean indicating whether the patient is currently exposed to saquinavir."} ;; "saquinavir"
(declare-const patient_is_exposed_to_saquinavir_now@@potent_inhibitor_of_cytochrome_p450_cyp3a_enzyme Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to saquinavir and it is being used as a potent inhibitor of cytochrome P450 3A enzyme.","when_to_set_to_false":"Set to false if the patient is currently exposed to saquinavir but it is not being used as a potent inhibitor of cytochrome P450 3A enzyme, or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether saquinavir is being used as a potent inhibitor of cytochrome P450 3A enzyme.","meaning":"Boolean indicating whether the patient is currently exposed to saquinavir as a potent inhibitor of cytochrome P450 3A enzyme."} ;; "saquinavir as potent inhibitor"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Non-exhaustive examples imply umbrella term (potent inhibitors of cytochrome P450 3A)
(assert
(! (=> (or patient_is_exposed_to_ketoconazole_now@@potent_inhibitor_of_cytochrome_p450_cyp3a_enzyme
           patient_is_exposed_to_itraconazole_now@@potent_inhibitor_of_cytochrome_p450_cyp3a_enzyme
           patient_is_exposed_to_clarithromycin_now
           patient_is_exposed_to_nefazodone_now
           patient_is_exposed_to_nelfinavir_now
           patient_is_exposed_to_ritonavir_now
           patient_is_exposed_to_indinavir_now
           patient_is_exposed_to_saquinavir_now@@potent_inhibitor_of_cytochrome_p450_cyp3a_enzyme)
    patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@potent_inhibitor)
:named REQ20_AUXILIARY0)) ;; "with non-exhaustive examples (ketoconazole, itraconazole, clarithromycin, nefazodone, nelfinavir, ritonavir, indinavir, saquinavir)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@potent_inhibitor
      patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now)
:named REQ20_AUXILIARY1)) ;; "potent inhibitors of cytochrome P450 3A"

(assert
(! (=> patient_is_exposed_to_ketoconazole_now@@potent_inhibitor_of_cytochrome_p450_cyp3a_enzyme
      patient_is_exposed_to_ketoconazole_now)
:named REQ20_AUXILIARY2)) ;; "ketoconazole as potent inhibitor"

(assert
(! (=> patient_is_exposed_to_itraconazole_now@@potent_inhibitor_of_cytochrome_p450_cyp3a_enzyme
      patient_is_exposed_to_itraconazole_now)
:named REQ20_AUXILIARY3)) ;; "itraconazole as potent inhibitor"

(assert
(! (=> patient_is_exposed_to_saquinavir_now@@potent_inhibitor_of_cytochrome_p450_cyp3a_enzyme
      patient_is_exposed_to_saquinavir_now)
:named REQ20_AUXILIARY4)) ;; "saquinavir as potent inhibitor"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@potent_inhibitor)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently being treated with potent inhibitors of cytochrome P450 3A with non-exhaustive examples (ketoconazole, itraconazole, clarithromycin, nefazodone, nelfinavir, ritonavir, indinavir, saquinavir)."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_is_exposed_to_cytochrome_p450_3a_inducer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with or exposed to any cytochrome P450 3A inducer.","when_to_set_to_false":"Set to false if the patient is currently not being treated with or exposed to any cytochrome P450 3A inducer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with or exposed to any cytochrome P450 3A inducer.","meaning":"Boolean indicating whether the patient is currently being treated with or exposed to any cytochrome P450 3A inducer."} ;; "the patient is currently being treated with cytochrome P450 3A inducers"
(declare-const patient_is_exposed_to_p_glycoprotein_inducer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with or exposed to any P glycoprotein inducer.","when_to_set_to_false":"Set to false if the patient is currently not being treated with or exposed to any P glycoprotein inducer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with or exposed to any P glycoprotein inducer.","meaning":"Boolean indicating whether the patient is currently being treated with or exposed to any P glycoprotein inducer."} ;; "the patient is currently being treated with P glycoprotein inducers"
(declare-const patient_is_exposed_to_rifampicin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with or exposed to rifampicin.","when_to_set_to_false":"Set to false if the patient is currently not being treated with or exposed to rifampicin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with or exposed to rifampicin.","meaning":"Boolean indicating whether the patient is currently being treated with or exposed to rifampicin."} ;; "rifampicin"
(declare-const patient_is_exposed_to_rifampicin_now@@as_inducer_of_cytochrome_p450_3a Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with rifampicin as an inducer of cytochrome P450 3A.","when_to_set_to_false":"Set to false if the patient is currently being treated with rifampicin but not as an inducer of cytochrome P450 3A.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with rifampicin as an inducer of cytochrome P450 3A.","meaning":"Boolean indicating whether the patient is currently being treated with rifampicin as an inducer of cytochrome P450 3A."} ;; "rifampicin as cytochrome P450 3A inducer"
(declare-const patient_is_exposed_to_rifampicin_now@@as_inducer_of_p_glycoprotein Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with rifampicin as an inducer of P glycoprotein.","when_to_set_to_false":"Set to false if the patient is currently being treated with rifampicin but not as an inducer of P glycoprotein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with rifampicin as an inducer of P glycoprotein.","meaning":"Boolean indicating whether the patient is currently being treated with rifampicin as an inducer of P glycoprotein."} ;; "rifampicin as P glycoprotein inducer"
(declare-const patient_is_exposed_to_rifampin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with or exposed to rifampin.","when_to_set_to_false":"Set to false if the patient is currently not being treated with or exposed to rifampin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with or exposed to rifampin.","meaning":"Boolean indicating whether the patient is currently being treated with or exposed to rifampin."} ;; "rifampin"
(declare-const patient_is_exposed_to_rifampin_now@@as_inducer_of_cytochrome_p450_3a Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with rifampin as an inducer of cytochrome P450 3A.","when_to_set_to_false":"Set to false if the patient is currently being treated with rifampin but not as an inducer of cytochrome P450 3A.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with rifampin as an inducer of cytochrome P450 3A.","meaning":"Boolean indicating whether the patient is currently being treated with rifampin as an inducer of cytochrome P450 3A."} ;; "rifampin as cytochrome P450 3A inducer"
(declare-const patient_is_exposed_to_rifampin_now@@as_inducer_of_p_glycoprotein Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with rifampin as an inducer of P glycoprotein.","when_to_set_to_false":"Set to false if the patient is currently being treated with rifampin but not as an inducer of P glycoprotein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with rifampin as an inducer of P glycoprotein.","meaning":"Boolean indicating whether the patient is currently being treated with rifampin as an inducer of P glycoprotein."} ;; "rifampin as P glycoprotein inducer"
(declare-const patient_is_exposed_to_carbamazepine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with or exposed to carbamazepine.","when_to_set_to_false":"Set to false if the patient is currently not being treated with or exposed to carbamazepine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with or exposed to carbamazepine.","meaning":"Boolean indicating whether the patient is currently being exposed to carbamazepine."} ;; "carbamazepine"
(declare-const patient_is_exposed_to_carbamazepine_now@@as_inducer_of_cytochrome_p450_3a Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with carbamazepine as an inducer of cytochrome P450 3A.","when_to_set_to_false":"Set to false if the patient is currently being treated with carbamazepine but not as an inducer of cytochrome P450 3A.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with carbamazepine as an inducer of cytochrome P450 3A.","meaning":"Boolean indicating whether the patient is currently being exposed to carbamazepine as an inducer of cytochrome P450 3A."} ;; "carbamazepine as cytochrome P450 3A inducer"
(declare-const patient_is_exposed_to_carbamazepine_now@@as_inducer_of_p_glycoprotein Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with carbamazepine as an inducer of P glycoprotein.","when_to_set_to_false":"Set to false if the patient is currently being treated with carbamazepine but not as an inducer of P glycoprotein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with carbamazepine as an inducer of P glycoprotein.","meaning":"Boolean indicating whether the patient is currently being exposed to carbamazepine as an inducer of P glycoprotein."} ;; "carbamazepine as P glycoprotein inducer"
(declare-const patient_is_exposed_to_hypericum_perforatum_extract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with or exposed to St. John's wort (hypericum perforatum extract).","when_to_set_to_false":"Set to false if the patient is currently not being treated with or exposed to St. John's wort (hypericum perforatum extract).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with or exposed to St. John's wort (hypericum perforatum extract).","meaning":"Boolean indicating whether the patient is currently being exposed to St. John's wort (hypericum perforatum extract)."} ;; "St. John's wort"
(declare-const patient_is_exposed_to_hypericum_perforatum_extract_now@@as_inducer_of_cytochrome_p450_3a Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with St. John's wort as an inducer of cytochrome P450 3A.","when_to_set_to_false":"Set to false if the patient is currently being treated with St. John's wort but not as an inducer of cytochrome P450 3A.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with St. John's wort as an inducer of cytochrome P450 3A.","meaning":"Boolean indicating whether the patient is currently being exposed to St. John's wort as an inducer of cytochrome P450 3A."} ;; "St. John's wort as cytochrome P450 3A inducer"
(declare-const patient_is_exposed_to_hypericum_perforatum_extract_now@@as_inducer_of_p_glycoprotein Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with St. John's wort as an inducer of P glycoprotein.","when_to_set_to_false":"Set to false if the patient is currently being treated with St. John's wort but not as an inducer of P glycoprotein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with St. John's wort as an inducer of P glycoprotein.","meaning":"Boolean indicating whether the patient is currently being exposed to St. John's wort as an inducer of P glycoprotein."} ;; "St. John's wort as P glycoprotein inducer"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Non-exhaustive examples imply umbrella term: cytochrome P450 3A inducers
(assert
(! (=> (or patient_is_exposed_to_rifampicin_now@@as_inducer_of_cytochrome_p450_3a
           patient_is_exposed_to_rifampin_now@@as_inducer_of_cytochrome_p450_3a
           patient_is_exposed_to_carbamazepine_now@@as_inducer_of_cytochrome_p450_3a
           patient_is_exposed_to_hypericum_perforatum_extract_now@@as_inducer_of_cytochrome_p450_3a)
        patient_is_exposed_to_cytochrome_p450_3a_inducer_now)
:named REQ21_AUXILIARY0)) ;; "with non-exhaustive examples (rifampicin, rifampin, carbamazepine, St. John's wort)" for cytochrome P450 3A inducers

;; Non-exhaustive examples imply umbrella term: P glycoprotein inducers
(assert
(! (=> (or patient_is_exposed_to_rifampicin_now@@as_inducer_of_p_glycoprotein
           patient_is_exposed_to_rifampin_now@@as_inducer_of_p_glycoprotein
           patient_is_exposed_to_carbamazepine_now@@as_inducer_of_p_glycoprotein
           patient_is_exposed_to_hypericum_perforatum_extract_now@@as_inducer_of_p_glycoprotein)
        patient_is_exposed_to_p_glycoprotein_inducer_now)
:named REQ21_AUXILIARY1)) ;; "with non-exhaustive examples (rifampicin, rifampin, carbamazepine, St. John's wort)" for P glycoprotein inducers

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_rifampicin_now@@as_inducer_of_cytochrome_p450_3a
       patient_is_exposed_to_rifampicin_now)
:named REQ21_AUXILIARY2)) ;; "rifampicin as cytochrome P450 3A inducer"

(assert
(! (=> patient_is_exposed_to_rifampicin_now@@as_inducer_of_p_glycoprotein
       patient_is_exposed_to_rifampicin_now)
:named REQ21_AUXILIARY3)) ;; "rifampicin as P glycoprotein inducer"

(assert
(! (=> patient_is_exposed_to_rifampin_now@@as_inducer_of_cytochrome_p450_3a
       patient_is_exposed_to_rifampin_now)
:named REQ21_AUXILIARY4)) ;; "rifampin as cytochrome P450 3A inducer"

(assert
(! (=> patient_is_exposed_to_rifampin_now@@as_inducer_of_p_glycoprotein
       patient_is_exposed_to_rifampin_now)
:named REQ21_AUXILIARY5)) ;; "rifampin as P glycoprotein inducer"

(assert
(! (=> patient_is_exposed_to_carbamazepine_now@@as_inducer_of_cytochrome_p450_3a
       patient_is_exposed_to_carbamazepine_now)
:named REQ21_AUXILIARY6)) ;; "carbamazepine as cytochrome P450 3A inducer"

(assert
(! (=> patient_is_exposed_to_carbamazepine_now@@as_inducer_of_p_glycoprotein
       patient_is_exposed_to_carbamazepine_now)
:named REQ21_AUXILIARY7)) ;; "carbamazepine as P glycoprotein inducer"

(assert
(! (=> patient_is_exposed_to_hypericum_perforatum_extract_now@@as_inducer_of_cytochrome_p450_3a
       patient_is_exposed_to_hypericum_perforatum_extract_now)
:named REQ21_AUXILIARY8)) ;; "St. John's wort as cytochrome P450 3A inducer"

(assert
(! (=> patient_is_exposed_to_hypericum_perforatum_extract_now@@as_inducer_of_p_glycoprotein
       patient_is_exposed_to_hypericum_perforatum_extract_now)
:named REQ21_AUXILIARY9)) ;; "St. John's wort as P glycoprotein inducer"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not (or patient_is_exposed_to_cytochrome_p450_3a_inducer_now
            patient_is_exposed_to_p_glycoprotein_inducer_now))
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is currently being treated with cytochrome P450 3A inducers ...) OR (the patient is currently being treated with P glycoprotein inducers ...)."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_illicit_drug_use_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of illicit drug use at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of illicit drug use at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of illicit drug use.","meaning":"Boolean indicating whether the patient has ever had a history of illicit drug use."} ;; "the patient has a history of illicit drug use"

(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has ever had a history of alcohol abuse."} ;; "the patient has a history of alcohol abuse"

(declare-const patient_has_finding_of_alcohol_abuse_within_1_year_of_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of alcohol abuse that occurred within one year prior to the screening date.","when_to_set_to_false":"Set to false if the patient has no documented history of alcohol abuse within one year prior to the screening date.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse within one year prior to the screening date.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse within one year prior to the screening date."} ;; "the patient has a history of alcohol abuse within one year of screening"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; The "within 1 year of screening" variable is a subset of the general alcohol abuse history
(assert
(! (=> patient_has_finding_of_alcohol_abuse_within_1_year_of_screening
      patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ22_AUXILIARY0)) ;; "the patient has a history of alcohol abuse within one year of screening" implies "the patient has a history of alcohol abuse"

;; ===================== Constraint Assertions (REQ 22) =====================
;; Exclusion: patient must NOT have a history of illicit drug use OR history of alcohol abuse within 1 year of screening
(assert
(! (not (or patient_has_finding_of_illicit_drug_use_inthehistory
            patient_has_finding_of_alcohol_abuse_within_1_year_of_screening))
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of illicit drug use) OR (the patient has a history of alcohol abuse within one year of screening)."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "conditions"

(declare-const patient_has_finding_of_disease_condition_finding_now@@likely_to_prevent_compliance_with_study_protocol_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the investigator, the patient's condition is likely to prevent compliance with the study protocol.","when_to_set_to_false":"Set to false if, in the opinion of the investigator, the patient's condition is not likely to prevent compliance with the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the condition is likely to prevent compliance.","meaning":"Boolean indicating whether the patient's condition is, in the investigator's opinion, likely to prevent compliance with the study protocol."} ;; "likely to prevent compliance with the study protocol in the opinion of the investigator"

(declare-const patient_has_finding_of_disease_condition_finding_now@@likely_to_pose_safety_concern_if_participates_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the investigator, the patient's condition is likely to pose a safety concern if the patient participates in the study.","when_to_set_to_false":"Set to false if, in the opinion of the investigator, the patient's condition is not likely to pose a safety concern if the patient participates in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator believes the condition is likely to pose a safety concern.","meaning":"Boolean indicating whether the patient's condition is, in the investigator's opinion, likely to pose a safety concern if the patient participates in the study."} ;; "likely to pose a safety concern if the patient participates in the study in the opinion of the investigator"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@likely_to_prevent_compliance_with_study_protocol_investigator_opinion
      patient_has_finding_of_disease_condition_finding_now)
:named REQ23_AUXILIARY0)) ;; "likely to prevent compliance with the study protocol in the opinion of the investigator"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@likely_to_pose_safety_concern_if_participates_investigator_opinion
      patient_has_finding_of_disease_condition_finding_now)
:named REQ23_AUXILIARY1)) ;; "likely to pose a safety concern if the patient participates in the study in the opinion of the investigator"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@likely_to_prevent_compliance_with_study_protocol_investigator_opinion)
:named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other conditions that, in the opinion of the investigator, are likely to prevent compliance with the study protocol."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@likely_to_pose_safety_concern_if_participates_investigator_opinion)
:named REQ23_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other conditions that, in the opinion of the investigator, are likely to pose a safety concern if the patient participates in the study."
