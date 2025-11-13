;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_female_now
         patient_sex_is_male_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "To be included, the patient must be (aged ≥ 18 years AND aged ≤ 65 years)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index ≥ 27 kilograms per square meter AND body mass index ≤ 35 kilograms per square meter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 27.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "body mass index ≥ 27 kilograms per square meter"

(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 35.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "body mass index ≤ 35 kilograms per square meter"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_general_health_good_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in overall good health.","when_to_set_to_false":"Set to false if the patient is currently not in overall good health.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in overall good health.","meaning":"Boolean indicating whether the patient is currently in overall good health."} ;; "To be included, the patient must be in overall good health (as defined by study protocol)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_general_health_good_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be in overall good health (as defined by study protocol)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_weight_steady_inthepast4months Bool) ;; {"when_to_set_to_true":"Set to true if the patient had weight stability (weight change less than 3 kg) at any time during the 4 months prior to the trial.","when_to_set_to_false":"Set to false if the patient did not have weight stability (weight change less than 3 kg) at any time during the 4 months prior to the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had weight stability (weight change less than 3 kg) during the 4 months prior to the trial.","meaning":"Boolean indicating whether the patient had weight stability (weight change less than 3 kg) during the 4 months prior to the trial."} ;; "weight stability (defined as weight change < 3 kilograms in the past 4 months before the trial)"
(declare-const weight_change_value_recorded_past_4_months_in_kg Real) ;; {"when_to_set_to_value":"Set to the value of the patient's weight change, in kilograms, over the 4 months prior to the trial.","when_to_set_to_null":"Set to null if the patient's weight change over the 4 months prior to the trial is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's weight change, in kilograms, over the 4 months prior to the trial."} ;; "weight change < 3 kilograms in the past 4 months before the trial"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition in the requirement: weight stability is defined as weight change < 3 kg in the past 4 months
(assert
  (! (= patient_has_finding_of_weight_steady_inthepast4months
        (< weight_change_value_recorded_past_4_months_in_kg 3.0))
     :named REQ4_AUXILIARY0)) ;; "weight stability (defined as weight change < 3 kilograms in the past 4 months before the trial)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_weight_steady_inthepast4months
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have weight stability (defined as weight change < 3 kilograms in the past 4 months before the trial)."
