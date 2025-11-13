;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_undergone_insertion_of_endotracheal_tube_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone insertion of endotracheal tube (endotracheal intubation) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone insertion of endotracheal tube (endotracheal intubation) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone insertion of endotracheal tube (endotracheal intubation).","meaning":"Boolean indicating whether the patient has ever undergone insertion of endotracheal tube (endotracheal intubation) at any time in the past."} ;; "To be included, the patient must undergo endotracheal intubation."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_undergone_insertion_of_endotracheal_tube_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must undergo endotracheal intubation."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_artificial_respiration_value_recorded_inthefuture_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the expected number of hours if a prediction or clinical estimate of the patient's future mechanical ventilation duration is available.","when_to_set_to_null":"Set to null if no expected duration is available or cannot be determined.","meaning":"Numeric value representing the expected duration (in hours) of mechanical ventilation the patient will require in the future."} ;; "expected duration of mechanical ventilation > 24 hours"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_artificial_respiration_value_recorded_inthefuture_withunit_hours 24.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "expected duration of mechanical ventilation > 24 hours"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} ;; "To be included, the patient must provide informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide informed consent."
