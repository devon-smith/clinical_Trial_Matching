;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 18 years of age"
(declare-const patient_has_been_admitted_to_intensive_care_unit_at_koge_hospital_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been admitted to the intensive care unit at Køge Hospital during the study period.","when_to_set_to_false":"Set to false if the patient has not been admitted to the intensive care unit at Køge Hospital during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been admitted to the intensive care unit at Køge Hospital during the study period.","meaning":"Boolean indicating whether the patient has been admitted to the intensive care unit at Køge Hospital during the study period."} // "must have been admitted to the intensive care unit at Køge Hospital during the study period"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 18 years of age."

(assert
  (! patient_has_been_admitted_to_intensive_care_unit_at_koge_hospital_during_study_period
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been admitted to the intensive care unit at Køge Hospital during the study period."
