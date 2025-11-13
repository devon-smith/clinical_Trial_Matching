;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_requires_intubation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires intubation.","when_to_set_to_false":"Set to false if the patient currently does not require intubation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires intubation.","meaning":"Boolean indicating whether the patient currently requires intubation."}  ;; "the patient must require intubation"
(declare-const patient_requires_mechanical_ventilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires mechanical ventilation.","when_to_set_to_false":"Set to false if the patient currently does not require mechanical ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires mechanical ventilation.","meaning":"Boolean indicating whether the patient currently requires mechanical ventilation."}  ;; "the patient must require mechanical ventilation"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must require intubation.
(assert
  (! patient_requires_intubation_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must require intubation"

;; Component 1: The patient must require mechanical ventilation.
(assert
  (! patient_requires_mechanical_ventilation_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must require mechanical ventilation"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (BMI) in kilograms per square meter is recorded now.","when_to_set_to_null":"Set to null if no such BMI measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."}  ;; "body mass index ≥ 40 kilograms per square meter"
(declare-const patient_intraabdominal_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured intra-abdominal pressure value if a numeric measurement in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such intra-abdominal pressure measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current intra-abdominal pressure in millimeters of mercury."}  ;; "intra-abdominal pressure ≥ 12 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must ((have a body mass index ≥ 40 kilograms per square meter) OR (have an intra-abdominal pressure ≥ 12 millimeters of mercury)).
(assert
  (! (or (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 40.0)
         (>= patient_intraabdominal_pressure_value_recorded_now_withunit_millimeters_of_mercury 12.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have a body mass index ≥ 40 kilograms per square meter) OR (have an intra-abdominal pressure ≥ 12 millimeters of mercury))."
