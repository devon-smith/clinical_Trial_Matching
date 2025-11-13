;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "be a man"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "be a premenopausal woman"
(declare-const patient_is_premenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently premenopausal.","when_to_set_to_false":"Set to false if the patient is currently not premenopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently premenopausal.","meaning":"Boolean indicating whether the patient is currently premenopausal."} // "be a premenopausal woman"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 50 years"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."} // "have obesity"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((be a man AND be aged ≥ 18 years AND be aged ≤ 50 years AND have obesity) OR (be a premenopausal woman AND be aged ≥ 18 years AND be aged ≤ 50 years AND have obesity)).
(assert
  (! (or
        (and patient_sex_is_male_now
             (>= patient_age_value_recorded_now_in_years 18.0)
             (<= patient_age_value_recorded_now_in_years 50.0)
             patient_has_finding_of_obesity_now)
        (and patient_sex_is_female_now
             patient_is_premenopausal_now
             (>= patient_age_value_recorded_now_in_years 18.0)
             (<= patient_age_value_recorded_now_in_years 50.0)
             patient_has_finding_of_obesity_now))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be a man AND be aged ≥ 18 years AND be aged ≤ 50 years AND have obesity) OR (be a premenopausal woman AND be aged ≥ 18 years AND be aged ≤ 50 years AND have obesity))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index (BMI) measured now, in kilograms per square meter."} // "body mass index"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 29.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≥ 29."

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 55.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≤ 55."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_sleep_deprivation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has sleep deprivation at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had sleep deprivation in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has sleep deprivation in their history.","meaning":"Boolean indicating whether the patient has sleep deprivation in their history."} // "have chronic sleep deprivation for > 6 months"
(declare-const patient_has_finding_of_sleep_deprivation_inthehistory@@chronic_for_more_than_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sleep deprivation has lasted for more than 6 months.","when_to_set_to_false":"Set to false if the patient's sleep deprivation has not lasted for more than 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sleep deprivation has lasted for more than 6 months.","meaning":"Boolean indicating whether the patient's sleep deprivation is chronic and has lasted for more than 6 months."} // "chronic sleep deprivation for > 6 months"
(declare-const patient_has_finding_of_sleep_deprivation_inthehistory@@determined_by_history_and_objective_devices Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sleep deprivation is determined by both history and objective devices.","when_to_set_to_false":"Set to false if the patient's sleep deprivation is not determined by both history and objective devices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sleep deprivation is determined by both history and objective devices.","meaning":"Boolean indicating whether the patient's sleep deprivation is determined by both history and objective devices."} // "by history AND by objective devices"
(declare-const patient_sleep_duration_value_recorded_regular_basis_in_hours_per_night Real) ;; {"when_to_set_to_value":"Set to the number of hours per night the patient sleeps on a regular basis, as determined by history and/or objective devices.","when_to_set_to_null":"Set to null if the regular sleep duration per night is unknown, not documented, or cannot be determined from history or objective devices.","meaning":"Numeric value representing the patient's regular sleep duration per night in hours."} // "sleeping on a regular basis < 6.5 hours per night OR sleeping on a regular basis = 6.5 hours per night"
(declare-const patient_sleep_duration_value_recorded_regular_basis_in_hours_per_night@@determined_by_objective_devices Real) ;; {"when_to_set_to_value":"Set to the number of hours per night the patient sleeps on a regular basis, as determined by objective devices.","when_to_set_to_null":"Set to null if the regular sleep duration per night is unknown, not documented, or cannot be determined from objective devices.","meaning":"Numeric value representing the patient's regular sleep duration per night in hours, as determined by objective devices."} // "by objective devices (with non-exhaustive examples (wrist activity monitors, sleep logs))"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_sleep_deprivation_inthehistory@@chronic_for_more_than_6_months
         patient_has_finding_of_sleep_deprivation_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "chronic sleep deprivation for > 6 months"

(assert
  (! (=> patient_has_finding_of_sleep_deprivation_inthehistory@@determined_by_history_and_objective_devices
         patient_has_finding_of_sleep_deprivation_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "by history AND by objective devices"

;; Non-exhaustive examples imply umbrella subclass for objective devices
;; (wrist activity monitors, sleep logs) are examples of objective devices, but not exhaustive

;; ===================== Constraint Assertions (REQ 2) =====================
;; Definition of chronic sleep deprivation for > 6 months:
;; Must have sleep deprivation for > 6 months, defined as sleeping on a regular basis < 6.5 hours per night OR = 6.5 hours per night,
;; by history AND by objective devices.

(assert
  (! (and
        patient_has_finding_of_sleep_deprivation_inthehistory@@chronic_for_more_than_6_months
        patient_has_finding_of_sleep_deprivation_inthehistory@@determined_by_history_and_objective_devices
        (or
          (< patient_sleep_duration_value_recorded_regular_basis_in_hours_per_night 6.5)
          (= patient_sleep_duration_value_recorded_regular_basis_in_hours_per_night 6.5))
        (or
          (< patient_sleep_duration_value_recorded_regular_basis_in_hours_per_night@@determined_by_objective_devices 6.5)
          (= patient_sleep_duration_value_recorded_regular_basis_in_hours_per_night@@determined_by_objective_devices 6.5))
     )
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have chronic sleep deprivation for > 6 months, defined as (sleeping on a regular basis < 6.5 hours per night OR sleeping on a regular basis = 6.5 hours per night) by history AND by objective devices"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_external_comparison_subject_for_extension_of_effectiveness_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an external comparison subject for the extension of the Effectiveness Study.","when_to_set_to_false":"Set to false if the patient is not an external comparison subject for the extension of the Effectiveness Study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an external comparison subject for the extension of the Effectiveness Study.","meaning":"Boolean indicating whether the patient is an external comparison subject for the extension of the Effectiveness Study."} // "if the patient is an external comparison subject for extension of Effectiveness Study"
(declare-const patient_satisfies_criterion_00 Bool) ;; {"when_to_set_to_true":"Set to true if the patient satisfies criterion [00] for inclusion as an external comparison subject for the extension of the Effectiveness Study.","when_to_set_to_false":"Set to false if the patient does not satisfy criterion [00] for inclusion as an external comparison subject for the extension of the Effectiveness Study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient satisfies criterion [00] for inclusion as an external comparison subject for the extension of the Effectiveness Study.","meaning":"Boolean indicating whether the patient satisfies criterion [00] for inclusion as an external comparison subject for the extension of the Effectiveness Study."} // "the patient must satisfy ([00] ... )"
(declare-const patient_satisfies_criterion_01 Bool) ;; {"when_to_set_to_true":"Set to true if the patient satisfies criterion [01] for inclusion as an external comparison subject for the extension of the Effectiveness Study.","when_to_set_to_false":"Set to false if the patient does not satisfy criterion [01] for inclusion as an external comparison subject for the extension of the Effectiveness Study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient satisfies criterion [01] for inclusion as an external comparison subject for the extension of the Effectiveness Study.","meaning":"Boolean indicating whether the patient satisfies criterion [01] for inclusion as an external comparison subject for the extension of the Effectiveness Study."} // "the patient must satisfy (... [01] ... )"
(declare-const patient_satisfies_criterion_02 Bool) ;; {"when_to_set_to_true":"Set to true if the patient satisfies criterion [02] for inclusion as an external comparison subject for the extension of the Effectiveness Study.","when_to_set_to_false":"Set to false if the patient does not satisfy criterion [02] for inclusion as an external comparison subject for the extension of the Effectiveness Study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient satisfies criterion [02] for inclusion as an external comparison subject for the extension of the Effectiveness Study.","meaning":"Boolean indicating whether the patient satisfies criterion [02] for inclusion as an external comparison subject for the extension of the Effectiveness Study."} // "the patient must satisfy (... [02])"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or (not patient_is_external_comparison_subject_for_extension_of_effectiveness_study)
         (and patient_satisfies_criterion_00
              patient_satisfies_criterion_01
              patient_satisfies_criterion_02))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is an external comparison subject for extension of Effectiveness Study, the patient must satisfy ([00] AND [01] AND [02])"
