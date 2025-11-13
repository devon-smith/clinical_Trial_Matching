;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "must be male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "must be male or female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged 35-75 years"
(declare-const patient_has_finding_of_angina_class_ii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Canada Cardiovascular Society Class II angina.","when_to_set_to_false":"Set to false if the patient currently does not have Canada Cardiovascular Society Class II angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Canada Cardiovascular Society Class II angina.","meaning":"Boolean indicating whether the patient currently has Canada Cardiovascular Society Class II angina."}  ;; "Canada Cardiovascular Society Class II angina"
(declare-const patient_has_finding_of_angina_class_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Canada Cardiovascular Society Class III angina.","when_to_set_to_false":"Set to false if the patient currently does not have Canada Cardiovascular Society Class III angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Canada Cardiovascular Society Class III angina.","meaning":"Boolean indicating whether the patient currently has Canada Cardiovascular Society Class III angina."}  ;; "Canada Cardiovascular Society Class III angina"
(declare-const patient_has_finding_of_angina_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Canada Cardiovascular Society Class IV angina.","when_to_set_to_false":"Set to false if the patient currently does not have Canada Cardiovascular Society Class IV angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Canada Cardiovascular Society Class IV angina.","meaning":"Boolean indicating whether the patient currently has Canada Cardiovascular Society Class IV angina."}  ;; "Canada Cardiovascular Society Class IV angina"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; No auxiliary assertions are needed for this requirement, as all constraints are direct.

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must be male or female"

;; Component 1: To be included, the patient must be aged 35-75 years.
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 35.0)
          (<= patient_age_value_recorded_now_in_years 75.0))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "aged 35-75 years"

;; Component 2: To be included, the patient must have angina (Canada Cardiovascular Society Class II angina, Canada Cardiovascular Society Class III angina, or Canada Cardiovascular Society Class IV angina).
(assert
  (! (or patient_has_finding_of_angina_class_ii_now
         patient_has_finding_of_angina_class_iii_now
         patient_has_finding_of_angina_class_iv_now)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have angina (Canada Cardiovascular Society Class II angina, Canada Cardiovascular Society Class III angina, or Canada Cardiovascular Society Class IV angina)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_essential_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of essential hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of essential hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of essential hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of essential hypertension."}  ;; "essential hypertension"
(declare-const patient_is_exposed_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking at least one anti-hypertensive medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any anti-hypertensive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any anti-hypertensive medication.","meaning":"Boolean indicating whether the patient is currently taking any anti-hypertensive medication."}  ;; "anti-hypertensive medication"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured average systolic blood pressure value (in mmHg) if available for now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's average systolic blood pressure measured now, in millimeters of mercury."}  ;; "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured average diastolic blood pressure value (in mmHg) if available for now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's average diastolic blood pressure measured now, in millimeters of mercury."}  ;; "diastolic blood pressure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: essential hypertension is defined as taking ≥ 1 anti-hypertensive medication
(assert
  (! (= patient_has_diagnosis_of_essential_hypertension_now
        patient_is_exposed_to_hypotensive_agent_now)
     :named REQ1_AUXILIARY0)) ;; "essential hypertension (defined as taking ≥ 1 anti-hypertensive medication)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have (essential hypertension) OR (average systolic BP ≥ 140 mmHg) OR (average diastolic BP ≥ 90 mmHg)
(assert
  (! (or patient_has_diagnosis_of_essential_hypertension_now
         (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 140.0)
         (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have essential hypertension (defined as taking ≥ 1 anti-hypertensive medication)) OR (have average systolic blood pressure ≥ 140 millimeters of mercury) OR (have average diastolic blood pressure ≥ 90 millimeters of mercury)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_ekg_left_ventricular_strain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular strain pattern.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular strain pattern.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of left ventricular strain pattern.","meaning":"Boolean indicating whether the patient currently has a left ventricular strain pattern."} ;; "have typical left ventricular strain pattern"
(declare-const patient_has_finding_of_ekg_left_ventricular_strain_now@@is_typical Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular strain pattern is typical.","when_to_set_to_false":"Set to false if the patient's left ventricular strain pattern is not typical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the left ventricular strain pattern is typical.","meaning":"Boolean indicating whether the patient's left ventricular strain pattern is typical."} ;; "typical left ventricular strain pattern"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular hypertrophy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular hypertrophy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient currently has left ventricular hypertrophy."} ;; "left ventricular hypertrophy"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now@@determined_according_to_romhilt_estes_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular hypertrophy is determined according to Romhilt-Estes criteria.","when_to_set_to_false":"Set to false if the patient's left ventricular hypertrophy is not determined according to Romhilt-Estes criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Romhilt-Estes criteria were used to determine left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient's left ventricular hypertrophy is determined according to Romhilt-Estes criteria."} ;; "ST-T changes of left ventricular hypertrophy according to Romhilt-Estes criteria"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now@@determined_according_to_framingham_heart_study_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular hypertrophy is determined according to Framingham Heart Study criteria.","when_to_set_to_false":"Set to false if the patient's left ventricular hypertrophy is not determined according to Framingham Heart Study criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Framingham Heart Study criteria were used to determine left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient's left ventricular hypertrophy is determined according to Framingham Heart Study criteria."} ;; "ST-T changes of left ventricular hypertrophy according to Framingham Heart Study criteria"
(declare-const patient_has_finding_of_inverted_t_wave_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of inverted T waves.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of inverted T waves.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of inverted T waves.","meaning":"Boolean indicating whether the patient currently has inverted T waves."} ;; "inverted T waves"
(declare-const patients_t_wave_feature_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's T wave features are abnormal now.","when_to_set_to_false":"Set to false if the patient's T wave features are not abnormal now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's T wave features are abnormal now.","meaning":"Boolean indicating whether the patient's T wave features are abnormal now."} ;; "abnormal T wave features"
(declare-const patients_t_wave_feature_is_abnormal_now@@is_biphasic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's T waves are biphasic.","when_to_set_to_false":"Set to false if the patient's T waves are not biphasic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's T waves are biphasic.","meaning":"Boolean indicating whether the patient's T waves are biphasic."} ;; "biphasic T waves"
(declare-const patients_t_wave_feature_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's T wave features are normal now.","when_to_set_to_false":"Set to false if the patient's T wave features are not normal now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's T wave features are normal now.","meaning":"Boolean indicating whether the patient's T wave features are normal now."} ;; "normal T wave features"
(declare-const patients_t_wave_feature_is_normal_now@@is_isoelectric Bool) ;; {"when_to_set_to_true":"Set to true if the patient's T waves are isoelectric.","when_to_set_to_false":"Set to false if the patient's T waves are not isoelectric.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's T waves are isoelectric.","meaning":"Boolean indicating whether the patient's T waves are isoelectric."} ;; "isoelectric T waves"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_ekg_left_ventricular_strain_now@@is_typical
         patient_has_finding_of_ekg_left_ventricular_strain_now)
     :named REQ2_AUXILIARY0)) ;; "typical left ventricular strain pattern"

(assert
  (! (=> patient_has_finding_of_left_ventricular_hypertrophy_now@@determined_according_to_romhilt_estes_criteria
         patient_has_finding_of_left_ventricular_hypertrophy_now)
     :named REQ2_AUXILIARY1)) ;; "ST-T changes of left ventricular hypertrophy according to Romhilt-Estes criteria"

(assert
  (! (=> patient_has_finding_of_left_ventricular_hypertrophy_now@@determined_according_to_framingham_heart_study_criteria
         patient_has_finding_of_left_ventricular_hypertrophy_now)
     :named REQ2_AUXILIARY2)) ;; "ST-T changes of left ventricular hypertrophy according to Framingham Heart Study criteria"

(assert
  (! (=> patients_t_wave_feature_is_abnormal_now@@is_biphasic
         patients_t_wave_feature_is_abnormal_now)
     :named REQ2_AUXILIARY3)) ;; "biphasic T waves"

(assert
  (! (=> patients_t_wave_feature_is_normal_now@@is_isoelectric
         patients_t_wave_feature_is_normal_now)
     :named REQ2_AUXILIARY4)) ;; "isoelectric T waves"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: ((ST-T changes of LVH by Romhilt-Estes AND typical LV strain) OR (ST-T changes of LVH by Framingham AND typical LV strain) OR isoelectric T waves OR inverted T waves OR biphasic T waves)
(assert
  (! (or
        (and patient_has_finding_of_left_ventricular_hypertrophy_now@@determined_according_to_romhilt_estes_criteria
             patient_has_finding_of_ekg_left_ventricular_strain_now@@is_typical)
        (and patient_has_finding_of_left_ventricular_hypertrophy_now@@determined_according_to_framingham_heart_study_criteria
             patient_has_finding_of_ekg_left_ventricular_strain_now@@is_typical)
        patients_t_wave_feature_is_normal_now@@is_isoelectric
        patient_has_finding_of_inverted_t_wave_now
        patients_t_wave_feature_is_abnormal_now@@is_biphasic)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((have ST-T changes of left ventricular hypertrophy according to Romhilt-Estes criteria AND have typical left ventricular strain pattern) OR (have ST-T changes of left ventricular hypertrophy according to Framingham Heart Study criteria AND have typical left ventricular strain pattern) OR (have isoelectric T waves) OR (have inverted T waves) OR (have biphasic T waves))"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has myocardial ischemia."} ;; "must have ST-T changes of myocardial ischemia in resting electrocardiogram"
(declare-const patient_has_finding_of_myocardial_ischemia_now@@detected_in_resting_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial ischemia is detected in the resting electrocardiogram.","when_to_set_to_false":"Set to false if the patient's myocardial ischemia is not detected in the resting electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myocardial ischemia is detected in the resting electrocardiogram.","meaning":"Boolean indicating whether the patient's myocardial ischemia is detected in the resting electrocardiogram."} ;; "must have ST-T changes of myocardial ischemia in resting electrocardiogram"
(declare-const patient_has_finding_of_st_segment_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ST segment depression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ST segment depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ST segment depression.","meaning":"Boolean indicating whether the patient currently has ST segment depression."} ;; "ST depression"
(declare-const patients_t_wave_feature_is_normal_now@@is_isoelectric Bool) ;; {"when_to_set_to_true":"Set to true if the patient's T waves are isoelectric.","when_to_set_to_false":"Set to false if the patient's T waves are not isoelectric.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's T waves are isoelectric.","meaning":"Boolean indicating whether the patient's T waves are isoelectric."} ;; "isoelectric T waves"
(declare-const patients_t_wave_feature_is_abnormal_now@@is_biphasic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's T waves are biphasic.","when_to_set_to_false":"Set to false if the patient's T waves are not biphasic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's T waves are biphasic.","meaning":"Boolean indicating whether the patient's T waves are biphasic."} ;; "biphasic T waves"
(declare-const patient_has_finding_of_negative_t_wave_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a negative T wave.","when_to_set_to_false":"Set to false if the patient currently does not have a negative T wave.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a negative T wave.","meaning":"Boolean indicating whether the patient currently has a negative T wave."} ;; "negative T waves"
(declare-const patient_has_finding_of_negative_t_wave_now@@detected_in_resting_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's negative T wave is detected in the resting electrocardiogram.","when_to_set_to_false":"Set to false if the patient's negative T wave is not detected in the resting electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's negative T wave is detected in the resting electrocardiogram.","meaning":"Boolean indicating whether the patient's negative T wave is detected in the resting electrocardiogram."} ;; "negative T waves in resting electrocardiogram"
(declare-const patient_has_finding_of_inverted_t_wave_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of inverted T waves.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of inverted T waves.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of inverted T waves.","meaning":"Boolean indicating whether the patient currently has inverted T waves."} ;; "inverted T waves"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_myocardial_ischemia_now@@detected_in_resting_electrocardiogram
         patient_has_finding_of_myocardial_ischemia_now)
     :named REQ3_AUXILIARY0)) ;; "must have ST-T changes of myocardial ischemia in resting electrocardiogram"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_negative_t_wave_now@@detected_in_resting_electrocardiogram
         patient_has_finding_of_negative_t_wave_now)
     :named REQ3_AUXILIARY1)) ;; "negative T waves in resting electrocardiogram"

;; Non-exhaustive examples imply the umbrella subclass
(assert
  (! (=> (or patient_has_finding_of_st_segment_depression_now
             patients_t_wave_feature_is_normal_now@@is_isoelectric
             patients_t_wave_feature_is_abnormal_now@@is_biphasic
             patient_has_finding_of_negative_t_wave_now
             patient_has_finding_of_inverted_t_wave_now)
         patient_has_finding_of_myocardial_ischemia_now@@detected_in_resting_electrocardiogram)
     :named REQ3_AUXILIARY2)) ;; "including ST depression, isoelectric T waves, biphasic T waves, negative T waves, or inverted T waves"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_myocardial_ischemia_now@@detected_in_resting_electrocardiogram
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have ST-T changes of myocardial ischemia in resting electrocardiogram"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_serum_potassium_measurement_value_recorded_inthehistory_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a serum potassium concentration measurement in millimoles per liter is available from any time in the patient's history prior to randomization.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's serum potassium concentration measured in millimoles per liter at any time in the history."}  ;; "serum potassium concentration < 5.0 millimoles per liter prior to randomization"
(declare-const patient_serum_potassium_measurement_value_recorded_inthehistory_withunit_millimoles_per_liter@@temporalcontext_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the serum potassium concentration measurement was taken prior to randomization.","when_to_set_to_false":"Set to false if the measurement was not taken prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken prior to randomization.","meaning":"Boolean indicating whether the serum potassium concentration measurement was taken prior to randomization."}  ;; "serum potassium concentration < 5.0 millimoles per liter prior to randomization"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_serum_potassium_measurement_value_recorded_inthehistory_withunit_millimoles_per_liter@@temporalcontext_prior_to_randomization
          (< patient_serum_potassium_measurement_value_recorded_inthehistory_withunit_millimoles_per_liter 5.0))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have serum potassium concentration < 5.0 millimoles per liter prior to randomization."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (e.g., is biologically female, within reproductive age, and not known to be infertile or postmenopausal).","when_to_set_to_false":"Set to false if the patient is currently not considered to have childbearing potential (e.g., is not biologically female, is outside reproductive age, or is known to be infertile or postmenopausal).","when_to_set_to_null":"Set to null if it cannot be determined whether the patient currently has childbearing potential due to insufficient or ambiguous information.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a woman of child-bearing potential"
(declare-const patient_has_pregnancy_test_result_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a recorded pregnancy test result.","when_to_set_to_false":"Set to false if the patient currently does not have a recorded pregnancy test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a recorded pregnancy test result.","meaning":"Boolean indicating whether the patient currently has a recorded pregnancy test result."} ;; "have a negative pregnancy test"
(declare-const patient_has_pregnancy_test_result_now@@pregnancy_test_result_is_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pregnancy test result is negative.","when_to_set_to_false":"Set to false if the patient's current pregnancy test result is not negative (i.e., positive or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pregnancy test result is negative.","meaning":"Boolean indicating whether the patient's current pregnancy test result is negative."} ;; "have a negative pregnancy test"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by a pregnancy test or clinical assessment.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as confirmed by a negative pregnancy test or clinical assessment.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, indeterminate, or not assessed.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "have a negative pregnancy test"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_pregnancy_test_result_now@@pregnancy_test_result_is_negative_now
         patient_has_pregnancy_test_result_now)
     :named REQ5_AUXILIARY0)) ;; "have a negative pregnancy test"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If the patient is a woman of child-bearing potential, she must have a negative pregnancy test
(assert
  (! (or (not patient_has_childbearing_potential_now)
         patient_has_pregnancy_test_result_now@@pregnancy_test_result_is_negative_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, if the patient is a woman of child-bearing potential, the patient must have a negative pregnancy test."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_willing_to_comply_with_scheduled_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to comply with scheduled visits.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to comply with scheduled visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with scheduled visits.","meaning":"Boolean indicating whether the patient is willing to comply with scheduled visits."}  ;; "To be included, the patient must be willing to comply with scheduled visits."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_willing_to_comply_with_scheduled_visits
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to comply with scheduled visits."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_signed_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation or confirmation that the patient has signed the informed consent form.","when_to_set_to_false":"Set to false if there is documentation or confirmation that the patient has not signed the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the informed consent form.","meaning":"Boolean indicating whether the patient has signed the informed consent form."} ;; "To be included, the patient must have signed the informed consent form."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_signed_informed_consent_form
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed the informed consent form."
