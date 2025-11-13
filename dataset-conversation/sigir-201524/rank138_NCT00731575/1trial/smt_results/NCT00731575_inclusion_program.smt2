;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}  ;; "aged ≥ 3 months AND aged ≤ 23 months"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 3 months.
(assert
  (! (>= patient_age_value_recorded_now_in_months 3)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 3 months."

;; Component 1: To be included, the patient must be aged ≤ 23 months.
(assert
  (! (<= patient_age_value_recorded_now_in_months 23)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 23 months."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_gestational_age_at_delivery_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of completed weeks of gestation at the time the patient was delivered.","when_to_set_to_null":"Set to null if the gestational age at delivery is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the gestational age in weeks at which the patient was delivered."}  ;; "gestational age ≥ 37 weeks at delivery"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_gestational_age_at_delivery_in_weeks 37)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been delivered at gestational age ≥ 37 weeks."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing wheezing.","when_to_set_to_false":"Set to false if the patient is currently not experiencing wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing wheezing.","meaning":"Boolean indicating whether the patient is currently experiencing wheezing."}  ;; "To be included, the patient must be experiencing (the first episode of wheezing)."
(declare-const patient_has_finding_of_wheezing_now@@first_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing wheezing and it is the first episode.","when_to_set_to_false":"Set to false if the patient is currently experiencing wheezing but it is not the first episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current episode of wheezing is the first.","meaning":"Boolean indicating whether the patient's current wheezing is the first episode."}  ;; "To be included, the patient must be experiencing (the first episode of wheezing)."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_wheezing_now@@first_episode
         patient_has_finding_of_wheezing_now)
     :named REQ2_AUXILIARY0)) ;; "To be included, the patient must be experiencing (the first episode of wheezing)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_wheezing_now@@first_episode
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be experiencing (the first episode of wheezing)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_written_informed_consent_from_guardian_now Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent from the guardian of the patient is currently present.","when_to_set_to_false":"Set to false if written informed consent from the guardian of the patient is currently not present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent from the guardian of the patient is currently present.","meaning":"Boolean indicating whether the patient currently has written informed consent from the guardian."} ;; "To be included, the patient must have written informed consent from the guardian of the patient."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_written_informed_consent_from_guardian_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent from the guardian of the patient."
