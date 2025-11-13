;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_symptoms_of_lower_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of lower respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has symptoms of lower respiratory tract infection."} // "To be included, the patient must have symptoms of lower airway infection."
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia (e.g., as evidenced by radiologic signs).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has the clinical finding of pneumonia."} // "To be included, the patient must have radiologic signs of pneumonia."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_symptoms_of_lower_respiratory_tract_infection_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have symptoms of lower airway infection."

(assert
  (! patient_has_finding_of_pneumonia_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have radiologic signs of pneumonia."
