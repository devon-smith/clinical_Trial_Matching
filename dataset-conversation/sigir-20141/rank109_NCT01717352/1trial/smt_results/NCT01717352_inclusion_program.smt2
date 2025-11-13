;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 21 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 21)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 21 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m^2 if a BMI measurement is recorded for the patient now.","when_to_set_to_null":"Set to null if no BMI measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} // "body mass index"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have body mass index ≥ 25.
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body mass index ≥ 25"

;; Component 1: To be included, the patient must have body mass index ≤ 45.
(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 45.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body mass index ≤ 45"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_duration_of_sleep_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the measured value in hours if the patient's sleep duration is recorded now (typically as an average or representative value for most nights).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's sleep duration in hours, recorded now."} // "sleep duration ≤ 7 hours on most nights"
(declare-const patient_duration_of_sleep_value_recorded_now_withunit_hours@@measured_on_most_nights Bool) ;; {"when_to_set_to_true":"Set to true if the sleep duration measurement reflects the patient's sleep duration on most nights (i.e., is representative of typical nightly sleep).","when_to_set_to_false":"Set to false if the sleep duration measurement does not reflect most nights (e.g., is a single-night measurement or atypical).","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement reflects most nights.","meaning":"Boolean indicating whether the sleep duration measurement reflects most nights."} // "sleep duration ≤ 7 hours on most nights"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have sleep duration ≤ 7 hours on most nights.
(assert
  (! (and patient_duration_of_sleep_value_recorded_now_withunit_hours@@measured_on_most_nights
          (<= patient_duration_of_sleep_value_recorded_now_withunit_hours 7.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "sleep duration ≤ 7 hours on most nights"
