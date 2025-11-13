;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as male.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as female.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged ≥ 18 years" and "be aged ≤ 50 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 50.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male) OR (be female AND be aged ≥ 18 years AND be aged ≤ 50 years))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_able_to_understand_informed_consent_document_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand the informed consent document.","when_to_set_to_false":"Set to false if the patient is currently not able to understand the informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand the informed consent document.","meaning":"Boolean indicating whether the patient is currently able to understand the informed consent document."} // "be able to understand the informed consent document"
(declare-const patient_is_willing_to_sign_informed_consent_document_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to sign the informed consent document.","when_to_set_to_false":"Set to false if the patient is currently not willing to sign the informed consent document.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to sign the informed consent document.","meaning":"Boolean indicating whether the patient is currently willing to sign the informed consent document."} // "be willing to sign the informed consent document"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_able_to_understand_informed_consent_document_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to understand the informed consent document."

(assert
  (! patient_is_willing_to_sign_informed_consent_document_now
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to sign the informed consent document."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_is_willing_to_participate_in_all_aspects_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to participate in all aspects of the study.","when_to_set_to_false":"Set to false if the patient does not express willingness to participate in all aspects of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to participate in all aspects of the study.","meaning":"Boolean indicating whether the patient is willing to participate in all aspects of the study."} // "be willing to participate in all aspects of the study"
(declare-const patient_is_able_to_participate_in_all_aspects_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to participate in all aspects of the study.","when_to_set_to_false":"Set to false if the patient is not able to participate in all aspects of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to participate in all aspects of the study.","meaning":"Boolean indicating whether the patient is able to participate in all aspects of the study."} // "be able to participate in all aspects of the study"
(declare-const patient_agrees_to_comply_with_all_study_requirements_for_duration_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to comply with all study requirements for the duration of the study.","when_to_set_to_false":"Set to false if the patient does not agree to comply with all study requirements for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to comply with all study requirements for the duration of the study.","meaning":"Boolean indicating whether the patient agrees to comply with all study requirements for the duration of the study."} // "agree to comply with all study requirements for the duration of the study"
(declare-const patient_has_reliable_transportation_to_attend_all_followup_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient has reliable transportation to attend all follow-up visits.","when_to_set_to_false":"Set to false if the patient does not have reliable transportation to attend all follow-up visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has reliable transportation to attend all follow-up visits.","meaning":"Boolean indicating whether the patient has reliable transportation to attend all follow-up visits."} // "have reliable transportation to attend all follow-up visits"
(declare-const patient_has_sufficient_time_to_attend_all_followup_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient has sufficient time to attend all follow-up visits.","when_to_set_to_false":"Set to false if the patient does not have sufficient time to attend all follow-up visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has sufficient time to attend all follow-up visits.","meaning":"Boolean indicating whether the patient has sufficient time to attend all follow-up visits."} // "have sufficient time to attend all follow-up visits"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 1: "To be included, the patient must be able to participate in all aspects of the study."
(assert
  (! patient_is_able_to_participate_in_all_aspects_of_study
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m^2 if a current measurement is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} // "body mass index"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} // "diabetes mellitus"
(declare-const patient_has_diagnosis_of_dyslipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dyslipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dyslipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dyslipidemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dyslipidemia."} // "dyslipidemia"
(declare-const patient_has_diagnosis_of_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertension."} // "hypertension"
(declare-const patient_has_diagnosis_of_obstructive_sleep_apnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of obstructive sleep apnea.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of obstructive sleep apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of obstructive sleep apnea.","meaning":"Boolean indicating whether the patient currently has a diagnosis of obstructive sleep apnea."} // "obstructive sleep apnea"
(declare-const patient_has_at_least_one_comorbid_disease_expected_to_improve_with_weight_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one co-morbid disease that is expected to improve with weight loss.","when_to_set_to_false":"Set to false if the patient currently does not have any co-morbid disease expected to improve with weight loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has at least one co-morbid disease expected to improve with weight loss.","meaning":"Boolean indicating whether the patient currently has at least one co-morbid disease expected to improve with weight loss."} // "have at least one co-morbid disease that is expected to improve with weight loss"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples: listed diseases imply the umbrella
(assert
  (! (=> (or patient_has_diagnosis_of_hypertension_now
             patient_has_diagnosis_of_dyslipidemia_now
             patient_has_diagnosis_of_obstructive_sleep_apnea_now
             patient_has_diagnosis_of_diabetes_mellitus_now)
         patient_has_at_least_one_comorbid_disease_expected_to_improve_with_weight_loss_now)
     :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (hypertension, dyslipidemia, obstructive sleep apnea, diabetes mellitus)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; BMI 40-45 OR (BMI 30-39.9 AND at least one co-morbid disease expected to improve with weight loss)
(assert
  (! (or (and (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 40.0)
              (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 45.0))
         (and (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30.0)
              (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 39.9)
              patient_has_at_least_one_comorbid_disease_expected_to_improve_with_weight_loss_now))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have a body mass index ≥ 40 AND have a body mass index ≤ 45) OR (have a body mass index ≥ 30 AND have a body mass index ≤ 39.9 AND have at least one co-morbid disease ... that is expected to improve with weight loss))."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_is_fully_ambulatory_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to walk independently without any assistance.","when_to_set_to_false":"Set to false if the patient is currently not able to walk independently without assistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently fully ambulatory.","meaning":"Boolean indicating whether the patient is currently fully ambulatory (able to walk independently without assistance)."} // "be fully ambulatory"
(declare-const patient_has_chronic_reliance_on_walking_aids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic reliance on walking aids (e.g., crutches, walkers, wheelchair).","when_to_set_to_false":"Set to false if the patient currently does not have chronic reliance on walking aids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic reliance on walking aids.","meaning":"Boolean indicating whether the patient currently has chronic reliance on walking aids (such as crutches, walkers, or wheelchair)."} // "NOT have chronic reliance on walking aids (with non-exhaustive examples (crutches, walkers, wheelchair))"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term: if patient uses crutches, walkers, or wheelchair, then has chronic reliance on walking aids
(declare-const patient_has_chronic_reliance_on_crutches_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic reliance on crutches.","when_to_set_to_false":"Set to false if the patient currently does not have chronic reliance on crutches.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic reliance on crutches.","meaning":"Boolean indicating whether the patient currently has chronic reliance on crutches."} // "crutches"
(declare-const patient_has_chronic_reliance_on_walker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic reliance on a walker.","when_to_set_to_false":"Set to false if the patient currently does not have chronic reliance on a walker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic reliance on a walker.","meaning":"Boolean indicating whether the patient currently has chronic reliance on a walker."} // "walkers"
(declare-const patient_has_chronic_reliance_on_wheelchair_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic reliance on a wheelchair.","when_to_set_to_false":"Set to false if the patient currently does not have chronic reliance on a wheelchair.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic reliance on a wheelchair.","meaning":"Boolean indicating whether the patient currently has chronic reliance on a wheelchair."} // "wheelchair"

(assert
  (! (=> (or patient_has_chronic_reliance_on_crutches_now
             patient_has_chronic_reliance_on_walker_now
             patient_has_chronic_reliance_on_wheelchair_now)
         patient_has_chronic_reliance_on_walking_aids_now)
     :named REQ4_AUXILIARY0)) ;; Non-exhaustive examples imply umbrella

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: patient must be fully ambulatory
(assert
  (! patient_is_fully_ambulatory_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be fully ambulatory"

;; Component 1: patient must NOT have chronic reliance on walking aids
(assert
  (! (not patient_has_chronic_reliance_on_walking_aids_now)
     :named REQ4_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT have chronic reliance on walking aids (with non-exhaustive examples (crutches, walkers, wheelchair))"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patients_health_status_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's health status is currently considered normal (sufficient and stable).","when_to_set_to_false":"Set to false if the patient's health status is currently not considered normal (not sufficient and/or not stable).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's health status is currently normal.","meaning":"Boolean indicating whether the patient's health status is currently normal (sufficient and stable)."} // "have sufficient and stable medical health"
(declare-const patients_health_status_is_normal_now@@evaluated_by_principal_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the determination of the patient's health status as normal (sufficient and stable) is made by the principal investigator.","when_to_set_to_false":"Set to false if the determination is not made by the principal investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the principal investigator performed the evaluation.","meaning":"Boolean indicating whether the patient's health status assessment is performed by the principal investigator."} // "as evaluated by the principal investigator"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patients_health_status_is_normal_now@@evaluated_by_principal_investigator
         patients_health_status_is_normal_now)
     :named REQ5_AUXILIARY0)) ;; "as evaluated by the principal investigator" implies "have sufficient and stable medical health"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patients_health_status_is_normal_now@@evaluated_by_principal_investigator
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have sufficient and stable medical health (as evaluated by the principal investigator)"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_primary_care_physician_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a primary care physician.","when_to_set_to_false":"Set to false if the patient currently does not have a primary care physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a primary care physician.","meaning":"Boolean indicating whether the patient currently has a primary care physician."} // "must have a primary care physician"
(declare-const patient_has_primary_care_physician_now@@will_manage_co_morbid_conditions_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's primary care physician will manage the patient for any co-morbid conditions throughout the study.","when_to_set_to_false":"Set to false if the patient's primary care physician will not manage the patient for any co-morbid conditions throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's primary care physician will manage the patient for any co-morbid conditions throughout the study.","meaning":"Boolean indicating whether the primary care physician will manage the patient for any co-morbid conditions throughout the study."} // "who will manage the patient for any co-morbid conditions throughout the study"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_primary_care_physician_now@@will_manage_co_morbid_conditions_throughout_study
         patient_has_primary_care_physician_now)
     :named REQ6_AUXILIARY0)) ;; "who will manage the patient for any co-morbid conditions throughout the study" implies "must have a primary care physician"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_primary_care_physician_now@@will_manage_co_morbid_conditions_throughout_study
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have a primary care physician who will manage the patient for any co-morbid conditions throughout the study"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_failed_standard_obesity_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever failed standard obesity therapy (diet therapy, exercise therapy, behavior modification therapy, and pharmacologic agent therapy, either alone or in combination) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never failed standard obesity therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever failed standard obesity therapy in the past.","meaning":"Boolean indicating whether the patient has ever failed standard obesity therapy in the past."} // "must have failed standard obesity therapy (diet therapy, exercise therapy, behavior modification therapy, and pharmacologic agent therapy, either alone or in combination)"
(declare-const patient_has_failed_standard_obesity_therapy_inthehistory@@failure_assessed_at_baseline_by_study_team_interview Bool) ;; {"when_to_set_to_true":"Set to true if the patient's failure of standard obesity therapy was assessed at baseline by an interview with a member of the study team.","when_to_set_to_false":"Set to false if the patient's failure of standard obesity therapy was not assessed at baseline by an interview with a member of the study team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the failure of standard obesity therapy was assessed at baseline by an interview with a member of the study team.","meaning":"Boolean indicating whether the failure of standard obesity therapy was assessed at baseline by interview with a study team member."} // "as assessed by an interview with a member of the study team at baseline"
(declare-const patient_has_undergone_drug_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone pharmacologic agent therapy (drug therapy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone pharmacologic agent therapy (drug therapy) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone pharmacologic agent therapy (drug therapy) in the past.","meaning":"Boolean indicating whether the patient has a history of pharmacologic agent therapy (drug therapy)."} // "pharmacologic agent therapy"
(declare-const patient_has_undergone_drug_therapy_inthehistory@@failure_assessed_at_baseline_by_study_team_interview Bool) ;; {"when_to_set_to_true":"Set to true if the patient's failure of pharmacologic agent therapy was assessed at baseline by an interview with a member of the study team.","when_to_set_to_false":"Set to false if the patient's failure of pharmacologic agent therapy was not assessed at baseline by an interview with a member of the study team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the failure of pharmacologic agent therapy was assessed at baseline by an interview with a member of the study team.","meaning":"Boolean indicating whether the failure of pharmacologic agent therapy was assessed at baseline by interview with a study team member."} // "pharmacologic agent therapy failure assessed at baseline by study team interview"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_failed_standard_obesity_therapy_inthehistory@@failure_assessed_at_baseline_by_study_team_interview
         patient_has_failed_standard_obesity_therapy_inthehistory)
     :named REQ7_AUXILIARY0)) ;; "failure assessed at baseline by study team interview" implies "failed standard obesity therapy"

;; Qualifier variable for drug therapy failure implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_drug_therapy_inthehistory@@failure_assessed_at_baseline_by_study_team_interview
         patient_has_undergone_drug_therapy_inthehistory)
     :named REQ7_AUXILIARY1)) ;; "drug therapy failure assessed at baseline by study team interview" implies "undergone drug therapy"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_failed_standard_obesity_therapy_inthehistory@@failure_assessed_at_baseline_by_study_team_interview
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have failed standard obesity therapy as assessed by interview at baseline"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_agrees_to_refrain_from_reconstructive_surgery_that_may_affect_body_weight_during_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient explicitly agrees to refrain from any reconstructive surgery that may affect body weight during the trial period.","when_to_set_to_false":"Set to false if the patient does not agree or refuses to refrain from reconstructive surgery that may affect body weight during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to refrain from reconstructive surgery that may affect body weight during the trial period.","meaning":"Boolean indicating whether the patient agrees to refrain from any reconstructive surgery that may affect body weight during the trial period."} // "must agree to refrain from any type of reconstructive surgery that may affect body weight during the trial"
(declare-const patient_will_undergo_reconstruction_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or plans to undergo any reconstructive procedure at any time in the future (including during the trial).","when_to_set_to_false":"Set to false if the patient is not scheduled and does not plan to undergo any reconstructive procedure at any time in the future (including during the trial).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo any reconstructive procedure in the future.","meaning":"Boolean indicating whether the patient will undergo any reconstructive procedure in the future."} // "reconstructive surgery"
(declare-const patient_will_undergo_reconstruction_procedure_inthefuture@@may_affect_body_weight Bool) ;; {"when_to_set_to_true":"Set to true if the reconstructive procedure is of a type that may affect body weight.","when_to_set_to_false":"Set to false if the reconstructive procedure is not of a type that may affect body weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reconstructive procedure may affect body weight.","meaning":"Boolean indicating whether the reconstructive procedure may affect body weight."} // "reconstructive surgery that may affect body weight"
(declare-const patient_will_undergo_reconstruction_procedure_inthefuture@@occurs_during_trial Bool) ;; {"when_to_set_to_true":"Set to true if the reconstructive procedure is scheduled to occur during the trial period.","when_to_set_to_false":"Set to false if the reconstructive procedure is not scheduled to occur during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reconstructive procedure occurs during the trial period.","meaning":"Boolean indicating whether the reconstructive procedure occurs during the trial period."} // "during the trial"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples: mammoplasty, abdominal lipoplasty, liposuction are examples of reconstructive surgery that may affect body weight, but other types may also qualify.
;; No umbrella equivalence needed, as the requirement is about agreement to refrain from any type.

;; If a reconstructive procedure is planned, and it may affect body weight, and it occurs during the trial, then the patient does NOT agree to refrain.
(assert
  (! (=> (and patient_will_undergo_reconstruction_procedure_inthefuture
              patient_will_undergo_reconstruction_procedure_inthefuture@@may_affect_body_weight
              patient_will_undergo_reconstruction_procedure_inthefuture@@occurs_during_trial)
         (not patient_agrees_to_refrain_from_reconstructive_surgery_that_may_affect_body_weight_during_trial))
     :named REQ8_AUXILIARY0)) ;; "must agree to refrain from any type of reconstructive surgery that may affect body weight during the trial"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_agrees_to_refrain_from_reconstructive_surgery_that_may_affect_body_weight_during_trial
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must agree to refrain from any type of reconstructive surgery that may affect body weight during the trial"
