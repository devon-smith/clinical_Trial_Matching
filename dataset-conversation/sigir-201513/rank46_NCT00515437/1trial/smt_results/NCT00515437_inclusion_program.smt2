;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease."} // "To be included, the patient must have Parkinson's disease."
(declare-const patient_has_finding_of_excessive_salivation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sialorrhea (excessive salivation).","when_to_set_to_false":"Set to false if the patient currently does not have sialorrhea (excessive salivation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sialorrhea (excessive salivation).","meaning":"Boolean indicating whether the patient currently has sialorrhea (excessive salivation)."} // "To be included, the patient must have sialorrhea for at least 3 months."
(declare-const patient_has_finding_of_excessive_salivation_now@@duration_at_least_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sialorrhea and the finding has been present for at least 3 months.","when_to_set_to_false":"Set to false if the patient currently has sialorrhea but the finding has not been present for at least 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sialorrhea for at least 3 months.","meaning":"Boolean indicating whether the patient currently has sialorrhea and the finding has been present for at least 3 months."} // "To be included, the patient must have sialorrhea for at least 3 months."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_excessive_salivation_now@@duration_at_least_3_months
         patient_has_finding_of_excessive_salivation_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have sialorrhea for at least 3 months."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_parkinson_s_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have Parkinson's disease."

(assert
  (! patient_has_finding_of_excessive_salivation_now@@duration_at_least_3_months
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have sialorrhea for at least 3 months."
