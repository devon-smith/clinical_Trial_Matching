;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND ≤ 65 years"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current BMI (in kg/m^2) is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} // "body mass index"
(declare-const patient_has_finding_of_overweight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of overweight.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of overweight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of overweight.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of overweight."} // "overweight"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition in the requirement: Overweight is defined as BMI ≥ 25 AND ≤ 45
(assert
  (! (= patient_has_finding_of_overweight_now
        (and (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25.0)
             (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 45.0)))
     :named REQ0_AUXILIARY0)) ;; "meet criteria for overweight (body mass index ≥ 25 AND ≤ 45)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Age between 18 and 65 years inclusive
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 18.0)
          (<= patient_age_value_recorded_now_in_years 65.0))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be aged ≥ 18 years AND ≤ 65 years"

;; Component 1: Must meet criteria for overweight (BMI between 25 and 45)
(assert
  (! patient_has_finding_of_overweight_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "meet criteria for overweight (body mass index ≥ 25 AND ≤ 45)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_written_informed_consent_for_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent for study participation.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent for study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent for study participation.","meaning":"Boolean indicating whether the patient has provided written informed consent for study participation."} // "the patient must provide written informed consent for study participation."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_provided_written_informed_consent_for_study_participation
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide written informed consent for study participation."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_english_language_skills_at_5th_grade_reading_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently possesses English language skills at the 5th grade reading level.","when_to_set_to_false":"Set to false if the patient currently does not possess English language skills at the 5th grade reading level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently possesses English language skills at the 5th grade reading level.","meaning":"Boolean indicating whether the patient currently possesses English language skills at the 5th grade reading level."} // "the patient must possess English language skills at the 5th grade reading level."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_english_language_skills_at_5th_grade_reading_level_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must possess English language skills at the 5th grade reading level."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke).","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has a diagnosis of cerebrovascular accident (stroke) at any time in their history."} // "recent history of stroke"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with coronary arteriosclerosis (coronary heart disease).","when_to_set_to_false":"Set to false if the patient has never been diagnosed with coronary arteriosclerosis (coronary heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with coronary arteriosclerosis (coronary heart disease).","meaning":"Boolean indicating whether the patient has a diagnosis of coronary arteriosclerosis (coronary heart disease) at any time in their history."} // "recent history of coronary heart disease"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with diabetes mellitus.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with diabetes mellitus.","meaning":"Boolean indicating whether the patient has a diagnosis of diabetes mellitus at any time in their history."} // "diabetes mellitus"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has a diagnosis of myocardial infarction at any time in their history."} // "recent history of myocardial infarction"
(declare-const patient_has_diagnosis_of_orthopedic_problem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with an orthopedic problem.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an orthopedic problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an orthopedic problem.","meaning":"Boolean indicating whether the patient has a diagnosis of orthopedic problem at any time in their history."} // "orthopedic problems that would limit activity during the following twelve months"
(declare-const patient_has_diagnosis_of_orthopedic_problem_inthehistory@@would_limit_activity_during_following_twelve_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's orthopedic problem would limit activity during the following twelve months.","when_to_set_to_false":"Set to false if the patient's orthopedic problem would not limit activity during the following twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's orthopedic problem would limit activity during the following twelve months.","meaning":"Boolean indicating whether the patient's orthopedic problem would limit activity during the following twelve months."} // "orthopedic problems that would limit activity during the following twelve months"
(declare-const patient_has_diagnosis_of_serious_physical_health_problem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a serious physical health problem.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a serious physical health problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a serious physical health problem.","meaning":"Boolean indicating whether the patient has a diagnosis of serious physical health problem at any time in their history."} // "any other serious medical condition that would make physical activity unsafe"
(declare-const patient_has_diagnosis_of_serious_physical_health_problem_inthehistory@@would_make_physical_activity_unsafe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's serious physical health problem would make physical activity unsafe.","when_to_set_to_false":"Set to false if the patient's serious physical health problem would not make physical activity unsafe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's serious physical health problem would make physical activity unsafe.","meaning":"Boolean indicating whether the patient's serious physical health problem would make physical activity unsafe."} // "any other serious medical condition that would make physical activity unsafe"
(declare-const patient_has_symptoms_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had symptoms of angina pectoris.","when_to_set_to_false":"Set to false if the patient has never had symptoms of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had symptoms of angina pectoris.","meaning":"Boolean indicating whether the patient has symptoms of angina pectoris at any time in their history."} // "recent symptoms of angina"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable for orthopedic problems
(assert
  (! (=> patient_has_diagnosis_of_orthopedic_problem_inthehistory@@would_limit_activity_during_following_twelve_months
         patient_has_diagnosis_of_orthopedic_problem_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "orthopedic problems that would limit activity during the following twelve months"

;; Qualifier variable implies corresponding stem variable for serious medical condition
(assert
  (! (=> patient_has_diagnosis_of_serious_physical_health_problem_inthehistory@@would_make_physical_activity_unsafe
         patient_has_diagnosis_of_serious_physical_health_problem_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "any other serious medical condition that would make physical activity unsafe"

;; Non-exhaustive examples: listed conditions imply umbrella term
(assert
  (! (=> (or patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory
             patient_has_diagnosis_of_myocardial_infarction_inthehistory
             patient_has_symptoms_of_angina_pectoris_inthehistory
             patient_has_diagnosis_of_diabetes_mellitus_inthehistory
             patient_has_diagnosis_of_cerebrovascular_accident_inthehistory
             patient_has_diagnosis_of_orthopedic_problem_inthehistory@@would_limit_activity_during_following_twelve_months)
         patient_has_diagnosis_of_serious_physical_health_problem_inthehistory)
     :named REQ3_AUXILIARY2)) ;; "major medical condition" umbrella, non-exhaustive examples

;; Qualifier variable for serious medical condition (would make physical activity unsafe) implies umbrella
(assert
  (! (=> patient_has_diagnosis_of_serious_physical_health_problem_inthehistory@@would_make_physical_activity_unsafe
         patient_has_diagnosis_of_serious_physical_health_problem_inthehistory)
     :named REQ3_AUXILIARY3)) ;; "any other serious medical condition that would make physical activity unsafe"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Patient must NOT have any major medical condition that would make physical activity unsafe
(assert
  (! (not patient_has_diagnosis_of_serious_physical_health_problem_inthehistory@@would_make_physical_activity_unsafe)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have any major medical condition ... that would make physical activity unsafe"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_bulimia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of bulimia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of bulimia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bulimia nervosa.","meaning":"Boolean indicating whether the patient currently has bulimia nervosa."} // "NOT have bulimia nervosa"
(declare-const patient_has_finding_of_anorexia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of anorexia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of anorexia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anorexia nervosa.","meaning":"Boolean indicating whether the patient currently has anorexia nervosa."} // "NOT have anorexia nervosa"
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of impaired cognition.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of impaired cognition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired cognition.","meaning":"Boolean indicating whether the patient currently has impaired cognition."} // "NOT have significant cognitive impairment"
(declare-const patient_has_finding_of_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychotic disorder.","meaning":"Boolean indicating whether the patient currently has psychotic disorder."} // "NOT have a known psychotic disorder"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of mental disorder (psychiatric illness).","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of mental disorder (psychiatric illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder (psychiatric illness).","meaning":"Boolean indicating whether the patient currently has a mental disorder (psychiatric illness)."} // "NOT have unstable psychiatric illness"
(declare-const patient_has_finding_of_mental_disorder_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder (psychiatric illness) and the illness is unstable, as evidenced by recent psychiatric hospitalization or acute suicidal ideation.","when_to_set_to_false":"Set to false if the patient currently has a mental disorder (psychiatric illness) but the illness is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is unstable.","meaning":"Boolean indicating whether the patient's current mental disorder is unstable."} // "unstable psychiatric illness"
(declare-const patient_has_history_of_psychiatric_hospitalization_recently Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of psychiatric hospitalization and the hospitalization is recent.","when_to_set_to_false":"Set to false if the patient has a history of psychiatric hospitalization but the hospitalization is not recent, or if the patient has no history of psychiatric hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a recent history of psychiatric hospitalization.","meaning":"Boolean indicating whether the patient has a recent history of psychiatric hospitalization."} // "recent psychiatric hospitalization"
(declare-const patient_has_finding_of_suicidal_thoughts_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding or diagnosis of suicidal thoughts (suicidal ideation).","when_to_set_to_false":"Set to false if the patient currently does not have a finding or diagnosis of suicidal thoughts (suicidal ideation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suicidal thoughts (suicidal ideation).","meaning":"Boolean indicating whether the patient currently has suicidal thoughts (suicidal ideation)."} // "acute suicidal ideation"
(declare-const patient_has_finding_of_suicidal_thoughts_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suicidal thoughts (suicidal ideation) and the ideation is acute.","when_to_set_to_false":"Set to false if the patient currently has suicidal thoughts (suicidal ideation) but the ideation is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suicidal ideation is acute.","meaning":"Boolean indicating whether the patient's current suicidal ideation is acute."} // "acute suicidal ideation"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply unstable psychiatric illness
(assert
  (! (=> (or patient_has_history_of_psychiatric_hospitalization_recently
             patient_has_finding_of_suicidal_thoughts_now@@acute)
         patient_has_finding_of_mental_disorder_now@@unstable)
     :named REQ4_AUXILIARY0)) ;; "unstable psychiatric illness with non-exhaustive examples (recent psychiatric hospitalization OR acute suicidal ideation)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_mental_disorder_now@@unstable
         patient_has_finding_of_mental_disorder_now)
     :named REQ4_AUXILIARY1)) ;; "unstable psychiatric illness" is a subset of "mental disorder"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_suicidal_thoughts_now@@acute
         patient_has_finding_of_suicidal_thoughts_now)
     :named REQ4_AUXILIARY2)) ;; "acute suicidal ideation" is a subset of "suicidal ideation"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and (not patient_has_finding_of_bulimia_nervosa_now)
          (not patient_has_finding_of_anorexia_nervosa_now)
          (not patient_has_finding_of_impaired_cognition_now)
          (not patient_has_finding_of_psychotic_disorder_now)
          (not patient_has_finding_of_mental_disorder_now@@unstable))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (NOT have bulimia nervosa) AND (NOT have anorexia nervosa) AND (NOT have significant cognitive impairment) AND (NOT have a known psychotic disorder) AND (NOT have unstable psychiatric illness...)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_moving_out_of_san_diego_area_during_study_enrollment_24_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is moving out of the San Diego area at any time during the 24-month study enrollment period.","when_to_set_to_false":"Set to false if the patient is not moving out of the San Diego area at any time during the 24-month study enrollment period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is moving out of the San Diego area during the 24-month study enrollment period.","meaning":"Boolean indicating whether the patient is moving out of the San Diego area at any time during the 24-month study enrollment period."} // "must NOT be moving out of the San Diego area for the duration of study enrollment (24 months)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_is_moving_out_of_san_diego_area_during_study_enrollment_24_months)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT be moving out of the San Diego area for the duration of study enrollment (24 months)"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "must not have pregnancy"
(declare-const patient_is_pregnant_inthefuture2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected or planning to be pregnant at any time in the next 2 years.","when_to_set_to_false":"Set to false if the patient is not expected or not planning to be pregnant at any time in the next 2 years.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is expected or planning to be pregnant in the next 2 years.","meaning":"Boolean value indicating whether the patient is expected or planning to be pregnant at any time in the next 2 years."} // "must not be planning to have pregnancy in the 2 year study period"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} // "must not have lactation"
(declare-const patients_lactation_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lactation.","when_to_set_to_false":"Set to false if the patient currently does not have lactation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lactation.","meaning":"Boolean indicating whether the patient currently has lactation now."} // "lactation"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: patients_lactation_is_positive_now is equivalent to patient_is_lactating_now
(assert
  (! (= patients_lactation_is_positive_now patient_is_lactating_now)
     :named REQ6_AUXILIARY0)) ;; "must not have lactation"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must not have pregnancy, must not be planning to have pregnancy in the 2 year study period, or must not have lactation.
(assert
  (! (or (not patient_is_pregnant_now)
         (not patient_is_pregnant_inthefuture2years)
         (not patient_is_lactating_now))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must not have pregnancy, must not be planning to have pregnancy in the 2 year study period, or must not have lactation."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_taking_medication_for_weight_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medication for weight loss.","when_to_set_to_false":"Set to false if the patient is currently not taking any medication for weight loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking medication for weight loss.","meaning":"Boolean indicating whether the patient is currently taking medication for weight loss."} // "NOT be taking medication for weight loss"
(declare-const patient_is_taking_medication_that_may_impair_physical_activity_tolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medication that may impair physical activity tolerance.","when_to_set_to_false":"Set to false if the patient is currently not taking any medication that may impair physical activity tolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking medication that may impair physical activity tolerance.","meaning":"Boolean indicating whether the patient is currently taking medication that may impair physical activity tolerance."} // "NOT be taking medication that may impair physical activity tolerance"
(declare-const patient_is_taking_medication_that_may_impair_physical_activity_performance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medication that may impair physical activity performance.","when_to_set_to_false":"Set to false if the patient is currently not taking any medication that may impair physical activity performance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking medication that may impair physical activity performance.","meaning":"Boolean indicating whether the patient is currently taking medication that may impair physical activity performance."} // "NOT be taking medication that may impair physical activity performance"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (and (not patient_is_taking_medication_for_weight_loss_now)
          (not patient_is_taking_medication_that_may_impair_physical_activity_tolerance_now)
          (not patient_is_taking_medication_that_may_impair_physical_activity_performance_now))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (NOT be taking medication for weight loss) AND (NOT be taking medication that may impair physical activity tolerance) AND (NOT be taking medication that may impair physical activity performance)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_physical_health_problems_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has physical health problems (medical problems).","when_to_set_to_false":"Set to false if the patient currently does not have physical health problems (medical problems).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has physical health problems (medical problems).","meaning":"Boolean indicating whether the patient currently has physical health problems (medical problems)."} // "NOT have medical problems that could make adherence with the study protocol difficult or dangerous"
(declare-const patient_has_finding_of_physical_health_problems_now@@could_make_adherence_with_study_protocol_difficult_or_dangerous Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has physical health problems (medical problems) and those problems could make adherence with the study protocol difficult or dangerous.","when_to_set_to_false":"Set to false if the patient currently has physical health problems (medical problems) but those problems would not make adherence with the study protocol difficult or dangerous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physical health problems could make adherence with the study protocol difficult or dangerous.","meaning":"Boolean indicating whether the patient's physical health problems could make adherence with the study protocol difficult or dangerous."} // "medical problems that could make adherence with the study protocol difficult or dangerous"

(declare-const patient_has_finding_of_mental_health_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychological problems (mental health problems).","when_to_set_to_false":"Set to false if the patient currently does not have psychological problems (mental health problems).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychological problems (mental health problems).","meaning":"Boolean indicating whether the patient currently has psychological problems (mental health problems)."} // "NOT have psychological problems that could make adherence with the study protocol difficult or dangerous"
(declare-const patient_has_finding_of_mental_health_problem_now@@could_make_adherence_with_study_protocol_difficult_or_dangerous Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychological problems (mental health problems) and those problems could make adherence with the study protocol difficult or dangerous.","when_to_set_to_false":"Set to false if the patient currently has psychological problems (mental health problems) but those problems would not make adherence with the study protocol difficult or dangerous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's psychological problems could make adherence with the study protocol difficult or dangerous.","meaning":"Boolean indicating whether the patient's psychological problems could make adherence with the study protocol difficult or dangerous."} // "psychological problems that could make adherence with the study protocol difficult or dangerous"

(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking medications (drug or medicament).","when_to_set_to_false":"Set to false if the patient is currently not taking medications (drug or medicament).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking medications (drug or medicament).","meaning":"Boolean indicating whether the patient is currently taking medications (drug or medicament)."} // "NOT be taking medications that could make adherence with the study protocol difficult or dangerous"
(declare-const patient_is_taking_drug_or_medicament_now@@could_make_adherence_with_study_protocol_difficult_or_dangerous Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking medications (drug or medicament) and those medications could make adherence with the study protocol difficult or dangerous.","when_to_set_to_false":"Set to false if the patient is currently taking medications (drug or medicament) but those medications would not make adherence with the study protocol difficult or dangerous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's medications could make adherence with the study protocol difficult or dangerous.","meaning":"Boolean indicating whether the patient's medications could make adherence with the study protocol difficult or dangerous."} // "medications that could make adherence with the study protocol difficult or dangerous"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_physical_health_problems_now@@could_make_adherence_with_study_protocol_difficult_or_dangerous
         patient_has_finding_of_physical_health_problems_now)
     :named REQ8_AUXILIARY0)) ;; "medical problems that could make adherence with the study protocol difficult or dangerous"

(assert
  (! (=> patient_has_finding_of_mental_health_problem_now@@could_make_adherence_with_study_protocol_difficult_or_dangerous
         patient_has_finding_of_mental_health_problem_now)
     :named REQ8_AUXILIARY1)) ;; "psychological problems that could make adherence with the study protocol difficult or dangerous"

(assert
  (! (=> patient_is_taking_drug_or_medicament_now@@could_make_adherence_with_study_protocol_difficult_or_dangerous
         patient_is_taking_drug_or_medicament_now)
     :named REQ8_AUXILIARY2)) ;; "medications that could make adherence with the study protocol difficult or dangerous"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (and (not patient_has_finding_of_physical_health_problems_now@@could_make_adherence_with_study_protocol_difficult_or_dangerous)
          (not patient_has_finding_of_mental_health_problem_now@@could_make_adherence_with_study_protocol_difficult_or_dangerous)
          (not patient_is_taking_drug_or_medicament_now@@could_make_adherence_with_study_protocol_difficult_or_dangerous))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "NOT have medical problems that could make adherence with the study protocol difficult or dangerous" AND "NOT have psychological problems that could make adherence with the study protocol difficult or dangerous" AND "NOT be taking medications that could make adherence with the study protocol difficult or dangerous"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a bariatric operative procedure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bariatric operative procedure.","meaning":"Boolean indicating whether the patient has ever undergone a bariatric operative procedure in their history."} // "must NOT have a history of bariatric surgery"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_undergone_bariatric_operative_procedure_inthehistory)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have a history of bariatric surgery."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_is_currently_enrolled_in_organized_weight_control_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in an organized weight control program.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in an organized weight control program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in an organized weight control program.","meaning":"Boolean indicating whether the patient is currently enrolled in an organized weight control program."} // "the patient must NOT currently be enrolled in an organized weight control program."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not patient_is_currently_enrolled_in_organized_weight_control_program)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT currently be enrolled in an organized weight control program."
