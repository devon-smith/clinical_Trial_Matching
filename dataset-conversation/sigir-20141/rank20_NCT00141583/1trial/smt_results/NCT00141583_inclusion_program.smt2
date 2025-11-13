;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_essential_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of essential hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of essential hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of essential hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of essential hypertension."} // "To be included, the patient must have essential hypertension."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_essential_hypertension_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have essential hypertension."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in mmHg is recorded now.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement in mmHg is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure in mmHg recorded now."} // "systolic blood pressure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_systolic_blood_pressure_value_recorded_now_withunit_mm_hg 140.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have systolic blood pressure ≥ 140 mmHg."

(assert
  (! (<= patient_systolic_blood_pressure_value_recorded_now_withunit_mm_hg 159.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have systolic blood pressure ≤ 159 mmHg."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured diastolic blood pressure value in mmHg if a measurement is recorded now.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement in mmHg is recorded now or the value is indeterminate.","meaning":"Numeric value of the patient's diastolic blood pressure measured now in mmHg."} // "diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: diastolic blood pressure ≥ 90 mmHg
(assert
  (! (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 90.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have diastolic blood pressure ≥ 90 mmHg."

;; Component 1: diastolic blood pressure ≤ 99 mmHg
(assert
  (! (<= patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 99.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have diastolic blood pressure ≤ 99 mmHg."
