;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_severe_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of severe hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of severe hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of severe hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe hypertension."}  ;; "To be included, the patient must have a diagnosis of severe hypertension"

(declare-const patient_has_diagnosis_of_severe_hypertension_now@@diagnosis_made_on_basis_of_current_findings Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of severe hypertension is made on the basis of current findings.","when_to_set_to_false":"Set to false if the diagnosis of severe hypertension is not made on the basis of current findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether current findings were used to make the diagnosis.","meaning":"Boolean indicating whether the diagnosis of severe hypertension is made on the basis of current findings."}  ;; "diagnosis made on the basis of current findings"

(declare-const patient_has_diagnosis_of_severe_hypertension_now@@diagnosis_made_on_basis_of_medical_history Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of severe hypertension is made on the basis of medical history.","when_to_set_to_false":"Set to false if the diagnosis of severe hypertension is not made on the basis of medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether medical history was used to make the diagnosis.","meaning":"Boolean indicating whether the diagnosis of severe hypertension is made on the basis of medical history."}  ;; "diagnosis made on the basis of medical history"

(declare-const patient_has_diagnosis_of_severe_hypertension_now@@diagnosis_made_on_basis_of_physical_examination_findings Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of severe hypertension is made on the basis of physical examination findings.","when_to_set_to_false":"Set to false if the diagnosis of severe hypertension is not made on the basis of physical examination findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether physical examination findings were used to make the diagnosis.","meaning":"Boolean indicating whether the diagnosis of severe hypertension is made on the basis of physical examination findings."}  ;; "diagnosis made on the basis of physical examination findings"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_severe_hypertension_now@@diagnosis_made_on_basis_of_current_findings
         patient_has_diagnosis_of_severe_hypertension_now)
     :named REQ0_AUXILIARY0)) ;; "diagnosis made on the basis of current findings" implies "diagnosis of severe hypertension"

(assert
  (! (=> patient_has_diagnosis_of_severe_hypertension_now@@diagnosis_made_on_basis_of_medical_history
         patient_has_diagnosis_of_severe_hypertension_now)
     :named REQ0_AUXILIARY1)) ;; "diagnosis made on the basis of medical history" implies "diagnosis of severe hypertension"

(assert
  (! (=> patient_has_diagnosis_of_severe_hypertension_now@@diagnosis_made_on_basis_of_physical_examination_findings
         patient_has_diagnosis_of_severe_hypertension_now)
     :named REQ0_AUXILIARY2)) ;; "diagnosis made on the basis of physical examination findings" implies "diagnosis of severe hypertension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_diagnosis_of_severe_hypertension_now
          patient_has_diagnosis_of_severe_hypertension_now@@diagnosis_made_on_basis_of_current_findings
          patient_has_diagnosis_of_severe_hypertension_now@@diagnosis_made_on_basis_of_medical_history
          patient_has_diagnosis_of_severe_hypertension_now@@diagnosis_made_on_basis_of_physical_examination_findings)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis made on the basis of current findings AND medical history AND physical examination findings"
