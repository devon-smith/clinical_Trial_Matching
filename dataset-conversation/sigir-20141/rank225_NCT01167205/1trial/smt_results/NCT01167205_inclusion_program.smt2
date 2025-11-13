;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (BMI) recorded now is available, in kilograms per square meter.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index > 25.0 kilograms per square meter."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_non_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a non-smoker.","when_to_set_to_false":"Set to false if the patient is currently a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a non-smoker.","meaning":"Boolean indicating whether the patient is currently a non-smoker."} // "non-smoker"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_non_smoker_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a non-smoker."
