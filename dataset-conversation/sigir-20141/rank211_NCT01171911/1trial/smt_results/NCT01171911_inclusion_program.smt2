;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_non_q_wave_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-Q wave myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-Q wave myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-Q wave myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-Q wave myocardial infarction."} // "a diagnosis of non-Q wave myocardial infarction"
(declare-const patient_has_diagnosis_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has a diagnosis of unstable angina (preinfarction syndrome)."} // "a diagnosis of unstable angina"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_preinfarction_syndrome_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of unstable angina."

(assert
  (! patient_has_diagnosis_of_non_q_wave_myocardial_infarction_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of non-Q wave myocardial infarction."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 18 years"

;; Component 1: To be included, the patient must be aged ≤ 75 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 75 years"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const diameter_stenosis_value_by_visual_estimation_of_coronary_artery_percent Real) ;; {"when_to_set_to_value":"Set to the percentage value if the diameter stenosis of the coronary artery has been determined by visual estimation.","when_to_set_to_null":"Set to null if the percentage diameter stenosis of the coronary artery by visual estimation is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percentage diameter stenosis of the coronary artery as determined by visual estimation."} // "diameter stenosis of coronary artery < 70% by visual estimation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (< diameter_stenosis_value_by_visual_estimation_of_coronary_artery_percent 70.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "diameter stenosis of coronary artery < 70% by visual estimation"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure in mmHg is recorded now.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement in mmHg is available for now or the value is indeterminate.","meaning":"Numeric value of the patient's systolic blood pressure in mmHg recorded now."} // "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure in mmHg is recorded now.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement in mmHg is available for now or the value is indeterminate.","meaning":"Numeric value of the patient's diastolic blood pressure in mmHg recorded now."} // "diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 110.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have systolic blood pressure > 110 mmHg."

(assert
  (! (> patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 70.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have diastolic blood pressure > 70 mmHg."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's heart rate in beats per minute is recorded now.","when_to_set_to_null":"Set to null if no heart rate measurement in beats per minute is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's heart rate measured now, in beats per minute."} // "heart rate"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 60)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "heart rate ≥ 60 beats per minute"

(assert
  (! (<= patient_heart_rate_value_recorded_now_withunit_beats_per_minute 100)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "heart rate ≤ 100 beats per minute"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a conduction disorder of the heart (cardiac arrhythmias).","when_to_set_to_false":"Set to false if the patient currently does not have a conduction disorder of the heart (cardiac arrhythmias).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a conduction disorder of the heart (cardiac arrhythmias).","meaning":"Boolean indicating whether the patient currently has a conduction disorder of the heart (cardiac arrhythmias)."} // "cardiac arrhythmias"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must NOT have cardiac arrhythmias.
(assert
  (! (not patient_has_finding_of_conduction_disorder_of_the_heart_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have cardiac arrhythmias."
