;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 65.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age ≥ 65 years)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_duration_in_emergency_department_at_enrollment_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has been in the emergency department at the time of enrollment.","when_to_set_to_null":"Set to null if the duration in hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the total duration, in hours, that the patient has been in the emergency department at the time of enrollment."} // "in the emergency department for < 12 hours at the time of enrollment"
(declare-const patient_is_located_in_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently located in the emergency department at the time of enrollment.","when_to_set_to_false":"Set to false if the patient is not currently located in the emergency department at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently located in the emergency department at the time of enrollment.","meaning":"Boolean indicating whether the patient is currently located in the emergency department at the time of enrollment."} // "in the emergency department for < 12 hours at the time of enrollment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must be in the emergency department for less than 12 hours at the time of enrollment
(assert
  (! (and patient_is_located_in_emergency_department_now
          (< patient_duration_in_emergency_department_at_enrollment_in_hours 12.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))
