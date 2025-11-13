;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_male Bool) ;; {"when_to_set_to_true":"Set to true if the patient is male.","when_to_set_to_false":"Set to false if the patient is not male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is male.","meaning":"Boolean indicating whether the patient is male."} // "To be included, the patient must be male."
(declare-const patients_health_status_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently healthy (has positive health status) at the present time.","when_to_set_to_false":"Set to false if the patient is currently not healthy (does not have positive health status) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently healthy.","meaning":"Boolean indicating whether the patient is currently healthy (has positive health status) at the present time."} // "To be included, the patient must have health."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_male
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male."
(assert
  (! patients_health_status_is_positive_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have health."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's BMI in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index (BMI) in kilograms per square meter, recorded now."} // "body mass index"
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight in kilograms, recorded now."} // "weight"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 18.5)
          (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have weight in the normal range (defined as body mass index ≥ 18.5 kilograms per square meter AND body mass index ≤ 25 kilograms per square meter)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years AND age ≤ 40 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 40)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age ≤ 40 years."
