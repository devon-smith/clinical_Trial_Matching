;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged ≥ 18 years AND be aged ≤ 60 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 60.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male) OR ((be female) AND (be aged ≥ 18 years AND be aged ≤ 60 years)))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in kilograms."} // "body weight"
(declare-const patient_ideal_body_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the calculated value if the patient's ideal body weight in kilograms is determined now.","when_to_set_to_null":"Set to null if no such calculation is available or the value is indeterminate.","meaning":"Numeric value representing the patient's ideal body weight in kilograms as determined now."} // "ideal body weight"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; None required for this requirement (no definitional or umbrella relationships).

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Body weight ≥ 130% of ideal body weight
(assert
  (! (>= patient_body_weight_value_recorded_now_withunit_kg
         (* 1.3 patient_ideal_body_weight_value_recorded_now_withunit_kg))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body weight that is ≥ 130 percent of ideal body weight"

;; Component 1: Body weight ≤ 180% of ideal body weight
(assert
  (! (<= patient_body_weight_value_recorded_now_withunit_kg
         (* 1.8 patient_ideal_body_weight_value_recorded_now_withunit_kg))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body weight that is ≤ 180 percent of ideal body weight"
