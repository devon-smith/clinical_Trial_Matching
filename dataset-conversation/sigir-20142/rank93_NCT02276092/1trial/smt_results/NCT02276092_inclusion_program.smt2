;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired pneumonia."} // "To be included, the patient must have community-acquired pneumonia."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_community_acquired_pneumonia_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have community-acquired pneumonia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patients_immunologic_competence_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immunocompetent (has immunologic competence at present).","when_to_set_to_false":"Set to false if the patient is currently not immunocompetent (lacks immunologic competence at present).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immunocompetent.","meaning":"Boolean indicating whether the patient is currently immunocompetent (has immunologic competence at present)."} // "To be included, the patient must be immunocompetent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patients_immunologic_competence_is_positive_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be immunocompetent."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 18 years of age"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 18 years of age."
