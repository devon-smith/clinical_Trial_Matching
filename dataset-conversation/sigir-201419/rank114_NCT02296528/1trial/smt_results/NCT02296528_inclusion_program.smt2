;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_oropharyngeal_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of oropharyngeal dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of oropharyngeal dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has oropharyngeal dysphagia.","meaning":"Boolean indicating whether the patient currently has oropharyngeal dysphagia."} // "To be included, the patient must have profound oropharyngeal dysphagia."
(declare-const patient_has_finding_of_oropharyngeal_dysphagia_now@@severity_is_profound Bool) ;; {"when_to_set_to_true":"Set to true if the patient's oropharyngeal dysphagia is profound in severity.","when_to_set_to_false":"Set to false if the patient's oropharyngeal dysphagia is not profound in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's oropharyngeal dysphagia is profound in severity.","meaning":"Boolean indicating whether the patient's oropharyngeal dysphagia is profound in severity."} // "To be included, the patient must have profound oropharyngeal dysphagia."
(declare-const patient_is_feeding_tube_dependent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently dependent on a feeding tube for nutrition.","when_to_set_to_false":"Set to false if the patient is currently not dependent on a feeding tube for nutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently dependent on a feeding tube for nutrition.","meaning":"Boolean indicating whether the patient is currently dependent on a feeding tube for nutrition."} // "To be included, the patient must be feeding tube dependent."
(declare-const patient_oropharyngeal_dysphagia_value_recorded_inthehistory_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months if the duration of the patient's oropharyngeal dysphagia over their history is known.","when_to_set_to_null":"Set to null if the duration in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in months of the patient's oropharyngeal dysphagia over their history."} // "To be included, the patient must have a duration of oropharyngeal dysphagia > 12 months."
(declare-const patient_has_finding_of_aspiration_on_fluoroscopic_swallow_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has documented aspiration on a fluoroscopic swallow study.","when_to_set_to_false":"Set to false if the patient currently does not have documented aspiration on a fluoroscopic swallow study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has documented aspiration on a fluoroscopic swallow study.","meaning":"Boolean indicating whether the patient currently has documented aspiration on a fluoroscopic swallow study."} // "To be included, the patient must have documentation of the prevalence of aspiration on fluoroscopic swallow study."
(declare-const patient_has_undergone_videofluoroscopy_swallow_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a fluoroscopic swallow study at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone a fluoroscopic swallow study at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a fluoroscopic swallow study at any time in their history.","meaning":"Boolean indicating whether the patient has undergone a fluoroscopic swallow study at any time in their history."} // "To be included, the patient must have documentation of the prevalence of aspiration on fluoroscopic swallow study."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_oropharyngeal_dysphagia_now@@severity_is_profound
         patient_has_finding_of_oropharyngeal_dysphagia_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have profound oropharyngeal dysphagia."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Profound oropharyngeal dysphagia
(assert
  (! patient_has_finding_of_oropharyngeal_dysphagia_now@@severity_is_profound
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have profound oropharyngeal dysphagia."

;; Component 1: Feeding tube dependent
(assert
  (! patient_is_feeding_tube_dependent_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be feeding tube dependent."

;; Component 2: Duration of oropharyngeal dysphagia > 12 months
(assert
  (! (> patient_oropharyngeal_dysphagia_value_recorded_inthehistory_withunit_months 12)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a duration of oropharyngeal dysphagia > 12 months."

;; Component 3: Documentation of prevalence of aspiration on fluoroscopic swallow study
(assert
  (! patient_has_finding_of_aspiration_on_fluoroscopic_swallow_study_now
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have documentation of the prevalence of aspiration on fluoroscopic swallow study."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_nutritional_requirement_percent_met_by_enterogastric_tube_now Real) ;; {"when_to_set_to_value":"Set to the percentage value if it is known and documented how much of the patient's total nutritional requirements are currently being met by enterogastric tube feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what percentage of the patient's nutritional requirements are currently being met by enterogastric tube feeding.","meaning":"Numeric value representing the percentage of the patient's total nutritional requirements currently being met by enterogastric tube feeding."} // "To be included, the patient must be receiving 100 percent of nutritional requirements by enterogastric tube."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (= patient_nutritional_requirement_percent_met_by_enterogastric_tube_now 100.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be receiving 100 percent of nutritional requirements by enterogastric tube."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be ≥ 18 years of age"
(declare-const patient_has_birth_certificate_for_verification_of_age_now Bool) ;; {"when_to_set_to_true":"Set to true if a birth certificate is currently available for verification of the patient's age.","when_to_set_to_false":"Set to false if a birth certificate is currently not available for verification of the patient's age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a birth certificate is available for verification of the patient's age.","meaning":"Boolean indicating whether the patient currently has a birth certificate available for verification of age."} // "birth certificate"
(declare-const patient_has_passport_for_verification_of_age_now Bool) ;; {"when_to_set_to_true":"Set to true if a passport is currently available for verification of the patient's age.","when_to_set_to_false":"Set to false if a passport is currently not available for verification of the patient's age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a passport is available for verification of the patient's age.","meaning":"Boolean indicating whether the patient currently has a passport available for verification of age."} // "passport"
(declare-const patient_has_drivers_license_for_verification_of_age_now Bool) ;; {"when_to_set_to_true":"Set to true if a driver's license is currently available for verification of the patient's age.","when_to_set_to_false":"Set to false if a driver's license is currently not available for verification of the patient's age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a driver's license is available for verification of the patient's age.","meaning":"Boolean indicating whether the patient currently has a driver's license available for verification of age."} // "driver's license"
(declare-const patient_has_documentation_for_verification_of_age_now Bool) ;; {"when_to_set_to_true":"Set to true if documentation for verification of age is currently available for the patient.","when_to_set_to_false":"Set to false if documentation for verification of age is currently not available for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether documentation for verification of age is available for the patient.","meaning":"Boolean indicating whether the patient currently has documentation available for verification of age."} // "documentation for verification of age (birth certificate OR passport OR driver's license)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Documentation for verification of age is defined as having at least one of the listed documents (exhaustive subcategories)
(assert
  (! (= patient_has_documentation_for_verification_of_age_now
        (or patient_has_birth_certificate_for_verification_of_age_now
            patient_has_passport_for_verification_of_age_now
            patient_has_drivers_license_for_verification_of_age_now))
     :named REQ2_AUXILIARY0)) ;; "documentation for verification of age (birth certificate OR passport OR driver's license)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must be ≥ 18 years of age
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be ≥ 18 years of age"

;; Component 1: patient must have documentation for verification of age (birth certificate OR passport OR driver's license)
(assert
  (! patient_has_documentation_for_verification_of_age_now
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have documentation for verification of age (birth certificate OR passport OR driver's license)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const upper_esophageal_sphincter_opening_value_recorded_now_withunit_centimeter_on_fluoroscopic_swallow_study Real) ;; {"when_to_set_to_value":"Set to the numeric value (in centimeters) of the patient's upper esophageal sphincter opening as measured on a fluoroscopic swallow study, recorded at the current time.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined from a fluoroscopic swallow study at the current time.","meaning":"Numeric value (in centimeters) of the patient's upper esophageal sphincter opening measured on a fluoroscopic swallow study at the current time."} // "have diminished upper esophageal sphincter opening defined as < 0.55 centimeters on fluoroscopic swallow study" and "have diminished upper esophageal sphincter opening defined as < 0.40 centimeters on fluoroscopic swallow study"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must ((be < 65 years of age AND have diminished upper esophageal sphincter opening defined as < 0.55 centimeters on fluoroscopic swallow study) OR (be ≥ 65 years of age AND have diminished upper esophageal sphincter opening defined as < 0.40 centimeters on fluoroscopic swallow study)).
(assert
  (! (or (and (< patient_age_value_recorded_now_in_years 65.0)
              (< upper_esophageal_sphincter_opening_value_recorded_now_withunit_centimeter_on_fluoroscopic_swallow_study 0.55))
         (and (>= patient_age_value_recorded_now_in_years 65.0)
              (< upper_esophageal_sphincter_opening_value_recorded_now_withunit_centimeter_on_fluoroscopic_swallow_study 0.40)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const duration_of_dysphagia_therapy_failure_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has had dysphagia therapy failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient has had dysphagia therapy failure.","meaning":"Numeric value indicating the duration, in months, of the patient's dysphagia therapy failure."} // "failure of dysphagia therapy for > 3 months"
(declare-const patient_has_failure_of_dysphagia_therapy_within_3_months_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had failure of dysphagia therapy within 3 months prior to study enrollment.","when_to_set_to_false":"Set to false if the patient has not had failure of dysphagia therapy within 3 months prior to study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had failure of dysphagia therapy within 3 months prior to study enrollment.","meaning":"Boolean indicating whether the patient has had failure of dysphagia therapy within 3 months prior to study enrollment."} // "failure of dysphagia therapy within 3 months prior to study enrollment"
(declare-const patient_has_finding_of_dysphagia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had dysphagia at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had dysphagia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had dysphagia.","meaning":"Boolean indicating whether the patient has ever had dysphagia at any time in the past."} // "dysphagia"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and
        patient_has_failure_of_dysphagia_therapy_within_3_months_prior_to_enrollment
        (> duration_of_dysphagia_therapy_failure_in_months 3.0))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "failure of dysphagia therapy for > 3 months within 3 months prior to study enrollment"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_documented_history_of_noncompliance_with_feeding_recommendations Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of noncompliance with feeding recommendations.","when_to_set_to_false":"Set to false if the patient does not have a documented history of noncompliance with feeding recommendations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a documented history of noncompliance with feeding recommendations.","meaning":"Boolean indicating whether the patient has a documented history of noncompliance with feeding recommendations."} // "the patient must NOT have documented history of noncompliance with feeding recommendations."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_documented_history_of_noncompliance_with_feeding_recommendations)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have documented history of noncompliance with feeding recommendations."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_abbreviated_mental_test_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if a current Abbreviated Mental Test Score (AMTS) is available.","when_to_set_to_null":"Set to null if no current AMTS value is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Abbreviated Mental Test Score (AMTS)."} // "Abbreviated Mental Test Score"
(declare-const patient_has_finding_of_normal_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cognition within normal limits.","when_to_set_to_false":"Set to false if the patient currently does not have cognition within normal limits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cognition within normal limits.","meaning":"Boolean indicating whether the patient currently has cognition within normal limits."} // "cognition within normal limits"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; "as evidenced by Abbreviated Mental Test Score > 6" defines normal cognition
(assert
  (! (= patient_has_finding_of_normal_cognition_now
        (> patient_abbreviated_mental_test_score_value_recorded_now_withunit_score 6))
     :named REQ6_AUXILIARY0)) ;; "as evidenced by Abbreviated Mental Test Score > 6"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_finding_of_normal_cognition_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have cognition within normal limits (as evidenced by Abbreviated Mental Test Score > 6)."

;; ===================== Declarations for the inclusion criterion (REQ 7) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} // "within normal limits for sex"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is male at the current time."} // "within normal limits for sex"
(declare-const patients_ability_to_perform_general_manipulative_activities_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has normal ability to perform general manipulative activities (manual dexterity).","when_to_set_to_false":"Set to false if the patient currently does not have normal ability to perform general manipulative activities (manual dexterity).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal ability to perform general manipulative activities (manual dexterity).","meaning":"Boolean indicating whether the patient currently has normal ability to perform general manipulative activities (manual dexterity)."} // "manual dexterity"
(declare-const patients_ability_to_perform_general_manipulative_activities_is_normal_now@@normal_limits_for_age_sex_and_hand Bool) ;; {"when_to_set_to_true":"Set to true if normal ability to perform general manipulative activities (manual dexterity) is defined relative to age, sex, and hand.","when_to_set_to_false":"Set to false if normality is not defined relative to age, sex, and hand.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether normality is defined relative to age, sex, and hand.","meaning":"Boolean indicating whether normality of manual dexterity is defined relative to age, sex, and hand."} // "within normal limits for age, sex, and hand"
(declare-const patients_ability_to_perform_general_manipulative_activities_is_normal_now@@evaluated_by_block_and_box_test Bool) ;; {"when_to_set_to_true":"Set to true if normal ability to perform general manipulative activities (manual dexterity) is evaluated by Block and Box Test.","when_to_set_to_false":"Set to false if normality is not evaluated by Block and Box Test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether normality is evaluated by Block and Box Test.","meaning":"Boolean indicating whether normality of manual dexterity is evaluated by Block and Box Test."} // "as evaluated by Block and Box Test"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patients_ability_to_perform_general_manipulative_activities_is_normal_now@@normal_limits_for_age_sex_and_hand
         patients_ability_to_perform_general_manipulative_activities_is_normal_now)
     :named REQ7_AUXILIARY0)) ;; "within normal limits for age, sex, and hand"

(assert
  (! (=> patients_ability_to_perform_general_manipulative_activities_is_normal_now@@evaluated_by_block_and_box_test
         patients_ability_to_perform_general_manipulative_activities_is_normal_now)
     :named REQ7_AUXILIARY1)) ;; "as evaluated by Block and Box Test"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (and patients_ability_to_perform_general_manipulative_activities_is_normal_now@@normal_limits_for_age_sex_and_hand
          patients_ability_to_perform_general_manipulative_activities_is_normal_now@@evaluated_by_block_and_box_test)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have manual dexterity within normal limits for age, sex, and hand (as evaluated by Block and Box Test)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_physical_strength_value_recorded_now_in_pounds Real) ;; {"when_to_set_to_value":"Set to the maximum weight in pounds the patient can lift off of a table now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how much weight the patient can lift off of a table now.","meaning":"Numeric value for the patient's current physical strength as measured by the maximum weight in pounds lifted off of a table."} // "ability to lift a 5 pound weight off of a table"
(declare-const patient_can_keep_weight_elevated_duration_now_in_seconds Real) ;; {"when_to_set_to_value":"Set to the number of seconds the patient can keep a 5 pound weight elevated after lifting it off of a table now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how long the patient can keep a 5 pound weight elevated after lifting it off of a table now.","meaning":"Numeric value for the duration in seconds the patient can keep a 5 pound weight elevated after lifting it off of a table now."} // "keep it elevated for 10 seconds"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: Patient must be able to lift a 5 pound weight off of a table AND keep it elevated for 10 seconds
(assert
  (! (and (>= patient_physical_strength_value_recorded_now_in_pounds 5.0)
          (>= patient_can_keep_weight_elevated_duration_now_in_seconds 10.0))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "ability to lift a 5 pound weight off of a table AND keep it elevated for 10 seconds"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_finding_of_ability_to_understand_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to understand the informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to understand the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to understand the informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to understand the informed consent."} // "ability to understand the informed consent"
(declare-const patient_has_finding_of_ability_to_understand_informed_consent_now@@evidenced_by_appropriate_questions_responses_and_comments_during_initial_evaluations Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ability to understand the informed consent is evidenced by appropriate questions, responses, and comments during the initial evaluations.","when_to_set_to_false":"Set to false if the patient's ability to understand the informed consent is not evidenced by appropriate questions, responses, and comments during the initial evaluations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ability to understand the informed consent is evidenced by appropriate questions, responses, and comments during the initial evaluations.","meaning":"Boolean indicating whether the patient's ability to understand the informed consent is evidenced by appropriate questions, responses, and comments during the initial evaluations."} // "as evidenced by appropriate questions, responses, and comments during the initial evaluations"
(declare-const patient_has_finding_of_follow_up_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to comply with follow-up.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to comply with follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to comply with follow-up.","meaning":"Boolean indicating whether the patient currently has the ability to comply with follow-up."} // "ability to comply with follow-up"
(declare-const patient_has_finding_of_follow_up_status_now@@evidenced_by_appropriate_questions_responses_and_comments_during_initial_evaluations Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ability to comply with follow-up is evidenced by appropriate questions, responses, and comments during the initial evaluations.","when_to_set_to_false":"Set to false if the patient's ability to comply with follow-up is not evidenced by appropriate questions, responses, and comments during the initial evaluations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ability to comply with follow-up is evidenced by appropriate questions, responses, and comments during the initial evaluations.","meaning":"Boolean indicating whether the patient's ability to comply with follow-up is evidenced by appropriate questions, responses, and comments during the initial evaluations."} // "as evidenced by appropriate questions, responses, and comments during the initial evaluations"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable for informed consent
(assert
  (! (=> patient_has_finding_of_ability_to_understand_informed_consent_now@@evidenced_by_appropriate_questions_responses_and_comments_during_initial_evaluations
         patient_has_finding_of_ability_to_understand_informed_consent_now)
     :named REQ9_AUXILIARY0)) ;; "as evidenced by appropriate questions, responses, and comments during the initial evaluations"

;; Qualifier variable implies corresponding stem variable for follow-up
(assert
  (! (=> patient_has_finding_of_follow_up_status_now@@evidenced_by_appropriate_questions_responses_and_comments_during_initial_evaluations
         patient_has_finding_of_follow_up_status_now)
     :named REQ9_AUXILIARY1)) ;; "as evidenced by appropriate questions, responses, and comments during the initial evaluations"

;; Abbreviated Mental Test Score within normal limits implies normal cognition
(assert
  (! (=> (and (not (= patient_abbreviated_mental_test_score_value_recorded_now_withunit_score 0.0))
              (>= patient_abbreviated_mental_test_score_value_recorded_now_withunit_score 8.0))
         patient_has_finding_of_normal_cognition_now)
     :named REQ9_AUXILIARY2)) ;; "Abbreviated Mental Test Score within normal limits" (assuming normal limits as >=8, not zero)

;; ===================== Constraint Assertions (REQ 9) =====================
;; All required conditions for inclusion: ability to understand informed consent (evidenced), ability to comply with follow-up (evidenced), and normal cognition (by AMTS)
(assert
  (! (and patient_has_finding_of_ability_to_understand_informed_consent_now@@evidenced_by_appropriate_questions_responses_and_comments_during_initial_evaluations
          patient_has_finding_of_follow_up_status_now@@evidenced_by_appropriate_questions_responses_and_comments_during_initial_evaluations
          patient_has_finding_of_normal_cognition_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ability to understand the informed consent AND comply with follow-up (as evidenced by appropriate questions, responses, and comments during the initial evaluations AND Abbreviated Mental Test Score within normal limits)."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_bilateral_vocal_fold_mobility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilateral vocal fold mobility.","when_to_set_to_false":"Set to false if the patient currently does not have bilateral vocal fold mobility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilateral vocal fold mobility.","meaning":"Boolean indicating whether the patient currently has bilateral vocal fold mobility."} // "have bilateral vocal fold mobility"
(declare-const patient_has_finding_of_unilateral_vocal_fold_immobility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unilateral vocal fold immobility.","when_to_set_to_false":"Set to false if the patient currently does not have unilateral vocal fold immobility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unilateral vocal fold immobility.","meaning":"Boolean indicating whether the patient currently has unilateral vocal fold immobility."} // "have unilateral vocal fold immobility"
(declare-const patient_has_finding_of_complete_glottic_closure_now_evidenced_on_endoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is able to attain complete glottic closure as evidenced on endoscopy.","when_to_set_to_false":"Set to false if the patient currently is not able to attain complete glottic closure as evidenced on endoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is able to attain complete glottic closure as evidenced on endoscopy.","meaning":"Boolean indicating whether the patient currently is able to attain complete glottic closure as evidenced on endoscopy."} // "be able to attain complete glottic closure as evidenced on endoscopy"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: To be included, the patient must ((have bilateral vocal fold mobility) OR (have unilateral vocal fold immobility AND be able to attain complete glottic closure as evidenced on endoscopy)).
(assert
  (! (or patient_has_finding_of_bilateral_vocal_fold_mobility_now
         (and patient_has_finding_of_unilateral_vocal_fold_immobility_now
              patient_has_finding_of_complete_glottic_closure_now_evidenced_on_endoscopy))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS))
