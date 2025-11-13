;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_low_back_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of chronic low back pain at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of chronic low back pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of chronic low back pain.","meaning":"Boolean indicating whether the patient has ever had chronic low back pain in their history."} ;; "To be included, the patient must have chronic low back pain."
(declare-const duration_of_chronic_low_back_pain_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has had chronic low back pain, as documented in the medical record.","when_to_set_to_null":"Set to null if the duration of chronic low back pain is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration, in months, that the patient has had chronic low back pain."} ;; "To be included, the patient must have had low back pain for more than 6 months."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must have chronic low back pain.
(assert
  (! patient_has_finding_of_chronic_low_back_pain_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic low back pain."

;; Component 1: The patient must have had low back pain for more than 6 months.
(assert
  (! (> duration_of_chronic_low_back_pain_in_months 6)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have had low back pain for more than 6 months."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_pain_value_recorded_inthehistory_withunit_episodes_per_week Real) ;; {"when_to_set_to_value":"Set to the number of pain episodes per week if this information is available from the patient's history.","when_to_set_to_null":"Set to null if the number of pain episodes per week in the patient's history is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of pain episodes per week experienced by the patient in their history."} ;; "To be included, the patient must have more than 3 episodes of pain per week."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_pain_value_recorded_inthehistory_withunit_episodes_per_week 3)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have more than 3 episodes of pain per week."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "To be included, the patient must be male."
(declare-const patient_waist_circumference_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's waist circumference in centimeters is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's waist circumference measured now in centimeters."} ;; "To be included, the patient must have a waist circumference greater than or equal to 102 cm."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_sex_is_male_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male."

(assert
  (! (>= patient_waist_circumference_value_recorded_now_withunit_cm 102.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a waist circumference greater than or equal to 102 cm."

;; --- verifier-bypassed (attempt 8/8) 2025-10-25T11:03:37.324694 policy=eventual
;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently female.","when_to_set_to_false":"Set to false if the patient is currently not female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently female.","meaning":"Boolean indicating whether the patient is currently female."} ;; "To be included, the patient must be female."
(declare-const patient_waist_circumference_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's waist circumference in centimeters is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's waist circumference measured now in centimeters."} ;; "To be included, the patient must have a waist circumference greater than or equal to 88 cm."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_sex_is_female_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be female."

(assert
  (! (>= patient_waist_circumference_value_recorded_now_withunit_cm 88.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a waist circumference greater than or equal to 88 cm."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_undergo_regular_exercise_inthefuture14weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is both willing and able to participate in regular exercise for the next 14 weeks.","when_to_set_to_false":"Set to false if the patient is not willing or not able to participate in regular exercise for the next 14 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing and able to participate in regular exercise for the next 14 weeks.","meaning":"Boolean indicating whether the patient is willing and able to participate in regular exercise for the next 14 weeks."} ;; "To be included, the patient must be willing and able to participate in regular exercise for 14 weeks."
(declare-const patient_can_undergo_regular_exercise_inthefuture14weeks@@willing_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to participate in regular exercise for the next 14 weeks.","when_to_set_to_false":"Set to false if the patient is not willing to participate in regular exercise for the next 14 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to participate in regular exercise for the next 14 weeks.","meaning":"Boolean indicating whether the patient is willing to participate in regular exercise for the next 14 weeks."} ;; "To be included, the patient must be willing to participate in regular exercise for 14 weeks."
(declare-const patient_can_undergo_regular_exercise_inthefuture14weeks@@able_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to participate in regular exercise for the next 14 weeks.","when_to_set_to_false":"Set to false if the patient is not able to participate in regular exercise for the next 14 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to participate in regular exercise for the next 14 weeks.","meaning":"Boolean indicating whether the patient is able to participate in regular exercise for the next 14 weeks."} ;; "To be included, the patient must be able to participate in regular exercise for 14 weeks."

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: patient_can_undergo_regular_exercise_inthefuture14weeks is true iff both willing and able qualifiers are true
(assert
  (! (= patient_can_undergo_regular_exercise_inthefuture14weeks
        (and patient_can_undergo_regular_exercise_inthefuture14weeks@@willing_to_participate
             patient_can_undergo_regular_exercise_inthefuture14weeks@@able_to_participate))
     :named REQ4_AUXILIARY0)) ;; "To be included, the patient must be willing and able to participate in regular exercise for 14 weeks."

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_can_undergo_regular_exercise_inthefuture14weeks@@willing_to_participate
         patient_can_undergo_regular_exercise_inthefuture14weeks)
     :named REQ4_AUXILIARY1)) ;; "To be included, the patient must be willing to participate in regular exercise for 14 weeks."

(assert
  (! (=> patient_can_undergo_regular_exercise_inthefuture14weeks@@able_to_participate
         patient_can_undergo_regular_exercise_inthefuture14weeks)
     :named REQ4_AUXILIARY2)) ;; "To be included, the patient must be able to participate in regular exercise for 14 weeks."

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Willingness to participate
(assert
  (! patient_can_undergo_regular_exercise_inthefuture14weeks@@willing_to_participate
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to participate in regular exercise for 14 weeks."

;; Component 1: Ability to participate
(assert
  (! patient_can_undergo_regular_exercise_inthefuture14weeks@@able_to_participate
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to participate in regular exercise for 14 weeks."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_low_back_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has low back pain.","when_to_set_to_false":"Set to false if the patient currently does not have low back pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has low back pain.","meaning":"Boolean indicating whether the patient currently has low back pain."} ;; "To be included, the patient must be using pain medication to control low back pain."
(declare-const patient_has_finding_of_low_back_pain_now@@controlled_by_pain_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has low back pain and the low back pain is being controlled by pain medication.","when_to_set_to_false":"Set to false if the patient currently has low back pain but the low back pain is not being controlled by pain medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the low back pain is being controlled by pain medication.","meaning":"Boolean indicating whether the patient's current low back pain is being controlled by pain medication."} ;; "To be included, the patient must be using pain medication to control low back pain."
(declare-const patient_has_finding_of_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain.","when_to_set_to_false":"Set to false if the patient currently does not have pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain.","meaning":"Boolean indicating whether the patient currently has pain."} ;; "To be included, the patient must be using pain medication to control low back pain."
(declare-const patient_has_finding_of_pain_now@@controlled_by_pain_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain and the pain is being controlled by pain medication.","when_to_set_to_false":"Set to false if the patient currently has pain but the pain is not being controlled by pain medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pain is being controlled by pain medication.","meaning":"Boolean indicating whether the patient's current pain is being controlled by pain medication."} ;; "To be included, the patient must be using pain medication to control low back pain."

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_low_back_pain_now@@controlled_by_pain_medication
         patient_has_finding_of_low_back_pain_now)
     :named REQ5_AUXILIARY0)) ;; "To be included, the patient must be using pain medication to control low back pain."

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_pain_now@@controlled_by_pain_medication
         patient_has_finding_of_pain_now)
     :named REQ5_AUXILIARY1)) ;; "To be included, the patient must be using pain medication to control low back pain."

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Patient must be using pain medication to control low back pain
(assert
  (! patient_has_finding_of_low_back_pain_now@@controlled_by_pain_medication
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be using pain medication to control low back pain."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_abnormal_cardiovascular_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal cardiovascular function.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal cardiovascular function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal cardiovascular function.","meaning":"Boolean indicating whether the patient currently has abnormal cardiovascular function."} ;; "abnormal cardiovascular response"
(declare-const patient_has_finding_of_abnormal_cardiovascular_function_now@@occurs_during_screening_graded_maximal_walk_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal cardiovascular function occurs during a screening graded maximal walk test.","when_to_set_to_false":"Set to false if the patient's abnormal cardiovascular function does not occur during a screening graded maximal walk test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal cardiovascular function occurs during a screening graded maximal walk test.","meaning":"Boolean indicating whether the patient's abnormal cardiovascular function occurs during a screening graded maximal walk test."} ;; "abnormal cardiovascular response during a screening graded maximal walk test"
(declare-const patient_has_undergone_walking_exercise_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone a walking exercise test.","when_to_set_to_false":"Set to false if the patient has not currently undergone a walking exercise test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone a walking exercise test.","meaning":"Boolean indicating whether the patient has currently undergone a walking exercise test."} ;; "walk test"
(declare-const patient_has_undergone_walking_exercise_test_now@@is_graded Bool) ;; {"when_to_set_to_true":"Set to true if the walking exercise test undergone by the patient is graded.","when_to_set_to_false":"Set to false if the walking exercise test undergone by the patient is not graded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the walking exercise test is graded.","meaning":"Boolean indicating whether the walking exercise test is graded."} ;; "graded walk test"
(declare-const patient_has_undergone_walking_exercise_test_now@@is_maximal Bool) ;; {"when_to_set_to_true":"Set to true if the walking exercise test undergone by the patient is maximal.","when_to_set_to_false":"Set to false if the walking exercise test undergone by the patient is not maximal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the walking exercise test is maximal.","meaning":"Boolean indicating whether the walking exercise test is maximal."} ;; "maximal walk test"
(declare-const patient_has_undergone_walking_exercise_test_now@@performed_as_screening_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the walking exercise test undergone by the patient is performed as a screening procedure.","when_to_set_to_false":"Set to false if the walking exercise test undergone by the patient is not performed as a screening procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the walking exercise test is performed as a screening procedure.","meaning":"Boolean indicating whether the walking exercise test is performed as a screening procedure."} ;; "screening graded maximal walk test"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_abnormal_cardiovascular_function_now@@occurs_during_screening_graded_maximal_walk_test
         patient_has_finding_of_abnormal_cardiovascular_function_now)
     :named REQ6_AUXILIARY0)) ;; "abnormal cardiovascular response during a screening graded maximal walk test" implies "abnormal cardiovascular response"

;; All three walk test qualifiers together imply the test is a screening graded maximal walk test
(assert
  (! (=> (and patient_has_undergone_walking_exercise_test_now
              patient_has_undergone_walking_exercise_test_now@@is_graded
              patient_has_undergone_walking_exercise_test_now@@is_maximal
              patient_has_undergone_walking_exercise_test_now@@performed_as_screening_procedure)
         patient_has_undergone_walking_exercise_test_now)
     :named REQ6_AUXILIARY1)) ;; "screening graded maximal walk test" definition

;; ===================== Constraint Assertions (REQ 6) =====================
;; The patient must be free of abnormal cardiovascular response during a screening graded maximal walk test
(assert
  (! (not patient_has_finding_of_abnormal_cardiovascular_function_now@@occurs_during_screening_graded_maximal_walk_test)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be free of abnormal cardiovascular response during a screening graded maximal walk test."
