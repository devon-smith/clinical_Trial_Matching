;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as male or other at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's sex is female at the current time."}
;; "a woman"
(declare-const patients_menopausal_transition_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has menopausal transition present (menopausal transition status is positive).","when_to_set_to_false":"Set to false if the patient currently does not have menopausal transition present (menopausal transition status is not positive).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's menopausal transition is present now.","meaning":"Boolean indicating whether the patient's menopausal transition is present now (categorical observable status positive)."}
;; "menopausal transition"
(declare-const patients_menopausal_transition_is_positive_now@@transition_stage_is_late Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current menopausal transition stage is documented or determined to be late.","when_to_set_to_false":"Set to false if the patient's current menopausal transition stage is documented or determined not to be late.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current menopausal transition stage is late.","meaning":"Boolean indicating whether the currently present menopausal transition is at a late stage."}
;; "late menopausal transition"
(declare-const patients_menopause_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has menopause present (menopause status is positive).","when_to_set_to_false":"Set to false if the patient currently does not have menopause present (menopause status is not positive).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's menopause is present now.","meaning":"Boolean indicating whether the patient's menopause is present now (categorical observable status positive)."}
;; "menopause"
(declare-const patients_menopause_is_positive_now@@menopause_stage_is_early Bool) ;; {"when_to_set_to_true":"Set to true if the patient's menopause stage is documented or determined to be early.","when_to_set_to_false":"Set to false if the patient's menopause stage is documented or determined not to be early.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's menopause stage is early.","meaning":"Boolean indicating whether the currently present menopause is at an early stage."}
;; "early menopause"

;; ===================== Auxiliary Assertions (REQ 0) =====================
(assert
  (! (=> patients_menopausal_transition_is_positive_now@@transition_stage_is_late
         patients_menopausal_transition_is_positive_now)
     :named        REQ0_AUXILIARY0))
;; "late menopausal transition"
(assert
  (! (=> patients_menopause_is_positive_now@@menopause_stage_is_early
         patients_menopause_is_positive_now)
     :named        REQ0_AUXILIARY1))
;; "early menopause"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or (and patient_sex_is_female_now
              patients_menopausal_transition_is_positive_now@@transition_stage_is_late) ;; "a woman in late menopausal transition"
         (and patient_sex_is_female_now
              patients_menopause_is_positive_now@@menopause_stage_is_early))            ;; "a woman in early menopause"
     :named        REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
;; "To be included, the patient must be (a woman in late menopausal transition) OR (a woman in early menopause)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}
;; "aged ≥ 40 years AND aged ≤ 55 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40.0)
     :named        REQ1_COMPONENT0_OTHER_REQUIREMENTS))
;; "To be included, the patient must be (aged ≥ 40 years)."

(assert
  (! (<= patient_age_value_recorded_now_in_years 55.0)
     :named        REQ1_COMPONENT1_OTHER_REQUIREMENTS))
;; "To be included, the patient must be (aged ≤ 55 years)."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kilograms per square meter if a BMI measurement recorded now is available.","when_to_set_to_null":"Set to null if no BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value of the patient's body mass index recorded now in kilograms per square meter."}
;; "body mass index > 25 kilograms per square meter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))
;; "To be included, the patient must have (body mass index > 25 kilograms per square meter)."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_menopausal_symptom_value_recorded_now_withunit_count Int) ;; {"when_to_set_to_value":"Set to the integer count if the number of menopausal symptoms present now is recorded or can be determined.","when_to_set_to_null":"Set to null if the number of menopausal symptoms present now is not recorded, cannot be determined, or is indeterminate.","meaning":"Numeric count of the patient's current menopausal symptoms."}
;; "menopausal symptoms (≥ 1 symptom)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_menopausal_symptom_value_recorded_now_withunit_count 1)
     :named        REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
