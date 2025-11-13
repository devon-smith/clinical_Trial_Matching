;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."}

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@diagnosed_by_histological_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplastic disease (cancer) was established by histological examination.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplastic disease (cancer) was not established by histological examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was established by histological examination.","meaning":"Boolean indicating whether the patient's diagnosis of malignant neoplastic disease (cancer) was established by histological examination."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable ("diagnosed by histological diagnosis" implies diagnosis of cancer)
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@diagnosed_by_histological_diagnosis
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have a histological diagnosis of cancer."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have a histological diagnosis of cancer
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now@@diagnosed_by_histological_diagnosis
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a histological diagnosis of cancer."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const fatigue_numerical_rating_value_recorded_previous_24_hours_withunit_0_to_10_scale Real) ;; {"when_to_set_to_value":"Set to the value reported by the patient for fatigue on a 0 to 10 scale during the previous 24 hours.","when_to_set_to_null":"Set to null if the patient's fatigue rating on a 0 to 10 scale during the previous 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's self-reported fatigue rating on a 0 to 10 scale, recorded during the previous 24 hours."} // "the patient must rate fatigue on a numerical scale during the previous 24 hours as (numerical rating ≥ 4 on a 0 to 10 scale (0 = no fatigue AND 10 = worst possible fatigue))"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= fatigue_numerical_rating_value_recorded_previous_24_hours_withunit_0_to_10_scale 4)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must rate fatigue on a numerical scale during the previous 24 hours as (numerical rating ≥ 4 on a 0 to 10 scale (0 = no fatigue AND 10 = worst possible fatigue))"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_fatigue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fatigue.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fatigue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fatigue.","meaning":"Boolean indicating whether the patient currently has fatigue."} // "the patient must describe fatigue as (being present every day AND being present for most of the day)"
(declare-const patient_has_finding_of_fatigue_now@@present_every_day_and_most_of_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fatigue and the fatigue is present every day and for most of the day.","when_to_set_to_false":"Set to false if the patient currently has fatigue but it is not present every day and/or not for most of the day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fatigue is present every day and for most of the day.","meaning":"Boolean indicating whether the patient's current fatigue is present every day and for most of the day."} // "the patient must describe fatigue as (being present every day AND being present for most of the day)"
(declare-const patient_fatigue_value_recorded_now_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks if the duration of the patient's current fatigue is known and recorded.","when_to_set_to_null":"Set to null if the duration in weeks of the patient's current fatigue is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in weeks of the patient's current fatigue."} // "duration of fatigue ≥ 2 weeks"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_fatigue_now@@present_every_day_and_most_of_day
         patient_has_finding_of_fatigue_now)
     :named REQ2_AUXILIARY0)) ;; "the patient must describe fatigue as (being present every day AND being present for most of the day)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Fatigue must be present every day and for most of the day
