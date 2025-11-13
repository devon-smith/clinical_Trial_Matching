;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 20 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 20)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 20 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (BMI) in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no such BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index ≥ 28 kilograms per square meter AND body mass index ≤ 35 kilograms per square meter"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 28.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body mass index ≥ 28 kilograms per square meter"

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 35.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body mass index ≤ 35 kilograms per square meter"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patients_tobacco_smoking_consumption_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently smokes tobacco.","when_to_set_to_false":"Set to false if the patient currently does not smoke tobacco.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently smokes tobacco.","meaning":"Boolean indicating whether the patient currently smokes tobacco."} // "smoke tobacco"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patients_tobacco_smoking_consumption_is_positive_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT smoke tobacco."
