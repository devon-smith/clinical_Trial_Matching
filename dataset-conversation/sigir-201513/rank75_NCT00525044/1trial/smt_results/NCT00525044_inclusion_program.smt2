;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_viral_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute viral pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have acute viral pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute viral pharyngitis.","meaning":"Boolean indicating whether the patient currently has acute viral pharyngitis."} // "To be included, the patient must have acute viral pharyngitis."
(declare-const patient_has_finding_of_sore_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sore throat symptom.","when_to_set_to_false":"Set to false if the patient currently does not have a sore throat symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sore throat symptom.","meaning":"Boolean indicating whether the patient currently has a sore throat symptom."} // "To be included, the patient must have a sore throat."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_sore_throat_symptom_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a sore throat."
(assert
  (! patient_has_finding_of_acute_viral_pharyngitis_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute viral pharyngitis."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_ambulating_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is ambulant (able to walk or move about independently) at the time of eligibility assessment.","when_to_set_to_false":"Set to false if the patient is not ambulant (unable to walk or move about independently) at the time of eligibility assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is ambulant at the time of eligibility assessment.","meaning":"Boolean indicating whether the patient is currently ambulant (able to walk or move about independently)."} // "To be included, the patient must be ambulant."
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "To be included, the patient must be (female OR male)."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "To be included, the patient must be (female OR male)."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be aged ≥ 18 years AND aged ≤ 65 years."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_undergoing_ambulating_patient_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be ambulant."

(assert
  (! (or patient_sex_is_female_now patient_sex_is_male_now)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (female OR male)."

(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ1_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_pain_in_throat_value_recorded_now_withunit_verbal_rating_scale Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's throat pain intensity is currently recorded using the verbal rating scale for pain intensity.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current throat pain intensity measured on the verbal rating scale for pain intensity."} // "the patient's throat pain intensity must be rated as severe or greater (on the verbal rating scale for pain intensity)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_pain_in_throat_value_recorded_now_withunit_verbal_rating_scale 3)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient's throat pain intensity must be rated as severe or greater (on the verbal rating scale for pain intensity)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_given_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given written informed consent.","when_to_set_to_false":"Set to false if the patient has not given written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given written informed consent.","meaning":"Boolean indicating whether the patient has given written informed consent."} // "To be included, the patient must have given written informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_given_written_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have given written informed consent."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_compliance_guaranteed_as_assessed_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the investigator has assessed and guarantees the patient's compliance.","when_to_set_to_false":"Set to false if the investigator has assessed and does not guarantee the patient's compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator has assessed and guaranteed the patient's compliance.","meaning":"Boolean indicating whether the patient's compliance is guaranteed, as assessed by the investigator."} // "To be included, the patient's compliance must be guaranteed (as assessed by the investigator)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_compliance_guaranteed_as_assessed_by_investigator
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient's compliance must be guaranteed (as assessed by the investigator)."
