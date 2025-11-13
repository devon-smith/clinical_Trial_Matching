;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged less than twenty-one years OR aged greater than sixty-five years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 21))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is aged less than twenty-one years."

(assert
(! (not (> patient_age_value_recorded_now_in_years 65))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is aged greater than sixty-five years."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body mass index (BMI) is recorded now in kilograms per square meter.","when_to_set_to_null":"Set to null if no BMI measurement is available for now in kilograms per square meter or if the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index greater than twenty-three kilograms per square meter"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 23))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have a body mass index greater than twenty-three kilograms per square meter."
