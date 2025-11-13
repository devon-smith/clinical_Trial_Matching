;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "medications"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@affects_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed affects sleep.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed does not affect sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient is currently exposed affects sleep.","meaning":"Boolean indicating whether the drug or medicament to which the patient is currently exposed affects sleep."} ;; "medications affecting sleep"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@affects_sleep
       patient_is_exposed_to_drug_or_medicament_now)
   :named REQ0_AUXILIARY0)) ;; "medications affecting sleep" implies "medications"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@affects_sleep)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses medications affecting sleep."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_sleep_apnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sleep apnea.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sleep apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sleep apnea.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sleep apnea."} ;; "sleep apnea"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_sleep_apnea_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sleep apnea."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_does_shift_work_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently does shift work.","when_to_set_to_false":"Set to false if the patient currently does not do shift work.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently does shift work.","meaning":"Boolean indicating whether the patient currently does shift work."} ;; "The patient is excluded if the patient does shift work."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_does_shift_work_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does shift work."
