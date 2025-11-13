;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  // "aged ≥ 3 years AND aged ≤ 15 years"
(declare-const patient_has_finding_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pharyngitis.","meaning":"Boolean indicating whether the patient currently has pharyngitis."}  // "pharyngitis"
(declare-const patient_is_seen_at_participating_site_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being seen at a participating site.","when_to_set_to_false":"Set to false if the patient is currently not being seen at a participating site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being seen at a participating site.","meaning":"Boolean indicating whether the patient is currently being seen at a participating site."}  // "be seen at a participating site"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 3.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 3 years."
(assert
  (! (<= patient_age_value_recorded_now_in_years 15.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 15 years."
(assert
  (! patient_has_finding_of_pharyngitis_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have pharyngitis."
(assert
  (! patient_is_seen_at_participating_site_now
     :named REQ0_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be seen at a participating site."
