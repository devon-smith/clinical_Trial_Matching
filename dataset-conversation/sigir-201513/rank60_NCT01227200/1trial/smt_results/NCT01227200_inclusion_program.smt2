;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_finding_of_peritonsillar_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a peritonsillar abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a peritonsillar abscess.","meaning":"Boolean indicating whether the patient currently has a peritonsillar abscess."} // "To be included, the patient must have peritonsillar abscess."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be aged 18-65 years."
(declare-const patient_has_agreed_to_join_research_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to join the research at the current time.","when_to_set_to_false":"Set to false if the patient has not agreed to join the research at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to join the research at the current time.","meaning":"Boolean indicating whether the patient has agreed to join the research at the current time."} // "To be included, the patient must have agreed to join the research."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_peritonsillar_abscess_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have peritonsillar abscess."

(assert
  (! (and (>= patient_age_value_recorded_now_in_years 18)
          (<= patient_age_value_recorded_now_in_years 65))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged 18-65 years."

(assert
  (! patient_has_agreed_to_join_research_now
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have agreed to join the research."
