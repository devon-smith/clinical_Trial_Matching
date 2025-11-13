;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "an adult (age ≥ 18 years)"
(declare-const patient_meets_study_protocol_defined_inclusion_criteria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets all inclusion criteria as defined by the study protocol.","when_to_set_to_false":"Set to false if the patient currently does not meet all inclusion criteria as defined by the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets all inclusion criteria as defined by the study protocol.","meaning":"Boolean indicating whether the patient currently meets the inclusion criteria as defined by the study protocol."}  ;; "meet criteria (criteria as defined by the study protocol)"
(declare-const patient_will_undergo_tonsillectomy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo tonsillectomy in the future (i.e., the procedure is planned but not yet performed).","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo tonsillectomy in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled for tonsillectomy in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo tonsillectomy in the future."}  ;; "be scheduled for tonsillectomy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "an adult (age ≥ 18 years)"

(assert
  (! patient_meets_study_protocol_defined_inclusion_criteria_now
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "meet criteria (criteria as defined by the study protocol)"

(assert
  (! patient_will_undergo_tonsillectomy_inthefuture
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be scheduled for tonsillectomy"
