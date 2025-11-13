;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of degenerative brain disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of degenerative brain disorder at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of degenerative brain disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of degenerative brain disorder."} ;; "has had a diagnosis of neurodegenerative disorder"

(declare-const patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory@@other_than_alzheimers_disease Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of degenerative brain disorder is for a disorder other than Alzheimer's disease.","when_to_set_to_false":"Set to false if the diagnosis is for Alzheimer's disease or if only Alzheimer's disease is present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis excludes Alzheimer's disease.","meaning":"Boolean indicating whether the diagnosis of degenerative brain disorder excludes Alzheimer's disease."} ;; "other than Alzheimer's disease (in the history)"

(declare-const patient_has_diagnosis_of_degenerative_brain_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of degenerative brain disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of degenerative brain disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of degenerative brain disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of degenerative brain disorder."} ;; "currently has a diagnosis of neurodegenerative disorder"

(declare-const patient_has_diagnosis_of_degenerative_brain_disorder_now@@other_than_alzheimers_disease Bool) ;; {"when_to_set_to_true":"Set to true if the current diagnosis of degenerative brain disorder is for a disorder other than Alzheimer's disease.","when_to_set_to_false":"Set to false if the current diagnosis is for Alzheimer's disease or if only Alzheimer's disease is present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current diagnosis excludes Alzheimer's disease.","meaning":"Boolean indicating whether the current diagnosis of degenerative brain disorder excludes Alzheimer's disease."} ;; "other than Alzheimer's disease (currently)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables (history)
(assert
(! (=> patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory@@other_than_alzheimers_disease
      patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory)
:named REQ0_AUXILIARY0)) ;; "other than Alzheimer's disease (in the history)"

;; Qualifier variables imply corresponding stem variables (now)
(assert
(! (=> patient_has_diagnosis_of_degenerative_brain_disorder_now@@other_than_alzheimers_disease
      patient_has_diagnosis_of_degenerative_brain_disorder_now)
:named REQ0_AUXILIARY1)) ;; "other than Alzheimer's disease (currently)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have ever had a diagnosis of neurodegenerative disorder other than Alzheimer's disease
(assert
(! (not patient_has_diagnosis_of_degenerative_brain_disorder_inthehistory@@other_than_alzheimers_disease)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a diagnosis of neurodegenerative disorder other than Alzheimer's disease."

;; Exclusion: patient must NOT currently have a diagnosis of neurodegenerative disorder other than Alzheimer's disease
(assert
(! (not patient_has_diagnosis_of_degenerative_brain_disorder_now@@other_than_alzheimers_disease)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently has a diagnosis of neurodegenerative disorder other than Alzheimer's disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness.","when_to_set_to_false":"Set to false if the patient currently does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an illness.","meaning":"Boolean indicating whether the patient currently has an illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is serious.","when_to_set_to_false":"Set to false if the patient's current illness is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is serious.","meaning":"Boolean indicating whether the patient's current illness is serious."} ;; "serious illness"
(declare-const patient_has_finding_of_illness_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is unstable.","when_to_set_to_false":"Set to false if the patient's current illness is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is unstable.","meaning":"Boolean indicating whether the patient's current illness is unstable."} ;; "unstable illness"
(declare-const patient_has_finding_of_illness_now@@could_interfere_with_completion_of_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness could interfere with completion of the study.","when_to_set_to_false":"Set to false if the patient's current illness could not interfere with completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness could interfere with completion of the study.","meaning":"Boolean indicating whether the patient's current illness could interfere with completion of the study."} ;; "illness could interfere with completion of the study"
(declare-const patient_has_finding_of_illness_now@@serious@@could_interfere_with_completion_of_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious illness that could interfere with completion of the study.","when_to_set_to_false":"Set to false if the patient currently does not have a serious illness that could interfere with completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious illness that could interfere with completion of the study.","meaning":"Boolean indicating whether the patient currently has a serious illness that could interfere with completion of the study."} ;; "serious illness that could interfere with completion of the study"
(declare-const patient_has_finding_of_illness_now@@unstable@@could_interfere_with_completion_of_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an unstable illness that could interfere with completion of the study.","when_to_set_to_false":"Set to false if the patient currently does not have an unstable illness that could interfere with completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an unstable illness that could interfere with completion of the study.","meaning":"Boolean indicating whether the patient currently has an unstable illness that could interfere with completion of the study."} ;; "unstable illness that could interfere with completion of the study"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
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
:named REQ1_AUXILIARY2)) ;; "illness could interfere with completion of the study"

;; Definition: serious illness that could interfere with completion of the study
(assert
(! (= patient_has_finding_of_illness_now@@serious@@could_interfere_with_completion_of_the_study
      (and patient_has_finding_of_illness_now@@serious
           patient_has_finding_of_illness_now@@could_interfere_with_completion_of_the_study))
:named REQ1_AUXILIARY3)) ;; "serious illness that could interfere with completion of the study"

;; Definition: unstable illness that could interfere with completion of the study
(assert
(! (= patient_has_finding_of_illness_now@@unstable@@could_interfere_with_completion_of_the_study
      (and patient_has_finding_of_illness_now@@unstable
           patient_has_finding_of_illness_now@@could_interfere_with_completion_of_the_study))
:named REQ1_AUXILIARY4)) ;; "unstable illness that could interfere with completion of the study"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_illness_now@@serious@@could_interfere_with_completion_of_the_study)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current serious illness that could interfere with completion of the study."

(assert
(! (not patient_has_finding_of_illness_now@@unstable@@could_interfere_with_completion_of_the_study)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current unstable illness that could interfere with completion of the study."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_lesion_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of the brain.","when_to_set_to_false":"Set to false if the patient currently does not have a lesion of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion of the brain.","meaning":"Boolean indicating whether the patient currently has a lesion of the brain."} ;; "brain lesion"
(declare-const patient_has_finding_of_lesion_of_brain_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of the brain and this lesion is known (documented or previously identified).","when_to_set_to_false":"Set to false if the patient currently has a lesion of the brain but it is not known (not documented or not previously identified).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion of the brain is known.","meaning":"Boolean indicating whether the patient's lesion of the brain is known."} ;; "known brain lesion"
(declare-const patient_has_finding_of_disorder_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the brain.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the brain.","meaning":"Boolean indicating whether the patient currently has a disorder of the brain."} ;; "brain pathology"
(declare-const patient_has_finding_of_disorder_of_brain_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the brain and this disorder is known (documented or previously identified).","when_to_set_to_false":"Set to false if the patient currently has a disorder of the brain but it is not known (not documented or not previously identified).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the brain is known.","meaning":"Boolean indicating whether the patient's disorder of the brain is known."} ;; "known brain pathology"
(declare-const patient_has_finding_of_traumatic_brain_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic brain injury.","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic brain injury.","meaning":"Boolean indicating whether the patient currently has a traumatic brain injury."} ;; "traumatic brain injury"
(declare-const patient_has_finding_of_traumatic_brain_injury_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic brain injury and this injury is known (documented or previously identified).","when_to_set_to_false":"Set to false if the patient currently has a traumatic brain injury but it is not known (not documented or not previously identified).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traumatic brain injury is known.","meaning":"Boolean indicating whether the patient's traumatic brain injury is known."} ;; "known traumatic brain injury"

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
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past thirty days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past thirty days."} ;; "has received investigational medication in the past thirty days"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past thirty days is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past thirty days is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past thirty days is investigational."} ;; "investigational medication in the past thirty days"
(declare-const patient_has_participated_in_trial_with_investigational_medication_inthepast_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a clinical trial with investigational medication within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not participated in a clinical trial with investigational medication within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a clinical trial with investigational medication within the past thirty days.","meaning":"Boolean indicating whether the patient has participated in a clinical trial with investigational medication within the past thirty days."} ;; "has participated in a trial with investigational medication in the past thirty days"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
:named REQ3_AUXILIARY0)) ;; "investigational medication in the past thirty days""

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have received investigational medication in the past thirty days
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received investigational medication in the past thirty days."

;; Exclusion: patient must NOT have participated in a trial with investigational medication in the past thirty days
(assert
(! (not patient_has_participated_in_trial_with_investigational_medication_inthepast_30_days)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in a trial with investigational medication in the past thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a nuclear medicine imaging procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a nuclear medicine imaging procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a nuclear medicine imaging procedure.","meaning":"Boolean indicating whether the patient has ever undergone a nuclear medicine imaging procedure at any time in the past."} ;; "radiopharmaceutical imaging procedure"
(declare-const patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session Bool) ;; {"when_to_set_to_true":"Set to true if the nuclear medicine imaging procedure occurred within seven days of the study imaging session.","when_to_set_to_false":"Set to false if the nuclear medicine imaging procedure did not occur within seven days of the study imaging session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred within seven days of the study imaging session.","meaning":"Boolean indicating whether the nuclear medicine imaging procedure occurred within seven days of the study imaging session."} ;; "radiopharmaceutical imaging procedure within seven days of the study imaging session"
(declare-const patient_has_undergone_administration_of_radiopharmaceutical_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of a radiopharmaceutical at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of a radiopharmaceutical at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of a radiopharmaceutical.","meaning":"Boolean indicating whether the patient has ever undergone administration of a radiopharmaceutical at any time in the past."} ;; "radiopharmaceutical treatment procedure"
(declare-const patient_has_undergone_administration_of_radiopharmaceutical_inthehistory@@temporalcontext_within7days_of_study_imaging_session Bool) ;; {"when_to_set_to_true":"Set to true if the administration of a radiopharmaceutical occurred within seven days of the study imaging session.","when_to_set_to_false":"Set to false if the administration of a radiopharmaceutical did not occur within seven days of the study imaging session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred within seven days of the study imaging session.","meaning":"Boolean indicating whether the administration of a radiopharmaceutical occurred within seven days of the study imaging session."} ;; "radiopharmaceutical treatment procedure within seven days of the study imaging session"
(declare-const patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a radiopharmaceutical treatment procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a radiopharmaceutical treatment procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a radiopharmaceutical treatment procedure.","meaning":"Boolean indicating whether the patient has ever undergone a radiopharmaceutical treatment procedure at any time in the past."} ;; "radiopharmaceutical treatment procedure"
(declare-const patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session Bool) ;; {"when_to_set_to_true":"Set to true if the radiopharmaceutical treatment procedure occurred within seven days of the study imaging session.","when_to_set_to_false":"Set to false if the radiopharmaceutical treatment procedure did not occur within seven days of the study imaging session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiopharmaceutical treatment procedure occurred within seven days of the study imaging session.","meaning":"Boolean indicating whether the radiopharmaceutical treatment procedure occurred within seven days of the study imaging session."} ;; "radiopharmaceutical treatment procedure within seven days of the study imaging session"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session
      patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory)
:named REQ4_AUXILIARY0)) ;; "radiopharmaceutical imaging procedure within seven days of the study imaging session"

(assert
(! (=> patient_has_undergone_administration_of_radiopharmaceutical_inthehistory@@temporalcontext_within7days_of_study_imaging_session
      patient_has_undergone_administration_of_radiopharmaceutical_inthehistory)
:named REQ4_AUXILIARY1)) ;; "radiopharmaceutical administration within seven days of the study imaging session"

(assert
(! (=> patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session
      patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory)
:named REQ4_AUXILIARY2)) ;; "radiopharmaceutical treatment procedure within seven days of the study imaging session"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a radiopharmaceutical imaging procedure within seven days of the study imaging session."

(assert
(! (not patient_has_undergone_radiopharmaceutical_treatment_procedure_inthehistory@@temporalcontext_within7days_of_study_imaging_session)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a radiopharmaceutical treatment procedure within seven days of the study imaging session."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "female of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently assessed to not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "female of childbearing potential"
(declare-const patient_has_finding_of_sterility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically sterile.","when_to_set_to_false":"Set to false if the patient is currently not surgically sterile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically sterile.","meaning":"Boolean indicating whether the patient is currently surgically sterile."} ;; "surgically sterile"
(declare-const patient_is_refraining_from_sexual_activity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently refraining from sexual activity.","when_to_set_to_false":"Set to false if the patient is currently not refraining from sexual activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently refraining from sexual activity.","meaning":"Boolean indicating whether the patient is currently refraining from sexual activity."} ;; "refraining from sexual activity"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@is_reliable_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a reliable method of contraception.","when_to_set_to_false":"Set to false if the patient is currently using contraception but the method is not considered reliable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception method is reliable.","meaning":"Boolean indicating whether the contraception method used by the patient is reliable."} ;; "reliable method of contraception"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable for contraception
(assert
(! (=> patient_has_finding_of_contraception_now@@is_reliable_method
      patient_has_finding_of_contraception_now)
:named REQ5_AUXILIARY0)) ;; "using a reliable method of contraception"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: female of childbearing potential AND (NOT surgically sterile OR NOT refraining from sexual activity OR NOT using reliable contraception)
(assert
(! (not (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             (or (not patient_has_finding_of_sterility_now)
                 (not patient_is_refraining_from_sexual_activity_now)
                 (not patient_has_finding_of_contraception_now@@is_reliable_method))))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a female of childbearing potential AND ((the patient is NOT surgically sterile) OR (the patient is NOT refraining from sexual activity) OR (the patient is NOT using a reliable method of contraception)))."
