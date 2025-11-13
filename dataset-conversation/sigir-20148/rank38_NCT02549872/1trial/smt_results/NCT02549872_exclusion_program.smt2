;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_gender_is_recorded_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gender is recorded at the present time.","when_to_set_to_false":"Set to false if the patient's gender is not recorded at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's gender is recorded at the present time.","meaning":"Boolean indicating whether the patient's gender is recorded at the present time."} ;; "recorded gender"

(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is recorded as the specified value (male, female, or other) at the present time.","when_to_set_to_false":"Set to false if the patient's sex is recorded and is not the specified value at the present time.","when_to_set_to_null":"Set to null if the patient's sex is not recorded or is unknown at the present time.","meaning":"Indicates the patient's currently recorded sex (male, female, or other) at the present time."} ;; "recorded gender"

(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is recorded as the specified value (male, female, or other) at the present time.","when_to_set_to_false":"Set to false if the patient's sex is recorded and is not the specified value at the present time.","when_to_set_to_null":"Set to null if the patient's sex is not recorded or is unknown at the present time.","meaning":"Indicates the patient's currently recorded sex (male, female, or other) at the present time."} ;; "recorded gender"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_gender_is_recorded_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have recorded gender."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const follow_up_duration_value_recorded_between_study_entry_and_administrative_censoring_in_years Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the number of years of follow-up between study entry and the date of administrative censoring for the patient.","when_to_set_to_null":"Set to null if the follow-up duration between study entry and administrative censoring cannot be determined, is not documented, or is missing.","meaning":"Numeric value representing the patient's follow-up duration in years between study entry and administrative censoring."} ;; "follow-up duration between study entry and date of administrative censoring < 1 year"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< follow_up_duration_value_recorded_between_study_entry_and_administrative_censoring_in_years 1))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has follow-up duration between study entry and date of administrative censoring < 1 year."
