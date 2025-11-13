;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"
(declare-const patient_has_finding_of_chronic_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic stable angina.","when_to_set_to_false":"Set to false if the patient currently does not have chronic stable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic stable angina.","meaning":"Boolean indicating whether the patient currently has chronic stable angina."} // "have chronic stable angina"
(declare-const chronic_stable_angina_duration_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the duration in months of the patient's current chronic stable angina if it is known and documented.","when_to_set_to_null":"Set to null if the duration in months of the patient's current chronic stable angina is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration in months of the patient's current chronic stable angina."} // "duration ≥ 2 months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be aged ≥ 18 years"

(assert
  (! (and patient_has_finding_of_chronic_stable_angina_now
          (>= chronic_stable_angina_duration_value_recorded_now_in_months 2))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have chronic stable angina of duration ≥ 2 months"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an exercise electrocardiogram with exercise test at any time in their history, regardless of outcome or protocol.","when_to_set_to_false":"Set to false if the patient has never undergone an exercise electrocardiogram with exercise test at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an exercise electrocardiogram with exercise test.","meaning":"Boolean indicating whether the patient has ever undergone an exercise electrocardiogram with exercise test in their history."} // "exercise electrocardiogram"
(declare-const patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory@@performed_on_modified_bruce_protocol_treadmill_exercise_test Bool) ;; {"when_to_set_to_true":"Set to true if the exercise electrocardiogram with exercise test was performed on a modified Bruce protocol treadmill exercise test.","when_to_set_to_false":"Set to false if the exercise electrocardiogram with exercise test was not performed on a modified Bruce protocol treadmill exercise test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure was performed on a modified Bruce protocol treadmill exercise test.","meaning":"Boolean indicating whether the exercise electrocardiogram with exercise test was performed on a modified Bruce protocol treadmill exercise test."} // "modified Bruce protocol treadmill exercise test"
(declare-const patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory@@outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the outcome of the exercise electrocardiogram with exercise test was positive.","when_to_set_to_false":"Set to false if the outcome of the exercise electrocardiogram with exercise test was not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the outcome was positive.","meaning":"Boolean indicating whether the outcome of the exercise electrocardiogram with exercise test was positive."} // "positive exercise electrocardiogram"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value (in millimeters) of ST segment depression recorded at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's ST segment depression (in millimeters) recorded at any time in their history."} // "ST segment depression ≥ 1 millimeter"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millimeter@@measured_at_j_point_plus_0_08_seconds Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment depression measurement was taken at J point plus 0.08 seconds.","when_to_set_to_false":"Set to false if the ST segment depression measurement was not taken at J point plus 0.08 seconds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken at J point plus 0.08 seconds.","meaning":"Boolean indicating whether the ST segment depression measurement was taken at J point plus 0.08 seconds."} // "at J point plus 0.08 seconds"
(declare-const patient_has_undergone_stress_echocardiography_using_dobutamine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a dobutamine stress echocardiogram at any time in their history, regardless of outcome.","when_to_set_to_false":"Set to false if the patient has never undergone a dobutamine stress echocardiogram at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a dobutamine stress echocardiogram.","meaning":"Boolean indicating whether the patient has ever undergone a dobutamine stress echocardiogram in their history."} // "dobutamine stress echocardiogram"
(declare-const patient_has_undergone_stress_echocardiography_using_dobutamine_inthehistory@@outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the outcome of the dobutamine stress echocardiogram was positive.","when_to_set_to_false":"Set to false if the outcome of the dobutamine stress echocardiogram was not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the outcome was positive.","meaning":"Boolean indicating whether the outcome of the dobutamine stress echocardiogram was positive."} // "positive dobutamine stress echocardiogram"
(declare-const patient_has_undergone_radionuclide_myocardial_perfusion_study_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a myocardial perfusion imaging scan at any time in their history, regardless of outcome.","when_to_set_to_false":"Set to false if the patient has never undergone a myocardial perfusion imaging scan at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a myocardial perfusion imaging scan.","meaning":"Boolean indicating whether the patient has ever undergone a myocardial perfusion imaging scan in their history."} // "myocardial perfusion imaging scan"
(declare-const patient_has_undergone_radionuclide_myocardial_perfusion_study_inthehistory@@outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the outcome of the myocardial perfusion imaging scan was positive.","when_to_set_to_false":"Set to false if the outcome of the myocardial perfusion imaging scan was not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the outcome was positive.","meaning":"Boolean indicating whether the outcome of the myocardial perfusion imaging scan was positive."} // "positive myocardial perfusion imaging scan"
(declare-const patient_has_undergone_coronary_angiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a coronary angiogram at any time in their history, regardless of outcome.","when_to_set_to_false":"Set to false if the patient has never undergone a coronary angiogram at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a coronary angiogram.","meaning":"Boolean indicating whether the patient has ever undergone a coronary angiogram in their history."} // "coronary angiogram"
(declare-const patient_has_undergone_coronary_angiography_inthehistory@@outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the outcome of the coronary angiogram was positive.","when_to_set_to_false":"Set to false if the outcome of the coronary angiogram was not positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the outcome was positive.","meaning":"Boolean indicating whether the outcome of the coronary angiogram was positive."} // "positive coronary angiogram"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory@@performed_on_modified_bruce_protocol_treadmill_exercise_test
         patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "performed on modified Bruce protocol treadmill exercise test" implies "undergone exercise electrocardiogram with exercise test"

(assert
  (! (=> patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory@@outcome_is_positive
         patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "positive exercise electrocardiogram" implies "undergone exercise electrocardiogram with exercise test"

(assert
  (! (=> patient_st_segment_depression_value_recorded_inthehistory_withunit_millimeter@@measured_at_j_point_plus_0_08_seconds
         true)
     :named REQ1_AUXILIARY2)) ;; "ST segment depression measured at J point plus 0.08 seconds" is a measurement qualifier

(assert
  (! (=> patient_has_undergone_stress_echocardiography_using_dobutamine_inthehistory@@outcome_is_positive
         patient_has_undergone_stress_echocardiography_using_dobutamine_inthehistory)
     :named REQ1_AUXILIARY3)) ;; "positive dobutamine stress echocardiogram" implies "undergone dobutamine stress echocardiogram"

(assert
  (! (=> patient_has_undergone_radionuclide_myocardial_perfusion_study_inthehistory@@outcome_is_positive
         patient_has_undergone_radionuclide_myocardial_perfusion_study_inthehistory)
     :named REQ1_AUXILIARY4)) ;; "positive myocardial perfusion imaging scan" implies "undergone myocardial perfusion imaging scan"

(assert
  (! (=> patient_has_undergone_coronary_angiography_inthehistory@@outcome_is_positive
         patient_has_undergone_coronary_angiography_inthehistory)
     :named REQ1_AUXILIARY5)) ;; "positive coronary angiogram" implies "undergone coronary angiogram"

;; Definition of "positive exercise electrocardiogram" per requirement
(define-fun patient_has_positive_exercise_electrocardiogram_on_modified_bruce_protocol () Bool
  (and patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory@@performed_on_modified_bruce_protocol_treadmill_exercise_test
       patient_has_undergone_electrocardiogram_with_exercise_test_inthehistory@@outcome_is_positive
       (>= patient_st_segment_depression_value_recorded_inthehistory_withunit_millimeter 1.0)
       patient_st_segment_depression_value_recorded_inthehistory_withunit_millimeter@@measured_at_j_point_plus_0_08_seconds)) ;; "ST segment depression ≥ 1 millimeter at J point plus 0.08 seconds on modified Bruce protocol treadmill exercise test"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: At least one of the following must be true
(assert
  (! (or patient_has_positive_exercise_electrocardiogram_on_modified_bruce_protocol
         patient_has_undergone_stress_echocardiography_using_dobutamine_inthehistory@@outcome_is_positive
         patient_has_undergone_radionuclide_myocardial_perfusion_study_inthehistory@@outcome_is_positive
         patient_has_undergone_coronary_angiography_inthehistory@@outcome_is_positive)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least one of the following: positive exercise ECG (as defined), positive dobutamine stress echo, positive myocardial perfusion scan, positive coronary angiogram"
