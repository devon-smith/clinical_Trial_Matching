;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "To be included, the patient must be female."
(declare-const patient_has_pregnancy_of_unknown_location_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as having a pregnancy of unknown location.","when_to_set_to_false":"Set to false if the patient is currently documented as not having a pregnancy of unknown location.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pregnancy of unknown location.","meaning":"Boolean indicating whether the patient currently has a pregnancy of unknown location."} ;; "To be included, the patient must have a persistent pregnancy of unknown location."
(declare-const patient_has_pregnancy_of_unknown_location_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pregnancy of unknown location is persistent.","when_to_set_to_false":"Set to false if the patient's current pregnancy of unknown location is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pregnancy of unknown location is persistent.","meaning":"Boolean indicating whether the patient's current pregnancy of unknown location is persistent."} ;; "To be included, the patient must have a persistent pregnancy of unknown location."
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "persistent pregnancy of unknown location"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for persistence implies the stem variable (if persistent, must have pregnancy of unknown location)
(assert
  (! (=> patient_has_pregnancy_of_unknown_location_now@@persistent
         patient_has_pregnancy_of_unknown_location_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have a persistent pregnancy of unknown location."

;; Having a pregnancy of unknown location implies being pregnant
(assert
  (! (=> patient_has_pregnancy_of_unknown_location_now
         patient_is_pregnant_now)
     :named REQ0_AUXILIARY1)) ;; "persistent pregnancy of unknown location"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be female
(assert
  (! patient_sex_is_female_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be female."

;; Component 1: Patient must have a persistent pregnancy of unknown location
(assert
  (! patient_has_pregnancy_of_unknown_location_now@@persistent
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a persistent pregnancy of unknown location."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_pregnancy_test_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive pregnancy test result.","when_to_set_to_false":"Set to false if the patient currently does not have a positive pregnancy test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive pregnancy test result.","meaning":"Boolean indicating whether the patient currently has a positive pregnancy test result."} ;; "a positive pregnancy test in a woman"
(declare-const patient_has_undergone_ultrasonography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography (ultrasound imaging) at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography in the history.","meaning":"Boolean indicating whether the patient has undergone ultrasonography at any time in the history."} ;; "ultrasound imaging"
(declare-const patient_has_undergone_ultrasonography_inthehistory@@temporalcontext_within_7_days_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography and the procedure was performed within 7 days prior to randomization.","when_to_set_to_false":"Set to false if the patient has undergone ultrasonography but not within 7 days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ultrasonography was performed within 7 days prior to randomization.","meaning":"Boolean indicating whether the patient has undergone ultrasonography within 7 days prior to randomization."} ;; "ultrasound imaging performed within 7 days prior to randomization"
(declare-const ultrasound_visualization_of_gestational_sac_with_yolk_sac_in_adnexa_with_or_without_embryo_within_7_days_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if, within 7 days prior to randomization, ultrasound visualized a gestational sac containing a yolk sac (with or without an embryo) in the adnexa.","when_to_set_to_false":"Set to false if, within 7 days prior to randomization, ultrasound did not visualize a gestational sac containing a yolk sac (with or without an embryo) in the adnexa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, within 7 days prior to randomization, ultrasound visualized a gestational sac containing a yolk sac (with or without an embryo) in the adnexa.","meaning":"Boolean indicating whether, within 7 days prior to randomization, ultrasound visualized a gestational sac containing a yolk sac (with or without an embryo) in the adnexa."} ;; "ultrasound visualization of a gestational sac with a yolk sac (with or without an embryo) in the adnexa"
(declare-const ultrasound_visualization_of_gestational_sac_with_yolk_sac_in_uterus_with_or_without_embryo_within_7_days_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if, within 7 days prior to randomization, ultrasound visualized a gestational sac containing a yolk sac (with or without an embryo) in the uterus.","when_to_set_to_false":"Set to false if, within 7 days prior to randomization, ultrasound did not visualize a gestational sac containing a yolk sac (with or without an embryo) in the uterus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, within 7 days prior to randomization, ultrasound visualized a gestational sac containing a yolk sac (with or without an embryo) in the uterus.","meaning":"Boolean indicating whether, within 7 days prior to randomization, ultrasound visualized a gestational sac containing a yolk sac (with or without an embryo) in the uterus."} ;; "ultrasound visualization of a gestational sac with a yolk sac (with or without an embryo) in the uterus"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for ultrasonography within 7 days prior to randomization implies ultrasonography in history
(assert
  (! (=> patient_has_undergone_ultrasonography_inthehistory@@temporalcontext_within_7_days_before_randomization
         patient_has_undergone_ultrasonography_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "ultrasound imaging performed within 7 days prior to randomization"

;; Definition: definitive sign of gestation in uterus within 7 days prior to randomization
(define-fun definitive_sign_of_gestation_in_uterus_within_7_days_before_randomization () Bool
  ultrasound_visualization_of_gestational_sac_with_yolk_sac_in_uterus_with_or_without_embryo_within_7_days_before_randomization) ;; "ultrasound visualization of a gestational sac with a yolk sac (with or without an embryo) in the uterus"

;; Definition: definitive sign of gestation in adnexa within 7 days prior to randomization
(define-fun definitive_sign_of_gestation_in_adnexa_within_7_days_before_randomization () Bool
  ultrasound_visualization_of_gestational_sac_with_yolk_sac_in_adnexa_with_or_without_embryo_within_7_days_before_randomization) ;; "ultrasound visualization of a gestational sac with a yolk sac (with or without an embryo) in the adnexa"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must have pregnancy of unknown location, defined as:
;; (a positive pregnancy test in a woman) AND
;; (no definitive sign of pregnancy in the uterus on ultrasound imaging performed within 7 days prior to randomization) AND
;; (no definitive sign of pregnancy in the adnexa on ultrasound imaging performed within 7 days prior to randomization)
(assert
  (! (= patient_has_pregnancy_of_unknown_location_now
        (and patient_sex_is_female_now
             patient_has_pregnancy_test_positive_now
             patient_has_undergone_ultrasonography_inthehistory@@temporalcontext_within_7_days_before_randomization
             (not definitive_sign_of_gestation_in_uterus_within_7_days_before_randomization)
             (not definitive_sign_of_gestation_in_adnexa_within_7_days_before_randomization)))
     :named REQ1_AUXILIARY1)) ;; "pregnancy of unknown location (defined as ...)"

(assert
  (! patient_has_pregnancy_of_unknown_location_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a pregnancy of unknown location (defined as ...)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const human_chorionic_gonadotropin_value_recorded_each_day_in_series_in_international_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of each hCG measurement in the series, per day, in IU/L.","when_to_set_to_null":"Set to null if any daily hCG value in the series is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing each hCG measurement in the series, per day, in IU/L."} ;; "at least 2 serial human chorionic gonadotropin values measured over 2-14 days"
(declare-const human_chorionic_gonadotropin_value_recorded_first_in_series_in_international_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the first hCG measurement in the series, in IU/L.","when_to_set_to_null":"Set to null if the first hCG value in the series is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the first hCG measurement in the series, in IU/L."} ;; "first value"
(declare-const human_chorionic_gonadotropin_value_recorded_last_in_series_in_international_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the last hCG measurement in the series, in IU/L.","when_to_set_to_null":"Set to null if the last hCG value in the series is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the last hCG measurement in the series, in IU/L."} ;; "last value"
(declare-const number_of_days_between_first_and_last_human_chorionic_gonadotropin_measurement_in_series Real) ;; {"when_to_set_to_value":"Set to the number of days between the first and last hCG measurement in the series.","when_to_set_to_null":"Set to null if the number of days between the first and last hCG measurement in the series is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days between the first and last hCG measurement in the series."} ;; "measured over 2-14 days"
(declare-const number_of_human_chorionic_gonadotropin_measurements_in_series Real) ;; {"when_to_set_to_value":"Set to the total number of hCG measurements in the series.","when_to_set_to_null":"Set to null if the total number of hCG measurements in the series is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of hCG measurements in the series."} ;; "at least 2 serial human chorionic gonadotropin values"
(declare-const patient_has_pregnancy_of_unknown_location_now@@persistent@@less_than_15_percent_rise_per_day_or_less_than_50_percent_fall_between_first_and_last_value Bool) ;; {"when_to_set_to_true":"Set to true if the serial hCG values show less than 15 percent rise per day OR less than 50 percent fall between the first and last value.","when_to_set_to_false":"Set to false if the serial hCG values show 15 percent or greater rise per day AND 50 percent or greater fall between the first and last value.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serial hCG values meet the rise/fall criteria.","meaning":"Boolean indicating whether the serial hCG values show less than 15 percent rise per day OR less than 50 percent fall between the first and last value."} ;; "showing less than 15 percent rise per day OR less than 50 percent fall between the first and last value"
(declare-const patient_has_pregnancy_of_unknown_location_now@@persistent@@measured_over_2_to_14_days_with_at_least_2_serial_values Bool) ;; {"when_to_set_to_true":"Set to true if at least two serial hCG values were measured over a window of 2 to 14 days for the patient.","when_to_set_to_false":"Set to false if the serial hCG measurements do not meet the 2-14 day window or there are fewer than two values.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether at least two serial hCG values were measured over 2-14 days.","meaning":"Boolean indicating whether at least two serial hCG values were measured over 2-14 days for the patient."} ;; "at least 2 serial human chorionic gonadotropin values measured over 2-14 days"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: measured over 2-14 days with at least 2 serial values
(assert
  (! (= patient_has_pregnancy_of_unknown_location_now@@persistent@@measured_over_2_to_14_days_with_at_least_2_serial_values
        (and (>= number_of_human_chorionic_gonadotropin_measurements_in_series 2)
             (>= number_of_days_between_first_and_last_human_chorionic_gonadotropin_measurement_in_series 2)
             (<= number_of_days_between_first_and_last_human_chorionic_gonadotropin_measurement_in_series 14)))
     :named REQ2_AUXILIARY0)) ;; "at least 2 serial human chorionic gonadotropin values measured over 2-14 days"

;; Definition: less than 15% rise per day OR less than 50% fall between first and last value
(assert
  (! (= patient_has_pregnancy_of_unknown_location_now@@persistent@@less_than_15_percent_rise_per_day_or_less_than_50_percent_fall_between_first_and_last_value
        (or
          ;; less than 15% rise per day
          (and
            (> number_of_days_between_first_and_last_human_chorionic_gonadotropin_measurement_in_series 0)
            (< (/ (- human_chorionic_gonadotropin_value_recorded_last_in_series_in_international_units_per_liter
                     human_chorionic_gonadotropin_value_recorded_first_in_series_in_international_units_per_liter)
                   human_chorionic_gonadotropin_value_recorded_first_in_series_in_international_units_per_liter
                   number_of_days_between_first_and_last_human_chorionic_gonadotropin_measurement_in_series)
               0.15))
          ;; less than 50% fall between first and last value
          (> human_chorionic_gonadotropin_value_recorded_first_in_series_in_international_units_per_liter 0)
          (>= (/ (- human_chorionic_gonadotropin_value_recorded_first_in_series_in_international_units_per_liter
                    human_chorionic_gonadotropin_value_recorded_last_in_series_in_international_units_per_liter)
                 human_chorionic_gonadotropin_value_recorded_first_in_series_in_international_units_per_liter)
              0)
          (< (/ (- human_chorionic_gonadotropin_value_recorded_first_in_series_in_international_units_per_liter
                   human_chorionic_gonadotropin_value_recorded_last_in_series_in_international_units_per_liter)
                human_chorionic_gonadotropin_value_recorded_first_in_series_in_international_units_per_liter)
             0.5)))
     :named REQ2_AUXILIARY1)) ;; "showing less than 15 percent rise per day OR less than 50 percent fall between the first and last value"

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_pregnancy_of_unknown_location_now@@persistent@@measured_over_2_to_14_days_with_at_least_2_serial_values
         patient_has_pregnancy_of_unknown_location_now@@persistent)
     :named REQ2_AUXILIARY2)) ;; "measured over 2-14 days with at least 2 serial values" implies persistent

(assert
  (! (=> patient_has_pregnancy_of_unknown_location_now@@persistent@@less_than_15_percent_rise_per_day_or_less_than_50_percent_fall_between_first_and_last_value
         patient_has_pregnancy_of_unknown_location_now@@persistent)
     :named REQ2_AUXILIARY3)) ;; "less than 15 percent rise per day OR less than 50 percent fall" implies persistent

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_pregnancy_of_unknown_location_now@@persistent@@measured_over_2_to_14_days_with_at_least_2_serial_values
          patient_has_pregnancy_of_unknown_location_now@@persistent@@less_than_15_percent_rise_per_day_or_less_than_50_percent_fall_between_first_and_last_value)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have persistence of human chorionic gonadotropin (defined as at least 2 serial human chorionic gonadotropin values measured over 2-14 days, showing less than 15 percent rise per day OR less than 50 percent fall between the first and last value)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hemodynamically_stable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hemodynamically stable.","when_to_set_to_false":"Set to false if the patient is currently not hemodynamically stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hemodynamically stable.","meaning":"Boolean indicating whether the patient is currently hemodynamically stable."} ;; "To be included, the patient must be hemodynamically stable."
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current hemoglobin concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin concentration in milligrams per deciliter."} ;; "To be included, the patient must have hemoglobin concentration greater than 10 milligrams per deciliter."

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Patient must be hemodynamically stable
(assert
  (! patient_has_finding_of_hemodynamically_stable_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be hemodynamically stable."

;; Component 1: Patient must have hemoglobin concentration > 10 mg/dL
(assert
  (! (> patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_milligrams_per_deciliter 10.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hemoglobin concentration greater than 10 milligrams per deciliter."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "age greater than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age greater than or equal to 18 years."
