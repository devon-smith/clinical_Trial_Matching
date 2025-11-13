;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age ≥ 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's mean seated cuff diastolic blood pressure recorded now in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's mean seated cuff diastolic blood pressure recorded now, in millimeters of mercury."} // "mean seated cuff diastolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_as_mean_seated_cuff Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was obtained as a mean seated cuff measurement.","when_to_set_to_false":"Set to false if the diastolic blood pressure measurement was not obtained as a mean seated cuff measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was obtained as mean seated cuff.","meaning":"Boolean indicating whether the diastolic blood pressure measurement was obtained as mean seated cuff."} // "mean seated cuff diastolic blood pressure"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} // "hypertension"
(declare-const patient_has_finding_of_stage_i_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stage I hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have stage I hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stage I hypertension.","meaning":"Boolean indicating whether the patient currently has stage I hypertension."} // "stage I hypertension"
(declare-const patient_has_finding_of_stage_ii_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stage II hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have stage II hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stage II hypertension.","meaning":"Boolean indicating whether the patient currently has stage II hypertension."} // "stage II hypertension"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: stage I hypertension or stage II hypertension is present if either finding is present
(assert
  (! (= patient_has_diagnosis_of_hypertensive_disorder_now
        (or patient_has_finding_of_stage_i_hypertension_now
            patient_has_finding_of_stage_ii_hypertension_now))
     :named REQ1_AUXILIARY0)) ;; "stage I hypertension OR stage II hypertension"

;; Definition: stage I hypertension is present if mean seated cuff diastolic BP is between 95 and 115 mmHg (inclusive) and measured as mean seated cuff
(assert
  (! (= patient_has_finding_of_stage_i_hypertension_now
        (and patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_as_mean_seated_cuff
             (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 95.0)
             (<= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 115.0)))
     :named REQ1_AUXILIARY1)) ;; "defined as (mean seated cuff diastolic blood pressure ≥ 95 mmHg AND ≤ 115 mmHg)"

;; For completeness, stage II hypertension is not further defined in this requirement, so no additional assertion is added.

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have either stage I or stage II hypertension (as defined above)
(assert
  (! (or patient_has_finding_of_stage_i_hypertension_now
         patient_has_finding_of_stage_ii_hypertension_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (stage I hypertension OR stage II hypertension) (defined as ...)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_ability_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to provide written informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to provide written informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to provide written informed consent."} // "the ability to provide written informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_ability_to_provide_written_informed_consent_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have (the ability to provide written informed consent)"
