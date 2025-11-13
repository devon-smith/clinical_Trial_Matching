;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical evidence of myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have clinical evidence of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical evidence of myocardial infarction.","meaning":"Boolean indicating whether the patient currently has clinical evidence of myocardial infarction."}  ;; "clinical evidence of myocardial infarction"
(declare-const patient_has_finding_of_ischemic_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ischemic chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have ischemic chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ischemic chest pain.","meaning":"Boolean indicating whether the patient currently has ischemic chest pain."}  ;; "ischemic chest pain"
(declare-const duration_of_ischemic_chest_pain_value_recorded_now_in_minutes Real) ;; {"when_to_set_to_value":"Set to the numeric value in minutes representing the duration of ischemic chest pain experienced by the patient, recorded now.","when_to_set_to_null":"Set to null if the duration of ischemic chest pain is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration, in minutes, of ischemic chest pain experienced by the patient, recorded now."}  ;; "ischemic chest pain lasting for more than 30 minutes"
(declare-const time_interval_from_onset_of_symptoms_to_hospital_admission_value_recorded_now_in_hours Real) ;; {"when_to_set_to_value":"Set to the numeric value in hours representing the time interval from onset of symptoms to hospital admission, recorded now.","when_to_set_to_null":"Set to null if the time interval from onset of symptoms to hospital admission is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the time interval, in hours, from the onset of symptoms to hospital admission for the patient, recorded now."}  ;; "time interval from onset of symptoms to hospital admission less than 6 hours"
(declare-const patient_has_finding_of_st_segment_elevation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment elevation.","when_to_set_to_false":"Set to false if the patient currently does not have ST-segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST-segment elevation.","meaning":"Boolean indicating whether the patient currently has ST-segment elevation."}  ;; "ST-segment elevation"
(declare-const patient_has_finding_of_st_segment_elevation_now@@typical Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ST-segment elevation is typical.","when_to_set_to_false":"Set to false if the patient's ST-segment elevation is not typical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ST-segment elevation is typical.","meaning":"Boolean indicating whether the patient's ST-segment elevation is typical."}  ;; "typical ST-segment elevation"
(declare-const patient_has_finding_of_st_segment_elevation_now@@detected_on_12_lead_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ST-segment elevation is detected on the 12-lead electrocardiogram.","when_to_set_to_false":"Set to false if the patient's ST-segment elevation is not detected on the 12-lead electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ST-segment elevation is detected on the 12-lead electrocardiogram.","meaning":"Boolean indicating whether the patient's ST-segment elevation is detected on the 12-lead electrocardiogram."}  ;; "ST-segment elevation on the 12-lead electrocardiogram"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_st_segment_elevation_now@@typical
         patient_has_finding_of_st_segment_elevation_now)
     :named REQ0_AUXILIARY0)) ;; "typical ST-segment elevation"

(assert
  (! (=> patient_has_finding_of_st_segment_elevation_now@@detected_on_12_lead_electrocardiogram
         patient_has_finding_of_st_segment_elevation_now)
     :named REQ0_AUXILIARY1)) ;; "ST-segment elevation on the 12-lead electrocardiogram"

;; Definition: clinical evidence of myocardial infarction is defined by all three conditions
(assert
  (! (= patient_has_finding_of_myocardial_infarction_now
        (and
          (and patient_has_finding_of_ischemic_chest_pain_now
               (> duration_of_ischemic_chest_pain_value_recorded_now_in_minutes 30))
          (< time_interval_from_onset_of_symptoms_to_hospital_admission_value_recorded_now_in_hours 6)
          (and patient_has_finding_of_st_segment_elevation_now@@typical
               patient_has_finding_of_st_segment_elevation_now@@detected_on_12_lead_electrocardiogram)))
     :named REQ0_AUXILIARY2)) ;; "clinical evidence of myocardial infarction defined by (ischemic chest pain lasting for more than 30 minutes) AND (time interval from onset of symptoms to hospital admission less than 6 hours) AND (typical ST-segment elevation on the 12-lead electrocardiogram)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_myocardial_infarction_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (clinical evidence of myocardial infarction defined by (ischemic chest pain lasting for more than 30 minutes) AND (time interval from onset of symptoms to hospital admission less than 6 hours) AND (typical ST-segment elevation on the 12-lead electrocardiogram))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_culprit_lesion_stenosis_diameter_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured or documented percentage diameter stenosis of the culprit lesion detected by angiography in the patient at the current time.","when_to_set_to_null":"Set to null if no such value is available or cannot be determined.","meaning":"Numeric value representing the percentage diameter stenosis of the culprit lesion detected by angiography in the patient at the current time."} ;; "angiographic-detected culprit lesion with stenosis diameter greater than 70%"
(declare-const patient_has_finding_of_culprit_lesion_of_coronary_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a culprit lesion of a coronary artery as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have a culprit lesion of a coronary artery as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a culprit lesion of a coronary artery.","meaning":"Boolean indicating whether the patient currently has a culprit lesion of a coronary artery."} ;; "angiographic-detected culprit lesion"
(declare-const patient_myocardial_infarction_value_recorded_now_withunit_grade Real) ;; {"when_to_set_to_value":"Set to the measured or documented TIMI flow grade value if available for the patient's current myocardial infarction.","when_to_set_to_null":"Set to null if no such value is available or cannot be determined.","meaning":"Numeric value representing the TIMI flow grade for the patient's current myocardial infarction."} ;; "thrombolysis in myocardial infarction flow grade less than or equal to 1"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; None required for this requirement (no umbrella, no equivalence, no definition).

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Angiographic-detected culprit lesion with stenosis diameter greater than 70%
(assert
  (! (and patient_has_finding_of_culprit_lesion_of_coronary_artery_now
          (> patient_culprit_lesion_stenosis_diameter_value_recorded_now_withunit_percent 70.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "angiographic-detected culprit lesion with stenosis diameter greater than 70%"

;; Component 1: Thrombolysis in myocardial infarction flow grade less than or equal to 1
(assert
  (! (<= patient_myocardial_infarction_value_recorded_now_withunit_grade 1.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "thrombolysis in myocardial infarction flow grade less than or equal to 1"
