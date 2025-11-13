;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years AND age ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≤ 80 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown or not documented.","meaning":"Indicates whether the patient's current recorded sex is female."} // "female"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or not documented.","meaning":"Indicates whether the patient currently has childbearing potential."} // "of childbearing potential"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant (i.e., has a negative pregnancy test).","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or not documented.","meaning":"Indicates whether the patient is currently pregnant."} // "have a negative pregnancy test"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or not documented.","meaning":"Indicates whether the patient is currently breastfeeding."} // "NOT be breastfeeding"
(declare-const patient_is_established_on_method_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently established on a method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not established on a method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently established on a method of contraception.","meaning":"Boolean indicating whether the patient is currently established on a method of contraception."} // "be established on a method of contraception"
(declare-const patient_is_established_on_method_of_contraception_now@@acceptable_in_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the method of contraception the patient is established on is considered acceptable in the investigator's opinion.","when_to_set_to_false":"Set to false if the method of contraception the patient is established on is not considered acceptable in the investigator's opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the method of contraception is considered acceptable in the investigator's opinion.","meaning":"Boolean indicating whether the method of contraception is considered acceptable in the investigator's opinion."} // "acceptable in investigator's opinion"
(declare-const patient_agrees_to_remain_on_established_method_of_contraception_through_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to remain on the established method of contraception throughout participation in the study.","when_to_set_to_false":"Set to false if the patient does not agree to remain on the established method of contraception throughout participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to remain on the established method of contraception throughout participation in the study.","meaning":"Boolean indicating whether the patient agrees to remain on the established method of contraception throughout participation in the study."} // "agree to remain on the established method of contraception through participation in the study"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_established_on_method_of_contraception_now@@acceptable_in_investigator_opinion
         patient_is_established_on_method_of_contraception_now)
     :named REQ1_AUXILIARY0)) ;; "acceptable in investigator's opinion"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: If female AND of childbearing potential, must have a negative pregnancy test
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (not patient_is_pregnant_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a negative pregnancy test"

;; Component 1: If female AND of childbearing potential, must NOT be breastfeeding
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (not patient_is_breastfeeding_now))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must NOT be breastfeeding"

;; Component 2: If female AND of childbearing potential, must be established on a method of contraception acceptable to investigator
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_is_established_on_method_of_contraception_now@@acceptable_in_investigator_opinion)
     :named REQ1_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be established on a method of contraception (acceptable in investigator's opinion)"

;; Component 3: If female AND of childbearing potential, must agree to remain on established method of contraception through study
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_agrees_to_remain_on_established_method_of_contraception_through_study_participation)
     :named REQ1_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must agree to remain on the established method of contraception through participation in the study"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with coronary artery disease at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with coronary artery disease at any time prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with coronary artery disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with coronary artery disease."} // "evidence of coronary artery disease"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@well_documented_medical_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of coronary artery disease is supported by well-documented medical records.","when_to_set_to_false":"Set to false if the patient's history of coronary artery disease is not supported by well-documented medical records.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of coronary artery disease is well-documented.","meaning":"Boolean indicating whether the patient's history of coronary artery disease is well-documented."} // "well-documented medical history of significant coronary artery disease"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@confirmed_by_noninvasive_methods Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of coronary artery disease is confirmed by noninvasive methods.","when_to_set_to_false":"Set to false if the patient's history of coronary artery disease is not confirmed by noninvasive methods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of coronary artery disease is confirmed by noninvasive methods.","meaning":"Boolean indicating whether the patient's history of coronary artery disease is confirmed by noninvasive methods."} // "with noninvasive confirmation"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@confirmed_by_angiographic_methods Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of coronary artery disease is confirmed by angiographic methods.","when_to_set_to_false":"Set to false if the patient's history of coronary artery disease is not confirmed by angiographic methods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of coronary artery disease is confirmed by angiographic methods.","meaning":"Boolean indicating whether the patient's history of coronary artery disease is confirmed by angiographic methods."} // "with angiographic confirmation"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time prior to enrollment.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any time prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction."} // "medical history of myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@well_documented_medical_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of myocardial infarction is supported by well-documented medical records.","when_to_set_to_false":"Set to false if the patient's history of myocardial infarction is not supported by well-documented medical records.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of myocardial infarction is well-documented.","meaning":"Boolean indicating whether the patient's history of myocardial infarction is well-documented."} // "well-documented medical history of myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@duration_greater_than_3_months_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction occurred more than 3 months prior to enrollment.","when_to_set_to_false":"Set to false if the patient's myocardial infarction occurred 3 months or less prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction occurred more than 3 months prior to enrollment.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred more than 3 months prior to enrollment."} // "duration > 3 months prior to the enrollment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@well_documented_medical_history
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "well-documented medical history of significant coronary artery disease"

