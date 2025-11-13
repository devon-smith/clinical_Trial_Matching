;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "a patient under twelve years of age (age < 12 years)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (< patient_age_value_recorded_now_in_years 12)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient under twelve years of age (age < 12 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_undergoing_bronchoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing bronchoscopy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing bronchoscopy.","meaning":"Boolean indicating whether the patient is currently undergoing bronchoscopy."}  ;; "a patient undergoing bronchoscopy"
(declare-const patient_is_undergoing_bronchoalveolar_lavage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing bronchoalveolar lavage.","when_to_set_to_false":"Set to false if the patient is currently not undergoing bronchoalveolar lavage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing bronchoalveolar lavage.","meaning":"Boolean indicating whether the patient is currently undergoing bronchoalveolar lavage."}  ;; "a patient undergoing bronchoalveolar lavage"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_undergoing_bronchoscopy_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient undergoing bronchoscopy."

(assert
  (! patient_is_undergoing_bronchoalveolar_lavage_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient undergoing bronchoalveolar lavage."
