;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_african_american Bool) ;; "Boolean demographic variable indicating whether the patient is African-American." {"when_to_set_to_true":"Set to true if the patient is African-American.","when_to_set_to_false":"Set to false if the patient is not African-American.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is African-American.","meaning":"Boolean indicating whether the patient is African-American."} ;; "To be included, the patient must be African-American."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_african_american
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be African-American."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; "Boolean value indicating whether the patient is currently female." {"when_to_set_to_true":"Set to true if the patient is currently documented as female.","when_to_set_to_false":"Set to false if the patient is currently documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently female."} ;; "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; "Boolean value indicating whether the patient is currently male." {"when_to_set_to_true":"Set to true if the patient is currently documented as male.","when_to_set_to_false":"Set to false if the patient is currently documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently male."} ;; "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} ;; "To be included, the patient must have a current diagnosis of type 2 diabetes mellitus (documented by medical history)."
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@documented_by_medical_history Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus, and this diagnosis is documented by medical history." {"when_to_set_to_true":"Set to true if the patient's current diagnosis of type 2 diabetes mellitus is documented by medical history.","when_to_set_to_false":"Set to false if the patient's current diagnosis of type 2 diabetes mellitus is not documented by medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of type 2 diabetes mellitus is documented by medical history.","meaning":"Boolean indicating whether the patient's current diagnosis of type 2 diabetes mellitus is documented by medical history."} ;; "To be included, the patient must have a current diagnosis of type 2 diabetes mellitus (documented by medical history)."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@documented_by_medical_history
         patient_has_diagnosis_of_type_2_diabetes_mellitus_now)
     :named REQ2_AUXILIARY0)) ;; "To be included, the patient must have a current diagnosis of type 2 diabetes mellitus (documented by medical history)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@documented_by_medical_history
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a current diagnosis of type 2 diabetes mellitus (documented by medical history)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; "Numeric value representing the patient's mean sitting diastolic blood pressure measurement (in millimeters of mercury) recorded now." {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's mean sitting diastolic blood pressure (in millimeters of mercury) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's mean sitting diastolic blood pressure measurement (in millimeters of mercury) recorded now."} ;; "mean sitting diastolic blood pressure measurement ≥ 90 millimeters of mercury AND mean sitting diastolic blood pressure measurement ≤ 110 millimeters of mercury"
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@mean_sitting_diastolic_measurement Bool) ;; "Numeric value representing the patient's mean sitting diastolic blood pressure measurement (in millimeters of mercury) recorded now, specifically qualifying that the measurement is the mean of sitting diastolic readings." {"when_to_set_to_true":"Set to true if the recorded blood pressure value is specifically the mean of sitting diastolic measurements.","when_to_set_to_false":"Set to false if the recorded blood pressure value is not the mean of sitting diastolic measurements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement is the mean of sitting diastolic readings.","meaning":"Boolean indicating whether the numeric blood pressure value is the mean sitting diastolic measurement."} ;; "mean sitting diastolic blood pressure measurement"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@mean_sitting_diastolic_measurement
          (>= patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "mean sitting diastolic blood pressure measurement ≥ 90 millimeters of mercury"

(assert
  (! (and patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@mean_sitting_diastolic_measurement
          (<= patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 110.0))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "mean sitting diastolic blood pressure measurement ≤ 110 millimeters of mercury"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent Real) ;; "Numeric value representing the patient's hemoglobin A1c measurement recorded now, in percent." {"when_to_set_to_value":"Set to the measured value if a hemoglobin A1c measurement in percent is recorded for the patient now.","when_to_set_to_null":"Set to null if no hemoglobin A1c measurement in percent is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's hemoglobin A1c measurement recorded now, in percent."} ;; "To be included, the patient must have hemoglobin A1c measurement ≤ 9.5 percent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (<= patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent 9.5)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hemoglobin A1c measurement ≤ 9.5 percent."
