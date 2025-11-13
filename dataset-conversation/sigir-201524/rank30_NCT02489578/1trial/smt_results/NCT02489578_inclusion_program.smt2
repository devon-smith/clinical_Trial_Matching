;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 14 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 14)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age ≥ 14 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired pneumonia."} // "the patient must meet the criteria of community-acquired pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_community_acquired_pneumonia_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must meet the criteria of community-acquired pneumonia"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_healthcare_associated_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has healthcare-associated pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have healthcare-associated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has healthcare-associated pneumonia.","meaning":"Boolean indicating whether the patient currently has healthcare-associated pneumonia."} // "the patient must meet the criteria of healthcare-associated pneumonia."
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} // "pneumonia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_healthcare_associated_pneumonia_now
         patient_has_finding_of_pneumonia_now)
     :named REQ2_AUXILIARY0)) ;; "healthcare-associated pneumonia" implies "pneumonia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_healthcare_associated_pneumonia_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must meet the criteria of healthcare-associated pneumonia."
