;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"
(declare-const patient_has_diagnosis_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the respiratory system (respiratory disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the respiratory system (respiratory disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the respiratory system (respiratory disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the respiratory system (respiratory disease)."} ;; "respiratory disease"
(declare-const patient_has_diagnosis_of_disorder_of_respiratory_system_now@@excluding_asthma Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the respiratory system (respiratory disease) and this diagnosis is not asthma.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of a disorder of the respiratory system, or if the only diagnosis is asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of a disorder of the respiratory system other than asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the respiratory system (respiratory disease) that is not asthma."} ;; "respiratory disease other than asthma"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_respiratory_system_now@@excluding_asthma
      patient_has_diagnosis_of_disorder_of_respiratory_system_now)
   :named REQ0_AUXILIARY0)) ;; "respiratory disease other than asthma" implies "respiratory disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have asthma
(assert
(! (not patient_has_diagnosis_of_asthma_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma."

;; Exclusion: patient must NOT have a respiratory disease other than asthma
(assert
(! (not patient_has_diagnosis_of_disorder_of_respiratory_system_now@@excluding_asthma)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a respiratory disease other than asthma."
