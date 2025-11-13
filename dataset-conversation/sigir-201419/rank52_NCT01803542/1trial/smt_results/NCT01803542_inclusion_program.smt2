;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_can_undergo_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently can undergo a biopsy.","when_to_set_to_false":"Set to false if the patient currently cannot undergo a biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently can undergo a biopsy.","meaning":"Boolean indicating whether the patient currently can undergo a biopsy."}  ;; "biopsy"
(declare-const patient_can_undergo_biopsy_now@@risks_unacceptable Bool) ;; {"when_to_set_to_true":"Set to true if the patient cannot undergo biopsy because the risks are unacceptable.","when_to_set_to_false":"Set to false if the patient cannot undergo biopsy and the risks are not unacceptable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the risks of biopsy are unacceptable.","meaning":"Boolean indicating whether the patient cannot undergo biopsy because the risks are unacceptable."}  ;; "the risks of biopsy are unacceptable"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy)."}  ;; "malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@confirmed_histologically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplastic disease is confirmed histologically.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplastic disease is not confirmed histologically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is confirmed histologically.","meaning":"Boolean indicating whether the patient's diagnosis of malignant neoplastic disease is confirmed histologically."}  ;; "histological confirmation of malignancy"
(declare-const patient_has_finding_of_finding_of_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of lesion.","meaning":"Boolean indicating whether the patient currently has a finding of lesion."}  ;; "lesion"
(declare-const patient_has_finding_of_finding_of_lesion_now@@grown_on_serial_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lesion has grown on serial computed tomography scan.","when_to_set_to_false":"Set to false if the patient's lesion has not grown on serial computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion has grown on serial computed tomography scan.","meaning":"Boolean indicating whether the patient's lesion has grown on serial computed tomography scan."}  ;; "the lesion has grown on serial computed tomography scan"
(declare-const patient_has_finding_of_finding_of_lesion_now@@positive_on_positron_emission_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lesion is positive on positron emission tomography scan.","when_to_set_to_false":"Set to false if the patient's lesion is not positive on positron emission tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is positive on positron emission tomography scan.","meaning":"Boolean indicating whether the patient's lesion is positive on positron emission tomography scan."}  ;; "the lesion is positive on positron emission tomography scan"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for histological confirmation implies diagnosis of malignancy
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@confirmed_histologically
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY0)) ;; "histological confirmation of malignancy" implies "diagnosis of malignancy"

;; Qualifier variable for risks unacceptable implies cannot undergo biopsy
(assert
  (! (=> patient_can_undergo_biopsy_now@@risks_unacceptable
         (not patient_can_undergo_biopsy_now))
     :named REQ0_AUXILIARY1)) ;; "risks of biopsy are unacceptable" implies cannot undergo biopsy

;; Qualifier variable for lesion grown on CT implies lesion present
(assert
  (! (=> patient_has_finding_of_finding_of_lesion_now@@grown_on_serial_computed_tomography_scan
         patient_has_finding_of_finding_of_lesion_now)
     :named REQ0_AUXILIARY2)) ;; "lesion has grown on serial CT" implies "lesion present"

;; Qualifier variable for lesion positive on PET implies lesion present
(assert
  (! (=> patient_has_finding_of_finding_of_lesion_now@@positive_on_positron_emission_tomography_scan
         patient_has_finding_of_finding_of_lesion_now)
     :named REQ0_AUXILIARY3)) ;; "lesion positive on PET" implies "lesion present"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((have histological confirmation of malignancy) OR ((the risks of biopsy are unacceptable) AND ((the lesion has grown on serial computed tomography scan) OR (the lesion is positive on positron emission tomography scan))))
(assert
  (! (or
        patient_has_diagnosis_of_malignant_neoplastic_disease_now@@confirmed_histologically
        (and
          patient_can_undergo_biopsy_now@@risks_unacceptable
          (or patient_has_finding_of_finding_of_lesion_now@@grown_on_serial_computed_tomography_scan
              patient_has_finding_of_finding_of_lesion_now@@positive_on_positron_emission_tomography_scan)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have histological confirmation of malignancy) OR ((the risks of biopsy are unacceptable) AND ((the lesion has grown on serial computed tomography scan) OR (the lesion is positive on positron emission tomography scan))))"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_staging_study_identifying_stage_i_non_metastatic_nsclc_t1_n0_m0 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a staging study that identifies them as having stage I non-metastatic non-small cell lung cancer (T1, N0, M0).","when_to_set_to_false":"Set to false if the patient has had a staging study that does not identify them as having stage I non-metastatic non-small cell lung cancer (T1, N0, M0).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has had a staging study identifying them as having stage I non-metastatic non-small cell lung cancer (T1, N0, M0).","meaning":"Boolean indicating whether the patient has had a staging study identifying them as having stage I non-metastatic non-small cell lung cancer (T1, N0, M0)."} ;; "stage I non-metastatic non-small cell lung cancer (T1, N0, M0)"
(declare-const patient_has_staging_study_identifying_stage_ii_non_metastatic_nsclc_t2_n0_m0 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a staging study that identifies them as having stage II non-metastatic non-small cell lung cancer (T2, N0, M0).","when_to_set_to_false":"Set to false if the patient has had a staging study that does not identify them as having stage II non-metastatic non-small cell lung cancer (T2, N0, M0).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has had a staging study identifying them as having stage II non-metastatic non-small cell lung cancer (T2, N0, M0).","meaning":"Boolean indicating whether the patient has had a staging study identifying them as having stage II non-metastatic non-small cell lung cancer (T2, N0, M0)."} ;; "stage II non-metastatic non-small cell lung cancer (T2, N0, M0)"
(declare-const patient_has_staging_study_identifying_non_metastatic_nsclc_with_chest_wall_primary_tumor_only_t3_n0_m0 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a staging study that identifies them as having non-metastatic non-small cell lung cancer with chest wall primary tumor only (T3, N0, M0).","when_to_set_to_false":"Set to false if the patient has had a staging study that does not identify them as having non-metastatic non-small cell lung cancer with chest wall primary tumor only (T3, N0, M0).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has had a staging study identifying them as having non-metastatic non-small cell lung cancer with chest wall primary tumor only (T3, N0, M0).","meaning":"Boolean indicating whether the patient has had a staging study identifying them as having non-metastatic non-small cell lung cancer with chest wall primary tumor only (T3, N0, M0)."} ;; "non-metastatic non-small cell lung cancer with chest wall primary tumor only (T3, N0, M0)"
(declare-const patient_has_staging_study_identifying_non_lung_primary_tumor_controlled_with_lung_only_metastasis_and_potentially_curative_surgery_option Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a staging study that identifies them as having a non-lung primary tumor that is controlled, with metastasis to the lungs alone, and in whom potentially curative surgery would otherwise be an option.","when_to_set_to_false":"Set to false if the patient has had a staging study that does not identify them as having a non-lung primary tumor that is controlled, with metastasis to the lungs alone, and in whom potentially curative surgery would otherwise be an option.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has had a staging study identifying them as having a non-lung primary tumor that is controlled, with metastasis to the lungs alone, and in whom potentially curative surgery would otherwise be an option.","meaning":"Boolean indicating whether the patient has had a staging study identifying them as having a non-lung primary tumor that is controlled, with metastasis to the lungs alone, and in whom potentially curative surgery would otherwise be an option."} ;; "non-lung primary tumor that is controlled AND that has metastasis to the lungs alone AND in whom potentially curative surgery would otherwise be an option"
(declare-const patient_has_staging_study_identifying_limited_volume_metastatic_nsclc_or_other_primary_site_tumor_with_potential_benefit_from_high_dose_sbrt_to_lung_tumor_and_other_sites_being_treated_for_long_term_control Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a staging study that identifies them as having limited volume metastatic non-small cell lung cancer or other primary site tumor, for whom it is felt they may derive benefit from high-dose stereotactic body radiation therapy to the primary or metastatic lung tumor, and in whom other sites of metastatic disease are being treated with the desire to achieve long term control.","when_to_set_to_false":"Set to false if the patient has had a staging study that does not identify them as such.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has had a staging study identifying them as such.","meaning":"Boolean indicating whether the patient has had a staging study identifying them as having limited volume metastatic non-small cell lung cancer or other primary site tumor, for whom it is felt they may derive benefit from high-dose stereotactic body radiation therapy to the primary or metastatic lung tumor, and in whom other sites of metastatic disease are being treated with the desire to achieve long term control."} ;; "limited volume metastatic non-small cell lung cancer OR other primary site tumor whom it is felt may derive benefit from high-dose stereotactic body radiation therapy treatment to the primary lung tumor OR metastatic lung tumor AND in whom other sites of metastatic disease are being treated with the desire to achieve long term control"
(declare-const lesion_size_value_recorded_most_recent_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the most recent recorded size of the lesion in millimeters (mm).","when_to_set_to_null":"Set to null if the most recent recorded size of the lesion in millimeters (mm) is unknown or cannot be determined.","meaning":"Numeric value representing the most recent recorded size of the lesion in millimeters (mm)."} ;; "lesion size in mm"
(declare-const lesion_size_value_recorded_most_recent_withunit_mm@@meets_criteria_specified_in_4_1_2_1 Bool) ;; {"when_to_set_to_true":"Set to true if the most recent recorded size of the lesion in millimeters (mm) meets the criteria specified in section 4.1.2.1.","when_to_set_to_false":"Set to false if the most recent recorded size of the lesion in millimeters (mm) does not meet the criteria specified in section 4.1.2.1.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the most recent recorded size of the lesion in millimeters (mm) meets the criteria specified in section 4.1.2.1.","meaning":"Boolean indicating whether the most recent recorded size of the lesion in millimeters (mm) meets the criteria specified in section 4.1.2.1."} ;; "lesion size meets criteria in 4.1.2.1"

;; Staging study examples (non-exhaustive)
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@used_as_staging_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a plain chest x-ray and it was performed as a staging study.","when_to_set_to_false":"Set to false if the patient has ever undergone a plain chest x-ray but it was not performed as a staging study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the chest x-ray was performed as a staging study.","meaning":"Boolean indicating whether the patient has ever undergone a plain chest x-ray as a staging study."} ;; "chest radiograph as staging study"
(declare-const patient_has_undergone_computerized_axial_tomography_inthehistory@@used_as_staging_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a computed tomography scan and it was performed as a staging study.","when_to_set_to_false":"Set to false if the patient has ever undergone a computed tomography scan but it was not performed as a staging study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the CT scan was performed as a staging study.","meaning":"Boolean indicating whether the patient has ever undergone a computed tomography scan as a staging study."} ;; "computed tomography scan as staging study"
(declare-const patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory@@used_as_staging_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone MRI of the brain and brain stem and it was performed as a staging study.","when_to_set_to_false":"Set to false if the patient has ever undergone MRI of the brain and brain stem but it was not performed as a staging study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the MRI was performed as a staging study.","meaning":"Boolean indicating whether the patient has ever undergone MRI of the brain and brain stem as a staging study."} ;; "magnetic resonance imaging of brain as staging study"
(declare-const patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory@@used_as_staging_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a computed tomography of the brain and it was performed as a staging study.","when_to_set_to_false":"Set to false if the patient has ever undergone a computed tomography of the brain but it was not performed as a staging study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the CT of the brain was performed as a staging study.","meaning":"Boolean indicating whether the patient has ever undergone a computed tomography of the brain as a staging study."} ;; "computed tomography of brain as staging study"
(declare-const patient_has_undergone_radioisotope_scan_of_bone_inthehistory@@used_as_staging_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a radioisotope scan of bone (bone scan) and it was performed as a staging study.","when_to_set_to_false":"Set to false if the patient has ever undergone a radioisotope scan of bone (bone scan) but it was not performed as a staging study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the bone scan was performed as a staging study.","meaning":"Boolean indicating whether the patient has ever undergone a radioisotope scan of bone (bone scan) as a staging study."} ;; "bone scan as staging study"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply staging study
(assert
  (! (=> (or patient_has_undergone_plain_chest_x_ray_inthehistory@@used_as_staging_study
            patient_has_undergone_computerized_axial_tomography_inthehistory@@used_as_staging_study
            patient_has_undergone_mri_of_brain_and_brain_stem_inthehistory@@used_as_staging_study
            patient_has_undergone_computerized_axial_tomography_of_brain_inthehistory@@used_as_staging_study
            patient_has_undergone_radioisotope_scan_of_bone_inthehistory@@used_as_staging_study)
        ;; umbrella variable not present, so no equivalence, just implication
        true)
     :named REQ1_AUXILIARY0)) ;; "staging studies (with non-exhaustive examples...)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must have staging study identifying them as at least one of the listed categories
(assert
  (! (or patient_has_staging_study_identifying_stage_i_non_metastatic_nsclc_t1_n0_m0
         patient_has_staging_study_identifying_stage_ii_non_metastatic_nsclc_t2_n0_m0
         patient_has_staging_study_identifying_non_metastatic_nsclc_with_chest_wall_primary_tumor_only_t3_n0_m0
         patient_has_staging_study_identifying_non_lung_primary_tumor_controlled_with_lung_only_metastasis_and_potentially_curative_surgery_option
         patient_has_staging_study_identifying_limited_volume_metastatic_nsclc_or_other_primary_site_tumor_with_potential_benefit_from_high_dose_sbrt_to_lung_tumor_and_other_sites_being_treated_for_long_term_control)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "identifying the patient as at least one of the following..."

;; Component 1: Lesions must meet size criteria in 4.1.2.1
(assert
  (! lesion_size_value_recorded_most_recent_withunit_mm@@meets_criteria_specified_in_4_1_2_1
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "lesions must meet size criteria in 4.1.2.1"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disease.","meaning":"Boolean indicating whether the patient currently has a disease diagnosis."} ;; "disease"
(declare-const patient_has_diagnosis_of_disease_now@@potentially_resectable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease diagnosis and the disease is potentially resectable.","when_to_set_to_false":"Set to false if the patient currently has a disease diagnosis but the disease is not potentially resectable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is potentially resectable.","meaning":"Boolean indicating whether the patient currently has a disease diagnosis and the disease is potentially resectable."} ;; "potentially resectable disease"
(declare-const patient_has_finding_of_patient_unsuitable_for_procedure_due_to_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered unsuitable for a procedure due to medical condition (medically inoperable).","when_to_set_to_false":"Set to false if the patient is currently considered suitable for a procedure from a medical standpoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is considered medically inoperable.","meaning":"Boolean indicating whether the patient is currently considered unsuitable for a procedure due to medical condition (medically inoperable)."} ;; "medically inoperable"
(declare-const patient_can_undergo_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo a surgical procedure (surgery).","when_to_set_to_false":"Set to false if the patient cannot currently undergo a surgical procedure (surgery).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a surgical procedure (surgery).","meaning":"Boolean indicating whether the patient can currently undergo a surgical procedure (surgery)."} ;; "surgery"
(declare-const patient_can_undergo_surgical_procedure_now@@not_preferred_management_option_in_judgement_of_thoracic_surgeon_and_lung_team Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo surgery and surgery is NOT considered the preferred management option in the judgement of the thoracic surgeon AND lung team.","when_to_set_to_false":"Set to false if the patient can currently undergo surgery and surgery IS considered the preferred management option in the judgement of the thoracic surgeon AND lung team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether surgery is NOT considered the preferred management option in the judgement of the thoracic surgeon AND lung team.","meaning":"Boolean indicating whether the patient can currently undergo surgery and surgery is NOT considered the preferred management option in the judgement of the thoracic surgeon AND lung team."} ;; "surgery is NOT considered the preferred management option in the judgement of the thoracic surgeon AND lung team"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable: potentially resectable disease
(assert
  (! (=> patient_has_diagnosis_of_disease_now@@potentially_resectable
         patient_has_diagnosis_of_disease_now)
     :named REQ2_AUXILIARY0)) ;; "potentially resectable disease" implies "disease"

;; Qualifier variable implies stem variable: surgery not preferred in judgement
(assert
  (! (=> patient_can_undergo_surgical_procedure_now@@not_preferred_management_option_in_judgement_of_thoracic_surgeon_and_lung_team
         patient_can_undergo_surgical_procedure_now)
     :named REQ2_AUXILIARY1)) ;; "surgery is NOT considered the preferred management option in the judgement of the thoracic surgeon AND lung team" implies "can undergo surgery"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If the patient has potentially resectable disease, then must be either medically inoperable OR (surgery is NOT considered the preferred management option in the judgement of the thoracic surgeon AND lung team)
(assert
  (! (or (not patient_has_diagnosis_of_disease_now@@potentially_resectable)
         (or patient_has_finding_of_patient_unsuitable_for_procedure_due_to_medical_condition_now
             patient_can_undergo_surgical_procedure_now@@not_preferred_management_option_in_judgement_of_thoracic_surgeon_and_lung_team))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has potentially resectable disease, the patient must ((be considered medically inoperable) OR (in the judgement of the thoracic surgeon AND lung team, surgery is NOT considered the preferred management option))"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_early_stage_lung_cancer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has early stage lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have early stage lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has early stage lung cancer.","meaning":"Boolean indicating whether the patient currently has early stage lung cancer."} ;; "if the patient has early stage lung cancer"
(declare-const patient_has_metastatic_disease_to_lungs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metastatic disease to the lungs.","when_to_set_to_false":"Set to false if the patient currently does not have metastatic disease to the lungs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metastatic disease to the lungs.","meaning":"Boolean indicating whether the patient currently has metastatic disease to the lungs."} ;; "if the patient has metastatic disease to lungs"
(declare-const patient_lesion_of_lung_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of lung lesions present in the patient now, as determined by imaging or clinical assessment.","when_to_set_to_null":"Set to null if the number of lung lesions present now cannot be determined or is not documented.","meaning":"Numeric count of lung lesions present in the patient now."} ;; "number of lung lesions present in the patient now"
(declare-const patient_lesion_of_lung_value_recorded_now_withunit_count@@parenchymal Bool) ;; {"when_to_set_to_true":"Set to true if the counted lung lesions are parenchymal.","when_to_set_to_false":"Set to false if the counted lung lesions are not parenchymal.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the lung lesions are parenchymal.","meaning":"Boolean indicating whether the counted lung lesions are parenchymal."} ;; "parenchymal lung lesions"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; The count variable with the parenchymal qualifier is only valid if the qualifier is true
(assert
  (! (=> patient_lesion_of_lung_value_recorded_now_withunit_count@@parenchymal
         (>= patient_lesion_of_lung_value_recorded_now_withunit_count 0))
     :named REQ3_AUXILIARY0)) ;; "parenchymal lung lesions" count is defined only if qualifier is true

;; ===================== Constraint Assertions (REQ 3) =====================
;; If the patient has early stage lung cancer, must have no more than three parenchymal lung lesions.
;; If the patient has metastatic disease to lungs, must have no more than five parenchymal lung lesions.
(assert
  (! (or
        (and patient_has_early_stage_lung_cancer_now
             patient_lesion_of_lung_value_recorded_now_withunit_count@@parenchymal
             (<= patient_lesion_of_lung_value_recorded_now_withunit_count 3))
        (and patient_has_metastatic_disease_to_lungs_now
             patient_lesion_of_lung_value_recorded_now_withunit_count@@parenchymal
             (<= patient_lesion_of_lung_value_recorded_now_withunit_count 5)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has early stage lung cancer, the patient must have no more than three parenchymal lung lesions OR if the patient has metastatic disease to lungs, the patient must have no more than five parenchymal lung lesions"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplasm (spread) of bronchopulmonary (hilar) lymph nodes.","when_to_set_to_false":"Set to false if the patient currently does not have secondary malignant neoplasm (spread) of bronchopulmonary (hilar) lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplasm (spread) of bronchopulmonary (hilar) lymph nodes.","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplasm of bronchopulmonary (hilar) lymph nodes."} ;; "hilar lymph node spread"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now@@no_clinico_radiological_evidence_of_spread Bool) ;; {"when_to_set_to_true":"Set to true if there is no clinico-radiological evidence of secondary malignant neoplasm (spread) of bronchopulmonary (hilar) lymph nodes.","when_to_set_to_false":"Set to false if there is clinico-radiological evidence of secondary malignant neoplasm (spread) of bronchopulmonary (hilar) lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is clinico-radiological evidence of secondary malignant neoplasm (spread) of bronchopulmonary (hilar) lymph nodes.","meaning":"Boolean indicating whether there is no clinico-radiological evidence of secondary malignant neoplasm of bronchopulmonary (hilar) lymph nodes."} ;; "no clinico-radiological evidence of hilar lymph node spread"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now@@considered_n0_on_clinico_radiological_grounds Bool) ;; {"when_to_set_to_true":"Set to true if the bronchopulmonary (hilar) lymph nodes are considered N0 on clinico-radiological grounds (i.e., no evidence of spread).","when_to_set_to_false":"Set to false if the bronchopulmonary (hilar) lymph nodes are not considered N0 on clinico-radiological grounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bronchopulmonary (hilar) lymph nodes are considered N0 on clinico-radiological grounds.","meaning":"Boolean indicating whether the bronchopulmonary (hilar) lymph nodes are considered N0 on clinico-radiological grounds."} ;; "hilar lymph nodes considered N0 on clinico-radiological grounds"

(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplasm (spread) of mediastinal lymph nodes.","when_to_set_to_false":"Set to false if the patient currently does not have secondary malignant neoplasm (spread) of mediastinal lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplasm (spread) of mediastinal lymph nodes.","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplasm of mediastinal lymph nodes."} ;; "mediastinal lymph node spread"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now@@no_clinico_radiological_evidence_of_spread Bool) ;; {"when_to_set_to_true":"Set to true if there is no clinico-radiological evidence of secondary malignant neoplasm (spread) of mediastinal lymph nodes.","when_to_set_to_false":"Set to false if there is clinico-radiological evidence of secondary malignant neoplasm (spread) of mediastinal lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is clinico-radiological evidence of secondary malignant neoplasm (spread) of mediastinal lymph nodes.","meaning":"Boolean indicating whether there is no clinico-radiological evidence of secondary malignant neoplasm of mediastinal lymph nodes."} ;; "no clinico-radiological evidence of mediastinal lymph node spread"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now@@considered_n0_on_clinico_radiological_grounds Bool) ;; {"when_to_set_to_true":"Set to true if the mediastinal lymph nodes are considered N0 on clinico-radiological grounds (i.e., no evidence of spread).","when_to_set_to_false":"Set to false if the mediastinal lymph nodes are not considered N0 on clinico-radiological grounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mediastinal lymph nodes are considered N0 on clinico-radiological grounds.","meaning":"Boolean indicating whether the mediastinal lymph nodes are considered N0 on clinico-radiological grounds."} ;; "mediastinal lymph nodes considered N0 on clinico-radiological grounds"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables (hilar)
(assert
  (! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now@@no_clinico_radiological_evidence_of_spread
         patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now)
     :named REQ4_AUXILIARY0)) ;; "no clinico-radiological evidence of hilar lymph node spread" implies hilar lymph node finding

(assert
  (! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now@@considered_n0_on_clinico_radiological_grounds
         patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now)
     :named REQ4_AUXILIARY1)) ;; "hilar lymph nodes considered N0" implies hilar lymph node finding

;; Qualifier variables imply corresponding stem variables (mediastinal)
(assert
  (! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now@@no_clinico_radiological_evidence_of_spread
         patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now)
     :named REQ4_AUXILIARY2)) ;; "no clinico-radiological evidence of mediastinal lymph node spread" implies mediastinal lymph node finding

(assert
  (! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now@@considered_n0_on_clinico_radiological_grounds
         patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now)
     :named REQ4_AUXILIARY3)) ;; "mediastinal lymph nodes considered N0" implies mediastinal lymph node finding

;; "considered N0 on clinico-radiological grounds" is equivalent to "no clinico-radiological evidence of spread" for both hilar and mediastinal nodes
(assert
  (! (= patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now@@considered_n0_on_clinico_radiological_grounds
        patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now@@no_clinico_radiological_evidence_of_spread)
     :named REQ4_AUXILIARY4)) ;; "considered N0" ≡ "no clinico-radiological evidence of spread" for hilar nodes

(assert
  (! (= patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now@@considered_n0_on_clinico_radiological_grounds
        patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now@@no_clinico_radiological_evidence_of_spread)
     :named REQ4_AUXILIARY5)) ;; "considered N0" ≡ "no clinico-radiological evidence of spread" for mediastinal nodes

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: If patient has early stage lung cancer, must have hilar lymph nodes considered N0 on clinico-radiological grounds
(assert
  (! (=> patient_has_early_stage_lung_cancer_now
         patient_has_finding_of_secondary_malignant_neoplasm_of_bronchopulmonary_lymph_nodes_now@@considered_n0_on_clinico_radiological_grounds)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has early stage primary non-small cell lung cancer, must have hilar lymph nodes considered N0 on clinico-radiological grounds"

;; Component 1: If patient has early stage lung cancer, must have mediastinal lymph nodes considered N0 on clinico-radiological grounds
(assert
  (! (=> patient_has_early_stage_lung_cancer_now
         patient_has_finding_of_secondary_malignant_neoplasm_of_mediastinal_lymph_nodes_now@@considered_n0_on_clinico_radiological_grounds)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if the patient has early stage primary non-small cell lung cancer, must have mediastinal lymph nodes considered N0 on clinico-radiological grounds"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const coexisting_malignancy_expected_prognosis_value_in_months Real) ;; {"when_to_set_to_value":"Set to the expected prognosis value in months for the patient's co-existing malignancy, as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the expected prognosis for the co-existing malignancy is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the expected prognosis in months for the patient's co-existing malignancy."}  ;; "the co-existing malignancy must have an expected prognosis better than the primary lung lesion"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignancy)."}  ;; "co-existing malignancy"
(declare-const primary_lung_lesion_expected_prognosis_value_in_months Real) ;; {"when_to_set_to_value":"Set to the expected prognosis value in months for the patient's primary non-small cell lung cancer lesion, as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the expected prognosis for the primary lung lesion is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the expected prognosis in months for the patient's primary non-small cell lung cancer lesion."}  ;; "expected prognosis for the primary lung lesion"
(declare-const patient_has_early_stage_lung_cancer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has early stage lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have early stage lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has early stage lung cancer.","meaning":"Boolean indicating whether the patient currently has early stage lung cancer."}  ;; "if the patient has early stage primary non-small cell lung cancer"

;; ===================== Constraint Assertions (REQ 5) =====================
;; If the patient has early stage primary non-small cell lung cancer AND a co-existing malignancy, the co-existing malignancy must have an expected prognosis better than the primary lung lesion.
(assert
  (! (or (not (and patient_has_early_stage_lung_cancer_now
                   patient_has_finding_of_malignant_neoplastic_disease_now))
         (> coexisting_malignancy_expected_prognosis_value_in_months
            primary_lung_lesion_expected_prognosis_value_in_months))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has early stage primary non-small cell lung cancer AND a co-existing malignancy, the co-existing malignancy must have an expected prognosis better than the primary lung lesion."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patients_pulmonary_function_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary (lung) function is currently within normal limits.","when_to_set_to_false":"Set to false if the patient's pulmonary (lung) function is currently not within normal limits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary (lung) function is currently within normal limits.","meaning":"Boolean indicating whether the patient's pulmonary (lung) function is currently normal."} ;; "lung function"
(declare-const patients_pulmonary_function_is_normal_now@@adequate_to_tolerate_planned_stereotactic_radiation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current normal pulmonary function is specifically adequate to tolerate the planned stereotactic radiation.","when_to_set_to_false":"Set to false if the patient's current normal pulmonary function is not adequate to tolerate the planned stereotactic radiation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current normal pulmonary function is adequate to tolerate the planned stereotactic radiation.","meaning":"Boolean indicating whether the patient's current normal pulmonary function is adequate for the planned stereotactic radiation."} ;; "adequate lung function to tolerate the planned stereotactic radiation"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patients_pulmonary_function_is_normal_now@@adequate_to_tolerate_planned_stereotactic_radiation
         patients_pulmonary_function_is_normal_now)
     :named REQ6_AUXILIARY0)) ;; "adequate lung function to tolerate the planned stereotactic radiation" implies "lung function is normal"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patients_pulmonary_function_is_normal_now@@adequate_to_tolerate_planned_stereotactic_radiation
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have adequate lung function to tolerate the planned stereotactic radiation."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_undergone_conventional_radiation_therapy_to_lung_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously undergone conventional radiation therapy to the lung.","when_to_set_to_false":"Set to false if the patient has not previously undergone conventional radiation therapy to the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously undergone conventional radiation therapy to the lung.","meaning":"Boolean indicating whether the patient has previously undergone conventional radiation therapy to the lung."} ;; "previous conventional radiation therapy to lung"
(declare-const patient_has_undergone_conventional_radiation_therapy_to_mediastinum_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously undergone conventional radiation therapy to the mediastinum.","when_to_set_to_false":"Set to false if the patient has not previously undergone conventional radiation therapy to the mediastinum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously undergone conventional radiation therapy to the mediastinum.","meaning":"Boolean indicating whether the patient has previously undergone conventional radiation therapy to the mediastinum."} ;; "previous conventional radiation therapy to mediastinum"
(declare-const patient_has_undergone_stereotactic_radiotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone stereotactic body radiation therapy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone stereotactic body radiation therapy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone stereotactic body radiation therapy.","meaning":"Boolean indicating whether the patient has ever undergone stereotactic body radiation therapy at any time in their history."} ;; "stereotactic body radiation therapy"
(declare-const stereotactic_body_radiation_therapy_expected_to_have_high_probability_of_impairing_lung_function Bool) ;; {"when_to_set_to_true":"Set to true if stereotactic body radiation therapy is expected to have a high probability of impairing lung function.","when_to_set_to_false":"Set to false if stereotactic body radiation therapy is not expected to have a high probability of impairing lung function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether stereotactic body radiation therapy is expected to have a high probability of impairing lung function.","meaning":"Boolean indicating whether stereotactic body radiation therapy is expected to have a high probability of impairing lung function."} ;; "stereotactic body radiation therapy must NOT be expected to have a high probability of impairing lung function"

;; ===================== Constraint Assertions (REQ 7) =====================
;; If the patient has had previous conventional radiation therapy to mediastinum OR previous conventional radiation therapy to lung, stereotactic body radiation therapy must NOT be expected to have a high probability of impairing lung function.
(assert
  (! (or (not (or patient_has_undergone_conventional_radiation_therapy_to_mediastinum_in_the_past
                  patient_has_undergone_conventional_radiation_therapy_to_lung_in_the_past))
         (not stereotactic_body_radiation_therapy_expected_to_have_high_probability_of_impairing_lung_function))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has had previous conventional radiation therapy to mediastinum OR previous conventional radiation therapy to lung, stereotactic body radiation therapy must NOT be expected to have a high probability of impairing lung function."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "at least 18 years of age"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be at least 18 years of age."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const zubrod_performance_status_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's Zubrod performance status as recorded now.","when_to_set_to_null":"Set to null if the Zubrod performance status value is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the patient's Zubrod performance status value as recorded now, expressed as an integer."} ;; "Zubrod performance status between 0 and 3 (inclusive)"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (and (>= zubrod_performance_status_value_recorded_now_withunit_integer 0)
          (<= zubrod_performance_status_value_recorded_now_withunit_integer 3))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have Zubrod performance status between 0 and 3 (inclusive)."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (i.e., has childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently not capable of becoming pregnant (i.e., does not have childbearing potential).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has childbearing potential.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "woman of child bearing potential"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "male participant"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any contraceptive method.","when_to_set_to_false":"Set to false if the patient is currently not using any contraceptive method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any contraceptive method.","meaning":"Boolean indicating whether the patient is currently using any contraceptive method."} ;; "contraceptive method"
(declare-const patient_has_finding_of_contraception_now@@contraceptive_method_is_effective Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a contraceptive method and the method is effective.","when_to_set_to_false":"Set to false if the patient is currently using a contraceptive method but the method is not effective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraceptive method used is effective.","meaning":"Boolean indicating whether the contraceptive method currently used by the patient is effective."} ;; "effective contraceptive method"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable for effective contraception implies contraception
(assert
  (! (=> patient_has_finding_of_contraception_now@@contraceptive_method_is_effective
         patient_has_finding_of_contraception_now)
     :named REQ10_AUXILIARY0)) ;; "contraceptive method is effective" implies "contraceptive method"

;; ===================== Constraint Assertions (REQ 10) =====================
;; If the patient is a woman of child bearing potential OR the patient is a male participant, the patient must use an effective contraceptive method.
(assert
  (! (=> (or patient_has_childbearing_potential_now
             patient_sex_is_male_now)
         patient_has_finding_of_contraception_now@@contraceptive_method_is_effective)
     :named REQ10_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman of child bearing potential OR the patient is a male participant, the patient must use an effective contraceptive method."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_is_willing_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently not willing to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to give informed consent.","meaning":"Boolean indicating whether the patient is currently willing to give informed consent."} ;; "the patient must be willing to give informed consent"
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} ;; "the patient must be able to give informed consent"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 0: The patient must be willing to give informed consent.
(assert
  (! patient_is_willing_to_give_informed_consent_now
     :named REQ11_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to give informed consent"

;; Component 1: The patient must be able to give informed consent.
(assert
  (! patient_is_able_to_give_informed_consent_now
     :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must be able to give informed consent"
