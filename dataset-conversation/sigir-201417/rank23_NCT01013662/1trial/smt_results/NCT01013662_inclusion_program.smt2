;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 80 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of septic shock.","meaning":"Boolean indicating whether the patient currently has a diagnosis of septic shock."} // "a diagnosis of septic shock"
(declare-const patient_has_diagnosis_of_severe_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of severe sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of severe sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of severe sepsis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe sepsis."} // "a diagnosis of severe sepsis"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (a diagnosis of septic shock OR a diagnosis of severe sepsis).
(assert
  (! (or patient_has_diagnosis_of_septic_shock_now
         patient_has_diagnosis_of_severe_sepsis_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a diagnosis of septic shock OR a diagnosis of severe sepsis)."
