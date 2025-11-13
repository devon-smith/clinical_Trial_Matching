;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertension.","meaning":"Boolean indicating whether the patient currently has hypertension."}  ;; "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@resistant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypertension is resistant.","when_to_set_to_false":"Set to false if the patient's current hypertension is not resistant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypertension is resistant.","meaning":"Boolean indicating whether the patient's current hypertension is resistant."}  ;; "resistant hypertension"
(declare-const patient_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a blood pressure measurement in mmHg is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood pressure in mmHg."}  ;; "blood pressure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for resistant hypertension implies hypertension
(assert
  (! (=> patient_has_finding_of_hypertensive_disorder_now@@resistant
         patient_has_finding_of_hypertensive_disorder_now)
     :named REQ0_AUXILIARY0)) ;; If the patient has resistant hypertension, then the patient has hypertension. ("resistant hypertension")

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must have resistant hypertension.
(assert
  (! patient_has_finding_of_hypertensive_disorder_now@@resistant
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have resistant hypertension."

;; Component 1: The patient must have blood pressure greater than 140/90 mmHg.
;; Note: Since only a single numeric variable is provided for blood pressure, we interpret "greater than 140/90 mmHg" as requiring the recorded value to be strictly greater than 140 (systolic) and 90 (diastolic). If only a single value is available, this assertion applies to that value.
(assert
  (! (> patient_blood_pressure_value_recorded_now_withunit_mmhg 140)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have blood pressure greater than 140/90 mmHg."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged 45 years or older"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must be aged 45 years or older.
(assert
  (! (>= patient_age_value_recorded_now_in_years 45)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged 45 years or older."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_blood_levels_monitored_regularly Bool) ;; {"when_to_set_to_true":"Set to true if the patient's blood levels are regularly monitored.","when_to_set_to_false":"Set to false if the patient's blood levels are not regularly monitored.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's blood levels are regularly monitored.","meaning":"Boolean indicating whether the patient's blood levels are regularly monitored."}  ;; "regular monitoring of blood levels"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_blood_levels_monitored_regularly
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have regular monitoring of blood levels considered."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_blood_pressure_value_recorded_inthehistory_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's blood pressure (in mm Hg) is recorded at any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's blood pressure (in mm Hg) as recorded at any time in the patient's history."} ;; "blood pressure (in history)"
(declare-const patient_has_received_pre_medication_to_lower_blood_pressure_for_at_least_3_weeks_before_preliminary_investigation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received pre-medication to lower blood pressure for a duration of at least 3 weeks before the preliminary investigation.","when_to_set_to_false":"Set to false if the patient has not received pre-medication to lower blood pressure for at least 3 weeks before the preliminary investigation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received pre-medication to lower blood pressure for at least 3 weeks before the preliminary investigation.","meaning":"Boolean indicating whether the patient has received pre-medication to lower blood pressure for at least 3 weeks before the preliminary investigation."} ;; "received pre-medication to lower blood pressure for at least 3 weeks before preliminary investigation"
(declare-const pre_medication_to_lower_blood_pressure_duration_before_preliminary_investigation_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks the patient received pre-medication to lower blood pressure before the preliminary investigation.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in weeks of pre-medication to lower blood pressure before the preliminary investigation."} ;; "duration in weeks of pre-medication to lower blood pressure before preliminary investigation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition in the requirement: patient_has_received_pre_medication_to_lower_blood_pressure_for_at_least_3_weeks_before_preliminary_investigation is true iff duration >= 3
(assert
  (! (= patient_has_received_pre_medication_to_lower_blood_pressure_for_at_least_3_weeks_before_preliminary_investigation
        (>= pre_medication_to_lower_blood_pressure_duration_before_preliminary_investigation_in_weeks 3))
     :named REQ3_AUXILIARY0)) ;; "received pre-medication to lower blood pressure for at least 3 weeks before preliminary investigation"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_received_pre_medication_to_lower_blood_pressure_for_at_least_3_weeks_before_preliminary_investigation
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have received pre-medication to lower blood pressure for at least 3 weeks before the preliminary investigation."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."}  ;; "female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."}  ;; "male"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must be male or must be female.
(assert
  (! (or patient_sex_is_male_now
         patient_sex_is_female_now)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
