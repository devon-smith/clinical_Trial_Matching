;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 80)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 80 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sitting_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's sitting systolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's sitting systolic blood pressure measured now, in millimeters of mercury."} // "sitting systolic blood pressure"
(declare-const patient_sitting_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's sitting diastolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's sitting diastolic blood pressure measured now, in millimeters of mercury."} // "sitting diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: sitting systolic blood pressure ≥ 160 mmHg
(assert
  (! (>= patient_sitting_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have sitting systolic blood pressure ≥ 160 millimeters of mercury."

;; Component 1: sitting systolic blood pressure ≤ 199 mmHg
(assert
  (! (<= patient_sitting_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 199.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have sitting systolic blood pressure ≤ 199 millimeters of mercury."

;; Component 2: sitting diastolic blood pressure < 110 mmHg
(assert
  (! (< patient_sitting_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 110.0)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have sitting diastolic blood pressure < 110 millimeters of mercury."
