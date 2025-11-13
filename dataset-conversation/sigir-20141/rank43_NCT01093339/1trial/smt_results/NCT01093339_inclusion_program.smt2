;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged between 18 years and 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 80.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or must be female and must be aged between 18 years and 80 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_heartburn_value_recorded_inthepast3months_withunit_episodes_per_week Real) ;; {"when_to_set_to_value":"Set to the measured or reported number of heartburn episodes per week if available for the 3 months immediately prior to screening.","when_to_set_to_null":"Set to null if no such measurement or report is available or the value is indeterminate.","meaning":"Numeric value representing the patient's number of heartburn episodes per week in the 3 months immediately prior to screening."} // "number of episodes of heartburn per week ≥ 2"
(declare-const patient_heartburn_value_recorded_inthepast3months_withunit_months Real) ;; {"when_to_set_to_value":"Set to the measured or reported duration in months of heartburn episodes if available for the 3 months immediately prior to screening.","when_to_set_to_null":"Set to null if no such measurement or report is available or the value is indeterminate.","meaning":"Numeric value representing the patient's duration in months of heartburn episodes in the 3 months immediately prior to screening."} // "duration of heartburn episodes ≥ 3 months immediately prior to screening"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: number of episodes of heartburn per week ≥ 2
(assert
  (! (>= patient_heartburn_value_recorded_inthepast3months_withunit_episodes_per_week 2)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "number of episodes of heartburn per week ≥ 2"

;; Component 1: duration of heartburn episodes ≥ 3 months immediately prior to screening
(assert
  (! (>= patient_heartburn_value_recorded_inthepast3months_withunit_months 3)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "duration of heartburn episodes ≥ 3 months immediately prior to screening"