(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@confirmed_by_noninvasive_methods
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "with noninvasive confirmation"

(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@confirmed_by_angiographic_methods
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ2_AUXILIARY2)) ;; "with angiographic confirmation"

(assert
  (! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@well_documented_medical_history
         patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ2_AUXILIARY3)) ;; "well-documented medical history of myocardial infarction"

(assert
  (! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@duration_greater_than_3_months_prior_to_enrollment
         patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ2_AUXILIARY4)) ;; "duration > 3 months prior to the enrollment"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have EITHER
;; (a well-documented medical history (with duration > 3 months prior to the enrollment) of myocardial infarction)
;; OR (a well-documented medical history of significant coronary artery disease with noninvasive confirmation)
;; OR (a well-documented medical history of significant coronary artery disease with angiographic confirmation)
(assert
  (! (or
        (and patient_has_diagnosis_of_myocardial_infarction_inthehistory@@well_documented_medical_history
             patient_has_diagnosis_of_myocardial_infarction_inthehistory@@duration_greater_than_3_months_prior_to_enrollment)
        (and patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@well_documented_medical_history
             patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@confirmed_by_noninvasive_methods)
        (and patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@well_documented_medical_history
             patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@confirmed_by_angiographic_methods)
     )
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "evidence of coronary artery disease that consists of (a well-documented medical history (with duration > 3 months prior to the enrollment) of myocardial infarction) OR (a well-documented medical history of significant coronary artery disease with noninvasive confirmation) OR (a well-documented medical history of significant coronary artery disease with angiographic confirmation)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_angina_pectoris_now@@supported_by_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris and the diagnosis is supported by symptoms.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris but the diagnosis is not supported by symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether symptoms support the diagnosis of angina pectoris.","meaning":"Boolean indicating whether the patient's angina pectoris diagnosis is supported by symptoms."} // "symptoms that support the diagnosis of chronic angina"
(declare-const patient_has_history_of_abnormal_exercise_response_limited_by_angina Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of an abnormal exercise response that is limited by angina.","when_to_set_to_false":"Set to false if the patient does not have a history of an abnormal exercise response limited by angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of an abnormal exercise response limited by angina.","meaning":"Boolean indicating whether the patient has a history of an abnormal exercise response limited by angina."} // "a history of an abnormal exercise response limited by angina"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of abnormal electrocardiogram changes.","when_to_set_to_false":"Set to false if the patient does not have a history of abnormal electrocardiogram changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of abnormal electrocardiogram changes.","meaning":"Boolean indicating whether the patient has a history of abnormal electrocardiogram changes."} // "a history of electrocardiograph changes"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have (symptoms that support the diagnosis of chronic angina) OR (a history of an abnormal exercise response limited by angina) OR (a history of electrocardiograph changes).
(assert
  (! (or patient_has_finding_of_angina_pectoris_now@@supported_by_symptoms
         patient_has_history_of_abnormal_exercise_response_limited_by_angina
         patient_has_finding_of_electrocardiogram_abnormal_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (symptoms that support the diagnosis of chronic angina) OR (a history of an abnormal exercise response limited by angina) OR (a history of electrocardiograph changes)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_moderate_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have moderate angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate angina pectoris.","meaning":"Boolean indicating whether the patient currently has moderate angina pectoris."} // "the patient must have moderate angina pectoris"
(declare-const patient_has_finding_of_moderate_angina_pectoris_now@@classified_as_ccs_class_ii_or_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current moderate angina pectoris is classified as Class II or Class III by the Canadian Cardiovascular Society Classification System.","when_to_set_to_false":"Set to false if the patient's current moderate angina pectoris is not classified as Class II or Class III by the Canadian Cardiovascular Society Classification System.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current moderate angina pectoris is classified as Class II or Class III by the Canadian Cardiovascular Society Classification System.","meaning":"Boolean indicating whether the patient's current moderate angina pectoris is classified as Class II or Class III by the Canadian Cardiovascular Society Classification System."} // "Class II OR Class III, Grading of Angina Pectoris by the Canadian Cardiovascular Society Classification System"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_moderate_angina_pectoris_now@@classified_as_ccs_class_ii_or_iii
         patient_has_finding_of_moderate_angina_pectoris_now)
     :named REQ4_AUXILIARY0)) ;; "moderate angina pectoris (Class II OR Class III, Grading of Angina Pectoris by the Canadian Cardiovascular Society Classification System)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_moderate_angina_pectoris_now@@classified_as_ccs_class_ii_or_iii
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have moderate angina pectoris (Class II OR Class III, Grading of Angina Pectoris by the Canadian Cardiovascular Society Classification System)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_naive_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a naive patient (has not previously undergone the relevant intervention or test as defined by the study protocol).","when_to_set_to_false":"Set to false if the patient is not a naive patient (has previously undergone the relevant intervention or test as defined by the study protocol).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a naive patient.","meaning":"Boolean indicating whether the patient is currently a naive patient."} // "a naive patient"
(declare-const patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a cardiovascular stress test using a treadmill (exercise treadmill test) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a cardiovascular stress test using a treadmill (exercise treadmill test) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a cardiovascular stress test using a treadmill (exercise treadmill test).","meaning":"Boolean indicating whether the patient has ever undergone a cardiovascular stress test using a treadmill (exercise treadmill test) at any time in the past."} // "exercise treadmill test"
(declare-const patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory@@performed_on_standard_bruce_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a cardiovascular stress test using a treadmill (exercise treadmill test) at any time in the past and the test was performed on the standard Bruce protocol.","when_to_set_to_false":"Set to false if the patient has undergone a cardiovascular stress test using a treadmill (exercise treadmill test) at any time in the past but the test was not performed on the standard Bruce protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the test was performed on the standard Bruce protocol.","meaning":"Boolean indicating whether the cardiovascular stress test using treadmill was performed on the standard Bruce protocol."} // "exercise treadmill test on standard Bruce protocol"
(declare-const total_exercise_duration_value_recorded_in_exercise_treadmill_test_on_standard_bruce_protocol_in_minutes Real) ;; {"when_to_set_to_value":"Set to the value of total exercise duration in minutes recorded during the patient's exercise treadmill test performed on the standard Bruce protocol.","when_to_set_to_null":"Set to null if the total exercise duration in minutes is unknown, not documented, or cannot be determined for the exercise treadmill test performed on the standard Bruce protocol.","meaning":"Numeric value of total exercise duration in minutes during exercise treadmill test on standard Bruce protocol."} // "total exercise duration is ≥ 3 minutes AND total exercise duration is ≤ 7 minutes in exercise treadmill test on standard Bruce protocol"
(declare-const total_exercise_duration_value_recorded_in_exercise_treadmill_test_on_standard_bruce_protocol_on_day_0_in_minutes Real) ;; {"when_to_set_to_value":"Set to the value of total exercise duration in minutes recorded during the patient's exercise treadmill test performed on the standard Bruce protocol on day 0.","when_to_set_to_null":"Set to null if the total exercise duration in minutes is unknown, not documented, or cannot be determined for the exercise treadmill test performed on the standard Bruce protocol on day 0.","meaning":"Numeric value of total exercise duration in minutes during exercise treadmill test on standard Bruce protocol on day 0."} // "total exercise duration on day 0"
(declare-const total_exercise_duration_value_recorded_in_exercise_treadmill_test_on_standard_bruce_protocol_on_day_minus_7_in_minutes Real) ;; {"when_to_set_to_value":"Set to the value of total exercise duration in minutes recorded during the patient's exercise treadmill test performed on the standard Bruce protocol on day -7.","when_to_set_to_null":"Set to null if the total exercise duration in minutes is unknown, not documented, or cannot be determined for the exercise treadmill test performed on the standard Bruce protocol on day -7.","meaning":"Numeric value of total exercise duration in minutes during exercise treadmill test on standard Bruce protocol on day -7."} // "total exercise duration on day -7"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory@@performed_on_standard_bruce_protocol
         patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory)
     :named REQ5_AUXILIARY0)) ;; "performed on standard Bruce protocol"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: (a naive patient) OR ((total exercise duration ≥ 3 AND ≤ 7 min in exercise treadmill test on standard Bruce protocol) AND (difference between day -7 and day 0 ≤ 15%))
(assert
  (! (or
        patient_is_naive_patient_now
        (and
          (and
            (>= total_exercise_duration_value_recorded_in_exercise_treadmill_test_on_standard_bruce_protocol_in_minutes 3.0)
            (<= total_exercise_duration_value_recorded_in_exercise_treadmill_test_on_standard_bruce_protocol_in_minutes 7.0)
            patient_has_undergone_cardiovascular_stress_test_using_treadmill_inthehistory@@performed_on_standard_bruce_protocol
          )
          (<=
            (abs
              (/ (- total_exercise_duration_value_recorded_in_exercise_treadmill_test_on_standard_bruce_protocol_on_day_0_in_minutes
                    total_exercise_duration_value_recorded_in_exercise_treadmill_test_on_standard_bruce_protocol_on_day_minus_7_in_minutes)
                 total_exercise_duration_value_recorded_in_exercise_treadmill_test_on_standard_bruce_protocol_on_day_minus_7_in_minutes))
            0.15)
        )
     )
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a naive patient OR ((total exercise duration is ≥ 3 minutes AND ≤ 7 minutes in exercise treadmill test on standard Bruce protocol) AND (difference in total exercise duration between day -7 and day 0 is ≤ 15%))"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_can_undergo_antianginal_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to discontinue all antianginal therapy regimens.","when_to_set_to_false":"Set to false if the patient is currently not able to discontinue all antianginal therapy regimens.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to discontinue all antianginal therapy regimens.","meaning":"Boolean indicating whether the patient is currently able to discontinue all antianginal therapy regimens."} // "able to discontinue all anti-angina regimens"
(declare-const patient_can_undergo_antianginal_therapy_now@@except_short_acting_nitroglycerin_and_one_beta_blocker_or_one_calcium_channel_blocker Bool) ;; {"when_to_set_to_true":"Set to true if the ability to discontinue all antianginal therapy regimens excludes short-acting nitroglycerin and (one beta-blocker OR one calcium channel blocker).","when_to_set_to_false":"Set to false if the ability to discontinue all antianginal therapy regimens does not exclude these exceptions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether these exceptions apply.","meaning":"Boolean indicating that the ability to discontinue all antianginal therapy regimens excludes short-acting nitroglycerin and (one beta-blocker OR one calcium channel blocker)."} // "except short-acting nitroglycerin AND (one beta-blocker OR one calcium channel blocker)"
(declare-const patient_can_undergo_oral_anticoagulant_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to discontinue all oral anticoagulant drugs.","when_to_set_to_false":"Set to false if the patient is currently not able to discontinue all oral anticoagulant drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to discontinue all oral anticoagulant drugs.","meaning":"Boolean indicating whether the patient is currently able to discontinue all oral anticoagulant drugs."} // "able to discontinue oral anticoagulant drugs"
(declare-const patient_can_undergo_oral_anticoagulant_drugs_now@@used_prior_to_initial_visit Bool) ;; {"when_to_set_to_true":"Set to true if the oral anticoagulant drugs to be discontinued were used prior to this initial visit.","when_to_set_to_false":"Set to false if the oral anticoagulant drugs to be discontinued were not used prior to this initial visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the oral anticoagulant drugs to be discontinued were used prior to this initial visit.","meaning":"Boolean indicating that the oral anticoagulant drugs to be discontinued were used prior to this initial visit."} // "oral anticoagulant drugs which were used prior to this initial visit"
(declare-const patient_can_undergo_warfarin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to discontinue warfarin.","when_to_set_to_false":"Set to false if the patient is currently not able to discontinue warfarin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to discontinue warfarin.","meaning":"Boolean indicating whether the patient is currently able to discontinue warfarin."} // "able to discontinue warfarin"
(declare-const patient_can_undergo_warfarin_now@@used_prior_to_initial_visit Bool) ;; {"when_to_set_to_true":"Set to true if the warfarin to be discontinued was used prior to this initial visit.","when_to_set_to_false":"Set to false if the warfarin to be discontinued was not used prior to this initial visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the warfarin to be discontinued was used prior to this initial visit.","meaning":"Boolean indicating that the warfarin to be discontinued was used prior to this initial visit."} // "warfarin which was used prior to this initial visit"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for antianginal therapy
(assert
  (! (=> patient_can_undergo_antianginal_therapy_now@@except_short_acting_nitroglycerin_and_one_beta_blocker_or_one_calcium_channel_blocker
         patient_can_undergo_antianginal_therapy_now)
     :named REQ6_AUXILIARY0)) ;; "except short-acting nitroglycerin AND (one beta-blocker OR one calcium channel blocker)"

;; Qualifier variable implies corresponding stem variable for oral anticoagulant drugs
(assert
  (! (=> patient_can_undergo_oral_anticoagulant_drugs_now@@used_prior_to_initial_visit
         patient_can_undergo_oral_anticoagulant_drugs_now)
     :named REQ6_AUXILIARY1)) ;; "oral anticoagulant drugs which were used prior to this initial visit"

;; Qualifier variable implies corresponding stem variable for warfarin
(assert
  (! (=> patient_can_undergo_warfarin_now@@used_prior_to_initial_visit
         patient_can_undergo_warfarin_now)
     :named REQ6_AUXILIARY2)) ;; "warfarin which was used prior to this initial visit"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Patient must be able to discontinue all anti-angina regimens (except short-acting nitroglycerin AND (one beta-blocker OR one calcium channel blocker))
(assert
  (! patient_can_undergo_antianginal_therapy_now@@except_short_acting_nitroglycerin_and_one_beta_blocker_or_one_calcium_channel_blocker
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "able to discontinue all anti-angina regimens (except short-acting nitroglycerin AND (one beta-blocker OR one calcium channel blocker))"

;; Component 1: Patient must be able to discontinue warfarin or other oral anticoagulant drugs which were used prior to this initial visit
(assert
  (! (and patient_can_undergo_warfarin_now@@used_prior_to_initial_visit
          patient_can_undergo_oral_anticoagulant_drugs_now@@used_prior_to_initial_visit)
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "able to discontinue warfarin or other oral anticoagulant drugs which were used prior to this initial visit"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_understands_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient understands all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient does not understand all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient understands all study procedures and restrictions.","meaning":"Boolean indicating whether the patient understands all study procedures and restrictions."} // "the patient must understand all study procedures and restrictions"
(declare-const patient_is_willing_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is not willing to comply with all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with all study procedures and restrictions.","meaning":"Boolean indicating whether the patient is willing to comply with all study procedures and restrictions."} // "the patient must be willing to comply with all study procedures and restrictions"
(declare-const patient_is_able_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to comply with all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is not able to comply with all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to comply with all study procedures and restrictions.","meaning":"Boolean indicating whether the patient is able to comply with all study procedures and restrictions."} // "the patient must be able to comply with all study procedures and restrictions"
(declare-const patient_is_likely_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is likely to comply with all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is not likely to comply with all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is likely to comply with all study procedures and restrictions.","meaning":"Boolean indicating whether the patient is likely to comply with all study procedures and restrictions."} // "the patient must be likely to comply with all study procedures and restrictions"
(declare-const patient_comprehends_verbal_rating_scales Bool) ;; {"when_to_set_to_true":"Set to true if the patient comprehends the verbal rating scales.","when_to_set_to_false":"Set to false if the patient does not comprehend the verbal rating scales.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient comprehends the verbal rating scales.","meaning":"Boolean indicating whether the patient comprehends the verbal rating scales."} // "the patient must comprehend the verbal rating scales"
(declare-const patient_comprehends_diary_cards Bool) ;; {"when_to_set_to_true":"Set to true if the patient comprehends the diary cards.","when_to_set_to_false":"Set to false if the patient does not comprehend the diary cards.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient comprehends the diary cards.","meaning":"Boolean indicating whether the patient comprehends the diary cards."} // "the patient must comprehend the diary cards"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_understands_study_procedures_and_restrictions
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must understand all study procedures and restrictions"
(assert
  (! patient_is_willing_to_comply_with_study_procedures_and_restrictions
     :named REQ7_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to comply with all study procedures and restrictions"
(assert
  (! patient_is_able_to_comply_with_study_procedures_and_restrictions
     :named REQ7_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to comply with all study procedures and restrictions"
(assert
  (! patient_is_likely_to_comply_with_study_procedures_and_restrictions
     :named REQ7_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be likely to comply with all study procedures and restrictions"
(assert
  (! patient_comprehends_verbal_rating_scales
     :named REQ7_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must comprehend the verbal rating scales"
(assert
  (! patient_comprehends_diary_cards
     :named REQ7_COMPONENT5_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must comprehend the diary cards"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_able_to_give_voluntary_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give voluntary written informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give voluntary written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give voluntary written informed consent.","meaning":"Boolean indicating whether the patient is currently able to give voluntary written informed consent."} // "the patient must be able to give voluntary written informed consent"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_is_able_to_give_voluntary_written_informed_consent_now
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to give voluntary written informed consent"
