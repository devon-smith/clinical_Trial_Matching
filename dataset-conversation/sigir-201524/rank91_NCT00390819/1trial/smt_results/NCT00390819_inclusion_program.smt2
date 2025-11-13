;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_community_acquired_pneumonia_now Bool) ;; "To be included, the patient must have community acquired pneumonia." {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of community acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of community acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of community acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has community acquired pneumonia."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_community_acquired_pneumonia_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have community acquired pneumonia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_patient_in_hospital_now Bool) ;; "To be included, the patient must be hospitalized." {"when_to_set_to_true":"Set to true if the patient is currently hospitalized (admitted to a hospital at the present time).","when_to_set_to_false":"Set to false if the patient is currently not hospitalized (not admitted to a hospital at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized."}

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_patient_in_hospital_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be hospitalized."
