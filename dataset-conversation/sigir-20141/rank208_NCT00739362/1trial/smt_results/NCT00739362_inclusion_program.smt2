;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index (in kilograms per square meter) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≥ 25 kilograms per square meter."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years AND age ≤ 60 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be age ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 18 years."

;; Component 1: To be included, the patient must be age ≤ 60 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 60)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≤ 60 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential (i.e., is not post-menopausal and has not had procedures that eliminate childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently assessed to not have childbearing potential (i.e., is post-menopausal or has had procedures that eliminate childbearing potential).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has the potential to bear children."} // "post-menopausal woman"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} // "post-menopausal woman"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must NOT be a post-menopausal woman.
(assert
  (! (or (not patient_sex_is_female_now)
         patient_has_childbearing_potential_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must NOT be a post-menopausal woman."

;; ===================== Declarations for the criterion (REQ 3) =====================
;; No new variable declarations needed; using patient_age_value_recorded_now_in_years
;; (declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must NOT be (age > 60 years)."

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must NOT be older than 60 years of age ("To be included, the patient must NOT be (age > 60 years).")
(assert
  (! (<= patient_age_value_recorded_now_in_years 60)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Constraint Assertions (REQ 4) =====================
;; "To be included, the patient must NOT be (age < 18 years)."
(assert
  (! (not (< patient_age_value_recorded_now_in_years 18.0))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_right_handed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of right-handedness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of right-handedness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has right-handedness.","meaning":"Boolean indicating whether the patient currently has right-handedness."} // "the patient must be a person with right-handedness."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_right_handed_now
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a person with right-handedness."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_weight_steady_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had stable body weight (no significant fluctuations) during the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had stable body weight during the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had stable body weight during the past 3 months.","meaning":"Boolean indicating whether the patient has had stable body weight during the past 3 months."} // "stable body weight (defined as body weight change ≤ 5 percent) for the last 3 months"
(declare-const patient_weight_change_value_recorded_inthepast3months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured or reported percentage value of the patient's body weight change during the past 3 months.","when_to_set_to_null":"Set to null if no such value is available or cannot be determined for the past 3 months.","meaning":"Numeric percentage representing the patient's body weight change during the past 3 months."} // "body weight change ≤ 5 percent for the last 3 months"
(declare-const patient_weight_change_value_recorded_inthepast3months_withunit_percent@@determined_by_volunteer_report Bool) ;; {"when_to_set_to_true":"Set to true if the value for body weight change during the past 3 months is determined by volunteer report.","when_to_set_to_false":"Set to false if the value is not determined by volunteer report.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the value is determined by volunteer report.","meaning":"Boolean indicating whether the body weight change value is determined by volunteer report."} // "as determined by volunteer report"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition in the requirement: stable body weight is defined as body weight change ≤ 5 percent for the last 3 months
(assert
  (! (= patient_has_finding_of_weight_steady_inthepast3months
        (and (<= patient_weight_change_value_recorded_inthepast3months_withunit_percent 5.0)
             patient_weight_change_value_recorded_inthepast3months_withunit_percent@@determined_by_volunteer_report))
     :named REQ6_AUXILIARY0)) ;; "stable body weight (defined as body weight change ≤ 5 percent) for the last 3 months (as determined by volunteer report)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_finding_of_weight_steady_inthepast3months
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had stable body weight (defined as body weight change ≤ 5 percent) for the last 3 months (as determined by volunteer report)."
