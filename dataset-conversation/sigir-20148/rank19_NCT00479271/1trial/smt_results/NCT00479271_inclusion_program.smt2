;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_been_examined_by_trained_clinician_ad_to_confirm_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been examined by a trained clinician (AD) to confirm the diagnosis of dementia at the current time.","when_to_set_to_false":"Set to false if the patient has not been examined by a trained clinician (AD) to confirm the diagnosis of dementia at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been examined by a trained clinician (AD) to confirm the diagnosis of dementia at the current time.","meaning":"Boolean indicating whether the patient has been examined by a trained clinician (AD) to confirm the diagnosis of dementia at the current time."} ;; "To be included, the patient must be examined by a trained clinician (AD) to confirm the diagnosis of dementia..."

(declare-const patient_has_been_graded_using_clinical_dementia_rating_scale_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been graded using the Clinical Dementia Rating Scale at the current time.","when_to_set_to_false":"Set to false if the patient has not been graded using the Clinical Dementia Rating Scale at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been graded using the Clinical Dementia Rating Scale at the current time.","meaning":"Boolean indicating whether the patient has been graded using the Clinical Dementia Rating Scale at the current time."} ;; "To be included, the patient must be graded using the Clinical Dementia Rating Scale."

(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} ;; "diagnosis of dementia"

(declare-const patient_has_diagnosis_of_dementia_now@@confirmed_according_to_dsm_iv_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of dementia is confirmed according to DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's current diagnosis of dementia is not confirmed according to DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of dementia is confirmed according to DSM-IV criteria.","meaning":"Boolean indicating whether the patient's current diagnosis of dementia is confirmed according to DSM-IV criteria."} ;; "diagnosis of dementia according to Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@confirmed_according_to_dsm_iv_criteria
         patient_has_diagnosis_of_dementia_now)
     :named REQ0_AUXILIARY0)) ;; "diagnosis of dementia according to DSM-IV criteria" implies "diagnosis of dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_been_examined_by_trained_clinician_ad_to_confirm_diagnosis_of_dementia_now
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "patient must be examined by a trained clinician (AD) to confirm the diagnosis of dementia according to DSM-IV criteria"

(assert
  (! patient_has_been_graded_using_clinical_dementia_rating_scale_now
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "patient must be graded using the Clinical Dementia Rating Scale"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@determined_according_to_clinical_dementia_rating_scale Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dementia is determined according to the Clinical Dementia Rating Scale.","when_to_set_to_false":"Set to false if the patient's dementia is not determined according to the Clinical Dementia Rating Scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dementia is determined according to the Clinical Dementia Rating Scale.","meaning":"Boolean indicating whether the patient's dementia is determined according to the Clinical Dementia Rating Scale."} ;; "according to the Clinical Dementia Rating Scale"
(declare-const patient_has_finding_of_dementia_now@@severity_mild Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dementia is mild.","when_to_set_to_false":"Set to false if the patient's dementia is not mild.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dementia is mild.","meaning":"Boolean indicating whether the patient's dementia is mild."} ;; "mild dementia"
(declare-const patient_has_finding_of_dementia_now@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dementia is moderate.","when_to_set_to_false":"Set to false if the patient's dementia is not moderate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dementia is moderate.","meaning":"Boolean indicating whether the patient's dementia is moderate."} ;; "moderate dementia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_dementia_now@@determined_according_to_clinical_dementia_rating_scale
         patient_has_finding_of_dementia_now)
     :named REQ1_AUXILIARY0)) ;; "dementia according to the Clinical Dementia Rating Scale"

(assert
  (! (=> patient_has_finding_of_dementia_now@@severity_mild
         patient_has_finding_of_dementia_now)
     :named REQ1_AUXILIARY1)) ;; "mild dementia"

(assert
  (! (=> patient_has_finding_of_dementia_now@@severity_moderate
         patient_has_finding_of_dementia_now)
     :named REQ1_AUXILIARY2)) ;; "moderate dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have (mild dementia according to the Clinical Dementia Rating Scale OR moderate dementia according to the Clinical Dementia Rating Scale)
(assert
  (! (or
        (and patient_has_finding_of_dementia_now@@severity_mild
             patient_has_finding_of_dementia_now@@determined_according_to_clinical_dementia_rating_scale)
        (and patient_has_finding_of_dementia_now@@severity_moderate
             patient_has_finding_of_dementia_now@@determined_according_to_clinical_dementia_rating_scale))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (mild dementia according to the Clinical Dementia Rating Scale OR moderate dementia according to the Clinical Dementia Rating Scale)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_has_a_carer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver.","when_to_set_to_false":"Set to false if the patient currently does not have a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caregiver.","meaning":"Boolean indicating whether the patient currently has a caregiver."} ;; "the patient must have a principal caregiver, as identified by the family, who is enrolled for the trial"
(declare-const patient_has_finding_of_has_a_carer_now@@principal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current caregiver is principal.","when_to_set_to_false":"Set to false if the patient's current caregiver is not principal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current caregiver is principal.","meaning":"Boolean indicating whether the patient's current caregiver is principal."} ;; "principal caregiver"
(declare-const patient_has_finding_of_has_a_carer_now@@identified_by_family Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current caregiver is identified by the family.","when_to_set_to_false":"Set to false if the patient's current caregiver is not identified by the family.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current caregiver is identified by the family.","meaning":"Boolean indicating whether the patient's current caregiver is identified by the family."} ;; "as identified by the family"
(declare-const patient_has_finding_of_has_a_carer_now@@enrolled_for_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current caregiver is enrolled for the trial.","when_to_set_to_false":"Set to false if the patient's current caregiver is not enrolled for the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current caregiver is enrolled for the trial.","meaning":"Boolean indicating whether the patient's current caregiver is enrolled for the trial."} ;; "who is enrolled for the trial"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the patient has a caregiver
(assert
  (! (=> patient_has_finding_of_has_a_carer_now@@principal
         patient_has_finding_of_has_a_carer_now)
     :named REQ2_AUXILIARY0)) ;; "principal caregiver"

(assert
  (! (=> patient_has_finding_of_has_a_carer_now@@identified_by_family
         patient_has_finding_of_has_a_carer_now)
     :named REQ2_AUXILIARY1)) ;; "as identified by the family"

(assert
  (! (=> patient_has_finding_of_has_a_carer_now@@enrolled_for_trial
         patient_has_finding_of_has_a_carer_now)
     :named REQ2_AUXILIARY2)) ;; "who is enrolled for the trial"

;; ===================== Constraint Assertions (REQ 2) =====================
;; All three qualifiers must be true for inclusion: principal, identified by family, and enrolled for trial
(assert
  (! (and patient_has_finding_of_has_a_carer_now@@principal
          patient_has_finding_of_has_a_carer_now@@identified_by_family
          patient_has_finding_of_has_a_carer_now@@enrolled_for_trial)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have a principal caregiver, as identified by the family, who is enrolled for the trial"
