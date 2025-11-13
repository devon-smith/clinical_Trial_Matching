;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_abdominal_pain_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the measured duration in days if the patient's abdominal pain duration is recorded now.","when_to_set_to_null":"Set to null if no such duration measurement is available or the value is indeterminate.","meaning":"Numeric value representing the duration in days of the patient's abdominal pain recorded now."} // "abdominal pain duration < 7 days"
(declare-const patient_abdominal_pain_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the measured duration in hours if the patient's abdominal pain duration is recorded now.","when_to_set_to_null":"Set to null if no such duration measurement is available or the value is indeterminate.","meaning":"Numeric value representing the duration in hours of the patient's abdominal pain recorded now."} // "abdominal pain duration > 2 hours"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: abdominal pain duration > 2 hours
(assert
  (! (> patient_abdominal_pain_value_recorded_now_withunit_hours 2.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "abdominal pain duration > 2 hours"

;; Component 1: abdominal pain duration < 7 days
(assert
  (! (< patient_abdominal_pain_value_recorded_now_withunit_days 7.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "abdominal pain duration < 7 days"
