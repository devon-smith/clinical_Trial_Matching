;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_magnetic_resonance_imaging_compatibility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently compatible with magnetic resonance imaging (MRI).","when_to_set_to_false":"Set to false if the patient is currently not compatible with magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently compatible with magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient currently has compatibility with magnetic resonance imaging (MRI)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_magnetic_resonance_imaging_compatibility_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have magnetic resonance imaging compatibility."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 25 years AND age ≤ 55 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 25)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 25 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 55)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 55 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body mass index (BMI) measured now, in units of kg/m²."} // "body mass index ≥ 25 AND body mass index ≤ 40"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 25)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≥ 25."

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 40)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≤ 40."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_weight_is_stable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's body weight is currently stable, as determined by clinical assessment or documented evidence.","when_to_set_to_false":"Set to false if the patient's body weight is currently unstable, as determined by clinical assessment or documented evidence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's body weight is currently stable.","meaning":"Boolean indicating whether the patient's body weight is currently stable."} // "To be included, the patient must have stable body weight."
(declare-const patient_body_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in kilograms, recorded now."} // "body weight"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_body_weight_is_stable_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have stable body weight."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_right_handed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has right-handedness.","when_to_set_to_false":"Set to false if the patient currently does not have right-handedness (e.g., is left-handed or ambidextrous).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has right-handedness.","meaning":"Boolean indicating whether the patient currently has right-handedness."} ;; "To be included, the patient must have right-handedness."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_right_handed_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have right-handedness."
