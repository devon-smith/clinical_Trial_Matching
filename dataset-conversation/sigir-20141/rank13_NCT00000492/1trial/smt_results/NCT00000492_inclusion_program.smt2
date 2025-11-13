;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 30 years AND aged ≤ 69 years"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "a woman"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "a man"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be ((a man AND aged ≥ 30 years AND aged ≤ 69 years) OR (a woman AND aged ≥ 30 years AND aged ≤ 69 years)).
(assert
  (! (or
        (and patient_sex_is_male_now
             (>= patient_age_value_recorded_now_in_years 30.0)
             (<= patient_age_value_recorded_now_in_years 69.0))
        (and patient_sex_is_female_now
             (>= patient_age_value_recorded_now_in_years 30.0)
             (<= patient_age_value_recorded_now_in_years 69.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be ((a man AND aged ≥ 30 years AND aged ≤ 69 years) OR (a woman AND aged ≥ 30 years AND aged ≤ 69 years))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_documented_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a documented myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a documented myocardial infarction."} // "the patient must have a documented myocardial infarction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_documented_myocardial_infarction_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have a documented myocardial infarction"
