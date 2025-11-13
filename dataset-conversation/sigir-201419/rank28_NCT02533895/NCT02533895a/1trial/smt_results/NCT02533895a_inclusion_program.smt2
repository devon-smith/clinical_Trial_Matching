;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_is_male Bool) ;; {"when_to_set_to_true":"Set to true if the patient is male.","when_to_set_to_false":"Set to false if the patient is not male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is male.","meaning":"Boolean indicating whether the patient is male."}  ;; "male"
(declare-const patient_is_female Bool) ;; {"when_to_set_to_true":"Set to true if the patient is female.","when_to_set_to_false":"Set to false if the patient is not female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is female.","meaning":"Boolean indicating whether the patient is female."}  ;; "female"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."}  ;; "malignant neoplasia"
(declare-const patient_has_no_more_conventional_treatment_options_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has no more conventional treatment options available.","when_to_set_to_false":"Set to false if the patient currently has conventional treatment options available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has conventional treatment options available.","meaning":"Boolean indicating whether the patient currently has no more conventional treatment options available."}  ;; "no more conventional treatment options"
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."}  ;; "disease"
(declare-const patient_has_finding_of_disease_now@@measurable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease is measurable.","when_to_set_to_false":"Set to false if the patient's current disease is not measurable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is measurable.","meaning":"Boolean indicating whether the patient's current disease is measurable."}  ;; "measurable disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; If the patient has measurable disease, then the patient must have disease (qualifier implies stem)
(assert
  (! (=> patient_has_finding_of_disease_now@@measurable
         patient_has_finding_of_disease_now)
     :named REQ0_AUXILIARY0)) ;; "must have measurable disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be male or female with a malignant neoplasia.
(assert
  (! (and (or patient_is_male patient_is_female)
          patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be male or female with a malignant neoplasia"

;; Component 1: The patient must have no more conventional treatment options.
(assert
  (! patient_has_no_more_conventional_treatment_options_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have no more conventional treatment options"

;; Component 2: The patient must have measurable disease.
(assert
  (! patient_has_finding_of_disease_now@@measurable
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "must have measurable disease"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a neoplastic disease (tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a neoplastic disease (tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neoplastic disease (tumor).","meaning":"Boolean indicating whether the patient currently has a neoplastic disease (tumor)."}  ;; "neoplasias"
(declare-const patient_has_finding_of_neoplastic_disease_now@@refractory Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neoplastic disease (tumor) is refractory (not responsive to standard treatment).","when_to_set_to_false":"Set to false if the patient's neoplastic disease (tumor) is not refractory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neoplastic disease (tumor) is refractory.","meaning":"Boolean indicating whether the patient's neoplastic disease (tumor) is refractory."} ;; "refractory"
(declare-const patient_has_finding_of_neoplastic_disease_now@@solid Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neoplastic disease (tumor) is solid.","when_to_set_to_false":"Set to false if the patient's neoplastic disease (tumor) is not solid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neoplastic disease (tumor) is solid.","meaning":"Boolean indicating whether the patient's neoplastic disease (tumor) is solid."} ;; "solid"
(declare-const patient_has_finding_of_neoplastic_disease_now@@occurs_in_childhood Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neoplastic disease (tumor) occurs in childhood (diagnosed or onset in pediatric age).","when_to_set_to_false":"Set to false if the patient's neoplastic disease (tumor) does not occur in childhood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neoplastic disease (tumor) occurs in childhood.","meaning":"Boolean indicating whether the patient's neoplastic disease (tumor) occurs in childhood."} ;; "occurs in childhood"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable (if any qualifier is true, the stem must be true)
(assert
  (! (=> patient_has_finding_of_neoplastic_disease_now@@refractory
         patient_has_finding_of_neoplastic_disease_now)
     :named REQ1_AUXILIARY0)) ;; "refractory solid neoplasias of childhood"

(assert
  (! (=> patient_has_finding_of_neoplastic_disease_now@@solid
         patient_has_finding_of_neoplastic_disease_now)
     :named REQ1_AUXILIARY1)) ;; "refractory solid neoplasias of childhood"

(assert
  (! (=> patient_has_finding_of_neoplastic_disease_now@@occurs_in_childhood
         patient_has_finding_of_neoplastic_disease_now)
     :named REQ1_AUXILIARY2)) ;; "refractory solid neoplasias of childhood"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have a tumour that is typical for the group of refractory solid neoplasias of childhood
(assert
  (! (and patient_has_finding_of_neoplastic_disease_now@@refractory
          patient_has_finding_of_neoplastic_disease_now@@solid
          patient_has_finding_of_neoplastic_disease_now@@occurs_in_childhood)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a tumour that is typical for the group of refractory solid neoplasias of childhood."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must NOT have human immunodeficiency virus infection.
(assert
  (! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_human_cells_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human cells available.","when_to_set_to_false":"Set to false if the patient currently does not have human cells available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human cells available.","meaning":"Boolean indicating whether the patient currently has human cells available."} ;; "have primary tumour cells available"
(declare-const patient_has_finding_of_human_cells_now@@is_primary_tumour_cells Bool) ;; {"when_to_set_to_true":"Set to true if the available human cells are primary tumour cells.","when_to_set_to_false":"Set to false if the available human cells are not primary tumour cells.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the available human cells are primary tumour cells.","meaning":"Boolean indicating whether the available human cells are primary tumour cells."} ;; "primary tumour cells"
(declare-const patient_has_finding_of_human_cells_now@@sufficient_number_for_protocol_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the available primary tumour cells are present in sufficient number to allow treatment according to the protocol.","when_to_set_to_false":"Set to false if the available primary tumour cells are not present in sufficient number to allow treatment according to the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the available primary tumour cells are present in sufficient number to allow treatment according to the protocol.","meaning":"Boolean indicating whether the available primary tumour cells are present in sufficient number to allow treatment according to the protocol."} ;; "sufficient number to allow treatment according to the protocol (cells)"

(declare-const patient_is_exposed_to_human_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human tissue available.","when_to_set_to_false":"Set to false if the patient currently does not have human tissue available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human tissue available.","meaning":"Boolean indicating whether the patient currently has human tissue available."} ;; "have primary tumour tissue available"
(declare-const patient_is_exposed_to_human_tissue_now@@is_primary_tumour_tissue Bool) ;; {"when_to_set_to_true":"Set to true if the available human tissue is primary tumour tissue.","when_to_set_to_false":"Set to false if the available human tissue is not primary tumour tissue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the available human tissue is primary tumour tissue.","meaning":"Boolean indicating whether the available human tissue is primary tumour tissue."} ;; "primary tumour tissue"
(declare-const patient_is_exposed_to_human_tissue_now@@sufficient_number_for_protocol_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the available primary tumour tissue is present in sufficient number to allow treatment according to the protocol.","when_to_set_to_false":"Set to false if the available primary tumour tissue is not present in sufficient number to allow treatment according to the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the available primary tumour tissue is present in sufficient number to allow treatment according to the protocol.","meaning":"Boolean indicating whether the available primary tumour tissue is present in sufficient number to allow treatment according to the protocol."} ;; "sufficient number to allow treatment according to the protocol (tissue)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables (cells)
(assert
  (! (=> patient_has_finding_of_human_cells_now@@is_primary_tumour_cells
         patient_has_finding_of_human_cells_now)
     :named REQ3_AUXILIARY0)) ;; "primary tumour cells" implies "human cells available"

(assert
  (! (=> patient_has_finding_of_human_cells_now@@sufficient_number_for_protocol_treatment
         patient_has_finding_of_human_cells_now@@is_primary_tumour_cells)
     :named REQ3_AUXILIARY1)) ;; "sufficient number for protocol treatment (cells)" implies "primary tumour cells"

;; Qualifier variables imply corresponding stem variables (tissue)
(assert
  (! (=> patient_is_exposed_to_human_tissue_now@@is_primary_tumour_tissue
         patient_is_exposed_to_human_tissue_now)
     :named REQ3_AUXILIARY2)) ;; "primary tumour tissue" implies "human tissue available"

(assert
  (! (=> patient_is_exposed_to_human_tissue_now@@sufficient_number_for_protocol_treatment
         patient_is_exposed_to_human_tissue_now@@is_primary_tumour_tissue)
     :named REQ3_AUXILIARY3)) ;; "sufficient number for protocol treatment (tissue)" implies "primary tumour tissue"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must (have primary tumour tissue available at sufficient number to allow treatment according to the protocol)
;; OR (have primary tumour cells available at sufficient number to allow treatment according to the protocol).
(assert
  (! (or patient_is_exposed_to_human_tissue_now@@sufficient_number_for_protocol_treatment
         patient_has_finding_of_human_cells_now@@sufficient_number_for_protocol_treatment)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have primary tumour tissue available at sufficient number to allow treatment according to the protocol) OR (have primary tumour cells available at sufficient number to allow treatment according to the protocol)."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_signed_informed_consent_indicating_awareness_of_research_and_possible_benefits_and_toxic_side_effects Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent indicating the patient is aware this is a research study and has been told of its possible benefits and toxic side effects.","when_to_set_to_false":"Set to false if the patient has not signed such an informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed such an informed consent.","meaning":"Boolean indicating whether the patient has signed an informed consent indicating awareness of the research study and its possible benefits and toxic side effects."} ;; "the patient signs an informed consent indicating that the patient is aware this is a research study and has been told of its possible benefits and toxic side effects"
(declare-const legal_guardian_signed_informed_consent_indicating_awareness_of_research_and_possible_benefits_and_toxic_side_effects Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal guardian has signed an informed consent indicating the legal guardian is aware this is a research study and has been told of its possible benefits and toxic side effects.","when_to_set_to_false":"Set to false if the patient's legal guardian has not signed such an informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal guardian has signed such an informed consent.","meaning":"Boolean indicating whether the patient's legal guardian has signed an informed consent indicating awareness of the research study and its possible benefits and toxic side effects."} ;; "the patient's legal guardian signs an informed consent indicating that the patient's legal guardian is aware this is a research study and has been told of its possible benefits and toxic side effects"
(declare-const patient_given_copy_of_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been given a copy of the consent form.","when_to_set_to_false":"Set to false if the patient has not been given a copy of the consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been given a copy of the consent form.","meaning":"Boolean indicating whether the patient has been given a copy of the consent form."} ;; "the patient is given a copy of the consent form"
(declare-const legal_guardian_given_copy_of_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal guardian has been given a copy of the consent form.","when_to_set_to_false":"Set to false if the patient's legal guardian has not been given a copy of the consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal guardian has been given a copy of the consent form.","meaning":"Boolean indicating whether the patient's legal guardian has been given a copy of the consent form."} ;; "the patient's legal guardian is given a copy of the consent form"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: ((the patient signs an informed consent indicating that the patient is aware this is a research study and has been told of its possible benefits and toxic side effects) OR (the patient's legal guardian signs an informed consent indicating that the patient's legal guardian is aware this is a research study and has been told of its possible benefits and toxic side effects))
(assert
  (! (or patient_signed_informed_consent_indicating_awareness_of_research_and_possible_benefits_and_toxic_side_effects
         legal_guardian_signed_informed_consent_indicating_awareness_of_research_and_possible_benefits_and_toxic_side_effects)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must ((the patient signs an informed consent indicating that the patient is aware this is a research study and has been told of its possible benefits and toxic side effects) OR (the patient's legal guardian signs an informed consent indicating that the patient's legal guardian is aware this is a research study and has been told of its possible benefits and toxic side effects))."

;; Component 1: ((the patient is given a copy of the consent form) OR (the patient's legal guardian is given a copy of the consent form))
(assert
  (! (or patient_given_copy_of_consent_form
         legal_guardian_given_copy_of_consent_form)
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must ((the patient is given a copy of the consent form) OR (the patient's legal guardian is given a copy of the consent form))."
