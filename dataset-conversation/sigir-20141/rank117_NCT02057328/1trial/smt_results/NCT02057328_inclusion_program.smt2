;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_arterial_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of arterial hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of arterial hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of arterial hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of arterial hypertension."}  ;; "To be included, the patient must be diagnosed with stage I arterial hypertension"
(declare-const patient_has_finding_of_arterial_hypertension_now@@stage_i Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current arterial hypertension is classified as stage I.","when_to_set_to_false":"Set to false if the patient's current arterial hypertension is not classified as stage I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current arterial hypertension is classified as stage I.","meaning":"Boolean indicating whether the patient's current arterial hypertension is classified as stage I."}  ;; "stage I arterial hypertension"

(declare-const patient_has_undergone_ambulatory_blood_pressure_recording_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone ambulatory blood pressure monitoring (ABPM) in the past.","when_to_set_to_false":"Set to false if the patient has never undergone ambulatory blood pressure monitoring (ABPM) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone ambulatory blood pressure monitoring (ABPM) in the past.","meaning":"Boolean indicating whether the patient has ever undergone ambulatory blood pressure monitoring (ABPM) in the past."} ;; "ambulatory blood pressure monitoring"
(declare-const patient_has_undergone_ambulatory_blood_pressure_recording_inthehistory@@performed_over_24_hour_period Bool) ;; {"when_to_set_to_true":"Set to true if the ambulatory blood pressure monitoring (ABPM) was performed over a 24-hour period.","when_to_set_to_false":"Set to false if the ABPM was not performed over a 24-hour period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ABPM was performed over a 24-hour period.","meaning":"Boolean indicating whether the ABPM was performed over a 24-hour period."} ;; "24-hour ambulatory blood pressure monitoring"

(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the value of the patient's systolic blood pressure (in mmHg) as measured by ambulatory blood pressure monitoring (ABPM) over a 24-hour period, recorded at any time in the past.","when_to_set_to_null":"Set to null if no such measurement is available or if it is indeterminate whether the value was measured by ABPM over a 24-hour period.","meaning":"Numeric value representing the patient's systolic blood pressure (in mmHg) recorded at any time in the past."} ;; "24-hour systolic blood pressure"
(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_by_ambulatory_blood_pressure_monitoring Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure value was measured by ambulatory blood pressure monitoring (ABPM).","when_to_set_to_false":"Set to false if the systolic blood pressure value was not measured by ABPM.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the value was measured by ABPM.","meaning":"Boolean indicating whether the systolic blood pressure value was measured by ABPM."} ;; "measured by ambulatory blood pressure monitoring"
(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_over_24_hour_period Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure value represents the average over a 24-hour period.","when_to_set_to_false":"Set to false if the value does not represent a 24-hour average.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the value is a 24-hour average.","meaning":"Boolean indicating whether the systolic blood pressure value is a 24-hour average."} ;; "24-hour systolic blood pressure"

(declare-const patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the value of the patient's diastolic blood pressure (in mmHg) as measured by ambulatory blood pressure monitoring (ABPM) over a 24-hour period, recorded at any time in the past.","when_to_set_to_null":"Set to null if no such measurement is available or if it is indeterminate whether the value was measured by ABPM over a 24-hour period.","meaning":"Numeric value representing the patient's diastolic blood pressure (in mmHg) recorded at any time in the past."} ;; "24-hour diastolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_by_ambulatory_blood_pressure_monitoring Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure value was measured by ambulatory blood pressure monitoring (ABPM).","when_to_set_to_false":"Set to false if the diastolic blood pressure value was not measured by ABPM.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the value was measured by ABPM.","meaning":"Boolean indicating whether the diastolic blood pressure value was measured by ABPM."} ;; "measured by ambulatory blood pressure monitoring"
(declare-const patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_over_24_hour_period Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure value represents the average over a 24-hour period.","when_to_set_to_false":"Set to false if the value does not represent a 24-hour average.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the value is a 24-hour average.","meaning":"Boolean indicating whether the diastolic blood pressure value is a 24-hour average."} ;; "24-hour diastolic blood pressure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for stage I implies stem variable
(assert
  (! (=> patient_has_finding_of_arterial_hypertension_now@@stage_i
         patient_has_finding_of_arterial_hypertension_now)
     :named REQ0_AUXILIARY0)) ;; "stage I arterial hypertension"

;; Qualifier variable for ABPM over 24 hours implies stem variable
(assert
  (! (=> patient_has_undergone_ambulatory_blood_pressure_recording_inthehistory@@performed_over_24_hour_period
         patient_has_undergone_ambulatory_blood_pressure_recording_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "ambulatory blood pressure monitoring over 24 hours"

;; Systolic BP qualifiers imply measurement is by ABPM and over 24 hours
(assert
  (! (=> (and patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_by_ambulatory_blood_pressure_monitoring
              patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_over_24_hour_period)
         patient_has_undergone_ambulatory_blood_pressure_recording_inthehistory@@performed_over_24_hour_period)
     :named REQ0_AUXILIARY2)) ;; "systolic BP measured by ABPM over 24 hours"

;; Diastolic BP qualifiers imply measurement is by ABPM and over 24 hours
(assert
  (! (=> (and patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_by_ambulatory_blood_pressure_monitoring
              patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_over_24_hour_period)
         patient_has_undergone_ambulatory_blood_pressure_recording_inthehistory@@performed_over_24_hour_period)
     :named REQ0_AUXILIARY3)) ;; "diastolic BP measured by ABPM over 24 hours"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must be diagnosed with stage I arterial hypertension
(assert
  (! patient_has_finding_of_arterial_hypertension_now@@stage_i
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosed with stage I arterial hypertension"

;; Component 1: Must have ABPM results (24-hour systolic BP >= 130 mmHg AND 24-hour diastolic BP >= 80 mmHg)
(assert
  (! (and
        patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_by_ambulatory_blood_pressure_monitoring
        patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_over_24_hour_period
        (>= patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 130.0)
        patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_by_ambulatory_blood_pressure_monitoring
        patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@measured_over_24_hour_period
        (>= patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 80.0)
     )
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "ambulatory blood pressure monitoring results (24-hour systolic blood pressure ≥ 130 mmHg AND 24-hour diastolic blood pressure ≥ 80 mmHg)"
