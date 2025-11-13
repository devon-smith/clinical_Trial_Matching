;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any type of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any type of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any type of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia (any type)."} ;; "dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@another_type Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia and the type is another (not the index dementia type).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of dementia but the type is not another (i.e., it is the index dementia type).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia type is another (not the index dementia type).","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia and the type is another (not the index dementia type)."} ;; "another type of dementia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_dementia_now@@another_type
      patient_has_diagnosis_of_dementia_now)
:named REQ0_AUXILIARY0)) ;; "another type of dementia" qualifier implies dementia diagnosis

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_dementia_now@@another_type)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from another type of dementia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_institutionalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently institutionalized (e.g., residing in an institution such as a hospital, nursing home, or correctional facility).","when_to_set_to_false":"Set to false if the patient is not currently institutionalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently institutionalized.","meaning":"Boolean indicating whether the patient is currently institutionalized."} ;; "institutionalized"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_institutionalized_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is institutionalized."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder (mental disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric disorder (mental disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric disorder (mental disorder).","meaning":"Boolean indicating whether the patient currently has a psychiatric disorder (mental disorder) now."} ;; "psychiatric disorder"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a psychiatric disorder."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_general_pathology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a general pathology.","when_to_set_to_false":"Set to false if the patient currently does not have a general pathology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a general pathology.","meaning":"Boolean indicating whether the patient currently has a general pathology."} ;; "pathology"
(declare-const patient_has_finding_of_general_pathology_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's general pathology is severe.","when_to_set_to_false":"Set to false if the patient's general pathology is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's general pathology is severe.","meaning":"Boolean indicating whether the patient's general pathology is severe."} ;; "severe"
(declare-const patient_has_finding_of_general_pathology_now@@in_terminal_stages Bool) ;; {"when_to_set_to_true":"Set to true if the patient's general pathology is in the terminal stages.","when_to_set_to_false":"Set to false if the patient's general pathology is not in the terminal stages.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's general pathology is in the terminal stages.","meaning":"Boolean indicating whether the patient's general pathology is in the terminal stages."} ;; "in the terminal stages"
(declare-const patient_has_finding_of_general_pathology_now@@severe@@in_terminal_stages Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a general pathology, and the pathology is both severe and in the terminal stages.","when_to_set_to_false":"Set to false if the patient currently has a general pathology, but the pathology is not both severe and in the terminal stages.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a general pathology that is both severe and in the terminal stages.","meaning":"Boolean indicating whether the patient currently has a general pathology that is both severe and in the terminal stages."} ;; "severe pathology in the terminal stages"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definitional: severe AND terminal stages qualifier variable
(assert
(! (= patient_has_finding_of_general_pathology_now@@severe@@in_terminal_stages
(and patient_has_finding_of_general_pathology_now@@severe
     patient_has_finding_of_general_pathology_now@@in_terminal_stages))
:named REQ3_AUXILIARY0)) ;; "severe pathology in the terminal stages"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_general_pathology_now@@severe@@in_terminal_stages
      patient_has_finding_of_general_pathology_now)
:named REQ3_AUXILIARY1)) ;; "severe pathology in the terminal stages" implies "pathology"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_general_pathology_now@@severe@@in_terminal_stages)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe pathology in the terminal stages."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_undergoing_therapeutic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing any therapeutic procedure (therapy).","when_to_set_to_false":"Set to false if the patient is currently not undergoing any therapeutic procedure (therapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing any therapeutic procedure (therapy).","meaning":"Boolean indicating whether the patient is currently undergoing any therapeutic procedure (therapy)."} ;; "therapy"
(declare-const patient_is_undergoing_therapeutic_procedure_now@@is_non_pharmacological Bool) ;; {"when_to_set_to_true":"Set to true if the therapeutic procedure the patient is currently undergoing is non-pharmacological.","when_to_set_to_false":"Set to false if the therapeutic procedure the patient is currently undergoing is pharmacological.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapeutic procedure is non-pharmacological.","meaning":"Boolean indicating whether the therapeutic procedure is non-pharmacological."} ;; "non-pharmacological therapy"
(declare-const patient_is_undergoing_therapeutic_procedure_now@@is_not_proposed_study_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the non-pharmacological therapy the patient is currently undergoing is not the specific non-pharmacological therapy proposed in the study.","when_to_set_to_false":"Set to false if the non-pharmacological therapy the patient is currently undergoing is the specific non-pharmacological therapy proposed in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the non-pharmacological therapy is the one proposed in the study.","meaning":"Boolean indicating whether the non-pharmacological therapy is not the one proposed in the study."} ;; "other than the non-pharmacological therapy proposed in the study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_undergoing_therapeutic_procedure_now@@is_non_pharmacological
     patient_is_undergoing_therapeutic_procedure_now)
:named REQ4_AUXILIARY0)) ;; "non-pharmacological therapy"

(assert
(! (=> patient_is_undergoing_therapeutic_procedure_now@@is_not_proposed_study_therapy
     patient_is_undergoing_therapeutic_procedure_now@@is_non_pharmacological)
:named REQ4_AUXILIARY1)) ;; "other than the non-pharmacological therapy proposed in the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_undergoing_therapeutic_procedure_now@@is_not_proposed_study_therapy)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving non-pharmacological therapy other than the non-pharmacological therapy proposed in the study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_clinical_drug_trial_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical drug trial at any time within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical drug trial within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical drug trial within the past six months.","meaning":"Boolean indicating whether the patient has undergone a clinical drug trial within the past six months."} ;; "pharmacological trial within the previous six months"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_clinical_drug_trial_inthepast6months)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been enrolled in a pharmacological trial within the previous six months."
