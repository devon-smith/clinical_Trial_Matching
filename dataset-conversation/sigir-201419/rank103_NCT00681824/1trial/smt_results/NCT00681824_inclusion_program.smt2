;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_is_undergoing_craniotomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a craniotomy procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a craniotomy procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a craniotomy procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a craniotomy procedure."} ;; "undergoing elective craniotomy"
(declare-const patient_is_undergoing_craniotomy_now@@elective Bool) ;; {"when_to_set_to_true":"Set to true if the craniotomy procedure the patient is currently undergoing is elective.","when_to_set_to_false":"Set to false if the craniotomy procedure the patient is currently undergoing is not elective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the craniotomy procedure is elective.","meaning":"Boolean indicating whether the craniotomy procedure is elective."} ;; "undergoing elective craniotomy"
(declare-const patient_is_undergoing_craniectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a craniectomy procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a craniectomy procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a craniectomy procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a craniectomy procedure."} ;; "undergoing elective craniectomy"
(declare-const patient_is_undergoing_craniectomy_now@@elective Bool) ;; {"when_to_set_to_true":"Set to true if the craniectomy procedure the patient is currently undergoing is elective.","when_to_set_to_false":"Set to false if the craniectomy procedure the patient is currently undergoing is not elective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the craniectomy procedure is elective.","meaning":"Boolean indicating whether the craniectomy procedure is elective."} ;; "undergoing elective craniectomy"

(declare-const patient_has_diagnosis_of_benign_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of benign neoplastic disease (benign tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of benign neoplastic disease (benign tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of benign neoplastic disease (benign tumor).","meaning":"Boolean indicating whether the patient currently has a diagnosis of benign neoplastic disease (benign tumor)."} ;; "benign tumor in the posterior fossa"
(declare-const patient_has_diagnosis_of_benign_neoplastic_disease_now@@located_in_posterior_fossa Bool) ;; {"when_to_set_to_true":"Set to true if the benign tumor is located in the posterior fossa.","when_to_set_to_false":"Set to false if the benign tumor is not located in the posterior fossa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the benign tumor is located in the posterior fossa.","meaning":"Boolean indicating whether the benign tumor is located in the posterior fossa."} ;; "benign tumor in the posterior fossa"

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignant tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignant tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (malignant tumor).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (malignant tumor)."} ;; "malignant tumor in the posterior fossa"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@located_in_posterior_fossa Bool) ;; {"when_to_set_to_true":"Set to true if the malignant tumor is located in the posterior fossa.","when_to_set_to_false":"Set to false if the malignant tumor is not located in the posterior fossa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant tumor is located in the posterior fossa.","meaning":"Boolean indicating whether the malignant tumor is located in the posterior fossa."} ;; "malignant tumor in the posterior fossa"

(declare-const patient_has_diagnosis_of_congenital_vascular_malformation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital vascular malformation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congenital vascular malformation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congenital vascular malformation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congenital vascular malformation."} ;; "vascular malformation in the posterior fossa"
(declare-const patient_has_diagnosis_of_congenital_vascular_malformation_now@@located_in_posterior_fossa Bool) ;; {"when_to_set_to_true":"Set to true if the vascular malformation is located in the posterior fossa.","when_to_set_to_false":"Set to false if the vascular malformation is not located in the posterior fossa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vascular malformation is located in the posterior fossa.","meaning":"Boolean indicating whether the vascular malformation is located in the posterior fossa."} ;; "vascular malformation in the posterior fossa"

(declare-const patient_has_diagnosis_of_chiari_malformation_type_i_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Chiari malformation type I.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Chiari malformation type I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Chiari malformation type I.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Chiari malformation type I."} ;; "Chiari 1 malformation in the posterior fossa"
(declare-const patient_has_diagnosis_of_chiari_malformation_type_i_now@@located_in_posterior_fossa Bool) ;; {"when_to_set_to_true":"Set to true if the Chiari malformation type I is located in the posterior fossa.","when_to_set_to_false":"Set to false if the Chiari malformation type I is not located in the posterior fossa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Chiari malformation type I is located in the posterior fossa.","meaning":"Boolean indicating whether the Chiari malformation type I is located in the posterior fossa."} ;; "Chiari 1 malformation in the posterior fossa"

(declare-const patient_is_exposed_to_dural_substitute_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a dural substitute.","when_to_set_to_false":"Set to false if the patient is not currently exposed to a dural substitute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a dural substitute.","meaning":"Boolean indicating whether the patient is currently exposed to a dural substitute."} ;; "dura substitution"
(declare-const patient_is_exposed_to_dural_substitute_now@@required_for_closure_of_dura_defect Bool) ;; {"when_to_set_to_true":"Set to true if the dural substitute exposure is required for closure of a dura defect.","when_to_set_to_false":"Set to false if the dural substitute exposure is not required for closure of a dura defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dural substitute exposure is required for closure of a dura defect.","meaning":"Boolean indicating whether the dural substitute exposure is required for closure of a dura defect."} ;; "dura defect requiring dura substitution for closure"

(declare-const patient_is_able_to_comply_with_protocol_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to comply with the procedures required by the protocol.","when_to_set_to_false":"Set to false if the patient is currently unable to comply with the procedures required by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comply with the procedures required by the protocol.","meaning":"Boolean indicating whether the patient is currently able to comply with the procedures required by the protocol."} ;; "be able to comply with the procedures required by the protocol"

(declare-const patient_is_willing_to_comply_with_protocol_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to comply with the procedures required by the protocol.","when_to_set_to_false":"Set to false if the patient is currently unwilling to comply with the procedures required by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to comply with the procedures required by the protocol.","meaning":"Boolean indicating whether the patient is currently willing to comply with the procedures required by the protocol."} ;; "be willing to comply with the procedures required by the protocol"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_is_undergoing_craniotomy_now@@elective
         patient_is_undergoing_craniotomy_now)
     :named REQ0_AUXILIARY0)) ;; "undergoing elective craniotomy"

(assert
  (! (=> patient_is_undergoing_craniectomy_now@@elective
         patient_is_undergoing_craniectomy_now)
     :named REQ0_AUXILIARY1)) ;; "undergoing elective craniectomy"

(assert
  (! (=> patient_has_diagnosis_of_benign_neoplastic_disease_now@@located_in_posterior_fossa
         patient_has_diagnosis_of_benign_neoplastic_disease_now)
     :named REQ0_AUXILIARY2)) ;; "benign tumor in the posterior fossa"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@located_in_posterior_fossa
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY3)) ;; "malignant tumor in the posterior fossa"

(assert
  (! (=> patient_has_diagnosis_of_congenital_vascular_malformation_now@@located_in_posterior_fossa
         patient_has_diagnosis_of_congenital_vascular_malformation_now)
     :named REQ0_AUXILIARY4)) ;; "vascular malformation in the posterior fossa"

(assert
  (! (=> patient_has_diagnosis_of_chiari_malformation_type_i_now@@located_in_posterior_fossa
         patient_has_diagnosis_of_chiari_malformation_type_i_now)
     :named REQ0_AUXILIARY5)) ;; "Chiari 1 malformation in the posterior fossa"

(assert
  (! (=> patient_is_exposed_to_dural_substitute_now@@required_for_closure_of_dura_defect
         patient_is_exposed_to_dural_substitute_now)
     :named REQ0_AUXILIARY6)) ;; "dura defect requiring dura substitution for closure"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: (undergoing elective craniotomy OR undergoing elective craniectomy) for (benign tumor in the posterior fossa OR malignant tumor in the posterior fossa OR vascular malformation in the posterior fossa OR Chiari 1 malformation in the posterior fossa)
(assert
  (! (and
        (or patient_is_undergoing_craniotomy_now@@elective
            patient_is_undergoing_craniectomy_now@@elective)
        (or patient_has_diagnosis_of_benign_neoplastic_disease_now@@located_in_posterior_fossa
            patient_has_diagnosis_of_malignant_neoplastic_disease_now@@located_in_posterior_fossa
            patient_has_diagnosis_of_congenital_vascular_malformation_now@@located_in_posterior_fossa
            patient_has_diagnosis_of_chiari_malformation_type_i_now@@located_in_posterior_fossa))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (undergoing elective craniotomy OR undergoing elective craniectomy) for (benign tumor in the posterior fossa OR malignant tumor in the posterior fossa OR vascular malformation in the posterior fossa OR Chiari 1 malformation in the posterior fossa)."

;; Component 1: have a dura defect requiring dura substitution for closure
(assert
  (! patient_is_exposed_to_dural_substitute_now@@required_for_closure_of_dura_defect
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a dura defect requiring dura substitution for closure."

;; Component 2: be able to comply with the procedures required by the protocol
(assert
  (! patient_is_able_to_comply_with_protocol_procedures_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to comply with the procedures required by the protocol."

;; Component 3: be willing to comply with the procedures required by the protocol
(assert
  (! patient_is_willing_to_comply_with_protocol_procedures_now
     :named REQ0_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to comply with the procedures required by the protocol."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_signed_and_dated_written_informed_consent_prior_to_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided signed and dated written informed consent before any study-related procedures are performed.","when_to_set_to_false":"Set to false if the patient has not provided signed and dated written informed consent before any study-related procedures are performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided signed and dated written informed consent prior to any study-related procedures.","meaning":"Boolean indicating whether the patient has provided signed and dated written informed consent prior to any study-related procedures."} ;; "signed and dated written informed consent from the patient prior to any study-related procedures"
(declare-const legal_representative_has_signed_and_dated_written_informed_consent_prior_to_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the legal representative of the patient has provided signed and dated written informed consent before any study-related procedures are performed.","when_to_set_to_false":"Set to false if the legal representative of the patient has not provided signed and dated written informed consent before any study-related procedures are performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legal representative of the patient has provided signed and dated written informed consent prior to any study-related procedures.","meaning":"Boolean indicating whether the legal representative of the patient has provided signed and dated written informed consent prior to any study-related procedures."} ;; "signed and dated written informed consent from the legal representative of the patient prior to any study-related procedures"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (signed and dated written informed consent from the patient OR signed and dated written informed consent from the legal representative of the patient) prior to any study-related procedures.
(assert
  (! (or patient_has_signed_and_dated_written_informed_consent_prior_to_study_procedures
         legal_representative_has_signed_and_dated_written_informed_consent_prior_to_study_procedures)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 3 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 3)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (aged ≥ 3 years)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_surgical_wound_classification_class_i_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a surgical wound classified as class I.","when_to_set_to_false":"Set to false if the patient currently does not have a surgical wound classified as class I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a surgical wound classified as class I.","meaning":"Boolean indicating whether the patient currently has a surgical wound classified as class I."} ;; "surgical wound classification class I"
(declare-const risk_index_category_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's risk index category recorded now.","when_to_set_to_null":"Set to null if the risk index category value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's risk index category recorded now, as an integer."} ;; "risk index category ≤ 2"
(declare-const patient_has_undergone_mastoidectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a mastoidectomy procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a mastoidectomy procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a mastoidectomy procedure.","meaning":"Boolean indicating whether the patient has undergone a mastoidectomy procedure at any time in the past."} ;; "mastoidectomy"
(declare-const patient_has_undergone_mastoidectomy_inthehistory@@partial Bool) ;; {"when_to_set_to_true":"Set to true if the mastoidectomy procedure undergone by the patient was partial.","when_to_set_to_false":"Set to false if the mastoidectomy procedure was not partial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mastoidectomy was partial.","meaning":"Boolean indicating whether the mastoidectomy procedure was partial."} ;; "partial mastoidectomy"
(declare-const patient_has_undergone_mastoidectomy_inthehistory@@penetration_of_mastoid_air_cells Bool) ;; {"when_to_set_to_true":"Set to true if the mastoidectomy procedure involved penetration of mastoid air cells.","when_to_set_to_false":"Set to false if the mastoidectomy procedure did not involve penetration of mastoid air cells.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether penetration of mastoid air cells occurred during mastoidectomy.","meaning":"Boolean indicating whether penetration of mastoid air cells occurred during mastoidectomy."} ;; "penetration of mastoid air cells during partial mastoidectomy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_mastoidectomy_inthehistory@@partial
         patient_has_undergone_mastoidectomy_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "partial mastoidectomy is a type of mastoidectomy"

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_mastoidectomy_inthehistory@@penetration_of_mastoid_air_cells
         patient_has_undergone_mastoidectomy_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "penetration of mastoid air cells during mastoidectomy is a property of mastoidectomy"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: surgical wound classification class I
(assert
  (! patient_has_surgical_wound_classification_class_i_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (surgical wound classification class I)"

;; Component 1: risk index category ≤ 2
(assert
  (! (<= risk_index_category_value_recorded_now_withunit_integer 2)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (risk index category ≤ 2)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_autologous_fascia_lata_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to autologous fascia lata (e.g., a patch used for closure of a dura defect).","when_to_set_to_false":"Set to false if the patient is currently not exposed to autologous fascia lata.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to autologous fascia lata.","meaning":"Boolean indicating whether the patient is currently exposed to autologous fascia lata."} ;; "a patch of autologous fascia"
(declare-const patient_is_exposed_to_autologous_fascia_lata_now@@used_as_patch_for_dura_defect_closure_cut_to_size_and_sutured Bool) ;; {"when_to_set_to_true":"Set to true if the patient is exposed to autologous fascia lata and it was used as a patch for closure of a dura defect, cut to size and sutured into the defect.","when_to_set_to_false":"Set to false if the patient is exposed to autologous fascia lata but it was not used as a patch for closure of a dura defect, cut to size and sutured into the defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the autologous fascia lata was used as a patch for closure of a dura defect, cut to size and sutured into the defect.","meaning":"Boolean indicating whether the autologous fascia lata exposure was specifically as a patch for closure of a dura defect, cut to size and sutured."} ;; "a patch of autologous fascia cut to size and then sutured into the dura defect"
(declare-const patient_is_exposed_to_pericranium_now@@used_as_patch_for_dura_defect_closure_cut_to_size_and_sutured Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to pericranium and it was used as a patch cut to size and then sutured into the dura defect.","when_to_set_to_false":"Set to false if the patient is currently exposed to pericranium but it was not used as a patch cut to size and then sutured into the dura defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to pericranium as a patch cut to size and then sutured into the dura defect.","meaning":"Boolean indicating whether the patient is currently exposed to pericranium, specifically as a patch cut to size and then sutured into the dura defect."} ;; "a patch of pericranium cut to size and then sutured into the dura defect"
(declare-const patient_is_exposed_to_suturable_collagen_based_dura_substitute_now@@used_as_patch_for_dura_defect_closure_cut_to_size_and_sutured Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a suturable collagen-based dura substitute and it was used as a patch cut to size and then sutured into the dura defect.","when_to_set_to_false":"Set to false if the patient is currently exposed to a suturable collagen-based dura substitute but it was not used as a patch cut to size and then sutured into the dura defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a suturable collagen-based dura substitute as a patch cut to size and then sutured into the dura defect.","meaning":"Boolean indicating whether the patient is currently exposed to a suturable collagen-based dura substitute, specifically as a patch cut to size and then sutured into the dura defect."} ;; "a patch of suturable collagen-based dura substitute cut to size and then sutured into the dura defect"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_autologous_fascia_lata_now@@used_as_patch_for_dura_defect_closure_cut_to_size_and_sutured
         patient_is_exposed_to_autologous_fascia_lata_now)
     :named REQ4_AUXILIARY0)) ;; "a patch of autologous fascia cut to size and then sutured into the dura defect"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have had (a patch of autologous fascia cut to size and then sutured into the dura defect OR a patch of pericranium cut to size and then sutured into the dura defect OR a patch of suturable collagen-based dura substitute cut to size and then sutured into the dura defect).
(assert
  (! (or patient_is_exposed_to_autologous_fascia_lata_now@@used_as_patch_for_dura_defect_closure_cut_to_size_and_sutured
         patient_is_exposed_to_pericranium_now@@used_as_patch_for_dura_defect_closure_cut_to_size_and_sutured
         patient_is_exposed_to_suturable_collagen_based_dura_substitute_now@@used_as_patch_for_dura_defect_closure_cut_to_size_and_sutured)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had (a patch of autologous fascia cut to size and then sutured into the dura defect OR a patch of pericranium cut to size and then sutured into the dura defect OR a patch of suturable collagen-based dura substitute cut to size and then sutured into the dura defect)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const hem_of_native_dura_exposed_along_craniotomy_edge_width_value_now_in_mm Real) ;; {"when_to_set_to_value":"Set to the measured width in millimeters of the hem of native dura exposed along the craniotomy edge at the current time.","when_to_set_to_null":"Set to null if the width is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the width in millimeters of the hem of native dura exposed along the craniotomy edge at the current time."} ;; "the hem of native dura exposed along the craniotomy edge"
(declare-const hem_of_native_dura_exposed_along_craniotomy_edge_width_value_now_in_mm@@sufficient_for_suturing_and_adherence_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the measured width is sufficient to facilitate suturing and allow for sufficient surface area for adherence of the investigational product.","when_to_set_to_false":"Set to false if the measured width is not sufficient for these purposes.","when_to_set_to_null":"Set to null if sufficiency cannot be determined or is not documented.","meaning":"Boolean indicating whether the width is sufficient to facilitate suturing and allow for sufficient surface area for adherence of the investigational product."} ;; "wide enough to facilitate suturing and allow for sufficient surface area for adherence of the investigational product (along craniotomy edge)"
(declare-const hem_of_native_dura_exposed_under_craniotomy_edge_width_value_now_in_mm Real) ;; {"when_to_set_to_value":"Set to the measured width in millimeters of the hem of native dura exposed under the craniotomy edge at the current time.","when_to_set_to_null":"Set to null if the width is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the width in millimeters of the hem of native dura exposed under the craniotomy edge at the current time."} ;; "the hem of native dura exposed under the craniotomy edge"
(declare-const hem_of_native_dura_exposed_under_craniotomy_edge_width_value_now_in_mm@@sufficient_for_suturing_and_adherence_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the measured width is sufficient to facilitate suturing and allow for sufficient surface area for adherence of the investigational product.","when_to_set_to_false":"Set to false if the measured width is not sufficient for these purposes.","when_to_set_to_null":"Set to null if sufficiency cannot be determined or is not documented.","meaning":"Boolean indicating whether the width is sufficient to facilitate suturing and allow for sufficient surface area for adherence of the investigational product."} ;; "wide enough to facilitate suturing and allow for sufficient surface area for adherence of the investigational product (under craniotomy edge)"
(declare-const patient_can_undergo_closure_by_suture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can undergo closure by suture (suturing) now.","when_to_set_to_false":"Set to false if the patient cannot undergo closure by suture (suturing) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo closure by suture (suturing) now.","meaning":"Boolean indicating whether the patient can undergo closure by suture (suturing) now."} ;; "facilitate suturing"
(declare-const patient_is_undergoing_craniotomy_now@@hem_of_native_dura_exposed_along_craniotomy_edge Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a craniotomy and the hem of native dura is exposed along the craniotomy edge.","when_to_set_to_false":"Set to false if the patient is currently undergoing a craniotomy and the hem of native dura is not exposed along the craniotomy edge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hem of native dura is exposed along the craniotomy edge during craniotomy.","meaning":"Boolean indicating whether the hem of native dura is exposed along the craniotomy edge during craniotomy."} ;; "the hem of native dura exposed along the craniotomy edge"
(declare-const patient_is_undergoing_craniotomy_now@@hem_of_native_dura_exposed_under_craniotomy_edge Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a craniotomy and the hem of native dura is exposed under the craniotomy edge.","when_to_set_to_false":"Set to false if the patient is currently undergoing a craniotomy and the hem of native dura is not exposed under the craniotomy edge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hem of native dura is exposed under the craniotomy edge during craniotomy.","meaning":"Boolean indicating whether the hem of native dura is exposed under the craniotomy edge during craniotomy."} ;; "the hem of native dura exposed under the craniotomy edge"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Exposure of hem of native dura along craniotomy edge implies craniotomy
(assert
  (! (=> patient_is_undergoing_craniotomy_now@@hem_of_native_dura_exposed_along_craniotomy_edge
         patient_is_undergoing_craniotomy_now)
     :named REQ5_AUXILIARY0)) ;; "the hem of native dura exposed along the craniotomy edge"

;; Exposure of hem of native dura under craniotomy edge implies craniotomy
(assert
  (! (=> patient_is_undergoing_craniotomy_now@@hem_of_native_dura_exposed_under_craniotomy_edge
         patient_is_undergoing_craniotomy_now)
     :named REQ5_AUXILIARY1)) ;; "the hem of native dura exposed under the craniotomy edge"

;; Sufficient width for suturing and adherence (along craniotomy edge) implies exposure
(assert
  (! (=> hem_of_native_dura_exposed_along_craniotomy_edge_width_value_now_in_mm@@sufficient_for_suturing_and_adherence_of_investigational_product
         patient_is_undergoing_craniotomy_now@@hem_of_native_dura_exposed_along_craniotomy_edge)
     :named REQ5_AUXILIARY2)) ;; "the hem of native dura exposed along the craniotomy edge wide enough to facilitate suturing and allow for sufficient surface area for adherence of the investigational product"

;; Sufficient width for suturing and adherence (under craniotomy edge) implies exposure
(assert
  (! (=> hem_of_native_dura_exposed_under_craniotomy_edge_width_value_now_in_mm@@sufficient_for_suturing_and_adherence_of_investigational_product
         patient_is_undergoing_craniotomy_now@@hem_of_native_dura_exposed_under_craniotomy_edge)
     :named REQ5_AUXILIARY3)) ;; "the hem of native dura exposed under the craniotomy edge wide enough to facilitate suturing and allow for sufficient surface area for adherence of the investigational product"

;; Sufficient width for suturing and adherence (either location) implies patient can undergo closure by suture
(assert
  (! (=> (and hem_of_native_dura_exposed_along_craniotomy_edge_width_value_now_in_mm@@sufficient_for_suturing_and_adherence_of_investigational_product
              hem_of_native_dura_exposed_under_craniotomy_edge_width_value_now_in_mm@@sufficient_for_suturing_and_adherence_of_investigational_product)
         patient_can_undergo_closure_by_suture_now)
     :named REQ5_AUXILIARY4)) ;; "facilitate suturing"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (and patient_is_undergoing_craniotomy_now@@hem_of_native_dura_exposed_along_craniotomy_edge
          hem_of_native_dura_exposed_along_craniotomy_edge_width_value_now_in_mm@@sufficient_for_suturing_and_adherence_of_investigational_product
          patient_is_undergoing_craniotomy_now@@hem_of_native_dura_exposed_under_craniotomy_edge
          hem_of_native_dura_exposed_under_craniotomy_edge_width_value_now_in_mm@@sufficient_for_suturing_and_adherence_of_investigational_product)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the hem of native dura exposed along the craniotomy edge AND the hem of native dura exposed under the craniotomy edge wide enough to facilitate suturing AND allow for sufficient surface area for adherence of the investigational product"
