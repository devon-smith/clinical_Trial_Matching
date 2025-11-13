;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of Alzheimer's disease at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of Alzheimer's disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of Alzheimer's disease."} ;; "Alzheimer's disease"

(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."} ;; "Alzheimer's disease"

(declare-const patient_has_diagnosis_of_neurodegenerative_disorder_other_than_alzheimer_s_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of a neurodegenerative disorder other than Alzheimer's disease at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of a neurodegenerative disorder other than Alzheimer's disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of a neurodegenerative disorder other than Alzheimer's disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a neurodegenerative disorder other than Alzheimer's disease."} ;; "neurodegenerative disorder other than Alzheimer's disease in history"

(declare-const patient_has_diagnosis_of_neurodegenerative_disorder_other_than_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a neurodegenerative disorder other than Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a neurodegenerative disorder other than Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a neurodegenerative disorder other than Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a neurodegenerative disorder other than Alzheimer's disease."} ;; "neurodegenerative disorder other than Alzheimer's disease now"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_neurodegenerative_disorder_other_than_alzheimer_s_disease_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a diagnosis of neurodegenerative disorder other than Alzheimer's disease."

(assert
  (! (not patient_has_diagnosis_of_neurodegenerative_disorder_other_than_alzheimer_s_disease_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently has a diagnosis of neurodegenerative disorder other than Alzheimer's disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_current_serious_illness_that_could_interfere_with_completion_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious illness and this illness could interfere with completion of the study.","when_to_set_to_false":"Set to false if the patient does not currently have a serious illness that could interfere with completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious illness that could interfere with completion of the study.","meaning":"Boolean indicating whether the patient currently has a serious illness that could interfere with completion of the study."} ;; "the patient has a current serious illness that could interfere with completion of the study"
(declare-const patient_has_current_unstable_illness_that_could_interfere_with_completion_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an unstable illness and this illness could interfere with completion of the study.","when_to_set_to_false":"Set to false if the patient does not currently have an unstable illness that could interfere with completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an unstable illness that could interfere with completion of the study.","meaning":"Boolean indicating whether the patient currently has an unstable illness that could interfere with completion of the study."} ;; "the patient has a current unstable illness that could interfere with completion of the study"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_current_serious_illness_that_could_interfere_with_completion_of_study)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current serious illness that could interfere with completion of the study."

(assert
(! (not patient_has_current_unstable_illness_that_could_interfere_with_completion_of_study)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current unstable illness that could interfere with completion of the study."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_lesion_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of the brain.","when_to_set_to_false":"Set to false if the patient currently does not have a lesion of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion of the brain.","meaning":"Boolean indicating whether the patient currently has a lesion of the brain."} ;; "brain lesion"
(declare-const patient_has_finding_of_lesion_of_brain_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lesion of the brain is known (previously identified or documented).","when_to_set_to_false":"Set to false if the patient's lesion of the brain is not known (not previously identified or documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lesion of the brain is known.","meaning":"Boolean indicating whether the patient's lesion of the brain is known."} ;; "known brain lesion"
(declare-const patient_has_finding_of_brain_pathology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a brain pathology.","when_to_set_to_false":"Set to false if the patient currently does not have a brain pathology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a brain pathology.","meaning":"Boolean indicating whether the patient currently has a brain pathology."} ;; "brain pathology"
(declare-const patient_has_finding_of_traumatic_brain_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic brain injury.","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic brain injury.","meaning":"Boolean indicating whether the patient currently has a traumatic brain injury."} ;; "traumatic brain injury"
(declare-const patient_has_finding_of_traumatic_brain_injury_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's traumatic brain injury is known (previously identified or documented).","when_to_set_to_false":"Set to false if the patient's traumatic brain injury is not known (not previously identified or documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's traumatic brain injury is known.","meaning":"Boolean indicating whether the patient's traumatic brain injury is known."} ;; "known traumatic brain injury"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_lesion_of_brain_now@@known
      patient_has_finding_of_lesion_of_brain_now)
   :named REQ2_AUXILIARY0)) ;; "known brain lesion"

(assert
(! (=> patient_has_finding_of_traumatic_brain_injury_now@@known
      patient_has_finding_of_traumatic_brain_injury_now)
   :named REQ2_AUXILIARY1)) ;; "known traumatic brain injury"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_lesion_of_brain_now@@known)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known brain lesion."

(assert
(! (not patient_has_finding_of_brain_pathology_now)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known brain pathology."

(assert
(! (not patient_has_finding_of_traumatic_brain_injury_now@@known)
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known traumatic brain injury."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past thirty days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past thirty days."} ;; "medication"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past thirty days is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past thirty days is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past thirty days is investigational."} ;; "investigational medication"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@exposure_context_trial_participation Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to the drug or medicament within the past thirty days occurred as part of a clinical trial.","when_to_set_to_false":"Set to false if the exposure to the drug or medicament within the past thirty days did not occur as part of a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred as part of a clinical trial.","meaning":"Boolean indicating whether the exposure to the drug or medicament within the past thirty days occurred as part of a clinical trial."} ;; "participated in a trial with investigational medication in the past thirty days"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ3_AUXILIARY0)) ;; "investigational medication in the past thirty days"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@exposure_context_trial_participation
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ3_AUXILIARY1)) ;; "participated in a trial with investigational medication in the past thirty days"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion if (received investigational medication in past 30 days) OR (participated in a trial with investigational medication in past 30 days)
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
            patient_is_exposed_to_drug_or_medicament_inthepast30days@@exposure_context_trial_participation))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received investigational medication in the past thirty days) OR (the patient has participated in a trial with investigational medication in the past thirty days)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_radiopharmaceutical_imaging_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a radiopharmaceutical imaging procedure within seven days of the study imaging session.","when_to_set_to_false":"Set to false if the patient has not undergone a radiopharmaceutical imaging procedure within seven days of the study imaging session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a radiopharmaceutical imaging procedure within seven days of the study imaging session.","meaning":"Boolean indicating whether the patient has undergone a radiopharmaceutical imaging procedure within seven days of the study imaging session."} ;; "the patient has had a radiopharmaceutical imaging procedure within seven days of the study imaging session"

(declare-const patient_has_undergone_therapeutic_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any therapeutic procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone any therapeutic procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any therapeutic procedure in the past.","meaning":"Boolean indicating whether the patient has undergone any therapeutic procedure in the past."} ;; "therapeutic procedure in the past"

(declare-const patient_has_undergone_therapeutic_procedure_inthehistory@@is_radiopharmaceutical Bool) ;; {"when_to_set_to_true":"Set to true if the therapeutic procedure undergone by the patient is radiopharmaceutical in nature.","when_to_set_to_false":"Set to false if the therapeutic procedure undergone by the patient is not radiopharmaceutical in nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapeutic procedure is radiopharmaceutical in nature.","meaning":"Boolean indicating whether the therapeutic procedure undergone by the patient is radiopharmaceutical in nature."} ;; "radiopharmaceutical therapeutic procedure in the past"

(declare-const patient_has_undergone_therapeutic_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session Bool) ;; {"when_to_set_to_true":"Set to true if the therapeutic procedure occurred within seven days of the study imaging session.","when_to_set_to_false":"Set to false if the therapeutic procedure did not occur within seven days of the study imaging session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapeutic procedure occurred within seven days of the study imaging session.","meaning":"Boolean indicating whether the therapeutic procedure occurred within seven days of the study imaging session."} ;; "therapeutic procedure within seven days of the study imaging session"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable for therapeutic procedure
(assert
(! (=> patient_has_undergone_therapeutic_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session
patient_has_undergone_therapeutic_procedure_inthehistory)
:named REQ4_AUXILIARY0)) ;; "therapeutic procedure within seven days of the study imaging session""

;; Qualifier variable implies corresponding stem variable for radiopharmaceutical nature
(assert
(! (=> patient_has_undergone_therapeutic_procedure_inthehistory@@is_radiopharmaceutical
patient_has_undergone_therapeutic_procedure_inthehistory)
:named REQ4_AUXILIARY1)) ;; "radiopharmaceutical therapeutic procedure in the past"

;; Both qualifiers together imply radiopharmaceutical therapeutic procedure within seven days
(declare-const patient_has_undergone_radiopharmaceutical_therapeutic_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a radiopharmaceutical therapeutic procedure within seven days of the study imaging session.","when_to_set_to_false":"Set to false if the patient has not undergone a radiopharmaceutical therapeutic procedure within seven days of the study imaging session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a radiopharmaceutical therapeutic procedure within seven days of the study imaging session.","meaning":"Boolean indicating whether the patient has undergone a radiopharmaceutical therapeutic procedure within seven days of the study imaging session."} ;; "the patient has had a radiopharmaceutical treatment procedure within seven days of the study imaging session"

(assert
(! (= patient_has_undergone_radiopharmaceutical_therapeutic_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session
(and patient_has_undergone_therapeutic_procedure_inthehistory@@is_radiopharmaceutical
     patient_has_undergone_therapeutic_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session))
:named REQ4_AUXILIARY2)) ;; "radiopharmaceutical therapeutic procedure within seven days of the study imaging session"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_undergone_radiopharmaceutical_imaging_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session
            patient_has_undergone_radiopharmaceutical_therapeutic_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had a radiopharmaceutical imaging procedure within seven days of the study imaging session) OR (the patient has had a radiopharmaceutical treatment procedure within seven days of the study imaging session)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."} ;; "the patient is a female of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has childbearing potential.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a female of childbearing potential"
(declare-const patient_is_surgically_sterile_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically sterile.","when_to_set_to_false":"Set to false if the patient is currently not surgically sterile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically sterile.","meaning":"Boolean value indicating whether the patient is currently surgically sterile."} ;; "the patient is not surgically sterile"
(declare-const patient_is_refraining_from_sexual_activity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently refraining from sexual activity.","when_to_set_to_false":"Set to false if the patient is currently not refraining from sexual activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently refraining from sexual activity.","meaning":"Boolean value indicating whether the patient is currently refraining from sexual activity."} ;; "the patient is not refraining from sexual activity"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@reliable_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a method of contraception that is considered reliable.","when_to_set_to_false":"Set to false if the patient is currently using a method of contraception that is not considered reliable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the method of contraception used is reliable.","meaning":"Boolean indicating whether the method of contraception currently used by the patient is reliable."} ;; "reliable method of contraception"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_contraception_now@@reliable_method
      patient_has_finding_of_contraception_now)
   :named REQ5_AUXILIARY0)) ;; "reliable method of contraception" implies "contraception"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: If patient is a female of childbearing potential AND (not surgically sterile OR not refraining from sexual activity OR not using a reliable method of contraception)
(assert
(! (not (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             (or (not patient_is_surgically_sterile_now)
                 (not patient_is_refraining_from_sexual_activity_now)
                 (not patient_has_finding_of_contraception_now@@reliable_method))))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a female of childbearing potential) AND ((the patient is not surgically sterile) OR (the patient is not refraining from sexual activity) OR (the patient is not using a reliable method of contraception))."