(assert
  (! patient_has_finding_of_fatigue_now@@present_every_day_and_most_of_day
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must describe fatigue as (being present every day AND being present for most of the day)"

;; Component 1: Duration of fatigue must be at least 2 weeks
(assert
  (! (>= patient_fatigue_value_recorded_now_withunit_weeks 2)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "duration of fatigue ≥ 2 weeks"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_delirium_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured Memorial delirium assessment scale score if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such score measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's Memorial delirium assessment scale score recorded now."} // "the patient must have a Memorial delirium assessment scale score ≤ 13."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (<= patient_delirium_value_recorded_now_withunit_score 13)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a Memorial delirium assessment scale score ≤ 13."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_blood_drawn_for_hemoglobin_at_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has blood drawn for hemoglobin measurement at the time of enrollment.","when_to_set_to_false":"Set to false if the patient does not have blood drawn for hemoglobin measurement at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has blood drawn for hemoglobin measurement at the time of enrollment.","meaning":"Boolean indicating whether the patient has blood drawn for hemoglobin measurement at the time of enrollment."} // "If the patient has NOT had blood drawn for a hemoglobin level in the previous 2 weeks, one hemoglobin level must be performed to determine eligibility."
(declare-const patient_has_blood_drawn_for_hemoglobin_in_the_past_2_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had blood drawn for hemoglobin measurement within the past 2 weeks prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had blood drawn for hemoglobin measurement within the past 2 weeks prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had blood drawn for hemoglobin measurement within the past 2 weeks prior to enrollment.","meaning":"Boolean indicating whether the patient has had blood drawn for hemoglobin measurement within the past 2 weeks prior to enrollment."} // "If the patient has NOT had blood drawn for a hemoglobin level in the previous 2 weeks, one hemoglobin level must be performed to determine eligibility."
(declare-const patient_hemoglobin_finding_value_recorded_at_enrollment_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured hemoglobin value in grams per deciliter if a measurement was performed at the time of enrollment.","when_to_set_to_null":"Set to null if no hemoglobin measurement was performed at the time of enrollment or the value is unavailable.","meaning":"Numeric value of the patient's hemoglobin level measured at the time of enrollment, in grams per deciliter."} // "hemoglobin level ≥ 8 grams per deciliter within 2 weeks of enrollment"
(declare-const patient_hemoglobin_finding_value_recorded_inthepast2weeks_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured hemoglobin value in grams per deciliter if a measurement was performed within the past 2 weeks prior to enrollment.","when_to_set_to_null":"Set to null if no hemoglobin measurement was performed within the past 2 weeks or the value is unavailable.","meaning":"Numeric value of the patient's hemoglobin level measured within the past 2 weeks, in grams per deciliter."} // "hemoglobin level ≥ 8 grams per deciliter within 2 weeks of enrollment"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must have a hemoglobin level ≥ 8 grams per deciliter within 2 weeks of enrollment.
(assert
  (! (or
        (and patient_has_blood_drawn_for_hemoglobin_in_the_past_2_weeks
             (>= patient_hemoglobin_finding_value_recorded_inthepast2weeks_withunit_grams_per_deciliter 8.0))
        (and patient_has_blood_drawn_for_hemoglobin_at_enrollment
             (>= patient_hemoglobin_finding_value_recorded_at_enrollment_withunit_grams_per_deciliter 8.0)))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a hemoglobin level ≥ 8 grams per deciliter within 2 weeks of enrollment."

;; Component 1: If the patient has NOT had blood drawn for a hemoglobin level in the previous 2 weeks, one hemoglobin level must be performed to determine eligibility.
(assert
  (! (or patient_has_blood_drawn_for_hemoglobin_in_the_past_2_weeks
         patient_has_blood_drawn_for_hemoglobin_at_enrollment)
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "If the patient has NOT had blood drawn for a hemoglobin level in the previous 2 weeks, one hemoglobin level must be performed to determine eligibility."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_been_evaluated_for_treatment_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been evaluated for treatment of anemia at the current time.","when_to_set_to_false":"Set to false if the patient has not been evaluated for treatment of anemia at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been evaluated for treatment of anemia at the current time.","meaning":"Boolean indicating whether the patient has been evaluated for treatment of anemia at the current time."} // "the patient must be evaluated for treatment of anemia"
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anemia.","meaning":"Boolean indicating whether the patient currently has a clinical finding of anemia."} // "anemia"
(declare-const patient_has_finding_of_hemoglobin_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hemoglobin level.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hemoglobin level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hemoglobin level.","meaning":"Boolean indicating whether the patient currently has a clinical finding of hemoglobin level."} // "hemoglobin level"
;; Reusable variables

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; If the patient has a hemoglobin value < 9 g/dL (at enrollment or in past 2 weeks), this implies anemia now
(assert
  (! (=> (or (< patient_hemoglobin_finding_value_recorded_at_enrollment_withunit_grams_per_deciliter 9.0)
             (< patient_hemoglobin_finding_value_recorded_inthepast2weeks_withunit_grams_per_deciliter 9.0))
         patient_has_finding_of_anemia_now)
     :named REQ6_AUXILIARY0)) ;; "if the patient has a hemoglobin level < 9 grams per deciliter" implies anemia

;; If the patient has a hemoglobin value (at enrollment or in past 2 weeks), this implies hemoglobin finding now
(assert
  (! (=> (or (not (= patient_hemoglobin_finding_value_recorded_at_enrollment_withunit_grams_per_deciliter 0.0))
             (not (= patient_hemoglobin_finding_value_recorded_inthepast2weeks_withunit_grams_per_deciliter 0.0)))
         patient_has_finding_of_hemoglobin_finding_now)
     :named REQ6_AUXILIARY1)) ;; "hemoglobin level" finding present if any value recorded

;; ===================== Constraint Assertions (REQ 6) =====================
;; If the patient has a hemoglobin value < 9 g/dL (at enrollment or in past 2 weeks), the patient must be evaluated for treatment of anemia
(assert
  (! (=> (or (< patient_hemoglobin_finding_value_recorded_at_enrollment_withunit_grams_per_deciliter 9.0)
             (< patient_hemoglobin_finding_value_recorded_inthepast2weeks_withunit_grams_per_deciliter 9.0))
         patient_has_been_evaluated_for_treatment_of_anemia_now)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient has a hemoglobin level < 9 grams per deciliter, the patient must be evaluated for treatment of anemia"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_able_to_sign_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to sign the informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to sign the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to sign the informed consent.","meaning":"Boolean indicating whether the patient is currently able to sign the informed consent."} // "the patient must be able to ... sign the informed consent"
(declare-const patient_is_able_to_understand_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand the informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to understand the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand the informed consent.","meaning":"Boolean indicating whether the patient is currently able to understand the informed consent."} // "the patient must be able to understand ... the informed consent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (and patient_is_able_to_understand_informed_consent_now
          patient_is_able_to_sign_informed_consent_now)
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to understand AND sign the informed consent"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_long_term_systemic_steroid_user_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on chronic systemic steroid therapy.","when_to_set_to_false":"Set to false if the patient is currently not on chronic systemic steroid therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on chronic systemic steroid therapy.","meaning":"Boolean indicating whether the patient is currently on chronic systemic steroid therapy."} // "concurrent use of chronic systemic steroid therapy"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: To be included, the patient must NOT have concurrent use of chronic systemic steroid therapy (defined as currently on chronic systemic steroid therapy for > 1 week).
(assert
  (! (not patient_has_finding_of_long_term_systemic_steroid_user_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have concurrent use of chronic systemic steroid therapy (defined as currently on chronic systemic steroid therapy for > 1 week)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const morphine_equivalent_dose_value_recorded_past_2_weeks_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the value of the morphine equivalent dose in milligrams recorded for the patient in the past 2 weeks.","when_to_set_to_null":"Set to null if the morphine equivalent dose in the past 2 weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the morphine equivalent dose (in milligrams) recorded for the patient in the past 2 weeks."} // "no change in the morphine equivalent dose of 30% in the past 2 weeks"
(declare-const patient_has_symptoms_of_symptoms_of_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of depression.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of depression.","meaning":"Boolean indicating whether the patient currently has symptoms of depression."} // "depression symptoms"
(declare-const patient_has_symptoms_of_symptoms_of_depression_now@@controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of depression and those symptoms are controlled (no change in the dose of antidepressant medication in the past 2 weeks).","when_to_set_to_false":"Set to false if the patient currently has symptoms of depression and those symptoms are not controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's depression symptoms are controlled.","meaning":"Boolean indicating whether the patient's current depression symptoms are controlled."} // "depression symptoms must be controlled (defined as no change in the dose of antidepressant medication in the past 2 weeks)"
(declare-const patient_is_exposed_to_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antidepressant medication.","meaning":"Boolean indicating whether the patient is currently exposed to antidepressant medication."} // "antidepressant medication"
(declare-const patients_pain_observable_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have pain symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain symptoms.","meaning":"Boolean indicating whether the patient currently has pain symptoms."} // "pain symptoms"
(declare-const patients_pain_observable_is_positive_now@@controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain symptoms and those symptoms are controlled (no change in morphine equivalent dose of 30% in the past 2 weeks).","when_to_set_to_false":"Set to false if the patient currently has pain symptoms and those symptoms are not controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pain symptoms are controlled.","meaning":"Boolean indicating whether the patient's current pain symptoms are controlled."} // "pain symptoms must be controlled (defined as no change in morphine equivalent dose of 30% in the past 2 weeks)"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: pain symptoms controlled means no change in morphine equivalent dose of 30% in past 2 weeks
(assert
  (! (= patients_pain_observable_is_positive_now@@controlled
        (and patients_pain_observable_is_positive_now
             (<= (abs morphine_equivalent_dose_value_recorded_past_2_weeks_withunit_mg) (* 0.3 morphine_equivalent_dose_value_recorded_past_2_weeks_withunit_mg))))
     :named REQ9_AUXILIARY0)) ;; "pain symptoms must be controlled (defined as no change in the morphine equivalent dose of 30% in the past 2 weeks)"

;; Definition: depression symptoms controlled means no change in dose of antidepressant medication in past 2 weeks
;; Note: The actual dose variable for antidepressant medication is not declared in the input, so we use the provided Boolean variable.
(assert
  (! (=> patient_has_symptoms_of_symptoms_of_depression_now@@controlled
         patient_has_symptoms_of_symptoms_of_depression_now)
     :named REQ9_AUXILIARY1)) ;; "depression symptoms must be controlled (defined as no change in the dose of antidepressant medication in the past 2 weeks)"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patients_pain_observable_is_positive_now@@controlled
         patients_pain_observable_is_positive_now)
     :named REQ9_AUXILIARY2)) ;; "pain symptoms must be controlled"

;; ===================== Constraint Assertions (REQ 9) =====================
;; If the patient has pain symptoms AND depression symptoms, both must be controlled
(assert
  (! (or (not (and patients_pain_observable_is_positive_now patient_has_symptoms_of_symptoms_of_depression_now))
         (and patients_pain_observable_is_positive_now@@controlled patient_has_symptoms_of_symptoms_of_depression_now@@controlled))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has pain symptoms and depression symptoms, pain symptoms and depression symptoms must be controlled"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const zubrod_score_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's Zubrod score as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's Zubrod score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's Zubrod score as recorded now, in integer units."} // "the patient must have a Zubrod score ≤ 2."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (<= zubrod_score_value_recorded_now_withunit_integer 2)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a Zubrod score ≤ 2."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_chemotherapy_cycle_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the total number of chemotherapy cycles completed by the patient at any time in the past.","when_to_set_to_null":"Set to null if the number of completed chemotherapy cycles is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of chemotherapy cycles completed by the patient in their history."} // "have completed at least one cycle of chemotherapy"
(declare-const patient_targeted_therapy_cycle_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the total number of targeted therapy cycles completed by the patient at any time in the past.","when_to_set_to_null":"Set to null if the number of completed targeted therapy cycles is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of targeted therapy cycles completed by the patient in their history."} // "have completed at least one cycle of targeted therapy"
(declare-const patient_radiation_therapy_week_value_recorded_inthehistory_withunit_week Real) ;; {"when_to_set_to_value":"Set to the total number of weeks of radiation therapy completed by the patient at any time in the past.","when_to_set_to_null":"Set to null if the number of completed weeks of radiation therapy is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of weeks of radiation therapy completed by the patient in their history."} // "have completed more than 1 week of radiation therapy"
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving chemotherapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving chemotherapy.","meaning":"Boolean indicating whether the patient is currently receiving chemotherapy."} // "the patient is receiving chemotherapy"
(declare-const patient_is_undergoing_radiation_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving radiation therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving radiation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving radiation therapy.","meaning":"Boolean indicating whether the patient is currently receiving radiation therapy."} // "the patient is receiving radiation therapy"
(declare-const patient_has_been_approved_to_go_on_study_by_primary_oncologist Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been approved to go on study by the patient's primary oncologist.","when_to_set_to_false":"Set to false if the patient has not been approved to go on study by the patient's primary oncologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been approved to go on study by the patient's primary oncologist.","meaning":"Boolean indicating whether the patient has been approved to go on study by the patient's primary oncologist."} // "have been approved to go on study by the patient's primary oncologist"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definition: patient has completed at least one cycle of chemotherapy
(define-fun patient_has_completed_at_least_one_cycle_of_chemotherapy () Bool
  (>= patient_chemotherapy_cycle_value_recorded_inthehistory_withunit_count 1)
) ;; "have completed at least one cycle of chemotherapy"

;; Definition: patient has completed at least one cycle of targeted therapy
(define-fun patient_has_completed_at_least_one_cycle_of_targeted_therapy () Bool
  (>= patient_targeted_therapy_cycle_value_recorded_inthehistory_withunit_count 1)
) ;; "have completed at least one cycle of targeted therapy"

;; Definition: patient has completed more than 1 week of radiation therapy
(define-fun patient_has_completed_more_than_one_week_of_radiation_therapy () Bool
  (> patient_radiation_therapy_week_value_recorded_inthehistory_withunit_week 1)
) ;; "have completed more than 1 week of radiation therapy"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 0: If (receiving chemotherapy OR receiving radiation therapy), must have completed at least one cycle of chemotherapy OR at least one cycle of targeted therapy OR more than 1 week of radiation therapy
(assert
  (! (or (not (or patient_is_undergoing_chemotherapy_now
                  patient_is_undergoing_radiation_therapy_now))
         (or patient_has_completed_at_least_one_cycle_of_chemotherapy
             patient_has_completed_at_least_one_cycle_of_targeted_therapy
             patient_has_completed_more_than_one_week_of_radiation_therapy))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if (the patient is receiving chemotherapy OR the patient is receiving radiation therapy), the patient must ((have completed at least one cycle of chemotherapy) OR (have completed at least one cycle of targeted therapy) OR (have completed more than 1 week of radiation therapy))"

;; Component 1: If (receiving chemotherapy OR receiving radiation therapy), must have been approved to go on study by the patient's primary oncologist
(assert
  (! (or (not (or patient_is_undergoing_chemotherapy_now
                  patient_is_undergoing_radiation_therapy_now))
         patient_has_been_approved_to_go_on_study_by_primary_oncologist)
     :named REQ11_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if (the patient is receiving chemotherapy OR the patient is receiving radiation therapy), the patient must have been approved to go on study by the patient's primary oncologist"

;; ===================== Declarations for the inclusion criterion (REQ 12) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets all criteria for childbearing potential (intact uterus, intact ovaries, and history of menses within the last 12 months).","when_to_set_to_false":"Set to false if the patient does not meet all criteria for childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status cannot be determined or is unknown.","meaning":"Boolean value indicating whether the patient currently has childbearing potential, as defined by clinical criteria."} // "woman of childbearing potential (defined as having an intact uterus AND having intact ovaries AND having a history of menses within the last 12 months)"
(declare-const patient_has_finding_of_elevated_serum_human_chorionic_gonadotropin_level_beta_subunit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an elevated serum beta-human chorionic gonadotropin (β-hCG) level.","when_to_set_to_false":"Set to false if the patient currently does not have an elevated serum beta-human chorionic gonadotropin (β-hCG) level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an elevated serum beta-human chorionic gonadotropin (β-hCG) level.","meaning":"Boolean indicating whether the patient currently has an elevated serum beta-human chorionic gonadotropin (β-hCG) level."} // "elevated beta-human chorionic gonadotropin"
(declare-const patient_has_finding_of_elevated_serum_human_chorionic_gonadotropin_level_beta_subunit_now@@level_not_consistent_with_pregnancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an elevated serum beta-human chorionic gonadotropin (β-hCG) level and the level is not consistent with pregnancy.","when_to_set_to_false":"Set to false if the patient currently has an elevated serum beta-human chorionic gonadotropin (β-hCG) level and the level is consistent with pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the elevated β-hCG level is consistent with pregnancy.","meaning":"Boolean indicating whether the patient currently has an elevated serum beta-human chorionic gonadotropin (β-hCG) level and the level is not consistent with pregnancy."} // "the level of beta-human chorionic gonadotropin is NOT consistent with pregnancy"
(declare-const patient_has_undergone_pregnancy_detection_examination_inthepast14days_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a pregnancy detection examination (pregnancy test) with a negative result in the past 14 days.","when_to_set_to_false":"Set to false if the patient has undergone a pregnancy detection examination (pregnancy test) in the past 14 days and the result was not negative, or if no such test was performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a pregnancy detection examination (pregnancy test) with a negative result in the past 14 days.","meaning":"Boolean indicating whether the patient has undergone a pregnancy detection examination (pregnancy test) with a negative result in the past 14 days."} // "have a negative pregnancy test performed ≤ 14 days prior to consent in study"
(declare-const patient_has_undergone_pregnancy_detection_examination_inthepast14days_outcome_is_negative@@temporalcontext_within14days_prior_to_consent_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the pregnancy detection examination (pregnancy test) with a negative result was performed within 14 days prior to the patient's consent in study.","when_to_set_to_false":"Set to false if the pregnancy detection examination (pregnancy test) with a negative result was not performed within 14 days prior to consent in study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pregnancy detection examination (pregnancy test) with a negative result was performed within 14 days prior to consent in study.","meaning":"Boolean indicating whether the pregnancy detection examination (pregnancy test) with a negative result was performed within 14 days prior to consent in study."} // "have a negative pregnancy test performed ≤ 14 days prior to consent in study"
(declare-const patient_is_pregnant_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was pregnant at any time during the 14 days prior to study consent.","when_to_set_to_false":"Set to false if the patient was not pregnant at any time during the 14 days prior to study consent (e.g., negative pregnancy test).","when_to_set_to_null":"Set to null if pregnancy status during the 14 days prior to study consent is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient was pregnant at any time during the 14 days prior to study consent."} // "have a negative pregnancy test performed ≤ 14 days prior to consent in study"
(declare-const patients_menstruation_is_positive_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had menstruation (menses) at any time in the past 12 months.","when_to_set_to_false":"Set to false if the patient has not had menstruation (menses) in the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had menstruation (menses) in the past 12 months.","meaning":"Boolean indicating whether the patient has had menstruation (menses) in the past 12 months."} // "menses"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Definition of childbearing potential per requirement: intact uterus AND intact ovaries AND menses in past 12 months
(declare-const patient_has_intact_uterus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intact uterus.","when_to_set_to_false":"Set to false if the patient does not currently have an intact uterus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intact uterus.","meaning":"Boolean indicating whether the patient currently has an intact uterus."} // "having an intact uterus"
(declare-const patient_has_intact_ovaries_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intact ovaries.","when_to_set_to_false":"Set to false if the patient does not currently have intact ovaries.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intact ovaries.","meaning":"Boolean indicating whether the patient currently has intact ovaries."} // "having intact ovaries"

;; Definition: childbearing potential ≡ (intact uterus AND intact ovaries AND menses in past 12 months)
(assert
  (! (= patient_has_childbearing_potential_now
        (and patient_has_intact_uterus_now
             patient_has_intact_ovaries_now
             patients_menstruation_is_positive_inthepast12months))
     :named REQ12_AUXILIARY0)) ;; "woman of childbearing potential (defined as having an intact uterus AND having intact ovaries AND having a history of menses within the last 12 months)"

;; Qualifier variable for β-hCG: level not consistent with pregnancy implies elevated β-hCG
(assert
  (! (=> patient_has_finding_of_elevated_serum_human_chorionic_gonadotropin_level_beta_subunit_now@@level_not_consistent_with_pregnancy
         patient_has_finding_of_elevated_serum_human_chorionic_gonadotropin_level_beta_subunit_now)
     :named REQ12_AUXILIARY1)) ;; "the level of beta-human chorionic gonadotropin is NOT consistent with pregnancy"

;; Qualifier variable for negative pregnancy test: temporal context within 14 days prior to consent implies negative test in past 14 days
(assert
  (! (=> patient_has_undergone_pregnancy_detection_examination_inthepast14days_outcome_is_negative@@temporalcontext_within14days_prior_to_consent_in_study
         patient_has_undergone_pregnancy_detection_examination_inthepast14days_outcome_is_negative)
     :named REQ12_AUXILIARY2)) ;; "have a negative pregnancy test performed ≤ 14 days prior to consent in study"

;; ===================== Constraint Assertions (REQ 12) =====================
;; If the patient is a woman of childbearing potential, then must have (negative pregnancy test ≤ 14 days prior to consent) OR (elevated β-hCG AND β-hCG not consistent with pregnancy)
(assert
  (! (or (not patient_has_childbearing_potential_now)
         (or patient_has_undergone_pregnancy_detection_examination_inthepast14days_outcome_is_negative@@temporalcontext_within14days_prior_to_consent_in_study
             (and patient_has_finding_of_elevated_serum_human_chorionic_gonadotropin_level_beta_subunit_now
                  patient_has_finding_of_elevated_serum_human_chorionic_gonadotropin_level_beta_subunit_now@@level_not_consistent_with_pregnancy)))
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a woman of childbearing potential (defined as having an intact uterus AND having intact ovaries AND having a history of menses within the last 12 months), the patient must ((have a negative pregnancy test performed ≤ 14 days prior to consent in study) OR ((have elevated beta-human chorionic gonadotropin) AND (the level of beta-human chorionic gonadotropin is NOT consistent with pregnancy)))."

;; ===================== Declarations for the inclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception.","when_to_set_to_false":"Set to false if the patient is currently not using contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} // "be on contraception OR use contraception"
(declare-const patient_has_finding_of_contraception_now@@used_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and this use occurs during the study period.","when_to_set_to_false":"Set to false if the patient is currently using contraception but not during the study period, or if the patient is not using contraception during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using contraception during the study period.","meaning":"Boolean indicating whether the patient's current contraception use occurs during the study period."} // "contraception used during the study period"
(declare-const patient_is_abstinent_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is abstinent during the study period.","when_to_set_to_false":"Set to false if the patient is not abstinent during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is abstinent during the study period.","meaning":"Boolean indicating whether the patient is abstinent during the study period."} // "be abstinent during the study period"
(declare-const male_partner_is_abstinent_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the male partner is abstinent during the study period.","when_to_set_to_false":"Set to false if the male partner is not abstinent during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the male partner is abstinent during the study period.","meaning":"Boolean indicating whether the male partner is abstinent during the study period."} // "male partners must maintain abstinence"
(declare-const male_partner_is_using_condom_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the male partner is using condom contraception during the study period.","when_to_set_to_false":"Set to false if the male partner is not using condom contraception during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the male partner is using condom contraception during the study period.","meaning":"Boolean indicating whether the male partner is using condom contraception during the study period."} // "male partners must use contraception (condom)"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_contraception_now@@used_during_study_period
         patient_has_finding_of_contraception_now)
     :named REQ13_AUXILIARY0)) ;; "contraception used during the study period" implies "contraception"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Component 0: If patient has childbearing potential, must use contraception during study period OR be abstinent during study period
(assert
  (! (or (not patient_has_childbearing_potential_now)
         (or patient_has_finding_of_contraception_now@@used_during_study_period
             patient_is_abstinent_during_study_period))
     :named REQ13_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman of childbearing potential ... must ((be on contraception) OR (use contraception) OR (be abstinent)) during the study period"

;; Component 1: If patient has childbearing potential, male partners must use condom contraception OR maintain abstinence during study period
(assert
  (! (or (not patient_has_childbearing_potential_now)
         (or male_partner_is_using_condom_during_study_period
             male_partner_is_abstinent_during_study_period))
     :named REQ13_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman of childbearing potential ... male partners ... must ((use contraception (condom)) OR (maintain abstinence))"

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_is_using_barrier_birth_control_during_study_and_30days_post_last_ginseng_or_placebo_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is using an acceptable form of barrier birth control (such as condom or diaphragm with spermicide) during the study and for 30 days after the last ginseng dose or after the last placebo dose.","when_to_set_to_false":"Set to false if the patient is not using an acceptable form of barrier birth control (such as condom or diaphragm with spermicide) during the study and for 30 days after the last ginseng dose or after the last placebo dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using an acceptable form of barrier birth control (such as condom or diaphragm with spermicide) during the study and for 30 days after the last ginseng dose or after the last placebo dose.","meaning":"Boolean indicating whether the patient is using an acceptable form of barrier birth control (such as condom or diaphragm with spermicide) during the study and for 30 days after the last ginseng dose or after the last placebo dose."} // "the patient must use birth control (acceptable forms include barrier methods such as condom or diaphragm with spermicide) during the study AND for 30 days after the last ginseng dose or after the last placebo dose."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (or (not patient_has_childbearing_potential_now)
         patient_is_using_barrier_birth_control_during_study_and_30days_post_last_ginseng_or_placebo_dose)
     :named REQ14_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman who is able to become pregnant, the patient must use birth control (acceptable forms include barrier methods such as condom or diaphragm with spermicide) during the study AND for 30 days after the last ginseng dose or after the last placebo dose."
