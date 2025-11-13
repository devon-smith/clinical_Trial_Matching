;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_apnea_value_recorded_now_withunit_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's apnea index (number of apnea events per hour) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's apnea index (number of apnea events per hour) recorded now."} // "have an apnea index > 20 per hour"
(declare-const patient_slow_shallow_breathing_value_recorded_now_withunit_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hypopnea index (number of hypopnea events per hour) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's hypopnea index (number of hypopnea events per hour) recorded now."} // "have a hypopnea index > 20 per hour"
(declare-const patient_is_being_treated_with_continuous_positive_airway_pressure_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with continuous positive airway pressure (CPAP) therapy.","when_to_set_to_false":"Set to false if the patient is not currently being treated with continuous positive airway pressure (CPAP) therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with continuous positive airway pressure (CPAP) therapy.","meaning":"Boolean indicating whether the patient is currently being treated with continuous positive airway pressure (CPAP) therapy."} // "be treated with continuous positive airway pressure therapy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_apnea_value_recorded_now_withunit_per_hour 20.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have an apnea index > 20 per hour"

(assert
  (! (> patient_slow_shallow_breathing_value_recorded_now_withunit_per_hour 20.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have a hypopnea index > 20 per hour"

(assert
  (! patient_is_being_treated_with_continuous_positive_airway_pressure_therapy_now
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be treated with continuous positive airway pressure therapy"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a diastolic blood pressure measurement in mmHg is recorded now.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement in mmHg is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in mmHg."} // "diastolic blood pressure"
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor hypertension control (uncontrolled hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have poor hypertension control (uncontrolled hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor hypertension control (uncontrolled hypertension).","meaning":"Boolean indicating whether the patient currently has poor hypertension control (uncontrolled hypertension)."} // "uncontrolled hypertension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a systolic blood pressure measurement in mmHg is recorded now.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement in mmHg is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} // "systolic blood pressure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition of uncontrolled hypertension as per requirement: (systolic BP > 130 mmHg) OR (diastolic BP > 80 mmHg)
(assert
  (! (= patient_has_finding_of_poor_hypertension_control_now
        (or (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 130.0)
            (> patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 80.0)))
     :named REQ1_AUXILIARY0)) ;; "uncontrolled hypertension (defined as (systolic blood pressure > 130 mmHg) OR (diastolic blood pressure > 80 mmHg))"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_poor_hypertension_control_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have uncontrolled hypertension"
