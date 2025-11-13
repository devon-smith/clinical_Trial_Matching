;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "the patient must be female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "the patient must be male"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or the patient must be female."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must be aged ≥ 18 years."
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 18 years"

;; Component 1: "To be included, the patient must be aged ≤ 65 years."
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 65 years"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_pounds Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body weight in pounds is available.","when_to_set_to_null":"Set to null if no current body weight measurement in pounds is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in pounds."}  ;; "body weight < 350 pounds"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (< patient_body_weight_value_recorded_now_withunit_pounds 350)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body weight < 350 pounds."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index (BMI) measured now, in kilograms per square meter."}  ;; "body mass index ≥ 25 kilograms per square meter AND body mass index ≤ 43 kilograms per square meter"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body mass index ≥ 25 kilograms per square meter"

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 43.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body mass index ≤ 43 kilograms per square meter"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const fasting_duration_value_prior_to_examination_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient fasted prior to examination.","when_to_set_to_null":"Set to null if the duration of fasting prior to examination is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration in hours of fasting performed prior to examination."}  ;; "fasting for 10 hours prior to examination"
(declare-const patient_is_willing_to_undergo_fasting_for_10_hours_prior_to_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo fasting for 10 hours prior to examination.","when_to_set_to_false":"Set to false if the patient is not willing to undergo fasting for 10 hours prior to examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to undergo fasting for 10 hours prior to examination.","meaning":"Boolean indicating whether the patient is willing to undergo fasting for 10 hours prior to examination."}  ;; "the patient must be willing to undergo fasting for 10 hours prior to examination"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_willing_to_undergo_fasting_for_10_hours_prior_to_examination
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to undergo fasting for 10 hours prior to examination"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_right_handed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently right-handed.","when_to_set_to_false":"Set to false if the patient is currently not right-handed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently right-handed.","meaning":"Boolean indicating whether the patient is currently right-handed."}  ;; "the patient must have right-handedness"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_right_handed_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have right-handedness"