;; "To be included, the patient must have menopausal symptoms (≥ 1 symptom)."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_amenorrhea_value_recorded_inthepast1years_withunit_days Real) ;; {"when_to_set_to_value":"Set to the measured duration in days if a numeric measurement of an amenorrhea interval recorded within the last year is available.","when_to_set_to_null":"Set to null if no amenorrhea interval duration recorded within the last year is available or the value is indeterminate.","meaning":"Numeric duration in days of an amenorrhea interval occurring within the last year."}
;; "an interval of amenorrhea (≥ 60 days) in the last year"
(declare-const patient_had_regular_menstrual_cycles_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if it is documented that the patient's menstrual cycles were previously regular.","when_to_set_to_false":"Set to false if it is documented that the patient's menstrual cycles were not previously regular.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's menstrual cycles were previously regular.","meaning":"Boolean indicating whether the patient previously had regular menstrual cycles in the history."}
;; "a change in previously regular cycles"
(declare-const patient_skipped_menstrual_cycles_value_recorded_inthepast1years_withunit_count Int) ;; {"when_to_set_to_value":"Set to the recorded number of skipped menstrual cycles that occurred within the last year.","when_to_set_to_null":"Set to null if no count of skipped menstrual cycles within the last year is available or the value is indeterminate.","meaning":"Numeric count of skipped menstrual cycles within the last year."}
;; "skipped cycles ≥ 2 in the last year"
(declare-const patient_has_change_in_previously_regular_menstrual_cycles_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient currently has a change in previously regular menstrual cycles.","when_to_set_to_false":"Set to false if there is evidence that the patient currently does not have a change in previously regular menstrual cycles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a change in previously regular menstrual cycles.","meaning":"Boolean indicating whether the patient currently has a change in previously regular menstrual cycles."}
;; "a change in previously regular cycles"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition in the requirement: change in previously regular cycles consists of skipped cycles ≥ 2 in the last year AND an interval of amenorrhea ≥ 60 days in the last year
(assert
  (! (= patient_has_change_in_previously_regular_menstrual_cycles_now
        (and patient_had_regular_menstrual_cycles_in_the_history
             (>= patient_skipped_menstrual_cycles_value_recorded_inthepast1years_withunit_count 2)
             (>= patient_amenorrhea_value_recorded_inthepast1years_withunit_days 60)))
     :named REQ4_AUXILIARY0))
;; "a change in previously regular cycles consisting of ((skipped cycles ≥ 2 in the last year) AND (an interval of amenorrhea (≥ 60 days) in the last year))."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_change_in_previously_regular_menstrual_cycles_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
;; "To be included, the patient must have (a change in previously regular cycles) consisting of ((skipped cycles ≥ 2 in the last year) AND (an interval of amenorrhea (≥ 60 days) in the last year))."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_has_pregnancy_test_result_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pregnancy test result is documented as negative.","when_to_set_to_false":"Set to false if the patient's current pregnancy test result is documented as not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pregnancy test result is negative.","meaning":"Boolean indicating whether the patient's current pregnancy test result is negative."}
;; "a negative pregnancy test"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_pregnancy_test_result_negative_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS))
;; "To be included, the patient must have (a negative pregnancy test)."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_decreased_vitamin_d_value_recorded_now_withunit_nanograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured vitamin D value (in ng/mL) if a vitamin D measurement recorded now is available.","when_to_set_to_null":"Set to null if no vitamin D measurement recorded now is available or the value is indeterminate.","meaning":"Numeric measurement representing the patient's current vitamin D level in ng/mL."}
;; "To be included, the patient must have (vitamin D insufficiency (< 30 nanograms per milliliter))."

(declare-const patient_has_vitamin_d_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vitamin D insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have vitamin D insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vitamin D insufficiency.","meaning":"Boolean indicating whether the patient currently has vitamin D insufficiency."}
;; "To be included, the patient must have (vitamin D insufficiency (< 30 nanograms per milliliter))."

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition in the requirement: vitamin D insufficiency is defined as vitamin D < 30 ng/mL
(assert
  (! (= patient_has_vitamin_d_insufficiency_now
        (< patient_decreased_vitamin_d_value_recorded_now_withunit_nanograms_per_milliliter 30.0))
     :named REQ6_AUXILIARY0))
;; "vitamin D insufficiency (< 30 nanograms per milliliter)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Inclusion: patient MUST have vitamin D insufficiency
(assert
  (! patient_has_vitamin_d_insufficiency_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS))
;; "To be included, the patient must have (vitamin D insufficiency (< 30 nanograms per milliliter))."

(declare-const body_weight_percent_change_value_recorded_past_3_months_in_percent Real) ;; {"when_to_set_to_value":"Set to the numeric percent change in the patient's body weight observed over the past 3 months, expressed in percent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's percent change in body weight over the past 3 months is.","meaning":"Numeric indicating the percent change in the patient's body weight over the past 3 months, expressed in percent."}
;; "weight stability (+/- 5%) for 3 months"

(declare-const patient_has_finding_of_weight_steady_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has the clinical finding of weight stability during the past 3 months.","when_to_set_to_false":"Set to false if the patient does not have the clinical finding of weight stability during the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has weight stability during the past 3 months.","meaning":"Boolean indicating whether the patient has weight stability in the past 3 months."}
;; "weight stability (+/- 5%) for 3 months"

;; ===================== Auxiliary Assertions (REQ 7) =====================
(assert
  (! (= patient_has_finding_of_weight_steady_inthepast3months
        (and (<= body_weight_percent_change_value_recorded_past_3_months_in_percent 5.0)
             (>= body_weight_percent_change_value_recorded_past_3_months_in_percent (- 5.0))))
     :named REQ7_AUXILIARY0))
;; "weight stability (+/- 5%) for 3 months"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_finding_of_weight_steady_inthepast3months
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS))
;; "To be included, the patient must have (weight stability (+/- 5%) for 3 months)."
