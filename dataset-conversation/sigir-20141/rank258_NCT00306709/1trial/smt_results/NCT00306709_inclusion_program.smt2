;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."} // "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 30.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index > 30."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_african_american_racial_identity Bool) ;; {"when_to_set_to_true":"Set to true if the patient is identified as having African American racial identity.","when_to_set_to_false":"Set to false if the patient is identified as not having African American racial identity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has African American racial identity.","meaning":"Boolean indicating whether the patient has African American racial identity."} // "To be included, the patient must have African American racial identity."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_african_american_racial_identity
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have African American racial identity."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 40 years AND age ≤ 46 years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have age ≥ 40 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 40.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age ≥ 40 years."

;; Component 1: To be included, the patient must have age ≤ 46 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 46.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age ≤ 46 years."
