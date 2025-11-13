;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_pleuritic_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleuritic pain.","when_to_set_to_false":"Set to false if the patient currently does not have pleuritic pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleuritic pain.","meaning":"Boolean indicating whether the patient currently has pleuritic pain."}  ;; "the patient must be affected by thoracic pleuritic pain"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_pleuritic_pain_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be affected by thoracic pleuritic pain"
