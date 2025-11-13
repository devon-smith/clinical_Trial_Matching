;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  // "an adult"
(declare-const patients_health_status_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive health status (is healthy).","when_to_set_to_false":"Set to false if the patient currently does not have a positive health status (is not healthy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive health status.","meaning":"Boolean indicating whether the patient currently has a positive health status (is healthy) at the present time."}  // "health"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an adult."

(assert
  (! patients_health_status_is_positive_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have health."
