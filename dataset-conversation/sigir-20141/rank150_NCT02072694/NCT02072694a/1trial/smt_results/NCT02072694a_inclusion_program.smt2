;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_lives_in_ribeirao_preto_sao_paulo_brazil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in Ribeirão Preto, São Paulo, Brazil.","when_to_set_to_false":"Set to false if the patient currently does not reside in Ribeirão Preto, São Paulo, Brazil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in Ribeirão Preto, São Paulo, Brazil.","meaning":"Boolean indicating whether the patient currently resides in Ribeirão Preto, São Paulo, Brazil."} // "To be included, the patient must live in Ribeirão Preto, São Paulo, Brazil."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_lives_in_ribeirao_preto_sao_paulo_brazil_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must live in Ribeirão Preto, São Paulo, Brazil."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 40 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."
(assert
  (! (<= patient_age_value_recorded_now_in_years 40)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 40 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_female Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as female sex.","when_to_set_to_false":"Set to false if the patient is documented as not female sex (e.g., male, other, unknown).","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient is of female sex."} // "To be included, the patient must be female."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_female
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be female."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_regular_periods_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has regular menstrual cycles (regular periods).","when_to_set_to_false":"Set to false if the patient currently does not have regular menstrual cycles (regular periods).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has regular menstrual cycles (regular periods).","meaning":"Boolean indicating whether the patient currently has regular menstrual cycles (regular periods)."} // "To be included, the patient must have regular menstrual cycles."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_regular_periods_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have regular menstrual cycles."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body weight in kilograms is available.","when_to_set_to_null":"Set to null if the patient's current body weight in kilograms is not available or cannot be determined.","meaning":"Numeric value representing the patient's current body weight in kilograms."} // "To be included, the patient must have weight < 120 kilograms."
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current BMI in kilograms per square meter is available.","when_to_set_to_null":"Set to null if the patient's current BMI in kilograms per square meter is not available or cannot be determined.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "To be included, the patient must have body mass index ≥ 30 kilograms per square meter AND body mass index ≤ 40 kilograms per square meter."
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of obesity.","meaning":"Boolean indicating whether the patient currently has a clinical finding of obesity."} // "for the group with obesity"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: weight < 120 kilograms
(assert
  (! (< patient_body_weight_value_recorded_now_withunit_kilograms 120.0)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have weight < 120 kilograms."

;; Component 1: BMI ≥ 30 kilograms per square meter
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 30.0)
     :named REQ4_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have body mass index ≥ 30 kilograms per square meter."

;; Component 2: BMI ≤ 40 kilograms per square meter
(assert
  (! (<= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 40.0)
     :named REQ4_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have body mass index ≤ 40 kilograms per square meter."

;; ===================== Constraint Assertion: Must be in the group with obesity (explicit in requirement) =====================
(assert
  (! patient_has_finding_of_obesity_now
     :named REQ4_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "for the group with obesity"
