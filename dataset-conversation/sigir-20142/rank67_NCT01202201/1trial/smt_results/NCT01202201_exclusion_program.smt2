;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever participated in any clinical trial at any time in the past.","when_to_set_to_false":"Set to false if the patient has never participated in any clinical trial at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever participated in any clinical trial.","meaning":"Boolean indicating whether the patient has ever participated in any clinical trial."} ;; "clinical trial"
(declare-const patient_has_undergone_clinical_trial_inthehistory@@is_rotavirus_vaccine_clinical_trial Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial the patient participated in was specifically a rotavirus vaccine clinical trial.","when_to_set_to_false":"Set to false if the clinical trial the patient participated in was not a rotavirus vaccine clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial was a rotavirus vaccine clinical trial.","meaning":"Boolean indicating whether the clinical trial the patient participated in was a rotavirus vaccine clinical trial."} ;; "rotavirus vaccine clinical trial"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_undergone_clinical_trial_inthehistory@@is_rotavirus_vaccine_clinical_trial
      patient_has_undergone_clinical_trial_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "participant of any kind of rotavirus vaccine clinical trial"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_clinical_trial_inthehistory@@is_rotavirus_vaccine_clinical_trial)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a participant of any kind of rotavirus vaccine clinical trial."
