;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_consumes_healthy_meals Bool) ;; {"when_to_set_to_true":"Set to true if the patient consumes healthy meals.","when_to_set_to_false":"Set to false if the patient does not consume healthy meals.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient consumes healthy meals.","meaning":"Boolean indicating whether the patient consumes healthy meals."} // "To be included, the patient must consume healthy meals."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_consumes_healthy_meals
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must consume healthy meals."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body mass index (BMI) in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no such BMI measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 24.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≥ 24 kilograms per square meter."

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 31.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≤ 31 kilograms per square meter."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 50 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."
(assert
  (! (<= patient_age_value_recorded_now_in_years 50)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 50 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_hemoglobin_finding_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin level in millimoles per liter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin level in millimoles per liter."} // "hemoglobin level"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_hemoglobin_finding_value_recorded_now_withunit_millimoles_per_liter 8.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hemoglobin level > 8 millimoles per liter."
