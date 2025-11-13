;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index (BMI) measured now in kg/m²."}  // "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≥ 25."

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 32.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≤ 32."
