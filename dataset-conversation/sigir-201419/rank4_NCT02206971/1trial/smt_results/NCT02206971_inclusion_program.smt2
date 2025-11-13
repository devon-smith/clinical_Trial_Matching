;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "be aged between 18 years and 75 years inclusive"
(declare-const patient_has_finding_of_cigarette_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a cigarette smoker.","when_to_set_to_false":"Set to false if the patient is currently not a cigarette smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a cigarette smoker.","meaning":"Boolean indicating whether the patient is currently a cigarette smoker."} // "cigarette smoker"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "be a female cigarette smoker"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "be a male cigarette smoker"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((male cigarette smoker AND age between 18 and 75 inclusive) OR (female cigarette smoker AND age between 18 and 75 inclusive))
(assert
  (! (or (and patient_sex_is_male_now
              patient_has_finding_of_cigarette_smoker_now
              (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 75.0))
         (and patient_sex_is_female_now
              patient_has_finding_of_cigarette_smoker_now
              (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 75.0)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be a male cigarette smoker AND be aged between 18 years and 75 years inclusive) OR (be a female cigarette smoker AND be aged between 18 years and 75 years inclusive))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_tobacco_smoking_behavior_finding_value_recorded_inthepast1months_withunit_cigarettes_per_day Real) ;; {"when_to_set_to_value":"Set to the patient's average number of cigarettes smoked per day if this value is recorded for the past 1 month.","when_to_set_to_null":"Set to null if the average daily cigarette consumption for the past 1 month is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's average number of cigarettes smoked per day during the past 1 month."} // "smoked an average of less than 10 cigarettes per day during the past 1 month"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (< patient_tobacco_smoking_behavior_finding_value_recorded_inthepast1months_withunit_cigarettes_per_day 10)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have smoked an average of less than 10 cigarettes per day during the past 1 month"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_personally_signed_and_dated_informed_consent_document Bool) ;; {"when_to_set_to_true":"Set to true if the patient has personally signed and dated an informed consent document, and the document indicates the patient has been informed of all pertinent aspects of the study.","when_to_set_to_false":"Set to false if the patient has not personally signed and dated an informed consent document, or the document does not indicate the patient has been informed of all pertinent aspects of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has personally signed and dated an informed consent document indicating they have been informed of all pertinent aspects of the study.","meaning":"Boolean indicating whether the patient has personally signed and dated an informed consent document, confirming that the patient has been informed of all pertinent aspects of the study."} // "must have personally signed and dated an informed consent document (indicating that the patient has been informed of all pertinent aspects of the study)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_personally_signed_and_dated_informed_consent_document
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have personally signed and dated an informed consent document (indicating that the patient has been informed of all pertinent aspects of the study)"
