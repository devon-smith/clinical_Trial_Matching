;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 8 years AND aged ≤ 11 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 8)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 8 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 11)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 11 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_percent_overweight_recorded_now Real) ;; {"when_to_set_to_value":"Set to the calculated percent overweight based on BMI if available for the patient now.","when_to_set_to_null":"Set to null if no percent overweight based on BMI is available for the patient now or if the value is indeterminate.","meaning":"Numeric value representing the patient's percent overweight based on BMI, measured now."} // "no greater than 100% overweight"
(declare-const patient_body_mass_index_percentile_for_age_recorded_now Real) ;; {"when_to_set_to_value":"Set to the measured BMI percentile for age if available for the patient now.","when_to_set_to_null":"Set to null if no BMI percentile for age is available for the patient now or if the value is indeterminate.","meaning":"Numeric value representing the patient's BMI percentile for age, measured now."} // "body mass index for age greater than the 5th percentile"
(declare-const patient_body_mass_index_percentile_for_gender_recorded_now Real) ;; {"when_to_set_to_value":"Set to the measured BMI percentile for gender if available for the patient now.","when_to_set_to_null":"Set to null if no BMI percentile for gender is available for the patient now or if the value is indeterminate.","meaning":"Numeric value representing the patient's BMI percentile for gender, measured now."} // "body mass index for gender greater than the 5th percentile"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have BMI-for-age > 5th percentile AND BMI-for-gender > 5th percentile AND percent overweight ≤ 100%
(assert
  (! (and (> patient_body_mass_index_percentile_for_age_recorded_now 5.0) ;; "body mass index for age greater than the 5th percentile"
          (> patient_body_mass_index_percentile_for_gender_recorded_now 5.0) ;; "body mass index for gender greater than the 5th percentile"
          (<= patient_body_mass_index_percent_overweight_recorded_now 100.0)) ;; "no greater than 100% overweight"
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_duration_of_sleep_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the measured number of hours if the patient's sleep duration per night is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's sleep duration per night in hours, recorded now."} // "sleep duration of approximately 9 to 10 hours per night"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have sleep duration of approximately 9 to 10 hours per night.
(assert
  (! (and (>= patient_duration_of_sleep_value_recorded_now_withunit_hours 9.0)
          (<= patient_duration_of_sleep_value_recorded_now_withunit_hours 10.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "sleep duration of approximately 9 to 10 hours per night"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_attends_elementary_school_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently attends elementary school.","when_to_set_to_false":"Set to false if the patient currently does not attend elementary school.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently attends elementary school.","meaning":"Boolean indicating whether the patient currently attends elementary school."} // "the patient must attend elementary school"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_attends_elementary_school_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must attend elementary school"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_foods_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently likes at least one food that is used in the reinforcement paradigm.","when_to_set_to_false":"Set to false if the patient does not currently like any food used in the reinforcement paradigm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient likes any food used in the reinforcement paradigm.","meaning":"Boolean indicating whether the patient currently likes at least one food used in the reinforcement paradigm."} // "the patient must like at least one food used in the reinforcement paradigm"
(declare-const patient_is_exposed_to_foods_now@@used_in_reinforcement_paradigm Bool) ;; {"when_to_set_to_true":"Set to true if the foods the patient is exposed to are used in the reinforcement paradigm.","when_to_set_to_false":"Set to false if the foods the patient is exposed to are not used in the reinforcement paradigm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the foods the patient is exposed to are used in the reinforcement paradigm.","meaning":"Boolean indicating whether the foods the patient is exposed to are used in the reinforcement paradigm."} // "the patient must like at least one food used in the reinforcement paradigm"
(declare-const patient_has_finding_of_activity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently likes at least one activity that is used in the reinforcement paradigm.","when_to_set_to_false":"Set to false if the patient does not currently like any activity used in the reinforcement paradigm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient likes any activity used in the reinforcement paradigm.","meaning":"Boolean indicating whether the patient currently likes at least one activity used in the reinforcement paradigm."} // "the patient must like at least one activity used in the reinforcement paradigm"
(declare-const patient_has_finding_of_activity_now@@used_in_reinforcement_paradigm Bool) ;; {"when_to_set_to_true":"Set to true if the activity the patient likes is used in the reinforcement paradigm.","when_to_set_to_false":"Set to false if the activity the patient likes is not used in the reinforcement paradigm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the activity the patient likes is used in the reinforcement paradigm.","meaning":"Boolean indicating whether the activity the patient likes is used in the reinforcement paradigm."} // "the patient must like at least one activity used in the reinforcement paradigm"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable for foods
(assert
  (! (=> patient_is_exposed_to_foods_now@@used_in_reinforcement_paradigm
         patient_is_exposed_to_foods_now)
     :named REQ4_AUXILIARY0)) ;; "the patient must like at least one food used in the reinforcement paradigm"

;; Qualifier variable implies corresponding stem variable for activities
(assert
  (! (=> patient_has_finding_of_activity_now@@used_in_reinforcement_paradigm
         patient_has_finding_of_activity_now)
     :named REQ4_AUXILIARY1)) ;; "the patient must like at least one activity used in the reinforcement paradigm"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: patient must like at least one food used in the reinforcement paradigm
(assert
  (! patient_is_exposed_to_foods_now@@used_in_reinforcement_paradigm
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must like at least one food used in the reinforcement paradigm"

;; Component 1: patient must like at least one activity used in the reinforcement paradigm
(assert
  (! patient_has_finding_of_activity_now@@used_in_reinforcement_paradigm
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must like at least one activity used in the reinforcement paradigm"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_able_to_understand_reinforcement_paradigm Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to understand the reinforcement paradigm.","when_to_set_to_false":"Set to false if the patient is not able to understand the reinforcement paradigm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to understand the reinforcement paradigm.","meaning":"Boolean indicating whether the patient is able to understand the reinforcement paradigm."} // "the patient must be able to understand the reinforcement paradigm"
(declare-const patient_is_able_to_complete_reinforcement_paradigm Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to complete the reinforcement paradigm.","when_to_set_to_false":"Set to false if the patient is not able to complete the reinforcement paradigm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to complete the reinforcement paradigm.","meaning":"Boolean indicating whether the patient is able to complete the reinforcement paradigm."} // "the patient must be able to complete the reinforcement paradigm"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_able_to_understand_reinforcement_paradigm
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to understand the reinforcement paradigm"
(assert
  (! patient_is_able_to_complete_reinforcement_paradigm
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must be able to complete the reinforcement paradigm"
