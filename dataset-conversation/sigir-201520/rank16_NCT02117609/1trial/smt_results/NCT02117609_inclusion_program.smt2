;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently male."} // "be a man"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently female."} // "be a woman"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged greater than 60 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (> patient_age_value_recorded_now_in_years 60.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be a man) OR (be a woman AND be aged greater than 60 years))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_been_living_in_nursing_home_duration_in_months Real) ;; {"when_to_set_to_value":"Set to the total number of months the patient has continuously been living in a nursing home up to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient has been living in a nursing home.","meaning":"Numeric value representing the duration in months the patient has continuously been living in a nursing home."} // "must have been living in a nursing home for greater than or equal to 2 months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_has_been_living_in_nursing_home_duration_in_months 2.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have been living in a nursing home for greater than or equal to 2 months"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_malnutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malnutrition.","when_to_set_to_false":"Set to false if the patient currently does not have malnutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malnutrition.","meaning":"Boolean indicating whether the patient currently has malnutrition."} // "have malnutrition"
(declare-const patient_has_finding_of_at_risk_for_imbalanced_nutrition_less_than_body_requirements_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently at risk for imbalanced nutrition less than body requirements (at risk of malnutrition).","when_to_set_to_false":"Set to false if the patient is currently not at risk for imbalanced nutrition less than body requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at risk for imbalanced nutrition less than body requirements.","meaning":"Boolean indicating whether the patient is currently at risk for imbalanced nutrition less than body requirements (at risk of malnutrition)."} // "be at risk of malnutrition"
(declare-const mini_nutritional_assessment_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Mini Nutritional Assessment score recorded now, in points.","when_to_set_to_null":"Set to null if the Mini Nutritional Assessment score is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's Mini Nutritional Assessment score recorded now, in points."} // "Mini Nutritional Assessment score less than 23.5"
(declare-const body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's body mass index recorded now, in kilograms per square meter.","when_to_set_to_null":"Set to null if the body mass index is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's body mass index recorded now, in kilograms per square meter."} // "body mass index less than 24"
(declare-const serum_albumin_concentration_value_recorded_now_withunit_g_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's serum albumin concentration recorded now, in grams per liter.","when_to_set_to_null":"Set to null if the serum albumin concentration is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's serum albumin concentration recorded now, in grams per liter."} // "serum albumin concentration less than 35 grams per liter"
(declare-const weight_loss_value_recorded_last_6_months_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's weight loss over the last 6 months, in kilograms.","when_to_set_to_null":"Set to null if the weight loss over the last 6 months is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's weight loss over the last 6 months, in kilograms."} // "weight loss of greater than 5 kilograms in the last 6 months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition in the requirement: "be at risk of malnutrition, defined as (Mini Nutritional Assessment score less than 23.5 OR body mass index less than 24 OR serum albumin concentration less than 35 grams per liter OR weight loss of greater than 5 kilograms in the last 6 months)"
(assert
  (! (= patient_has_finding_of_at_risk_for_imbalanced_nutrition_less_than_body_requirements_now
        (or (< mini_nutritional_assessment_score_value_recorded_now_withunit_points 23.5)
            (< body_mass_index_value_recorded_now_withunit_kg_per_m2 24)
            (< serum_albumin_concentration_value_recorded_now_withunit_g_per_l 35)
            (> weight_loss_value_recorded_last_6_months_withunit_kg 5)))
     :named REQ2_AUXILIARY0)) ;; "at risk of malnutrition, defined as ..."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: "To be included, the patient must ((have malnutrition) OR (be at risk of malnutrition, defined as ...))."
(assert
  (! (or patient_has_finding_of_malnutrition_now
         patient_has_finding_of_at_risk_for_imbalanced_nutrition_less_than_body_requirements_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have malnutrition OR be at risk of malnutrition (definition above)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} // "have dementia"
(declare-const patient_has_finding_of_dementia_now@@moderate_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia and the dementia is of moderate severity.","when_to_set_to_false":"Set to false if the patient currently has dementia but the severity is not moderate, or if the patient does not have dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia is of moderate severity.","meaning":"Boolean indicating whether the patient currently has dementia and the dementia is of moderate severity."} // "have moderate dementia"
(declare-const mini_mental_state_examination_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's MMSE score recorded at the current time, in points (out of 30).","when_to_set_to_null":"Set to null if the MMSE score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's MMSE score recorded now, in points (out of 30)."} // "Mini-Mental State Examination score greater than or equal to 10 out of 30"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: moderate dementia is defined as MMSE score >= 10 out of 30
(assert
  (! (= patient_has_finding_of_dementia_now@@moderate_severity
        (and patient_has_finding_of_dementia_now
             (>= mini_mental_state_examination_score_value_recorded_now_withunit_points 10)))
     :named REQ3_AUXILIARY0)) ;; "have moderate dementia, defined as Mini-Mental State Examination score greater than or equal to 10 out of 30"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_dementia_now@@moderate_severity
         patient_has_finding_of_dementia_now)
     :named REQ3_AUXILIARY1)) ;; "have moderate dementia" implies "have dementia"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Inclusion: (NOT have dementia) OR (have moderate dementia, defined as MMSE >= 10)
(assert
  (! (or (not patient_has_finding_of_dementia_now)
         patient_has_finding_of_dementia_now@@moderate_severity)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((NOT have dementia) OR (have moderate dementia, defined as Mini-Mental State Examination score greater than or equal to 10 out of 30))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_does_walk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to walk (regardless of technical assistance, but without human assistance).","when_to_set_to_false":"Set to false if the patient is currently unable to walk or requires human assistance to walk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to walk without human assistance.","meaning":"Boolean indicating whether the patient is currently able to walk (without human assistance)."} // "walk"
(declare-const patient_has_finding_of_does_walk_now@@without_human_assistance Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to walk without human assistance (regardless of technical assistance).","when_to_set_to_false":"Set to false if the patient requires human assistance to walk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to walk without human assistance.","meaning":"Boolean indicating whether the patient's ability to walk is specifically without human assistance."} // "walk without human assistance"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_does_walk_now@@without_human_assistance
         patient_has_finding_of_does_walk_now)
     :named REQ4_AUXILIARY0)) ;; "To be included, the patient must be able to walk without human assistance, although technical assistance is allowed."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_does_walk_now@@without_human_assistance
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to walk without human assistance, although technical assistance is allowed."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_receiving_vitamin_d_supplementation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving vitamin D supplementation.","when_to_set_to_false":"Set to false if the patient is currently not receiving vitamin D supplementation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving vitamin D supplementation.","meaning":"Boolean indicating whether the patient is currently receiving vitamin D supplementation."} // "the patient must NOT be receiving vitamin D supplementation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_is_receiving_vitamin_d_supplementation_now)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must NOT be receiving vitamin D supplementation"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_able_to_follow_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to follow the study procedures as required by the study.","when_to_set_to_false":"Set to false if the patient is not able to follow the study procedures as required by the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to follow the study procedures as required by the study.","meaning":"Boolean indicating whether the patient is able to follow the study procedures as required by the study."} // "be able to follow the study procedures"
(declare-const patient_has_agreed_to_consume_oral_supplement Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to consume the oral supplement as part of the study.","when_to_set_to_false":"Set to false if the patient has not agreed to consume the oral supplement as part of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to consume the oral supplement as part of the study.","meaning":"Boolean indicating whether the patient has agreed to consume the oral supplement as part of the study."} // "have agreed to consume the oral supplement"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_able_to_follow_study_procedures
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be able to follow the study procedures"
(assert
  (! patient_has_agreed_to_consume_oral_supplement
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have agreed to consume the oral supplement"
