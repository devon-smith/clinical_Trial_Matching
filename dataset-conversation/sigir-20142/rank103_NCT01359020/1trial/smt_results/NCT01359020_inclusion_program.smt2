;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}  ;; "aged ≥ 6 months AND ≤ 6 years"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."}  ;; "female child"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."}  ;; "male child"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and (or patient_sex_is_male_now
              patient_sex_is_female_now) ;; "((a male child) OR (a female child))"
          (and (>= patient_age_value_recorded_now_in_months 6.0)
               (<= patient_age_value_recorded_now_in_months 72.0))) ;; "aged ≥ 6 months AND ≤ 6 years"
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body weight in kilograms is available.","when_to_set_to_null":"Set to null if the patient's current body weight in kilograms is not available or cannot be determined.","meaning":"Numeric value representing the patient's current body weight in kilograms."}  ;; "body weight > 5 kilograms"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_body_weight_value_recorded_now_withunit_kilograms 5.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a body weight > 5 kilograms."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_axillary_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's axillary temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no axillary temperature measurement in degrees Celsius is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current axillary temperature in degrees Celsius."}  ;; "axillary temperature > 37.5 degrees Celsius"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_axillary_temperature_value_recorded_now_withunit_celsius 37.5)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an axillary temperature > 37.5 degrees Celsius."
