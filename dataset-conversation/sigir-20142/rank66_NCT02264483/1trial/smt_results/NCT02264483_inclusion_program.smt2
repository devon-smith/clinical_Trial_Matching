;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of chronic obstructive pulmonary disease."} // "To be included, the patient must have a clinical diagnosis of chronic obstructive pulmonary disease."
(declare-const patient_has_spirometric_diagnosis_of_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a spirometric diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a spirometric diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a spirometric diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a spirometric diagnosis of chronic obstructive pulmonary disease."} // "To be included, the patient must have a spirometric diagnosis of chronic obstructive pulmonary disease."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of chronic obstructive pulmonary disease."
(assert
  (! patient_has_spirometric_diagnosis_of_chronic_obstructive_pulmonary_disease_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a spirometric diagnosis of chronic obstructive pulmonary disease."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_exacerbation_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical symptoms of exacerbation.","when_to_set_to_false":"Set to false if the patient currently does not have clinical symptoms of exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical symptoms of exacerbation.","meaning":"Boolean indicating whether the patient currently has clinical symptoms of exacerbation."} // "To be included, the patient must have clinical symptoms of exacerbation."
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of lower respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has lower respiratory tract infection."} // "To be included, the patient must have clinical symptoms of infection of the lower airway."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have clinical symptoms of exacerbation.
(assert
  (! patient_has_finding_of_exacerbation_symptoms_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have clinical symptoms of exacerbation."

;; Component 1: The patient must have clinical symptoms of infection of the lower airway.
(assert
  (! patient_has_finding_of_lower_respiratory_tract_infection_now
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have clinical symptoms of infection of the lower airway."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed informed consent.","when_to_set_to_false":"Set to false if the patient has not signed informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent.","meaning":"Boolean indicating whether the patient has signed informed consent."} // "To be included, the patient must have signed informed consent."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent."
