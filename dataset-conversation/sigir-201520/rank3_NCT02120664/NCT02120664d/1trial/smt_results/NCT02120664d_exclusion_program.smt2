;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of a degenerative brain disorder (neurodegenerative disorder) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of a degenerative brain disorder (neurodegenerative disorder) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of a degenerative brain disorder (neurodegenerative disorder).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a degenerative brain disorder (neurodegenerative disorder) in their medical history."} ;; "has had a diagnosis of neurodegenerative disorder"

(declare-const patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory@@excludes_alzheimers_disease Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of degenerative brain disorder excludes Alzheimer's disease.","when_to_set_to_false":"Set to false if the diagnosis of degenerative brain disorder includes Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether Alzheimer's disease is excluded from the diagnosis.","meaning":"Boolean indicating that the diagnosis of degenerative brain disorder excludes Alzheimer's disease."} ;; "other than Alzheimer's disease" (history)

(declare-const patient_has_diagnosis_of_degenerative_brain_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a degenerative brain disorder (neurodegenerative disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a degenerative brain disorder (neurodegenerative disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a degenerative brain disorder (neurodegenerative disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of a degenerative brain disorder (neurodegenerative disorder)."} ;; "currently has a diagnosis of neurodegenerative disorder"

(declare-const patient_has_diagnosis_of_degenerative_brain_disorder_now@@excludes_alzheimers_disease Bool) ;; {"when_to_set_to_true":"Set to true if the current diagnosis of degenerative brain disorder excludes Alzheimer's disease.","when_to_set_to_false":"Set to false if the current diagnosis of degenerative brain disorder includes Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether Alzheimer's disease is excluded from the current diagnosis.","meaning":"Boolean indicating that the current diagnosis of degenerative brain disorder excludes Alzheimer's disease."} ;; "other than Alzheimer's disease" (current)

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable (history)
(assert
(! (=> patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory@@excludes_alzheimers_disease
      patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory)
:named REQ0_AUXILIARY0)) ;; "other than Alzheimer's disease" (history)

;; Qualifier variable implies corresponding stem variable (current)
(assert
(! (=> patient_has_diagnosis_of_degenerative_brain_disorder_now@@excludes_alzheimers_disease
      patient_has_diagnosis_of_degenerative_brain_disorder_now)
:named REQ0_AUXILIARY1)) ;; "other than Alzheimer's disease" (current)

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have ever had a diagnosis of neurodegenerative disorder other than Alzheimer's disease
(assert
(! (not patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory@@excludes_alzheimers_disease)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "has had a diagnosis of neurodegenerative disorder other than Alzheimer's disease"

;; Exclusion: patient must NOT currently have a diagnosis of neurodegenerative disorder other than Alzheimer's disease
(assert
(! (not patient_has_diagnosis_of_degenerative_brain_disorder_now@@excludes_alzheimers_disease)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "currently has a diagnosis of neurodegenerative disorder other than Alzheimer's disease"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness.","when_to_set_to_false":"Set to false if the patient currently does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an illness.","meaning":"Boolean indicating whether the patient currently has an illness."} ;; "illness"

(declare-const patient_has_finding_of_illness_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is serious.","when_to_set_to_false":"Set to false if the patient's current illness is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is serious.","meaning":"Boolean indicating whether the patient's current illness is serious."} ;; "serious illness"

(declare-const patient_has_finding_of_illness_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is unstable.","when_to_set_to_false":"Set to false if the patient's current illness is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is unstable.","meaning":"Boolean indicating whether the patient's current illness is unstable."} ;; "unstable illness"

(declare-const patient_has_finding_of_illness_now@@could_interfere_with_completion_of_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness could interfere with completion of the study.","when_to_set_to_false":"Set to false if the patient's current illness could not interfere with completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness could interfere with completion of the study.","meaning":"Boolean indicating whether the patient's current illness could interfere with completion of the study."} ;; "illness ... could interfere with completion of the study"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@serious
       patient_has_finding_of_illness_now)
   :named REQ1_AUXILIARY0)) ;; "serious illness"

(assert
(! (=> patient_has_finding_of_illness_now@@unstable
       patient_has_finding_of_illness_now)
   :named REQ1_AUXILIARY1)) ;; "unstable illness"

(assert
(! (=> patient_has_finding_of_illness_now@@could_interfere_with_completion_of_the_study
       patient_has_finding_of_illness_now)
   :named REQ1_AUXILIARY2)) ;; "illness ... could interfere with completion of the study"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have a current serious illness
(assert
(! (not patient_has_finding_of_illness_now@@serious)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current serious illness."

;; Exclusion: patient must NOT have a current unstable illness that could interfere with completion of the study
(assert
(! (not (and patient_has_finding_of_illness_now@@unstable
             patient_has_finding_of_illness_now@@could_interfere_with_completion_of_the_study))
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current unstable illness that could interfere with completion of the study."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_lesion_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of the brain.","when_to_set_to_false":"Set to false if the patient currently does not have a lesion of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion of the brain.","meaning":"Boolean indicating whether the patient currently has a lesion of the brain."} ;; "brain lesion"
(declare-const patient_has_finding_of_lesion_of_brain_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of the brain and this lesion is known (documented or established).","when_to_set_to_false":"Set to false if the patient currently has a lesion of the brain but it is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion of the brain is known.","meaning":"Boolean indicating whether the patient's lesion of the brain is known."} ;; "known brain lesion"
(declare-const patient_has_finding_of_disorder_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder (pathology) of the brain.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder (pathology) of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder (pathology) of the brain.","meaning":"Boolean indicating whether the patient currently has a disorder (pathology) of the brain."} ;; "brain pathology"
(declare-const patient_has_finding_of_disorder_of_brain_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder (pathology) of the brain and this disorder is known (documented or established).","when_to_set_to_false":"Set to false if the patient currently has a disorder (pathology) of the brain but it is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the brain is known.","meaning":"Boolean indicating whether the patient's disorder of the brain is known."} ;; "known brain pathology"
(declare-const patient_has_finding_of_traumatic_brain_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic brain injury.","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic brain injury.","meaning":"Boolean indicating whether the patient currently has a traumatic brain injury."} ;; "traumatic brain injury"
(declare-const patient_has_finding_of_traumatic_brain_injury_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic brain injury and this injury is known (documented or established).","when_to_set_to_false":"Set to false if the patient currently has a traumatic brain injury but it is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traumatic brain injury is known.","meaning":"Boolean indicating whether the patient's traumatic brain injury is known."} ;; "known traumatic brain injury"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_lesion_of_brain_now@@known
      patient_has_finding_of_lesion_of_brain_now)
   :named REQ2_AUXILIARY0)) ;; "known brain lesion"

(assert
(! (=> patient_has_finding_of_disorder_of_brain_now@@known
      patient_has_finding_of_disorder_of_brain_now)
   :named REQ2_AUXILIARY1)) ;; "known brain pathology"

(assert
(! (=> patient_has_finding_of_traumatic_brain_injury_now@@known
      patient_has_finding_of_traumatic_brain_injury_now)
   :named REQ2_AUXILIARY2)) ;; "known traumatic brain injury"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_lesion_of_brain_now@@known)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known brain lesion."

(assert
(! (not patient_has_finding_of_disorder_of_brain_now@@known)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known brain pathology."

(assert
(! (not patient_has_finding_of_traumatic_brain_injury_now@@known)
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known traumatic brain injury."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past thirty days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past thirty days."} ;; "has received investigational medication in the past thirty days" or "has participated in a trial with investigational medication in the past thirty days"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past thirty days is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past thirty days is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament is investigational."} ;; "investigational medication"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@exposure_occurred_in_trial Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to the drug or medicament within the past thirty days occurred as part of a clinical trial.","when_to_set_to_false":"Set to false if the exposure to the drug or medicament within the past thirty days did not occur as part of a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred as part of a clinical trial.","meaning":"Boolean indicating whether the exposure occurred as part of a clinical trial."} ;; "participated in a trial with investigational medication in the past thirty days"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
     patient_is_exposed_to_drug_or_medicament_inthepast30days)
:named REQ3_AUXILIARY0)) ;; "investigational medication in the past thirty days"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@exposure_occurred_in_trial
     patient_is_exposed_to_drug_or_medicament_inthepast30days)
:named REQ3_AUXILIARY1)) ;; "exposure occurred as part of a clinical trial in the past thirty days"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have received investigational medication in the past thirty days
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received investigational medication in the past thirty days."

;; Exclusion: patient must NOT have participated in a trial with investigational medication in the past thirty days
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
             patient_is_exposed_to_drug_or_medicament_inthepast30days@@exposure_occurred_in_trial))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in a trial with investigational medication in the past thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a nuclear medicine imaging procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a nuclear medicine imaging procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a nuclear medicine imaging procedure.","meaning":"Boolean indicating whether the patient has ever undergone a nuclear medicine imaging procedure at any time in their history."} ;; "radiopharmaceutical imaging procedure"
(declare-const patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a nuclear medicine imaging procedure and the procedure occurred within seven days of the study imaging session.","when_to_set_to_false":"Set to false if the patient has undergone a nuclear medicine imaging procedure but the procedure did not occur within seven days of the study imaging session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred within seven days of the study imaging session.","meaning":"Boolean indicating whether the nuclear medicine imaging procedure occurred within seven days of the study imaging session."} ;; "radiopharmaceutical imaging procedure within seven days of the study imaging session"
(declare-const patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a radiopharmaceutical treatment procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a radiopharmaceutical treatment procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a radiopharmaceutical treatment procedure.","meaning":"Boolean indicating whether the patient has ever undergone a radiopharmaceutical treatment procedure at any time in their history."} ;; "radiopharmaceutical treatment procedure"
(declare-const patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a radiopharmaceutical treatment procedure and the procedure occurred within seven days of the study imaging session.","when_to_set_to_false":"Set to false if the patient has undergone a radiopharmaceutical treatment procedure but the procedure did not occur within seven days of the study imaging session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred within seven days of the study imaging session.","meaning":"Boolean indicating whether the radiopharmaceutical treatment procedure occurred within seven days of the study imaging session."} ;; "radiopharmaceutical treatment procedure within seven days of the study imaging session"
(declare-const patient_has_undergone_administration_of_radiopharmaceutical_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of a radiopharmaceutical at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone administration of a radiopharmaceutical at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of a radiopharmaceutical.","meaning":"Boolean indicating whether the patient has ever undergone administration of a radiopharmaceutical at any time in their history."} ;; "radiopharmaceutical treatment procedure"
(declare-const patient_has_undergone_administration_of_radiopharmaceutical_inthehistory@@temporalcontext_within7days_of_study_imaging_session Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of a radiopharmaceutical and the procedure occurred within seven days of the study imaging session.","when_to_set_to_false":"Set to false if the patient has undergone administration of a radiopharmaceutical but the procedure did not occur within seven days of the study imaging session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred within seven days of the study imaging session.","meaning":"Boolean indicating whether the administration of a radiopharmaceutical occurred within seven days of the study imaging session."} ;; "radiopharmaceutical treatment procedure within seven days of the study imaging session"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session
      patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory)
    :named REQ4_AUXILIARY0)) ;; "radiopharmaceutical imaging procedure within seven days of the study imaging session"

(assert
(! (=> patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session
      patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory)
    :named REQ4_AUXILIARY1)) ;; "radiopharmaceutical treatment procedure within seven days of the study imaging session"

(assert
(! (=> patient_has_undergone_administration_of_radiopharmaceutical_inthehistory@@temporalcontext_within7days_of_study_imaging_session
      patient_has_undergone_administration_of_radiopharmaceutical_inthehistory)
    :named REQ4_AUXILIARY2)) ;; "radiopharmaceutical treatment procedure within seven days of the study imaging session"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a radiopharmaceutical imaging procedure within seven days of the study imaging session."

(assert
(! (not patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a radiopharmaceutical treatment procedure within seven days of the study imaging session."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female.","when_to_set_to_false":"Set to false if the patient's sex is documented as male or other.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's sex is female as currently recorded."} ;; "female of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (i.e., has childbearing potential).","when_to_set_to_false":"Set to false if the patient is not capable of becoming pregnant (e.g., postmenopausal, prepubertal, or otherwise incapable).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient currently has childbearing potential."} ;; "female of childbearing potential"
(declare-const patient_has_finding_of_sterility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sterile.","when_to_set_to_false":"Set to false if the patient is currently not sterile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sterile.","meaning":"Boolean indicating whether the patient is currently sterile."} ;; "sterile"
(declare-const patient_has_finding_of_sterility_now@@surgically_achieved Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sterility is surgically achieved.","when_to_set_to_false":"Set to false if the patient's sterility is not surgically achieved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sterility is surgically achieved.","meaning":"Boolean indicating whether the patient's sterility is surgically achieved."} ;; "surgically sterile"
(declare-const patient_is_refraining_from_sexual_activity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently refraining from all sexual activity.","when_to_set_to_false":"Set to false if the patient is currently not refraining from sexual activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently refraining from sexual activity.","meaning":"Boolean indicating whether the patient is currently refraining from sexual activity."} ;; "refraining from sexual activity"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using a method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a method of contraception.","meaning":"Boolean indicating whether the patient is currently using a method of contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@reliable_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a reliable method of contraception.","when_to_set_to_false":"Set to false if the patient is currently using an unreliable method of contraception or not using contraception at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the method of contraception used is reliable.","meaning":"Boolean indicating whether the patient is currently using a reliable method of contraception."} ;; "reliable method of contraception"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for surgically achieved sterility implies sterility
(assert
(! (=> patient_has_finding_of_sterility_now@@surgically_achieved
       patient_has_finding_of_sterility_now)
    :named REQ5_AUXILIARY0)) ;; "surgically sterile"

;; Qualifier variable for reliable contraception implies contraception
(assert
(! (=> patient_has_finding_of_contraception_now@@reliable_method
       patient_has_finding_of_contraception_now)
    :named REQ5_AUXILIARY1)) ;; "reliable method of contraception"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: If patient is female of childbearing potential AND (not surgically sterile OR not refraining from sexual activity OR not using reliable contraception)
(assert
(! (not (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             (or (not patient_has_finding_of_sterility_now@@surgically_achieved)
                 (not patient_is_refraining_from_sexual_activity_now)
                 (not patient_has_finding_of_contraception_now@@reliable_method))))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a female of childbearing potential) AND ((the patient is NOT surgically sterile) OR (the patient is NOT refraining from sexual activity) OR (the patient is NOT using a reliable method of contraception))."
