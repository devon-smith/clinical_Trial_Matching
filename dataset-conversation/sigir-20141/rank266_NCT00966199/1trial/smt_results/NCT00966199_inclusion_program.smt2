;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 70 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 70)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 70 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric blood pressure measurement in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's blood pressure measurement in millimeters of mercury, recorded now."} // "systolic office blood pressure measurement ≥ 160 millimeters of mercury"
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@systolic Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement is systolic.","when_to_set_to_false":"Set to false if the blood pressure measurement is not systolic (e.g., diastolic or mean arterial).","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement is systolic.","meaning":"Boolean indicating whether the blood pressure measurement is systolic."} // "systolic office blood pressure measurement"
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_office_setting Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement was taken in the office setting.","when_to_set_to_false":"Set to false if the blood pressure measurement was not taken in the office setting (e.g., home or ambulatory).","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement was taken in the office setting.","meaning":"Boolean indicating whether the blood pressure measurement was taken in the office setting."} // "systolic office blood pressure measurement"
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@systolic@@measured_in_office_setting Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric systolic blood pressure measurement in millimeters of mercury is recorded now and was taken in the office setting.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measurement in millimeters of mercury, recorded now, taken in the office setting."} // "systolic office blood pressure measurement"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; The doubly qualified variable (systolic, office) is only defined if both qualifiers are true and the unqualified value is defined
(assert
  (! (=> (and patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@systolic
              patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_office_setting)
         (= patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@systolic@@measured_in_office_setting
            patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury))
     :named REQ1_AUXILIARY0)) ;; "systolic office blood pressure measurement"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and
        (>= patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@systolic@@measured_in_office_setting 160)
        patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@systolic
        patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_office_setting)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "systolic office blood pressure measurement ≥ 160 millimeters of mercury"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@systolic@@measured_in_home_setting Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric systolic blood pressure measurement in millimeters of mercury is recorded now and was taken in the home setting.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measurement in millimeters of mercury, recorded now, taken in the home setting."} // "systolic home blood pressure measurement ≥ 155 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@systolic@@measured_in_home_setting 155.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a systolic home blood pressure measurement ≥ 155 millimeters of mercury."
