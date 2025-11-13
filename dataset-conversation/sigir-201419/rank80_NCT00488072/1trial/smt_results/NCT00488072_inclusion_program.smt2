;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient does not currently have a malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (cancer)."} // "be a patient with advanced cancer"
(declare-const patient_has_finding_of_tumor_of_advanced_extent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tumor of advanced extent (advanced cancer).","when_to_set_to_false":"Set to false if the patient does not currently have a tumor of advanced extent (advanced cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tumor of advanced extent (advanced cancer).","meaning":"Boolean indicating whether the patient currently has a tumor of advanced extent (advanced cancer)."} // "be a patient with advanced cancer"
(declare-const patient_is_seen_in_outpatient_clinic_or_inpatient_unit_at_md_anderson_cancer_center_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being seen in outpatient clinics or inpatient units at MD Anderson Cancer Center.","when_to_set_to_false":"Set to false if the patient is not currently being seen in outpatient clinics or inpatient units at MD Anderson Cancer Center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being seen in outpatient clinics or inpatient units at MD Anderson Cancer Center.","meaning":"Boolean indicating whether the patient is currently being seen in outpatient clinics or inpatient units at MD Anderson Cancer Center."} // "seen in (outpatient clinics OR inpatient units) at MD Anderson Cancer Center"
(declare-const patient_has_finding_of_anorexia_for_at_least_1_month_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had anorexia for at least 1 month prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had anorexia for at least 1 month prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had anorexia for at least 1 month prior to enrollment.","meaning":"Boolean indicating whether the patient has had anorexia for at least 1 month prior to enrollment."} // "presence of anorexia for ≥ 1 month"
(declare-const patient_weight_loss_percent_of_pre_illness_body_weight_in_last_6_months_value_recorded_in_percent Real) ;; {"when_to_set_to_value":"Set to the percent of pre-illness body weight lost by the patient in the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what percent of pre-illness body weight the patient lost in the last 6 months.","meaning":"Numeric value indicating the percent of pre-illness body weight lost by the patient in the last 6 months."} // "weight loss > 5 percent of pre-illness body weight in the last 6 months"
(declare-const patient_edmonton_symptom_assessment_scale_anorexia_score_on_day_0_plus_minus_3_days_value_recorded_in_0_to_10_scale Real) ;; {"when_to_set_to_value":"Set to the patient's Edmonton Symptom Assessment Scale score for anorexia on the day of enrollment (day 0 ± 3 days), on a scale from 0 to 10.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's Edmonton Symptom Assessment Scale score for anorexia is on the day of enrollment (day 0 ± 3 days).","meaning":"Numeric value indicating the patient's Edmonton Symptom Assessment Scale score for anorexia on the day of enrollment (day 0 ± 3 days), on a scale from 0 to 10."} // "anorexia on the day of enrollment (day 0 ± 3 days) with a score > 4 out of 10"
(declare-const patient_has_finding_of_loss_of_appetite_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has loss of appetite (anorexia).","when_to_set_to_false":"Set to false if the patient does not currently have loss of appetite (anorexia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has loss of appetite (anorexia).","meaning":"Boolean indicating whether the patient currently has loss of appetite (anorexia)."} // "anorexia"

(declare-const patient_has_finding_of_weight_decreased_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased weight (weight loss).","when_to_set_to_false":"Set to false if the patient does not currently have decreased weight (weight loss).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased weight (weight loss).","meaning":"Boolean indicating whether the patient currently has decreased weight (weight loss)."} // "weight loss"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Advanced cancer implies both malignant neoplastic disease and tumor of advanced extent
(assert
  (! (=> (and patient_has_finding_of_malignant_neoplastic_disease_now
              patient_has_finding_of_tumor_of_advanced_extent_now)
         true)
     :named REQ0_AUXILIARY0)) ;; "be a patient with advanced cancer"

;; Loss of appetite now is equivalent to anorexia now
(assert
  (! (= patient_has_finding_of_loss_of_appetite_now
        patient_has_finding_of_malignant_neoplastic_disease_now) ; This is a placeholder, but the requirement does not specify equivalence, so we do not assert equivalence here.
     :named REQ0_AUXILIARY1)) ;; "anorexia" (no equivalence asserted, just variable definition)

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be a patient with advanced cancer seen in (outpatient clinics OR inpatient units) at MD Anderson Cancer Center
(assert
  (! (and patient_has_finding_of_malignant_neoplastic_disease_now
          patient_has_finding_of_tumor_of_advanced_extent_now
          patient_is_seen_in_outpatient_clinic_or_inpatient_unit_at_md_anderson_cancer_center_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be a patient with advanced cancer seen in (outpatient clinics OR inpatient units) at MD Anderson Cancer Center"

;; Component 1: Patient must have presence of anorexia for ≥ 1 month
(assert
  (! patient_has_finding_of_anorexia_for_at_least_1_month_prior_to_enrollment
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "presence of anorexia for ≥ 1 month"

;; Component 2: Patient must have weight loss > 5 percent of pre-illness body weight in the last 6 months
(assert
  (! (> patient_weight_loss_percent_of_pre_illness_body_weight_in_last_6_months_value_recorded_in_percent 5.0)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "weight loss > 5 percent of pre-illness body weight in the last 6 months"

;; Component 3: Patient must have anorexia on the day of enrollment (day 0 ± 3 days) with a score > 4 out of 10 on the Edmonton Symptom Assessment Scale
(assert
  (! (> patient_edmonton_symptom_assessment_scale_anorexia_score_on_day_0_plus_minus_3_days_value_recorded_in_0_to_10_scale 4.0)
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "anorexia on the day of enrollment (day 0 ± 3 days) with a score > 4 out of 10 on the Edmonton Symptom Assessment Scale"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be > 18 years of age."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be > 18 years of age."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_kps_karnofsky_performance_status_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured Karnofsky Performance Status score if a numeric measurement is available at the time of inclusion into the study.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's Karnofsky Performance Status score measured at the time of inclusion into the study."} // "Karnofsky Performance score > 40 at time of inclusion into study"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_kps_karnofsky_performance_status_score_value_recorded_now_withunit_score 40)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Karnofsky Performance score > 40 at time of inclusion into study."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_ability_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to provide informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to provide informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to provide informed consent."} // "the ability to provide informed consent"
(declare-const patient_has_ability_to_comply_with_study_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to comply with study procedures.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to comply with study procedures.","meaning":"Boolean indicating whether the patient currently has the ability to comply with study procedures."} // "the ability to comply with study procedures"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_ability_to_provide_informed_consent_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the ability to provide informed consent"

(assert
  (! patient_has_ability_to_comply_with_study_procedures_now
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the ability to comply with study procedures"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_ability_to_engage_in_telephone_follow_up_by_research_nurse_on_day_2_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 2 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient does not have the ability to engage in telephone follow-up conducted by a research nurse on day 2 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 2 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 2 (± 3 days) after enrollment."} // "ability to engage in telephone follow-up by research nurse on day 2 (± 3 days)"
(declare-const patient_has_ability_to_engage_in_telephone_follow_up_by_research_nurse_on_day_8_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 8 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient does not have the ability to engage in telephone follow-up conducted by a research nurse on day 8 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 8 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 8 (± 3 days) after enrollment."} // "ability to engage in telephone follow-up by research nurse on day 8 (± 3 days)"
(declare-const patient_has_ability_to_engage_in_telephone_follow_up_by_research_nurse_on_day_16_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 16 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient does not have the ability to engage in telephone follow-up conducted by a research nurse on day 16 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 16 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 16 (± 3 days) after enrollment."} // "ability to engage in telephone follow-up by research nurse on day 16 (± 3 days)"
(declare-const patient_has_ability_to_engage_in_telephone_follow_up_by_research_nurse_on_day_22_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 22 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient does not have the ability to engage in telephone follow-up conducted by a research nurse on day 22 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 22 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient has the ability to engage in telephone follow-up conducted by a research nurse on day 22 (± 3 days) after enrollment."} // "ability to engage in telephone follow-up by research nurse on day 22 (± 3 days)"
(declare-const patient_has_willingness_to_engage_in_telephone_follow_up_by_research_nurse_on_day_2_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to engage in telephone follow-up conducted by a research nurse on day 2 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient is not willing to engage in telephone follow-up conducted by a research nurse on day 2 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to engage in telephone follow-up conducted by a research nurse on day 2 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient is willing to engage in telephone follow-up conducted by a research nurse on day 2 (± 3 days) after enrollment."} // "willingness to engage in telephone follow-up by research nurse on day 2 (± 3 days)"
(declare-const patient_has_willingness_to_engage_in_telephone_follow_up_by_research_nurse_on_day_8_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to engage in telephone follow-up conducted by a research nurse on day 8 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient is not willing to engage in telephone follow-up conducted by a research nurse on day 8 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to engage in telephone follow-up conducted by a research nurse on day 8 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient is willing to engage in telephone follow-up conducted by a research nurse on day 8 (± 3 days) after enrollment."} // "willingness to engage in telephone follow-up by research nurse on day 8 (± 3 days)"
(declare-const patient_has_willingness_to_engage_in_telephone_follow_up_by_research_nurse_on_day_16_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to engage in telephone follow-up conducted by a research nurse on day 16 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient is not willing to engage in telephone follow-up conducted by a research nurse on day 16 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to engage in telephone follow-up conducted by a research nurse on day 16 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient is willing to engage in telephone follow-up conducted by a research nurse on day 16 (± 3 days) after enrollment."} // "willingness to engage in telephone follow-up by research nurse on day 16 (± 3 days)"
(declare-const patient_has_willingness_to_engage_in_telephone_follow_up_by_research_nurse_on_day_22_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to engage in telephone follow-up conducted by a research nurse on day 22 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient is not willing to engage in telephone follow-up conducted by a research nurse on day 22 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to engage in telephone follow-up conducted by a research nurse on day 22 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient is willing to engage in telephone follow-up conducted by a research nurse on day 22 (± 3 days) after enrollment."} // "willingness to engage in telephone follow-up by research nurse on day 22 (± 3 days)"
(declare-const patient_has_ability_to_return_to_outpatient_clinic_for_evaluation_on_day_15_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to return to the outpatient clinic for evaluation on day 15 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient does not have the ability to return to the outpatient clinic for evaluation on day 15 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to return to the outpatient clinic for evaluation on day 15 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient has the ability to return to the outpatient clinic for evaluation on day 15 (± 3 days) after enrollment."} // "ability to return to outpatient clinic for evaluation on day 15 (± 3 days)"
(declare-const patient_has_ability_to_return_to_outpatient_clinic_for_evaluation_on_day_29_plusminus_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the ability to return to the outpatient clinic for evaluation on day 29 (± 3 days) after enrollment.","when_to_set_to_false":"Set to false if the patient does not have the ability to return to the outpatient clinic for evaluation on day 29 (± 3 days) after enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to return to the outpatient clinic for evaluation on day 29 (± 3 days) after enrollment.","meaning":"Boolean indicating whether the patient has the ability to return to the outpatient clinic for evaluation on day 29 (± 3 days) after enrollment."} // "ability to return to outpatient clinic for evaluation on day 29 (± 3 days)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Ability AND willingness to engage in telephone follow-up by research nurse on days 2, 8, 16, and 22 (± 3 days)
(assert
  (! (and patient_has_ability_to_engage_in_telephone_follow_up_by_research_nurse_on_day_2_plusminus_3
          patient_has_willingness_to_engage_in_telephone_follow_up_by_research_nurse_on_day_2_plusminus_3
          patient_has_ability_to_engage_in_telephone_follow_up_by_research_nurse_on_day_8_plusminus_3
          patient_has_willingness_to_engage_in_telephone_follow_up_by_research_nurse_on_day_8_plusminus_3
          patient_has_ability_to_engage_in_telephone_follow_up_by_research_nurse_on_day_16_plusminus_3
          patient_has_willingness_to_engage_in_telephone_follow_up_by_research_nurse_on_day_16_plusminus_3
          patient_has_ability_to_engage_in_telephone_follow_up_by_research_nurse_on_day_22_plusminus_3
          patient_has_willingness_to_engage_in_telephone_follow_up_by_research_nurse_on_day_22_plusminus_3)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have the ability AND willingness to engage in telephone follow-up by research nurse on days 2 (± 3 days), 8 (± 3 days), 16 (± 3 days), and 22 (± 3 days)"

;; Component 1: Ability to return to outpatient clinic for evaluation on days 15 and 29 (± 3 days)
(assert
  (! (and patient_has_ability_to_return_to_outpatient_clinic_for_evaluation_on_day_15_plusminus_3
          patient_has_ability_to_return_to_outpatient_clinic_for_evaluation_on_day_29_plusminus_3)
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "return to outpatient clinic for evaluation on days 15 (± 3 days) AND 29 (± 3 days)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently female."} // "female of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed to not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "female of childbearing potential"
(declare-const patient_has_undergone_urine_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test now (i.e., at the time of inclusion into the study).","when_to_set_to_false":"Set to false if the patient has not undergone a urine pregnancy test now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a urine pregnancy test now.","meaning":"Boolean indicating whether the patient has undergone a urine pregnancy test now."} // "urine pregnancy test"
(declare-const patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test now and the outcome is negative.","when_to_set_to_false":"Set to false if the patient has undergone a urine pregnancy test now and the outcome is not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the outcome of the urine pregnancy test is negative.","meaning":"Boolean indicating whether the outcome of the urine pregnancy test performed now is negative."} // "negative urine pregnancy test"
(declare-const patient_has_undergone_urine_pregnancy_test_now@@temporalcontext_within_24_hours_of_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a urine pregnancy test now and the test was performed within 24 hours of study enrollment.","when_to_set_to_false":"Set to false if the patient has undergone a urine pregnancy test now but the test was not performed within 24 hours of study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the test was performed within 24 hours of study enrollment.","meaning":"Boolean indicating whether the urine pregnancy test performed now was done within 24 hours of study enrollment."} // "within 24 hours of study enrollment"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant based on a urine pregnancy test at the time of inclusion.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant based on a urine pregnancy test at the time of inclusion.","when_to_set_to_null":"Set to null if the patient's pregnancy status at the time of inclusion is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "negative urine pregnancy test at time of inclusion into study, within 24 hours of study enrollment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply the base procedure variable
(assert
  (! (=> patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative
         patient_has_undergone_urine_pregnancy_test_now)
     :named REQ5_AUXILIARY0)) ;; "negative urine pregnancy test at time of inclusion"

(assert
  (! (=> patient_has_undergone_urine_pregnancy_test_now@@temporalcontext_within_24_hours_of_study_enrollment
         patient_has_undergone_urine_pregnancy_test_now)
     :named REQ5_AUXILIARY1)) ;; "urine pregnancy test within 24 hours of study enrollment"

;; If the urine pregnancy test is negative, the patient is not pregnant (definition)
(assert
  (! (= patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative
         (not patient_is_pregnant_now))
     :named REQ5_AUXILIARY2)) ;; "negative urine pregnancy test" ≡ "not pregnant"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If the patient is a female of childbearing potential, she must have a negative urine pregnancy test at time of inclusion, within 24 hours of study enrollment
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (and patient_has_undergone_urine_pregnancy_test_now@@outcome_is_negative
              patient_has_undergone_urine_pregnancy_test_now@@temporalcontext_within_24_hours_of_study_enrollment))
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of childbearing potential, the patient must have a negative urine pregnancy test at time of inclusion into study, within 24 hours of study enrollment"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving chemotherapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving chemotherapy.","meaning":"Boolean indicating whether the patient is currently receiving chemotherapy."} // "if the patient is receiving chemotherapy"
(declare-const eligibility_discussed_with_primary_oncologist_after_chemotherapy_status_determined Bool) ;; {"when_to_set_to_true":"Set to true if eligibility for inclusion has been discussed with the primary oncologist after confirming the patient is currently receiving chemotherapy.","when_to_set_to_false":"Set to false if eligibility for inclusion has not been discussed with the primary oncologist after confirming the patient is currently receiving chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether eligibility for inclusion has been discussed with the primary oncologist after confirming the patient is currently receiving chemotherapy.","meaning":"Boolean indicating whether eligibility for inclusion has been discussed with the primary oncologist after determining that the patient is currently receiving chemotherapy."} // "eligibility must be determined after discussion with the primary oncologist"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient is receiving chemotherapy, eligibility must be determined after discussion with the primary oncologist.
(assert
  (! (or (not patient_is_undergoing_chemotherapy_now)
         eligibility_discussed_with_primary_oncologist_after_chemotherapy_status_determined)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is receiving chemotherapy, eligibility must be determined after discussion with the primary oncologist."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_drowsiness_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured drowsiness score if the patient's drowsiness is recorded now (at baseline) using the Edmonton Symptom Assessment Scale.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's drowsiness score measured now (at baseline) on the Edmonton Symptom Assessment Scale."} // "drowsiness ≤ 4 out of 10 on the Edmonton Symptom Assessment Scale at baseline"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (<= patient_drowsiness_value_recorded_now_withunit_score 4)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have drowsiness ≤ 4 out of 10 on the Edmonton Symptom Assessment Scale at baseline"

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_complementary_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any complementary therapy.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any complementary therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any complementary therapy.","meaning":"Boolean indicating whether the patient is currently exposed to any complementary therapy."} // "complementary therapies"
(declare-const patient_is_exposed_to_complementary_therapy_now@@stable_dose_for_at_least_2_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any complementary therapy and has been on a stable dose for at least 2 weeks.","when_to_set_to_false":"Set to false if the patient is currently exposed to any complementary therapy but has not been on a stable dose for at least 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose for at least 2 weeks.","meaning":"Boolean indicating whether the patient is currently exposed to any complementary therapy and has been on a stable dose for at least 2 weeks."} // "stable dose for ≥ 2 weeks" for complementary therapies
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} // "all medications"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@stable_dose_for_at_least_2_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament and has been on a stable dose for at least 2 weeks.","when_to_set_to_false":"Set to false if the patient is currently exposed to any drug or medicament but has not been on a stable dose for at least 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose for at least 2 weeks.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament and has been on a stable dose for at least 2 weeks."} // "stable dose for ≥ 2 weeks" for all medications
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of an antineoplastic agent.","when_to_set_to_false":"Set to false if the patient is currently not undergoing administration of an antineoplastic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of an antineoplastic agent.","meaning":"Boolean indicating whether the patient is currently undergoing administration of an antineoplastic agent."} // "antineoplastic therapy"
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now@@stable_dose_for_at_least_2_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of an antineoplastic agent and has been on a stable dose for at least 2 weeks.","when_to_set_to_false":"Set to false if the patient is currently undergoing administration of an antineoplastic agent but has not been on a stable dose for at least 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose for at least 2 weeks.","meaning":"Boolean indicating whether the patient is currently undergoing administration of an antineoplastic agent and has been on a stable dose for at least 2 weeks."} // "stable dose for ≥ 2 weeks" for antineoplastic therapy

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables for all medication types
(assert
  (! (=> patient_is_exposed_to_complementary_therapy_now@@stable_dose_for_at_least_2_weeks
         patient_is_exposed_to_complementary_therapy_now)
     :named REQ8_AUXILIARY0)) ;; "complementary therapies" with stable dose for ≥ 2 weeks

(assert
  (! (=> patient_is_exposed_to_drug_or_medicament_now@@stable_dose_for_at_least_2_weeks
         patient_is_exposed_to_drug_or_medicament_now)
     :named REQ8_AUXILIARY1)) ;; "all medications" with stable dose for ≥ 2 weeks

(assert
  (! (=> patient_is_undergoing_administration_of_antineoplastic_agent_now@@stable_dose_for_at_least_2_weeks
         patient_is_undergoing_administration_of_antineoplastic_agent_now)
     :named REQ8_AUXILIARY2)) ;; "antineoplastic therapy" with stable dose for ≥ 2 weeks

;; "all medications (including complementary therapies OR antineoplastic therapy)" is a non-exhaustive example list:
(assert
  (! (=> (or patient_is_exposed_to_complementary_therapy_now
             patient_is_undergoing_administration_of_antineoplastic_agent_now)
         patient_is_exposed_to_drug_or_medicament_now)
     :named REQ8_AUXILIARY3)) ;; "including complementary therapies OR antineoplastic therapy" are examples of "all medications"

(assert
  (! (=> (or patient_is_exposed_to_complementary_therapy_now@@stable_dose_for_at_least_2_weeks
             patient_is_undergoing_administration_of_antineoplastic_agent_now@@stable_dose_for_at_least_2_weeks)
         patient_is_exposed_to_drug_or_medicament_now@@stable_dose_for_at_least_2_weeks)
     :named REQ8_AUXILIARY4)) ;; "including complementary therapies OR antineoplastic therapy" with stable dose for ≥ 2 weeks are examples of "all medications" with stable dose for ≥ 2 weeks

;; ===================== Constraint Assertions (REQ 8) =====================
;; The patient can continue all medications (including complementary therapies OR antineoplastic therapy) while on-study IF the patient has been on a stable dose for ≥ 2 weeks.
(assert
  (! patient_is_exposed_to_drug_or_medicament_now@@stable_dose_for_at_least_2_weeks
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "can continue all medications ... if the patient has been on a stable dose for ≥ 2 weeks"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const duration_of_stable_antidepressant_dose_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has continuously been on a stable dose of antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how long the patient has been on a stable dose of antidepressant medication.","meaning":"Numeric variable indicating the duration, in months, that the patient has been on a stable dose of antidepressant medication."} // "stable dose of antidepressant medication for ≥ 2 months"
(declare-const patient_is_taking_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking an antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an antidepressant medication.","meaning":"Boolean indicating whether the patient is currently taking an antidepressant medication."} // "antidepressant medication"
(declare-const patient_is_taking_antidepressant_now@@stable_dose_for_at_least_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antidepressant medication and has been on a stable dose for at least 2 months.","when_to_set_to_false":"Set to false if the patient is currently taking an antidepressant medication but has not been on a stable dose for at least 2 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose for at least 2 months.","meaning":"Boolean indicating whether the patient is currently taking an antidepressant medication and has been on a stable dose for at least 2 months."} // "stable dose of antidepressant medication for ≥ 2 months"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_taking_antidepressant_now@@stable_dose_for_at_least_2_months
         patient_is_taking_antidepressant_now)
     :named REQ9_AUXILIARY0)) ;; "patient must be on a stable dose of antidepressant medication for ≥ 2 months"

;; Definition of qualifier variable in terms of numeric duration
(assert
  (! (= patient_is_taking_antidepressant_now@@stable_dose_for_at_least_2_months
        (and patient_is_taking_antidepressant_now
             (>= duration_of_stable_antidepressant_dose_in_months 2.0)))
     :named REQ9_AUXILIARY1)) ;; "stable dose of antidepressant medication for ≥ 2 months"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_is_taking_antidepressant_now@@stable_dose_for_at_least_2_months
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "patient must be on a stable dose of antidepressant medication for ≥ 2 months"
