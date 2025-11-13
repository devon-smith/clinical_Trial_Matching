;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired pneumonia."} // "To be included, the patient must have a current diagnosis of community-acquired pneumonia."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_community_acquired_pneumonia_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a current diagnosis of community-acquired pneumonia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_evidence_of_systemic_inflammatory_response_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has documented evidence of systemic inflammatory response to infection.","when_to_set_to_false":"Set to false if the patient currently does not have documented evidence of systemic inflammatory response to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of systemic inflammatory response to infection.","meaning":"Boolean indicating whether the patient currently has evidence of systemic inflammatory response to infection."} // "To be included, the patient must have evidence of systemic inflammatory response to infection."
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} // "infection"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_evidence_of_systemic_inflammatory_response_to_infection_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have evidence of systemic inflammatory response to infection."
