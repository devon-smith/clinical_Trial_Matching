;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 35 years AND aged ≤ 70 years"
(declare-const patient_resides_in_area_allotted_to_community_health_worker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in the area allotted to the community health worker.","when_to_set_to_false":"Set to false if the patient currently does not reside in the area allotted to the community health worker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in the area allotted to the community health worker.","meaning":"Boolean indicating whether the patient currently resides in the area allotted to the community health worker."} // "reside in the area allotted to the community health worker"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 35)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 35 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 70)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 70 years."

(assert
  (! patient_resides_in_area_allotted_to_community_health_worker_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must reside in the area allotted to the community health worker."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_cardiovascular_risk_factor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one cardiovascular risk factor as defined by the exhaustive subcategories: hypertension (systolic blood pressure > 140 mmHg OR diastolic blood pressure > 90 mmHg), diabetes mellitus (fasting blood glucose > 126 mg/dL), or current daily tobacco use (self-reported).","when_to_set_to_false":"Set to false if the patient currently has none of the defined cardiovascular risk factors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any of the defined cardiovascular risk factors.","meaning":"Boolean indicating whether the patient currently has at least one cardiovascular risk factor as defined by the exhaustive subcategories."} // "at least one cardiovascular risk factor with exhaustive subcategories ((hypertension (defined as systolic blood pressure > 140 mmHg OR diastolic blood pressure > 90 mmHg)) OR (diabetes mellitus (defined as fasting blood glucose > 126 mg/dL)) OR (current daily tobacco use (defined as self-reported current daily tobacco use)))"
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of hypertension.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of hypertension."} // "hypertension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a current systolic blood pressure measurement in mmHg is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} // "systolic blood pressure > 140 mmHg"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a current diastolic blood pressure measurement in mmHg is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in mmHg."} // "diastolic blood pressure > 90 mmHg"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of diabetes mellitus."} // "diabetes mellitus"
(declare-const patient_fasting_blood_glucose_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a current fasting blood glucose measurement in mg/dL is available.","when_to_set_to_null":"Set to null if no current fasting blood glucose measurement in mg/dL is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fasting blood glucose in mg/dL."} // "fasting blood glucose > 126 mg/dL"
(declare-const patient_has_finding_of_smokes_tobacco_daily_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently smokes tobacco daily.","when_to_set_to_false":"Set to false if the patient currently does not smoke tobacco daily.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently smokes tobacco daily.","meaning":"Boolean indicating whether the patient currently smokes tobacco daily."} // "current daily tobacco use"
(declare-const patient_has_finding_of_smokes_tobacco_daily_now@@self_reported Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current daily tobacco use is self-reported.","when_to_set_to_false":"Set to false if the patient's current daily tobacco use is not self-reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current daily tobacco use is self-reported.","meaning":"Boolean indicating whether the patient's current daily tobacco use is self-reported."} // "self-reported current daily tobacco use"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Hypertension definition: diagnosis or blood pressure criteria
(assert
  (! (= patient_has_finding_of_hypertensive_disorder_now
        (or (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 140.0)
            (> patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 90.0)))
     :named REQ1_AUXILIARY0)) ;; "hypertension (defined as systolic blood pressure > 140 mmHg OR diastolic blood pressure > 90 mmHg)"

;; Diabetes mellitus definition: diagnosis or fasting glucose criteria
(assert
  (! (= patient_has_finding_of_diabetes_mellitus_now
        (> patient_fasting_blood_glucose_value_recorded_now_withunit_mg_per_dl 126.0))
     :named REQ1_AUXILIARY1)) ;; "diabetes mellitus (defined as fasting blood glucose > 126 mg/dL)"

;; Self-reported qualifier implies stem variable for tobacco use
(assert
  (! (=> patient_has_finding_of_smokes_tobacco_daily_now@@self_reported
         patient_has_finding_of_smokes_tobacco_daily_now)
     :named REQ1_AUXILIARY2)) ;; "current daily tobacco use (defined as self-reported current daily tobacco use)"

;; Exhaustive subcategories define the umbrella exactly:
(assert
  (! (= patient_has_cardiovascular_risk_factor_now
        (or patient_has_finding_of_hypertensive_disorder_now
            patient_has_finding_of_diabetes_mellitus_now
            patient_has_finding_of_smokes_tobacco_daily_now@@self_reported))
     :named REQ1_AUXILIARY3)) ;; "at least one cardiovascular risk factor with exhaustive subcategories ..."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_cardiovascular_risk_factor_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have at least one cardiovascular risk factor with exhaustive subcategories ..."
