;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 80 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 80.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 80 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_stable_angina_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of stable angina pectoris at any time prior to now.","when_to_set_to_false":"Set to false if the patient does not have a documented history of stable angina pectoris at any time prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of stable angina pectoris.","meaning":"Boolean indicating whether the patient has a history of stable angina pectoris."} ;; "history of stable angina pectoris"
(declare-const patient_has_finding_of_stable_angina_inthehistory@@duration_at_least_3_months_prior_to_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of stable angina pectoris has been present for at least 3 months prior to enrolment in the study.","when_to_set_to_false":"Set to false if the patient's history of stable angina pectoris has not been present for at least 3 months prior to enrolment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history has been present for at least 3 months prior to enrolment.","meaning":"Boolean indicating whether the history of stable angina pectoris has been present for at least 3 months prior to enrolment in the study."} ;; "history of stable angina pectoris for at least 3 months duration prior to enrolment"

(declare-const patient_has_finding_of_exercise_induced_angina_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of exertional angina pectoris at any time prior to now.","when_to_set_to_false":"Set to false if the patient does not have a documented history of exertional angina pectoris at any time prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of exertional angina pectoris.","meaning":"Boolean indicating whether the patient has a history of exertional angina pectoris."} ;; "history of exertional angina pectoris"
(declare-const patient_has_finding_of_exercise_induced_angina_inthehistory@@duration_at_least_3_months_prior_to_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of exertional angina pectoris has been present for at least 3 months prior to enrolment in the study.","when_to_set_to_false":"Set to false if the patient's history of exertional angina pectoris has not been present for at least 3 months prior to enrolment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history has been present for at least 3 months prior to enrolment.","meaning":"Boolean indicating whether the history of exertional angina pectoris has been present for at least 3 months prior to enrolment in the study."} ;; "history of exertional angina pectoris for at least 3 months duration prior to enrolment"
(declare-const patient_has_finding_of_exercise_induced_angina_inthehistory@@ccs_functional_class_ii_or_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exertional angina pectoris is of Canadian Cardiovascular Society functional class II or III.","when_to_set_to_false":"Set to false if the patient's exertional angina pectoris is not of Canadian Cardiovascular Society functional class II or III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina is of CCS functional class II or III.","meaning":"Boolean indicating whether the exertional angina pectoris is of Canadian Cardiovascular Society functional class II or III."} ;; "history of exertional angina pectoris of Canadian Cardiovascular Society functional class II or III"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable (stable angina, duration)
(assert
  (! (=> patient_has_finding_of_stable_angina_inthehistory@@duration_at_least_3_months_prior_to_enrolment
         patient_has_finding_of_stable_angina_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "history of stable angina pectoris for at least 3 months duration prior to enrolment"

;; Qualifier variable implies corresponding stem variable (exertional angina, duration)
(assert
  (! (=> patient_has_finding_of_exercise_induced_angina_inthehistory@@duration_at_least_3_months_prior_to_enrolment
         patient_has_finding_of_exercise_induced_angina_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "history of exertional angina pectoris for at least 3 months duration prior to enrolment"

;; Qualifier variable implies corresponding stem variable (exertional angina, CCS class)
(assert
  (! (=> patient_has_finding_of_exercise_induced_angina_inthehistory@@ccs_functional_class_ii_or_iii
         patient_has_finding_of_exercise_induced_angina_inthehistory)
     :named REQ1_AUXILIARY2)) ;; "history of exertional angina pectoris of Canadian Cardiovascular Society functional class II or III"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: history of stable angina pectoris for at least 3 months duration prior to enrolment
(assert
  (! patient_has_finding_of_stable_angina_inthehistory@@duration_at_least_3_months_prior_to_enrolment
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "history of stable angina pectoris for at least 3 months duration prior to enrolment"

;; Component 1: history of exertional angina pectoris of CCS functional class II or III for at least 3 months duration prior to enrolment
(assert
  (! (and patient_has_finding_of_exercise_induced_angina_inthehistory@@duration_at_least_3_months_prior_to_enrolment
          patient_has_finding_of_exercise_induced_angina_inthehistory@@ccs_functional_class_ii_or_iii)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "history of exertional angina pectoris of Canadian Cardiovascular Society functional class II or III for at least 3 months duration prior to enrolment"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_nitrate_salt_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nitrate salt (i.e., currently taking nitrate salt medication).","when_to_set_to_false":"Set to false if the patient is currently not exposed to nitrate salt.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nitrate salt.","meaning":"Boolean indicating whether the patient is currently exposed to nitrate salt."} ;; "short-acting nitrates"
(declare-const patient_is_exposed_to_nitrate_salt_now@@short_acting Bool) ;; {"when_to_set_to_true":"Set to true if the nitrate salt the patient is currently exposed to is short-acting.","when_to_set_to_false":"Set to false if the nitrate salt the patient is currently exposed to is not short-acting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nitrate salt is short-acting.","meaning":"Boolean indicating whether the nitrate salt the patient is currently exposed to is short-acting."} ;; "short-acting nitrates"
(declare-const patient_is_receiving_treatment_with_antianginal_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with any antianginal medication.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment with any antianginal medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with any antianginal medication.","meaning":"Boolean indicating whether the patient is currently receiving treatment with any antianginal medication."} ;; "antianginal medication"
(declare-const patient_is_receiving_treatment_with_antianginal_medication_now@@other_than_short_acting_nitrates Bool) ;; {"when_to_set_to_true":"Set to true if the antianginal medication the patient is currently receiving is other than short-acting nitrates.","when_to_set_to_false":"Set to false if the antianginal medication the patient is currently receiving is short-acting nitrates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antianginal medication the patient is currently receiving is other than short-acting nitrates.","meaning":"Boolean indicating whether the antianginal medication the patient is currently receiving is other than short-acting nitrates."} ;; "antianginal medication other than short-acting nitrates"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_nitrate_salt_now@@short_acting
         patient_is_exposed_to_nitrate_salt_now)
     :named REQ2_AUXILIARY0)) ;; "short-acting nitrates" qualifier implies nitrate salt exposure

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_receiving_treatment_with_antianginal_medication_now@@other_than_short_acting_nitrates
         patient_is_receiving_treatment_with_antianginal_medication_now)
     :named REQ2_AUXILIARY1)) ;; "antianginal medication other than short-acting nitrates" qualifier implies antianginal medication exposure

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must NOT currently be receiving treatment with antianginal medication other than treatment with short-acting nitrates.
(assert
  (! (not patient_is_receiving_treatment_with_antianginal_medication_now@@other_than_short_acting_nitrates)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT currently be receiving treatment with antianginal medication other than treatment with short-acting nitrates"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a treadmill cardiovascular stress test at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a treadmill cardiovascular stress test at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a treadmill cardiovascular stress test.","meaning":"Boolean indicating whether the patient has ever undergone a treadmill cardiovascular stress test using a treadmill in the past."} ;; "treadmill exercise tests"
(declare-const patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory@@performed_between_visit_2_and_visit_3 Bool) ;; {"when_to_set_to_true":"Set to true if the treadmill cardiovascular stress test was performed between visit 2 and visit 3.","when_to_set_to_false":"Set to false if the treadmill cardiovascular stress test was not performed between visit 2 and visit 3.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the treadmill cardiovascular stress test was performed between visit 2 and visit 3.","meaning":"Boolean indicating whether the treadmill cardiovascular stress test was performed between visit 2 and visit 3."} ;; "performed between visit 2 and visit 3"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt Real) ;; {"when_to_set_to_value":"Set to the measured value (in millivolts) of ST-segment depression recorded at any time in the past.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's ST-segment depression (in millivolts) recorded at any time in the past."} ;; "ST-segment depression"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt@@horizontal_morphology Bool) ;; {"when_to_set_to_true":"Set to true if the ST-segment depression measurement is of horizontal morphology.","when_to_set_to_false":"Set to false if the ST-segment depression measurement is not of horizontal morphology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST-segment depression measurement is of horizontal morphology.","meaning":"Boolean indicating whether the ST-segment depression measurement is of horizontal morphology."} ;; "horizontal ST-segment depression"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt@@down_sloping_morphology Bool) ;; {"when_to_set_to_true":"Set to true if the ST-segment depression measurement is of down sloping morphology.","when_to_set_to_false":"Set to false if the ST-segment depression measurement is not of down sloping morphology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST-segment depression measurement is of down sloping morphology.","meaning":"Boolean indicating whether the ST-segment depression measurement is of down sloping morphology."} ;; "down sloping ST-segment depression"
(declare-const patient_symptom_limited_exercise_duration_value_recorded_between_visit_2_and_visit_3_withunit_minutes_1 Real) ;; {"when_to_set_to_value":"Set to the measured value (in minutes) of the patient's symptom-limited exercise duration for the first treadmill exercise test performed between visit 2 and visit 3.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's symptom-limited exercise duration (in minutes) for the first treadmill exercise test performed between visit 2 and visit 3."} ;; "symptom-limited exercise duration for test 1"
(declare-const patient_symptom_limited_exercise_duration_value_recorded_between_visit_2_and_visit_3_withunit_minutes_2 Real) ;; {"when_to_set_to_value":"Set to the measured value (in minutes) of the patient's symptom-limited exercise duration for the second treadmill exercise test performed between visit 2 and visit 3.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's symptom-limited exercise duration (in minutes) for the second treadmill exercise test performed between visit 2 and visit 3."} ;; "symptom-limited exercise duration for test 2"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_1 Real) ;; {"when_to_set_to_value":"Set to the measured value (in millivolts) of ST-segment depression for the first treadmill exercise test performed between visit 2 and visit 3.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the ST-segment depression (in millivolts) for the first treadmill exercise test performed between visit 2 and visit 3."} ;; "ST-segment depression for test 1"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_2 Real) ;; {"when_to_set_to_value":"Set to the measured value (in millivolts) of ST-segment depression for the second treadmill exercise test performed between visit 2 and visit 3.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the ST-segment depression (in millivolts) for the second treadmill exercise test performed between visit 2 and visit 3."} ;; "ST-segment depression for test 2"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_1@@horizontal_morphology Bool) ;; {"when_to_set_to_true":"Set to true if the ST-segment depression measurement for test 1 is of horizontal morphology.","when_to_set_to_false":"Set to false if the ST-segment depression measurement for test 1 is not of horizontal morphology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST-segment depression measurement for test 1 is of horizontal morphology.","meaning":"Boolean indicating whether the ST-segment depression measurement for test 1 is of horizontal morphology."} ;; "horizontal ST-segment depression for test 1"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_1@@down_sloping_morphology Bool) ;; {"when_to_set_to_true":"Set to true if the ST-segment depression measurement for test 1 is of down sloping morphology.","when_to_set_to_false":"Set to false if the ST-segment depression measurement for test 1 is not of down sloping morphology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST-segment depression measurement for test 1 is of down sloping morphology.","meaning":"Boolean indicating whether the ST-segment depression measurement for test 1 is of down sloping morphology."} ;; "down sloping ST-segment depression for test 1"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_2@@horizontal_morphology Bool) ;; {"when_to_set_to_true":"Set to true if the ST-segment depression measurement for test 2 is of horizontal morphology.","when_to_set_to_false":"Set to false if the ST-segment depression measurement for test 2 is not of horizontal morphology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST-segment depression measurement for test 2 is of horizontal morphology.","meaning":"Boolean indicating whether the ST-segment depression measurement for test 2 is of horizontal morphology."} ;; "horizontal ST-segment depression for test 2"
(declare-const patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_2@@down_sloping_morphology Bool) ;; {"when_to_set_to_true":"Set to true if the ST-segment depression measurement for test 2 is of down sloping morphology.","when_to_set_to_false":"Set to false if the ST-segment depression measurement for test 2 is not of down sloping morphology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST-segment depression measurement for test 2 is of down sloping morphology.","meaning":"Boolean indicating whether the ST-segment depression measurement for test 2 is of down sloping morphology."} ;; "down sloping ST-segment depression for test 2"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory@@performed_between_visit_2_and_visit_3
         patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "performed between visit 2 and visit 3"

;; Qualifier variables for ST-segment depression imply corresponding stem variables for each test
(assert
  (! (=> patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_1@@horizontal_morphology
         true)
     :named REQ3_AUXILIARY1)) ;; "horizontal ST-segment depression for test 1"
(assert
  (! (=> patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_1@@down_sloping_morphology
         true)
     :named REQ3_AUXILIARY2)) ;; "down sloping ST-segment depression for test 1"
(assert
  (! (=> patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_2@@horizontal_morphology
         true)
     :named REQ3_AUXILIARY3)) ;; "horizontal ST-segment depression for test 2"
(assert
  (! (=> patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_2@@down_sloping_morphology
         true)
     :named REQ3_AUXILIARY4)) ;; "down sloping ST-segment depression for test 2"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Two treadmill exercise tests performed between visit 2 and visit 3, each demonstrating either horizontal ST-segment depression ≥ 0.1 mV OR down sloping ST-segment depression ≥ 0.1 mV
(assert
  (! (and
        patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory@@performed_between_visit_2_and_visit_3
        ;; Test 1: horizontal or down sloping ST-segment depression ≥ 0.1 mV
        (or
          (and patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_1@@horizontal_morphology
               (>= patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_1 0.1))
          (and patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_1@@down_sloping_morphology
               (>= patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_1 0.1)))
        ;; Test 2: horizontal or down sloping ST-segment depression ≥ 0.1 mV
        (or
          (and patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_2@@horizontal_morphology
               (>= patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_2 0.1))
          (and patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_2@@down_sloping_morphology
               (>= patient_st_segment_depression_value_recorded_inthehistory_withunit_millivolt_2 0.1)))
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "two treadmill exercise tests performed between visit 2 and visit 3, each demonstrating either horizontal ST-segment depression ≥ 0.1 millivolt OR down sloping ST-segment depression ≥ 0.1 millivolt"

;; Component 1: The difference in symptom-limited exercise duration between these two tests must not exceed 20 percent
(assert
  (! (<=
        (abs
          (/ (- patient_symptom_limited_exercise_duration_value_recorded_between_visit_2_and_visit_3_withunit_minutes_1
                patient_symptom_limited_exercise_duration_value_recorded_between_visit_2_and_visit_3_withunit_minutes_2)
             (ite (> patient_symptom_limited_exercise_duration_value_recorded_between_visit_2_and_visit_3_withunit_minutes_1
                     patient_symptom_limited_exercise_duration_value_recorded_between_visit_2_and_visit_3_withunit_minutes_2)
                  patient_symptom_limited_exercise_duration_value_recorded_between_visit_2_and_visit_3_withunit_minutes_1
                  patient_symptom_limited_exercise_duration_value_recorded_between_visit_2_and_visit_3_withunit_minutes_2)))
        0.20)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the difference in symptom-limited exercise duration between these two tests must not exceed 20 percent"

;; Helper function for absolute value (since SMT-LIB does not have abs for Real natively)
(define-fun abs ((x Real)) Real
  (ite (>= x 0.0) x (- 0.0 x))) ;; "absolute value helper for difference calculation"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_treadmill_exercise_duration_value_recorded_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the value (in minutes) of the total treadmill exercise duration performed by the patient during a standard Bruce protocol, if available.","when_to_set_to_null":"Set to null if the total treadmill exercise duration in minutes is unknown, not documented, or cannot be determined for the patient during a standard Bruce protocol.","meaning":"Numeric value representing the total treadmill exercise duration in minutes for the patient during a standard Bruce protocol."} ;; "total treadmill exercise duration > 3 minutes (stage 2 or above on a standard Bruce protocol)"
(declare-const patient_treadmill_exercise_duration_value_recorded_withunit_minutes@@stage_2_or_above_on_standard_bruce_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the treadmill exercise duration value corresponds to the patient reaching stage 2 or above on a standard Bruce protocol.","when_to_set_to_false":"Set to false if the treadmill exercise duration value does not correspond to the patient reaching stage 2 or above on a standard Bruce protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the treadmill exercise duration value corresponds to reaching stage 2 or above on a standard Bruce protocol.","meaning":"Boolean indicating whether the treadmill exercise duration value corresponds to reaching stage 2 or above on a standard Bruce protocol."} ;; "stage 2 or above on a standard Bruce protocol"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_treadmill_exercise_duration_value_recorded_withunit_minutes@@stage_2_or_above_on_standard_bruce_protocol
         (> patient_treadmill_exercise_duration_value_recorded_withunit_minutes 3.0))
     :named REQ4_AUXILIARY0)) ;; "stage 2 or above on a standard Bruce protocol" implies "total treadmill exercise duration > 3 minutes"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have total treadmill exercise duration > 3 minutes (stage 2 or above on a standard Bruce protocol).
(assert
  (! (and (> patient_treadmill_exercise_duration_value_recorded_withunit_minutes 3.0)
          patient_treadmill_exercise_duration_value_recorded_withunit_minutes@@stage_2_or_above_on_standard_bruce_protocol)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "total treadmill exercise duration > 3 minutes (stage 2 or above on a standard Bruce protocol)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_coronary_artery_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of coronary artery disease at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of coronary artery disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of coronary artery disease.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of coronary artery disease in their history."} ;; "the patient must have coronary artery disease"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with coronary artery disease (coronary arteriosclerosis) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with coronary artery disease (coronary arteriosclerosis) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with coronary artery disease (coronary arteriosclerosis).","meaning":"Boolean indicating whether the patient has ever been diagnosed with coronary artery disease (coronary arteriosclerosis) in their history."} ;; "the patient must have coronary artery disease"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in their history."} ;; "history of proven myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_proven_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of proven myocardial infarction at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a history of proven myocardial infarction at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of proven myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a history of proven myocardial infarction in their history."} ;; "history of proven myocardial infarction"
(declare-const patient_has_undergone_coronary_angiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary angiography at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone coronary angiography at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary angiography.","meaning":"Boolean indicating whether the patient has ever undergone coronary angiography in their history."} ;; "coronary angiography"
(declare-const patient_coronary_artery_luminal_diameter_reduction_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value in percent if a reduction in luminal diameter of a coronary artery or its primary branch is recorded at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the percentage reduction in luminal diameter of a coronary artery or its primary branch, recorded at any time in the patient's history."} ;; "≥ 50% reduction in luminal diameter of one or more coronary arteries or their primary branches"
(declare-const patient_vessel_lumen_diameter_value_recorded_inthehistory_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a luminal diameter measurement of a coronary artery or its primary branch is recorded at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the measured luminal diameter (in millimeters) of a coronary artery or its primary branch, recorded at any time in the patient's history."} ;; "luminal diameter"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; A diagnosis of coronary arteriosclerosis implies a finding of coronary artery disease
(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory
         patient_has_finding_of_coronary_artery_disease_inthehistory)
     :named REQ5_AUXILIARY0)) ;; "coronary artery disease" includes diagnosis of coronary arteriosclerosis

;; A history of proven myocardial infarction implies a finding of myocardial infarction
(assert
  (! (=> patient_has_finding_of_myocardial_infarction_proven_inthehistory
         patient_has_finding_of_myocardial_infarction_inthehistory)
     :named REQ5_AUXILIARY1)) ;; "proven myocardial infarction" is a subset of "myocardial infarction"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have coronary artery disease (diagnosis or clinical finding)
(assert
  (! patient_has_finding_of_coronary_artery_disease_inthehistory
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have coronary artery disease"
