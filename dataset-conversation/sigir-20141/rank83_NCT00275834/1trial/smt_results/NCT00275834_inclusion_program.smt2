;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."} // "body mass index"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have body mass index ≥ 30.
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body mass index ≥ 30"

;; Component 1: To be included, the patient must have body mass index ≤ 50.
(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 50.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body mass index ≤ 50"
