;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 60 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 60 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 60.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 60 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current BMI in kilograms per square meter is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."}  ;; "body mass index"
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any comorbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have any comorbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any comorbid conditions.","meaning":"Boolean indicating whether the patient currently has any comorbid conditions."}  ;; "comorbid condition"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the comorbid condition(s) currently present in the patient are severe.","when_to_set_to_false":"Set to false if the comorbid condition(s) currently present in the patient are not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid condition(s) currently present in the patient are severe.","meaning":"Boolean indicating whether the comorbid condition(s) currently present in the patient are severe."}  ;; "severe comorbid condition"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_co_morbid_conditions_now@@is_severe
         patient_has_finding_of_co_morbid_conditions_now)
     :named REQ1_AUXILIARY0)) ;; "severe comorbid condition" implies "comorbid condition"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: ((BMI ≥ 35 AND BMI ≤ 39.9 AND ≥1 severe comorbid condition) OR (BMI ≥ 40 AND BMI ≤ 55))
(assert
  (! (or (and (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 35.0)
              (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 39.9)
              patient_has_finding_of_co_morbid_conditions_now@@is_severe)
         (and (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 40.0)
              (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 55.0)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have a body mass index ≥ 35 kilograms per square meter AND body mass index ≤ 39.9 kilograms per square meter AND have ≥ 1 severe comorbid condition) OR (have a body mass index ≥ 40 kilograms per square meter AND body mass index ≤ 55 kilograms per square meter))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_willing_to_comply_with_dietary_restrictions_required_by_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with the dietary restrictions required by the protocol.","when_to_set_to_false":"Set to false if the patient is not willing to comply with the dietary restrictions required by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with the dietary restrictions required by the protocol.","meaning":"Boolean indicating whether the patient is willing to comply with the dietary restrictions required by the protocol."}  ;; "the patient must be willing to comply with dietary restrictions required by the protocol"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_willing_to_comply_with_dietary_restrictions_required_by_protocol
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to comply with dietary restrictions required by the protocol"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const duration_of_obesity_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has had a history of obesity, as documented in the medical record.","when_to_set_to_null":"Set to null if the duration of obesity history is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the total duration in years of the patient's history of obesity."}  ;; "history of obesity for ≥ 5 years"
(declare-const patient_has_diagnosis_of_obesity_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of obesity at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of obesity in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of obesity.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of obesity in their medical history."}  ;; "history of obesity"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_has_diagnosis_of_obesity_inthehistory
          (>= duration_of_obesity_in_years 5.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "history of obesity for ≥ 5 years"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const duration_of_documented_failure_of_traditional_non_surgical_weight_loss_methods_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has documented failures with traditional non-surgical weight loss methods.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the total duration, in months, of the patient's documented failures with traditional non-surgical weight loss methods."}  ;; "history of ≥ 6 months of documented failures with traditional non-surgical weight loss methods"
(declare-const patient_has_history_of_documented_failure_of_traditional_non_surgical_weight_loss_methods Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of documented failures with traditional non-surgical weight loss methods.","when_to_set_to_false":"Set to false if the patient does not have a history of documented failures with traditional non-surgical weight loss methods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of documented failures with traditional non-surgical weight loss methods.","meaning":"Boolean indicating whether the patient has a history of documented failures with traditional non-surgical weight loss methods."}  ;; "history of documented failures with traditional non-surgical weight loss methods"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Duration of documented failure ≥ 6 months implies history of documented failure
(assert
  (! (=> (>= duration_of_documented_failure_of_traditional_non_surgical_weight_loss_methods_in_months 6.0)
         patient_has_history_of_documented_failure_of_traditional_non_surgical_weight_loss_methods)
     :named REQ4_AUXILIARY0)) ;; "history of ≥ 6 months of documented failures with traditional non-surgical weight loss methods"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and (>= duration_of_documented_failure_of_traditional_non_surgical_weight_loss_methods_in_months 6.0)
          patient_has_history_of_documented_failure_of_traditional_non_surgical_weight_loss_methods)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "history of ≥ 6 months of documented failures with traditional non-surgical weight loss methods"

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_is_willing_to_follow_protocol_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to follow all protocol requirements.","when_to_set_to_false":"Set to false if the patient is not willing to follow all protocol requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to follow all protocol requirements.","meaning":"Boolean indicating whether the patient is willing to follow all protocol requirements."} ;; "the patient must be willing to follow protocol requirements"
(declare-const patient_has_signed_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the informed consent form.","when_to_set_to_false":"Set to false if the patient has not signed the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the informed consent form.","meaning":"Boolean indicating whether the patient has signed the informed consent form."} ;; "the patient must sign the informed consent form"
(declare-const patient_has_completed_routine_follow_up_visits_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed all routine follow-up visits for the study duration.","when_to_set_to_false":"Set to false if the patient has not completed all routine follow-up visits for the study duration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed all routine follow-up visits for the study duration.","meaning":"Boolean indicating whether the patient has completed all routine follow-up visits for the study duration."} ;; "the patient must complete all routine follow-up visits for the study duration"
(declare-const patient_has_undergone_laboratory_test_now@@pre_operative_context Bool) ;; {"when_to_set_to_true":"Set to true if the laboratory tests completed as of now are specifically pre-operative tests.","when_to_set_to_false":"Set to false if the laboratory tests completed as of now are not pre-operative tests.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the laboratory tests completed as of now are pre-operative.","meaning":"Boolean indicating whether the laboratory tests completed as of now are pre-operative."} ;; "the patient must complete all pre-operative laboratory tests"
(declare-const patient_has_undergone_laboratory_test_now@@post_operative_context Bool) ;; {"when_to_set_to_true":"Set to true if the laboratory tests completed as of now are specifically post-operative tests.","when_to_set_to_false":"Set to false if the laboratory tests completed as of now are not post-operative tests.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the laboratory tests completed as of now are post-operative.","meaning":"Boolean indicating whether the laboratory tests completed as of now are post-operative."} ;; "the patient must complete all post-operative laboratory tests"
(declare-const patient_has_completed_pre_operative_diagnostic_tests Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed all pre-operative diagnostic tests.","when_to_set_to_false":"Set to false if the patient has not completed all pre-operative diagnostic tests.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed all pre-operative diagnostic tests.","meaning":"Boolean indicating whether the patient has completed all pre-operative diagnostic tests."} ;; "the patient must complete all pre-operative diagnostic tests"
(declare-const patient_has_completed_post_operative_diagnostic_tests Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed all post-operative diagnostic tests.","when_to_set_to_false":"Set to false if the patient has not completed all post-operative diagnostic tests.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed all post-operative diagnostic tests.","meaning":"Boolean indicating whether the patient has completed all post-operative diagnostic tests."} ;; "the patient must complete all post-operative diagnostic tests"
(declare-const patient_has_completed_quality_of_life_questionnaire Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed the quality of life questionnaire.","when_to_set_to_false":"Set to false if the patient has not completed the quality of life questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed the quality of life questionnaire.","meaning":"Boolean indicating whether the patient has completed the quality of life questionnaire."} ;; "the patient must complete the quality of life questionnaire"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: patient must be willing to follow protocol requirements
(assert
  (! patient_is_willing_to_follow_protocol_requirements
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to follow protocol requirements"

;; Component 1: patient must sign the informed consent form
(assert
  (! patient_has_signed_informed_consent_form
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must sign the informed consent form"

;; Component 2: patient must complete all routine follow-up visits for the study duration
(assert
  (! patient_has_completed_routine_follow_up_visits_for_study_duration
     :named REQ5_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must complete all routine follow-up visits for the study duration"

;; Component 3: patient must complete all pre-operative laboratory tests
(assert
  (! patient_has_undergone_laboratory_test_now@@pre_operative_context
     :named REQ5_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must complete all pre-operative laboratory tests"

;; Component 4: patient must complete all post-operative laboratory tests
(assert
  (! patient_has_undergone_laboratory_test_now@@post_operative_context
     :named REQ5_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must complete all post-operative laboratory tests"

;; Component 5: patient must complete all pre-operative diagnostic tests
(assert
  (! patient_has_completed_pre_operative_diagnostic_tests
     :named REQ5_COMPONENT5_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must complete all pre-operative diagnostic tests"

;; Component 6: patient must complete all post-operative diagnostic tests
(assert
  (! patient_has_completed_post_operative_diagnostic_tests
     :named REQ5_COMPONENT6_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must complete all post-operative diagnostic tests"

;; Component 7: patient must complete the quality of life questionnaire
(assert
  (! patient_has_completed_quality_of_life_questionnaire
     :named REQ5_COMPONENT7_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must complete the quality of life questionnaire"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."}  ;; "female"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."}  ;; "childbearing potential"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."}  ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@appropriate_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and the form of contraception is considered appropriate.","when_to_set_to_false":"Set to false if the patient is currently using contraception but the form is not considered appropriate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the form of contraception is appropriate.","meaning":"Boolean indicating whether the patient's current contraception is an appropriate form."}  ;; "appropriate form of contraception"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for appropriate contraception implies contraception is being used
(assert
  (! (=> patient_has_finding_of_contraception_now@@appropriate_form
         patient_has_finding_of_contraception_now)
     :named REQ6_AUXILIARY0)) ;; "the patient must be using an appropriate form of contraception"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient is female with childbearing potential, she must be using an appropriate form of contraception
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_has_finding_of_contraception_now@@appropriate_form)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female with childbearing potential, the patient must be using an appropriate form of contraception"
