;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently male.","when_to_set_to_false":"Set to false if the patient is currently not male (i.e., female or other).","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient is currently male."}  ;; "male"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."}  ;; "male"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 50 years AND aged ≤ 80 years"
(declare-const patient_aged_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if available.","when_to_set_to_null":"Set to null if the patient's age is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the patient's current age in years."}  ;; "aged"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Both "patient_has_finding_of_male_now" and "patient_sex_is_male_now" represent the patient being male; we equate them for this requirement.
(assert
  (! (= patient_has_finding_of_male_now patient_sex_is_male_now)
     :named REQ0_AUXILIARY0)) ;; "male"

;; Both "patient_age_value_recorded_now_in_years" and "patient_aged_value_recorded_now_withunit_years" represent the patient's age in years; we equate them for this requirement.
(assert
  (! (= patient_age_value_recorded_now_in_years patient_aged_value_recorded_now_withunit_years)
     :named REQ0_AUXILIARY1)) ;; "aged ≥ 50 years AND aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be male.
(assert
  (! patient_has_finding_of_male_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male."

;; Component 1: To be included, the patient must be aged ≥ 50 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 50)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 50 years."

;; Component 2: To be included, the patient must be aged ≤ 80 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 80 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently female.","when_to_set_to_false":"Set to false if the patient is currently not female.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient is currently female."}  ;; "female"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be female.
(assert
  (! patient_has_finding_of_female_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be female."

;; Component 1: To be included, the patient must be aged ≥ 55 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 55)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 55 years."

;; Component 2: To be included, the patient must be aged ≤ 80 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 80 years."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_is_currently_resident_in_kalaleh_golestan Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a resident in Kalaleh, Golestan.","when_to_set_to_false":"Set to false if the patient is currently not a resident in Kalaleh, Golestan.","when_to_set_to_null":"Set to null if the patient's current residence status in Kalaleh, Golestan is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient is currently resident in Kalaleh, Golestan."} ;; "resident in Kalaleh, Golestan"
(declare-const patient_resident_in_kalaleh_golestan_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has continuously resided in Kalaleh, Golestan as of now.","when_to_set_to_null":"Set to null if the duration of residence in Kalaleh, Golestan is unknown, not documented, or cannot be determined.","meaning":"Numeric value (in years) representing the patient's duration of residence in Kalaleh, Golestan as of now."} ;; "duration of residence in Kalaleh, Golestan ≥ 1 year"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must be resident in Kalaleh, Golestan.
(assert
  (! patient_is_currently_resident_in_kalaleh_golestan
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be resident in Kalaleh, Golestan."

;; Component 1: The patient must have duration of residence in Kalaleh, Golestan ≥ 1 year.
(assert
  (! (>= patient_resident_in_kalaleh_golestan_value_recorded_now_withunit_years 1.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have duration of residence in Kalaleh, Golestan ≥ 1 year."
