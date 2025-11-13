;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertension.","meaning":"Boolean indicating whether the patient currently has hypertension."}  // "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@untreated_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertension and the hypertension is untreated.","when_to_set_to_false":"Set to false if the patient currently has hypertension and the hypertension is treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertension is untreated.","meaning":"Boolean indicating whether the patient's current hypertension is untreated."}  // "untreated hypertension"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  // "aged between 20 and 80 years old"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a systolic blood pressure measurement in mmHg recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."}  // "systolic blood pressure"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg@@measured_in_sitting_position Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken in a sitting position.","when_to_set_to_false":"Set to false if the systolic blood pressure measurement was not taken in a sitting position.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken in a sitting position.","meaning":"Boolean indicating whether the systolic blood pressure measurement was taken in a sitting position."}  // "systolic blood pressure ... as measured in a sitting position"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a diastolic blood pressure measurement in mmHg recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in mmHg."}  // "diastolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg@@measured_in_sitting_position Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken in a sitting position.","when_to_set_to_false":"Set to false if the diastolic blood pressure measurement was not taken in a sitting position.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken in a sitting position.","meaning":"Boolean indicating whether the diastolic blood pressure measurement was taken in a sitting position."}  // "diastolic blood pressure ... as measured in a sitting position"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for untreated hypertension implies hypertension
(assert
  (! (=> patient_has_finding_of_hypertensive_disorder_now@@untreated_status
         patient_has_finding_of_hypertensive_disorder_now)
     :named REQ0_AUXILIARY0)) ;; "untreated hypertension" implies "hypertension"

;; Qualifier variable for systolic BP measured in sitting position implies systolic BP is available
(assert
  (! (=> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg@@measured_in_sitting_position
         (exists ((x Real)) (= x patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg)))
     :named REQ0_AUXILIARY1)) ;; "systolic BP measured in sitting position" implies systolic BP value is available

;; Qualifier variable for diastolic BP measured in sitting position implies diastolic BP is available
(assert
  (! (=> patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg@@measured_in_sitting_position
         (exists ((x Real)) (= x patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg)))
     :named REQ0_AUXILIARY2)) ;; "diastolic BP measured in sitting position" implies diastolic BP value is available

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have untreated hypertension AND be aged between 20 and 80 years old AND (have systolic BP between 130 and 179 mmHg OR diastolic BP between 85 and 109 mmHg), as measured in a sitting position.
(assert
  (! (and
        patient_has_finding_of_hypertensive_disorder_now@@untreated_status
        (>= patient_age_value_recorded_now_in_years 20.0)
        (<= patient_age_value_recorded_now_in_years 80.0)
        (or
          (and patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg@@measured_in_sitting_position
               (>= patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 130.0)
               (<= patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 179.0))
          (and patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg@@measured_in_sitting_position
               (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 85.0)
               (<= patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 109.0))
        )
     )
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have untreated hypertension AND be aged between 20 and 80 years old AND (have systolic blood pressure between 130 and 179 mmHg OR diastolic blood pressure between 85 and 109 mmHg), as measured in a sitting position."
