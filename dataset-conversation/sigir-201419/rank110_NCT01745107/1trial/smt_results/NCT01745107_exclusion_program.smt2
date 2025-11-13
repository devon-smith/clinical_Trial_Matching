;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_exploratory_thoracotomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an exploratory thoracotomy procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone an exploratory thoracotomy procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an exploratory thoracotomy procedure.","meaning":"Boolean indicating whether the patient has ever undergone an exploratory thoracotomy procedure at any time in their history."} ;; "the patient has undergone exploratory thoracotomy"

(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any surgical procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone any surgical procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any surgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone any surgical procedure at any time in their history."} ;; "surgery"

(declare-const patient_has_undergone_surgical_procedure_inthehistory@@palliative_intent Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone by the patient was performed with palliative intent.","when_to_set_to_false":"Set to false if the surgical procedure undergone by the patient was not performed with palliative intent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure was performed with palliative intent.","meaning":"Boolean indicating whether the surgical procedure was performed with palliative intent."} ;; "palliative surgery"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for palliative intent implies the patient has undergone a surgical procedure
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@palliative_intent
      patient_has_undergone_surgical_procedure_inthehistory)
:named REQ0_AUXILIARY0)) ;; "palliative surgery" implies "surgery"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have undergone exploratory thoracotomy or palliative surgery
(assert
(! (not (or patient_has_undergone_exploratory_thoracotomy_inthehistory
            patient_has_undergone_surgical_procedure_inthehistory@@palliative_intent))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has undergone exploratory thoracotomy) OR (the patient has undergone palliative surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_clear_metastatic_sites_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clear metastatic sites.","when_to_set_to_false":"Set to false if the patient currently does not have clear metastatic sites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clear metastatic sites.","meaning":"Boolean indicating whether the patient currently has clear metastatic sites."} ;; "the patient does NOT have clear metastatic sites"
(declare-const patient_has_clear_recurrent_sites_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clear recurrent sites.","when_to_set_to_false":"Set to false if the patient currently does not have clear recurrent sites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clear recurrent sites.","meaning":"Boolean indicating whether the patient currently has clear recurrent sites."} ;; "the patient does NOT have clear recurrent sites"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT satisfy (no clear recurrent sites OR no clear metastatic sites)
(assert
(! (not (or (not patient_has_clear_recurrent_sites_now)
            (not patient_has_clear_metastatic_sites_now)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient does NOT have clear recurrent sites) OR (the patient does NOT have clear metastatic sites)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_recurrent_tumor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of recurrent tumor (recurrence is certain).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of recurrent tumor (recurrence is not certain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of recurrent tumor.","meaning":"Boolean indicating whether the patient currently has a finding of recurrent tumor."} ;; "recurrence is NOT certain for the patient"
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of secondary malignant neoplastic disease (metastasis is certain).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of secondary malignant neoplastic disease (metastasis is not certain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of secondary malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a finding of secondary malignant neoplastic disease (metastasis)."} ;; "metastasis is NOT certain for the patient"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or (not patient_has_finding_of_recurrent_tumor_now)
            (not patient_has_finding_of_secondary_malignant_neoplastic_disease_now)))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (recurrence is NOT certain for the patient) OR (metastasis is NOT certain for the patient)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_dead_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently dead.","when_to_set_to_false":"Set to false if the patient is currently alive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently dead.","meaning":"Boolean indicating whether the patient is currently dead."} ;; "died"
(declare-const patient_has_finding_of_dead_now@@cause_of_death_is_not_definite Bool) ;; {"when_to_set_to_true":"Set to true if the patient is dead and the cause of death is not definite.","when_to_set_to_false":"Set to false if the patient is dead and the cause of death is definite.","when_to_set_to_null":"Set to null if the patient is dead but it is unknown, not documented, or cannot be determined whether the cause of death is definite or not.","meaning":"Boolean indicating whether the patient's death is of no definite cause."} ;; "died of no definite cause"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_dead_now@@cause_of_death_is_not_definite
      patient_has_finding_of_dead_now)
   :named REQ3_AUXILIARY0)) ;; "died of no definite cause" (qualifier variable implies stem variable)

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_dead_now@@cause_of_death_is_not_definite)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has died of no definite cause."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_follow_up_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any abnormality in follow-up status (e.g., irregular follow-up).","when_to_set_to_false":"Set to false if the patient currently does not have any abnormality in follow-up status (i.e., follow-up is regular or normal).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any abnormality in follow-up status.","meaning":"Boolean indicating whether the patient currently has any abnormality in follow-up status."} ;; "follow-up"
(declare-const patient_has_finding_of_follow_up_status_now@@irregular Bool) ;; {"when_to_set_to_true":"Set to true if the abnormality in follow-up status is specifically irregular (i.e., follow-up is not regular).","when_to_set_to_false":"Set to false if the abnormality in follow-up status is not irregular (e.g., missing, but not irregular).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormality in follow-up status is irregular.","meaning":"Boolean indicating whether the abnormality in follow-up status is specifically irregular."} ;; "irregular follow-up"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_follow_up_status_now@@irregular
      patient_has_finding_of_follow_up_status_now)
:named REQ4_AUXILIARY0)) ;; "irregular follow-up"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_follow_up_status_now@@irregular)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has irregular follow-up."
