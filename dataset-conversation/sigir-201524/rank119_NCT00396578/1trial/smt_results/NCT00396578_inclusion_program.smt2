;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const mechanical_ventilation_duration_value_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has been on mechanical ventilation (artificial respiration) for the current episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient has been on mechanical ventilation (artificial respiration) for the current episode.","meaning":"Numeric value indicating the total duration, in days, that the patient has been on mechanical ventilation (artificial respiration) for the current episode."}  ;; "the patient must be on mechanical ventilation for greater than three days."
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing mechanical ventilation (artificial respiration).","when_to_set_to_false":"Set to false if the patient is currently not undergoing mechanical ventilation (artificial respiration).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing mechanical ventilation (artificial respiration).","meaning":"Boolean indicating whether the patient is currently undergoing mechanical ventilation (artificial respiration) now."}  ;; "the patient must be on mechanical ventilation for greater than three days."
(declare-const patient_is_undergoing_artificial_respiration_now@@duration_greater_than_three_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing mechanical ventilation and the duration has exceeded three days.","when_to_set_to_false":"Set to false if the patient is currently undergoing mechanical ventilation but the duration is three days or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of mechanical ventilation exceeds three days.","meaning":"Boolean indicating whether the duration of current mechanical ventilation exceeds three days."}  ;; "the patient must be on mechanical ventilation for greater than three days."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: patient_is_undergoing_artificial_respiration_now@@duration_greater_than_three_days means patient is currently on mechanical ventilation AND duration > 3 days
(assert
  (! (= patient_is_undergoing_artificial_respiration_now@@duration_greater_than_three_days
        (and patient_is_undergoing_artificial_respiration_now
             (> mechanical_ventilation_duration_value_in_days 3.0)))
     :named REQ0_AUXILIARY0)) ;; "the patient must be on mechanical ventilation for greater than three days."

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_undergoing_artificial_respiration_now@@duration_greater_than_three_days
         patient_is_undergoing_artificial_respiration_now)
     :named REQ0_AUXILIARY1)) ;; "the patient must be on mechanical ventilation for greater than three days."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_undergoing_artificial_respiration_now@@duration_greater_than_three_days
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be on mechanical ventilation for greater than three days."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged greater than or equal to eighteen years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to eighteen years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_survival_time_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the estimated number of days if the patient's survival expectancy is currently assessed and available.","when_to_set_to_null":"Set to null if no current estimate of survival expectancy in days is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current estimated survival expectancy in days."} ;; "the patient must have a survival expectancy greater than fourteen days."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_survival_time_value_recorded_now_withunit_days 14.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a survival expectancy greater than fourteen days."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_tracheal_mucus_value_recorded_now_withunit_cubic_centimeter_per_4_hours Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's tracheal mucus (tracheal secretion) volume in cubic centimeters per four hours is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's tracheal mucus (tracheal secretion) volume in cubic centimeters per four hours, recorded now."} ;; "tracheal secretion volume greater than two cubic centimeters per four hours"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_tracheal_mucus_value_recorded_now_withunit_cubic_centimeter_per_4_hours 2.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have tracheal secretion volume greater than two cubic centimeters per four hours."
