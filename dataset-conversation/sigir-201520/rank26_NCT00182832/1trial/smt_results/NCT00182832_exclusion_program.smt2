;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_been_enrolled_in_study_in_prior_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient was previously enrolled in the study during any prior hospitalization (before the current hospitalization).","when_to_set_to_false":"Set to false if the patient was never previously enrolled in the study during any prior hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was previously enrolled in the study during a prior hospitalization.","meaning":"Boolean indicating whether the patient was previously enrolled in the study during a prior hospitalization (before the current hospitalization)."} ;; "previously enrolled in the study during a prior hospitalization"

(declare-const patient_has_finding_of_inpatient_stay_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an inpatient stay (hospitalization) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an inpatient stay (hospitalization) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an inpatient stay (hospitalization) in their history.","meaning":"Boolean indicating whether the patient has ever had an inpatient stay (hospitalization) in their history."} ;; "hospitalization"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_been_enrolled_in_study_in_prior_hospitalization)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was previously enrolled in the study during a prior hospitalization."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in a clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in a clinical trial.","meaning":"Boolean indicating whether the patient is currently enrolled in a clinical trial."} ;; "clinical trial"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_clinical_trial_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is enrolled in another clinical trial."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cognitive impairment.","meaning":"Boolean indicating whether the patient currently has cognitive impairment."} ;; "cognitive impairment"

(declare-const patient_has_finding_of_impaired_cognition_now@@based_on_cognitive_impairment_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cognitive impairment finding is based on cognitive impairment screening.","when_to_set_to_false":"Set to false if the patient's cognitive impairment finding is not based on cognitive impairment screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cognitive impairment finding is based on cognitive impairment screening.","meaning":"Boolean indicating whether the patient's cognitive impairment finding is based on cognitive impairment screening."} ;; "cognitive impairment screening"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@based_on_cognitive_impairment_screening
      patient_has_finding_of_impaired_cognition_now)
:named REQ2_AUXILIARY0)) ;; "cognitive impairment based on cognitive impairment screening"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient does NOT have cognitive impairment based on cognitive impairment screening at the time of hospital admission
(assert
(! (not (not patient_has_finding_of_impaired_cognition_now@@based_on_cognitive_impairment_screening))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have cognitive impairment based on cognitive impairment screening at the time of hospital admission."
