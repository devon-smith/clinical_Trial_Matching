;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kg/m^2 if a BMI measurement is recorded for the patient now.","when_to_set_to_null":"Set to null if no BMI measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m^2."} // "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 21.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≥ 21."

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≤ 30."
