;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_undergone_hospital_admission_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been admitted to the hospital (hospital admission) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been admitted to the hospital (hospital admission) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been admitted to the hospital.","meaning":"Boolean indicating whether the patient has ever undergone hospital admission (been admitted to the hospital) in their history."} // "admitted to the hospital"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_undergone_hospital_admission_inthehistory
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been admitted to the hospital."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community acquired pneumonia."} // "community acquired pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_community_acquired_pneumonia_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have community acquired pneumonia."
