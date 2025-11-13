;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_ventilator_associated_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ventilator-associated pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ventilator-associated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ventilator-associated pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ventilator-associated pneumonia."} // "the patient must have the diagnosis of ventilator-associated pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_ventilator_associated_pneumonia_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have the diagnosis of ventilator-associated pneumonia"
