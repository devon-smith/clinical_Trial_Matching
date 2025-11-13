;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 12 years"
(declare-const patient_has_diagnosis_of_prion_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of prion disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of prion disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of prion disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of prion disease."} // "diagnosed with any type of human prion disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 12.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 12 years."
(assert
  (! patient_has_diagnosis_of_prion_disease_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be diagnosed with any type of human prion disease."
