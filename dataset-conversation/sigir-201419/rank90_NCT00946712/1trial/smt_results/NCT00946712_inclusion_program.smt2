;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_diagnosis_of_non_small_cell_lung_cancer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-small cell lung cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-small cell lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-small cell lung cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-small cell lung cancer."} // "non-small cell lung cancer"
(declare-const patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@histologically_proven Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of non-small cell lung cancer is histologically proven.","when_to_set_to_false":"Set to false if the patient's diagnosis of non-small cell lung cancer is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the patient's diagnosis of non-small cell lung cancer is histologically proven."} // "histologically proven"
(declare-const patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@primary Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of non-small cell lung cancer is primary.","when_to_set_to_false":"Set to false if the patient's diagnosis of non-small cell lung cancer is not primary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cancer is primary.","meaning":"Boolean indicating whether the patient's diagnosis of non-small cell lung cancer is primary."} // "primary"
(declare-const patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@cytologically_proven Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of non-small cell lung cancer is cytologically proven.","when_to_set_to_false":"Set to false if the patient's diagnosis of non-small cell lung cancer is not cytologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is cytologically proven.","meaning":"Boolean indicating whether the patient's diagnosis of non-small cell lung cancer is cytologically proven."} // "cytologically proven"
(declare-const patient_has_finding_of_clinical_stage_4_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical stage IV disease.","when_to_set_to_false":"Set to false if the patient currently does not have clinical stage IV disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical stage IV disease.","meaning":"Boolean indicating whether the patient currently has clinical stage IV disease."} // "stage IV disease"
(declare-const patient_has_finding_of_newly_diagnosed_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has newly diagnosed disease.","when_to_set_to_false":"Set to false if the patient currently does not have newly diagnosed disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has newly diagnosed disease.","meaning":"Boolean indicating whether the patient currently has newly diagnosed disease."} // "newly diagnosed disease"
(declare-const patient_has_finding_of_recurrent_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has recurrent disease.","when_to_set_to_false":"Set to false if the patient currently does not have recurrent disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has recurrent disease.","meaning":"Boolean indicating whether the patient currently has recurrent disease."} // "recurrent disease"
(declare-const patient_has_finding_of_recurrent_disease_now@@after_previous_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's recurrent disease occurred after previous surgery.","when_to_set_to_false":"Set to false if the patient's recurrent disease did not occur after previous surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the recurrence occurred after previous surgery.","meaning":"Boolean indicating whether the patient's recurrent disease occurred after previous surgery."} // "recurrent disease after previous surgery"
(declare-const patient_has_finding_of_recurrent_disease_now@@after_previous_irradiation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's recurrent disease occurred after previous irradiation.","when_to_set_to_false":"Set to false if the patient's recurrent disease did not occur after previous irradiation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the recurrence occurred after previous irradiation.","meaning":"Boolean indicating whether the patient's recurrent disease occurred after previous irradiation."} // "recurrent disease after previous irradiation"
(declare-const patient_has_finding_of_finding_of_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lesions.","when_to_set_to_false":"Set to false if the patient currently does not have lesions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lesions.","meaning":"Boolean indicating whether the patient currently has lesions."} // "lesions"
(declare-const patient_has_finding_of_finding_of_lesion_now@@located_in_an_ipsilateral_non_primary_lobe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lesions are located in an ipsilateral non-primary lobe.","when_to_set_to_false":"Set to false if the patient's lesions are not located in an ipsilateral non-primary lobe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesions are located in an ipsilateral non-primary lobe.","meaning":"Boolean indicating whether the patient's lesions are located in an ipsilateral non-primary lobe."} // "lesions in an ipsilateral non-primary lobe"
(declare-const patient_has_finding_of_m1a_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has M1a disease.","when_to_set_to_false":"Set to false if the patient currently does not have M1a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has M1a disease.","meaning":"Boolean indicating whether the patient currently has M1a disease."} // "M1a disease"
(declare-const patient_has_finding_of_m1b_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has M1b disease.","when_to_set_to_false":"Set to false if the patient currently does not have M1b disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has M1b disease.","meaning":"Boolean indicating whether the patient currently has M1b disease."} // "M1b disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@histologically_proven
         patient_has_diagnosis_of_non_small_cell_lung_cancer_now)
     :named REQ0_AUXILIARY0)) ;; "histologically proven primary non-small cell lung cancer"
(assert
  (! (=> patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@cytologically_proven
         patient_has_diagnosis_of_non_small_cell_lung_cancer_now)
     :named REQ0_AUXILIARY1)) ;; "cytologically proven primary non-small cell lung cancer"
(assert
  (! (=> patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@primary
         patient_has_diagnosis_of_non_small_cell_lung_cancer_now)
     :named REQ0_AUXILIARY2)) ;; "primary non-small cell lung cancer"
(assert
  (! (=> patient_has_finding_of_finding_of_lesion_now@@located_in_an_ipsilateral_non_primary_lobe
         patient_has_finding_of_finding_of_lesion_now)
     :named REQ0_AUXILIARY3)) ;; "lesions in an ipsilateral non-primary lobe"
(assert
  (! (=> patient_has_finding_of_recurrent_disease_now@@after_previous_surgery
         patient_has_finding_of_recurrent_disease_now)
     :named REQ0_AUXILIARY4)) ;; "recurrent disease after previous surgery"
(assert
  (! (=> patient_has_finding_of_recurrent_disease_now@@after_previous_irradiation
         patient_has_finding_of_recurrent_disease_now)
     :named REQ0_AUXILIARY5)) ;; "recurrent disease after previous irradiation"

;; Non-exhaustive examples for cytologically proven NSCLC (umbrella mapping)
;; The requirement lists adenocarcinoma, large cell carcinoma, squamous cell carcinoma, unspecified carcinoma as non-exhaustive examples of cytologically proven NSCLC.
(declare-const patient_has_diagnosis_of_adenocarcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of adenocarcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of adenocarcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of adenocarcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of adenocarcinoma."} // "adenocarcinoma"
(declare-const patient_has_diagnosis_of_large_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of large cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of large cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of large cell carcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of large cell carcinoma."} // "large cell carcinoma"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of squamous cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of squamous cell carcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of squamous cell carcinoma."} // "squamous cell carcinoma"
(declare-const patient_has_diagnosis_of_unspecified_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of unspecified carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of unspecified carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of unspecified carcinoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of unspecified carcinoma."} // "unspecified carcinoma"

(assert
  (! (=> (or patient_has_diagnosis_of_adenocarcinoma_now
             patient_has_diagnosis_of_large_cell_carcinoma_now
             patient_has_diagnosis_of_squamous_cell_carcinoma_now
             patient_has_diagnosis_of_unspecified_carcinoma_now)
         patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@cytologically_proven)
     :named REQ0_AUXILIARY6)) ;; "cytologically proven NSCLC (non-exhaustive examples: adenocarcinoma, large cell carcinoma, squamous cell carcinoma, unspecified carcinoma)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((histologically proven primary NSCLC) OR (cytologically proven primary NSCLC)) must be true
(assert
  (! (or (and patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@histologically_proven
              patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@primary)
         (and patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@cytologically_proven
              patient_has_diagnosis_of_non_small_cell_lung_cancer_now@@primary))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have histologically proven primary non-small cell lung cancer) OR (have cytologically proven primary non-small cell lung cancer))"

;; Component 1: must have stage IV disease
(assert
  (! patient_has_finding_of_clinical_stage_4_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have stage IV disease"

;; Component 2: must have newly diagnosed disease OR recurrent disease after previous surgery OR recurrent disease after previous irradiation
(assert
  (! (or patient_has_finding_of_newly_diagnosed_disease_now
         patient_has_finding_of_recurrent_disease_now@@after_previous_surgery
         patient_has_finding_of_recurrent_disease_now@@after_previous_irradiation)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have newly diagnosed disease) OR (have recurrent disease after previous surgery) OR (have recurrent disease after previous irradiation))"

;; Component 3: must NOT ((have additional lesions in an ipsilateral non-primary lobe) AND (NOT have M1a disease) AND (NOT have M1b disease))
(assert
  (! (not (and patient_has_finding_of_finding_of_lesion_now@@located_in_an_ipsilateral_non_primary_lobe
               (not patient_has_finding_of_m1a_disease_now)
               (not patient_has_finding_of_m1b_disease_now)))
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "NOT ((have additional lesions in an ipsilateral non-primary lobe) AND (NOT have M1a disease) AND (NOT have M1b disease))"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_computerized_axial_tomography_of_brain_inthepast42days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a computed tomography scan of the brain within the past 42 days.","when_to_set_to_false":"Set to false if the patient has not undergone a computed tomography scan of the brain within the past 42 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a computed tomography scan of the brain within the past 42 days.","meaning":"Boolean indicating whether the patient has undergone a computed tomography scan of the brain within the past 42 days."} // "computed tomography scan of the brain within 42 days prior to registration"
(declare-const patient_has_undergone_mri_of_brain_and_brain_stem_inthepast42days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a magnetic resonance imaging scan of the brain within the past 42 days.","when_to_set_to_false":"Set to false if the patient has not undergone a magnetic resonance imaging scan of the brain within the past 42 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a magnetic resonance imaging scan of the brain within the past 42 days.","meaning":"Boolean indicating whether the patient has undergone a magnetic resonance imaging scan of the brain within the past 42 days."} // "magnetic resonance imaging scan of the brain within 42 days prior to registration"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of brain metastases.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of brain metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of brain metastases.","meaning":"Boolean indicating whether the patient currently has a diagnosis of brain metastases."} // "brain metastases"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current brain metastases have been treated.","when_to_set_to_false":"Set to false if the patient's current brain metastases have not been treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current brain metastases have been treated.","meaning":"Boolean indicating whether the patient's current brain metastases have been treated."} // "brain metastases that have been treated"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now@@controlled_for_at_least_14_days_following_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current brain metastases have remained controlled for at least 14 days following treatment.","when_to_set_to_false":"Set to false if the patient's current brain metastases have not remained controlled for at least 14 days following treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current brain metastases have remained controlled for at least 14 days following treatment.","meaning":"Boolean indicating whether the patient's current brain metastases have remained controlled for at least 14 days following treatment."} // "brain metastases that have remained controlled for at least 14 days following treatment"
(declare-const patient_has_finding_of_neurological_deficit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has neurological dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have neurological dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neurological dysfunction.","meaning":"Boolean indicating whether the patient currently has neurological dysfunction."} // "neurological dysfunction"
(declare-const patient_has_finding_of_neurological_deficit_now@@absent_for_at_least_1_day_off_corticosteroid_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neurological dysfunction has been absent for at least 1 day off corticosteroid therapy.","when_to_set_to_false":"Set to false if the patient's neurological dysfunction has not been absent for at least 1 day off corticosteroid therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neurological dysfunction has been absent for at least 1 day off corticosteroid therapy.","meaning":"Boolean indicating whether the patient's neurological dysfunction has been absent for at least 1 day off corticosteroid therapy."} // "no residual neurological dysfunction off corticosteroid therapy for at least 1 day"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now@@treated
         patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now)
     :named REQ1_AUXILIARY0)) ;; "brain metastases that have been treated" implies "brain metastases"

(assert
  (! (=> patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now@@controlled_for_at_least_14_days_following_treatment
         patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now)
     :named REQ1_AUXILIARY1)) ;; "brain metastases controlled for at least 14 days" implies "brain metastases"

(assert
  (! (=> patient_has_finding_of_neurological_deficit_now@@absent_for_at_least_1_day_off_corticosteroid_therapy
         (not patient_has_finding_of_neurological_deficit_now))
     :named REQ1_AUXILIARY2)) ;; "no residual neurological dysfunction off corticosteroid therapy for at least 1 day" implies absence of neurological dysfunction

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have CT or MRI of brain within 42 days prior to registration
(assert
  (! (or patient_has_undergone_computerized_axial_tomography_of_brain_inthepast42days
         patient_has_undergone_mri_of_brain_and_brain_stem_inthepast42days)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have a computed tomography scan of the brain OR have a magnetic resonance imaging scan of the brain to evaluate for central nervous system disease within 42 days prior to registration"

;; Component 1: Must NOT have brain metastases OR (if present, must be treated AND controlled for at least 14 days AND no residual neurological dysfunction off corticosteroid therapy for at least 1 day)
(assert
  (! (or (not patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now)
         (and patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now@@treated
              patient_has_diagnosis_of_secondary_malignant_neoplasm_of_brain_now@@controlled_for_at_least_14_days_following_treatment
              patient_has_finding_of_neurological_deficit_now@@absent_for_at_least_1_day_off_corticosteroid_therapy))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have brain metastases OR ((have brain metastases that have been treated AND have remained controlled for at least 14 days following treatment) AND (have no residual neurological dysfunction off corticosteroid therapy for at least 1 day))"

;; ===================== Declarations for the inclusion criteria (REQ 2) =====================
(declare-const patient_has_measurable_disease_documented_by_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient has measurable disease documented by computed tomography scan.","when_to_set_to_false":"Set to false if the patient does not have measurable disease documented by computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has measurable disease documented by computed tomography scan.","meaning":"Boolean indicating whether the patient has measurable disease documented by computed tomography scan."} // "measurable disease documented by computed tomography scan"
(declare-const patient_has_measurable_disease_documented_by_magnetic_resonance_imaging_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient has measurable disease documented by magnetic resonance imaging scan.","when_to_set_to_false":"Set to false if the patient does not have measurable disease documented by magnetic resonance imaging scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has measurable disease documented by magnetic resonance imaging scan.","meaning":"Boolean indicating whether the patient has measurable disease documented by magnetic resonance imaging scan."} // "measurable disease documented by magnetic resonance imaging scan"
(declare-const measurable_disease_assessed_within_28_days_prior_to_registration Bool) ;; {"when_to_set_to_true":"Set to true if measurable disease was assessed within 28 days prior to registration.","when_to_set_to_false":"Set to false if measurable disease was not assessed within 28 days prior to registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether measurable disease was assessed within 28 days prior to registration.","meaning":"Boolean indicating whether measurable disease was assessed within 28 days prior to registration."} // "measurable disease must be assessed within 28 days prior to registration"
(declare-const patient_has_non_measurable_disease_documented_by_computed_tomography_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient has non-measurable disease documented by computed tomography scan.","when_to_set_to_false":"Set to false if the patient does not have non-measurable disease documented by computed tomography scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has non-measurable disease documented by computed tomography scan.","meaning":"Boolean indicating whether the patient has non-measurable disease documented by computed tomography scan."} // "non-measurable disease documented by computed tomography scan"
(declare-const patient_has_non_measurable_disease_documented_by_magnetic_resonance_imaging_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient has non-measurable disease documented by magnetic resonance imaging scan.","when_to_set_to_false":"Set to false if the patient does not have non-measurable disease documented by magnetic resonance imaging scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has non-measurable disease documented by magnetic resonance imaging scan.","meaning":"Boolean indicating whether the patient has non-measurable disease documented by magnetic resonance imaging scan."} // "non-measurable disease documented by magnetic resonance imaging scan"
(declare-const non_measurable_disease_assessed_within_42_days_prior_to_registration Bool) ;; {"when_to_set_to_true":"Set to true if non-measurable disease was assessed within 42 days prior to registration.","when_to_set_to_false":"Set to false if non-measurable disease was not assessed within 42 days prior to registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether non-measurable disease was assessed within 42 days prior to registration.","meaning":"Boolean indicating whether non-measurable disease was assessed within 42 days prior to registration."} // "non-measurable disease must be assessed within 42 days prior to registration"
(declare-const computed_tomography_scan_from_combined_pet_ct_used_to_document_non_measurable_disease Bool) ;; {"when_to_set_to_true":"Set to true if a computed tomography scan from a combined positron emission tomography/computed tomography scan was used to document non-measurable disease.","when_to_set_to_false":"Set to false if a computed tomography scan from a combined positron emission tomography/computed tomography scan was not used to document non-measurable disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a computed tomography scan from a combined positron emission tomography/computed tomography scan was used to document non-measurable disease.","meaning":"Boolean indicating whether a computed tomography scan from a combined positron emission tomography/computed tomography scan was used to document non-measurable disease."} // "computed tomography scan from a combined PET/CT used to document non-measurable disease"
(declare-const computed_tomography_scan_from_combined_pet_ct_used_to_document_non_measurable_disease@@scan_of_diagnostic_quality Bool) ;; {"when_to_set_to_true":"Set to true if the computed tomography scan from a combined PET/CT scan used to document non-measurable disease is of diagnostic quality.","when_to_set_to_false":"Set to false if the computed tomography scan from a combined PET/CT scan used to document non-measurable disease is not of diagnostic quality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the computed tomography scan from a combined PET/CT scan used to document non-measurable disease is of diagnostic quality.","meaning":"Boolean indicating whether the computed tomography scan from a combined PET/CT scan used to document non-measurable disease is of diagnostic quality."} // "scan is of diagnostic quality"
(declare-const pleural_effusion_as_only_evidence_of_disease Bool) ;; {"when_to_set_to_true":"Set to true if pleural effusion is the only evidence of disease.","when_to_set_to_false":"Set to false if pleural effusion is not the only evidence of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether pleural effusion is the only evidence of disease.","meaning":"Boolean indicating whether pleural effusion is the only evidence of disease."} // "pleural effusion as only evidence of disease"
(declare-const ascites_as_only_evidence_of_disease Bool) ;; {"when_to_set_to_true":"Set to true if ascites is the only evidence of disease.","when_to_set_to_false":"Set to false if ascites is not the only evidence of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ascites is the only evidence of disease.","meaning":"Boolean indicating whether ascites is the only evidence of disease."} // "ascites as only evidence of disease"
(declare-const abnormal_laboratory_parameters_as_only_evidence_of_disease Bool) ;; {"when_to_set_to_true":"Set to true if abnormal laboratory parameters are the only evidence of disease.","when_to_set_to_false":"Set to false if abnormal laboratory parameters are not the only evidence of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether abnormal laboratory parameters are the only evidence of disease.","meaning":"Boolean indicating whether abnormal laboratory parameters are the only evidence of disease."} // "abnormal laboratory parameters as only evidence of disease"
(declare-const all_disease_assessed_and_documented_on_baseline_tumor_assessment_form Bool) ;; {"when_to_set_to_true":"Set to true if all disease has been assessed and documented on the Baseline Tumor Assessment Form.","when_to_set_to_false":"Set to false if all disease has not been assessed and documented on the Baseline Tumor Assessment Form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether all disease has been assessed and documented on the Baseline Tumor Assessment Form.","meaning":"Boolean indicating whether all disease has been assessed and documented on the Baseline Tumor Assessment Form."} // "all disease must be assessed and documented on the Baseline Tumor Assessment Form"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; If scan is of diagnostic quality, it may be used to document measurable disease
(assert
  (! (=> computed_tomography_scan_from_combined_pet_ct_used_to_document_non_measurable_disease@@scan_of_diagnostic_quality
         computed_tomography_scan_from_combined_pet_ct_used_to_document_non_measurable_disease)
     :named REQ2_AUXILIARY0)) ;; "if a computed tomography scan from a combined PET/CT scan is used, it may be used to document only non-measurable disease unless the scan is of diagnostic quality"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: (((measurable disease documented by CT or MRI) AND assessed within 28 days) OR ((non-measurable disease documented by CT or MRI) AND assessed within 42 days))
(assert
  (! (or
        (and
          (or patient_has_measurable_disease_documented_by_computed_tomography_scan
              patient_has_measurable_disease_documented_by_magnetic_resonance_imaging_scan)
          measurable_disease_assessed_within_28_days_prior_to_registration)
        (and
          (or patient_has_non_measurable_disease_documented_by_computed_tomography_scan
              patient_has_non_measurable_disease_documented_by_magnetic_resonance_imaging_scan)
          non_measurable_disease_assessed_within_42_days_prior_to_registration))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "measurable or non-measurable disease documented by CT or MRI, with assessment within time window"

;; Component 1: If a CT scan from combined PET/CT is used, it may be used to document only non-measurable disease unless scan is of diagnostic quality
(assert
  (! (or
        (not computed_tomography_scan_from_combined_pet_ct_used_to_document_non_measurable_disease)
        computed_tomography_scan_from_combined_pet_ct_used_to_document_non_measurable_disease@@scan_of_diagnostic_quality)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "CT from PET/CT may be used to document only non-measurable disease unless scan is of diagnostic quality"

;; Component 2: NOT (pleural effusion OR ascites OR abnormal laboratory parameters) as the only evidence of disease
(assert
  (! (not (or pleural_effusion_as_only_evidence_of_disease
              ascites_as_only_evidence_of_disease
              abnormal_laboratory_parameters_as_only_evidence_of_disease))
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "pleural effusion OR ascites OR abnormal laboratory parameters as the only evidence of disease is NOT allowed"

;; Component 3: all disease must be assessed and documented on the Baseline Tumor Assessment Form
(assert
  (! all_disease_assessed_and_documented_on_baseline_tumor_assessment_form
     :named REQ2_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "all disease must be assessed and documented on the Baseline Tumor Assessment Form"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_human_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human tissue available (i.e., tumor tissue available for submission).","when_to_set_to_false":"Set to false if the patient does not currently have human tissue available for submission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human tissue available for submission.","meaning":"Boolean indicating whether the patient currently has human tissue available for submission."} // "have tumor tissue available for submission"
(declare-const patient_is_exposed_to_human_tissue_now@@sufficient_for_egfr_fish_testing Bool) ;; {"when_to_set_to_true":"Set to true if the available human tissue is sufficient for EGFR FISH testing.","when_to_set_to_false":"Set to false if the available human tissue is not sufficient for EGFR FISH testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the available human tissue is sufficient for EGFR FISH testing.","meaning":"Boolean indicating whether the available human tissue is sufficient for EGFR FISH testing."} // "sufficient for epidermal growth factor receptor fluorescence in situ hybridization testing"
(declare-const patient_agrees_to_submission_of_tumor_tissue_specimens Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to the submission of tumor tissue specimens.","when_to_set_to_false":"Set to false if the patient does not agree to the submission of tumor tissue specimens.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to the submission of tumor tissue specimens.","meaning":"Boolean indicating whether the patient agrees to the submission of tumor tissue specimens."} // "agree to submission of these specimens"
(declare-const patient_agrees_to_submission_of_specimens_for_other_translational_medicine_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to the submission of specimens for other translational medicine studies.","when_to_set_to_false":"Set to false if the patient does not agree to the submission of specimens for other translational medicine studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to the submission of specimens for other translational medicine studies.","meaning":"Boolean indicating whether the patient agrees to the submission of specimens for other translational medicine studies."} // "agree to submission of specimens for other translational medicine studies"
(declare-const patient_is_offered_participation_in_banking_for_future_research Bool) ;; {"when_to_set_to_true":"Set to true if the patient is offered participation in banking for future research.","when_to_set_to_false":"Set to false if the patient is not offered participation in banking for future research.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is offered participation in banking for future research.","meaning":"Boolean indicating whether the patient is offered participation in banking for future research."} // "be offered participation in banking for future research"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_human_tissue_now@@sufficient_for_egfr_fish_testing
         patient_is_exposed_to_human_tissue_now)
     :named REQ3_AUXILIARY0)) ;; "sufficient for EGFR FISH testing" implies "tumor tissue available for submission"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have tumor tissue available for submission that is sufficient for EGFR FISH testing AND agree to submission of these specimens
(assert
  (! (and patient_is_exposed_to_human_tissue_now@@sufficient_for_egfr_fish_testing
          patient_agrees_to_submission_of_tumor_tissue_specimens)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have tumor tissue available for submission that is sufficient for EGFR FISH testing AND agree to submission of these specimens"

;; Component 1: Must agree to submission of specimens for other translational medicine studies
(assert
  (! patient_agrees_to_submission_of_specimens_for_other_translational_medicine_studies
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "agree to submission of specimens for other translational medicine studies"

;; Component 2: Must be offered participation in banking for future research
(assert
  (! patient_is_offered_participation_in_banking_for_future_research
     :named REQ3_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be offered participation in banking for future research"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy at any time in the past."} // "chemotherapy"
(declare-const patient_has_undergone_chemotherapy_inthehistory@@for_any_stage_of_non_small_cell_lung_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chemotherapy was for any stage of non-small cell lung cancer.","when_to_set_to_false":"Set to false if the patient's chemotherapy was not for any stage of non-small cell lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy was for any stage of non-small cell lung cancer.","meaning":"Boolean indicating whether the patient's chemotherapy was for any stage of non-small cell lung cancer."} // "prior chemotherapy for any stage of non-small cell lung cancer"
(declare-const patient_has_undergone_chemotherapy_inthehistory@@platinum_based Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chemotherapy was platinum-based.","when_to_set_to_false":"Set to false if the patient's chemotherapy was not platinum-based.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy was platinum-based.","meaning":"Boolean indicating whether the patient's chemotherapy was platinum-based."} // "prior platinum-based chemotherapy for any purpose"
(declare-const patient_has_undergone_cetuximab_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone cetuximab therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone cetuximab therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone cetuximab therapy.","meaning":"Boolean indicating whether the patient has ever undergone cetuximab therapy at any time in the past."} // "cetuximab therapy"
(declare-const patient_has_undergone_gefitinib_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone gefitinib therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone gefitinib therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone gefitinib therapy.","meaning":"Boolean indicating whether the patient has ever undergone gefitinib therapy at any time in the past."} // "gefitinib therapy"
(declare-const patient_has_undergone_erlotinib_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone erlotinib therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone erlotinib therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone erlotinib therapy.","meaning":"Boolean indicating whether the patient has ever undergone erlotinib therapy at any time in the past."} // "erlotinib therapy"
(declare-const patient_has_undergone_investigational_agent_therapy_inthehistory@@targets_egfr_pathway Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone investigational agent therapy at any time in the past and the therapy targets the epidermal growth factor receptor pathway.","when_to_set_to_false":"Set to false if the patient has never undergone investigational agent therapy at any time in the past that targets the epidermal growth factor receptor pathway.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone investigational agent therapy that targets the epidermal growth factor receptor pathway.","meaning":"Boolean indicating whether the patient has ever undergone investigational agent therapy at any time in the past, and the investigational agent therapy targets the epidermal growth factor receptor pathway."} // "other investigational agent therapy that targets the epidermal growth factor receptor pathway"
(declare-const patient_has_undergone_bevacizumab_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone bevacizumab therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone bevacizumab therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone bevacizumab therapy.","meaning":"Boolean indicating whether the patient has ever undergone bevacizumab therapy at any time in the past."} // "bevacizumab therapy"
(declare-const patient_has_undergone_vegf_related_agent_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone vascular endothelial growth factor-related agent therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone vascular endothelial growth factor-related agent therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone vascular endothelial growth factor-related agent therapy.","meaning":"Boolean indicating whether the patient has ever undergone vascular endothelial growth factor-related agent therapy at any time in the past."} // "other vascular endothelial growth factor-related agent therapy"
(declare-const patient_has_undergone_chimerized_monoclonal_antibody_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chimerized monoclonal antibody therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone chimerized monoclonal antibody therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chimerized monoclonal antibody therapy.","meaning":"Boolean indicating whether the patient has ever undergone chimerized monoclonal antibody therapy at any time in the past."} // "chimerized monoclonal antibody therapy"
(declare-const patient_has_undergone_murine_monoclonal_antibody_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone murine monoclonal antibody therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone murine monoclonal antibody therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone murine monoclonal antibody therapy.","meaning":"Boolean indicating whether the patient has ever undergone murine monoclonal antibody therapy at any time in the past."} // "murine monoclonal antibody therapy"
(declare-const patient_is_exposed_to_human_anti_mouse_antibody_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently or has ever been exposed to human anti-mouse antibody at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to human anti-mouse antibody at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to human anti-mouse antibody.","meaning":"Boolean indicating whether the patient is currently or has ever been exposed to human anti-mouse antibody at any time in the past."} // "human anti-mouse antibody"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: NOT (have received prior chemotherapy for any stage of non-small cell lung cancer)
(assert
  (! (not patient_has_undergone_chemotherapy_inthehistory@@for_any_stage_of_non_small_cell_lung_cancer)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT have received prior chemotherapy for any stage of non-small cell lung cancer"

;; Component 1: NOT (have received prior platinum-based chemotherapy for any purpose)
(assert
  (! (not patient_has_undergone_chemotherapy_inthehistory@@platinum_based)
     :named REQ4_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT have received prior platinum-based chemotherapy for any purpose"

;; Component 2: NOT (have received any cetuximab therapy OR gefitinib therapy OR erlotinib therapy OR other investigational agent therapy that targets the epidermal growth factor receptor pathway)
(assert
  (! (not (or patient_has_undergone_cetuximab_therapy_inthehistory
              patient_has_undergone_gefitinib_therapy_inthehistory
              patient_has_undergone_erlotinib_therapy_inthehistory
              patient_has_undergone_investigational_agent_therapy_inthehistory@@targets_egfr_pathway))
     :named REQ4_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT have received any cetuximab therapy OR gefitinib therapy OR erlotinib therapy OR other investigational agent therapy that targets the epidermal growth factor receptor pathway"

;; Component 3: NOT (have received prior bevacizumab therapy OR other vascular endothelial growth factor-related agent therapy for any purpose)
(assert
  (! (not (or patient_has_undergone_bevacizumab_therapy_inthehistory
              patient_has_undergone_vegf_related_agent_therapy_inthehistory))
     :named REQ4_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT have received prior bevacizumab therapy OR other vascular endothelial growth factor-related agent therapy for any purpose"

;; Component 4: NOT (have received prior chimerized monoclonal antibody therapy OR prior murine monoclonal antibody therapy for any purpose OR have documented presence of human anti-mouse antibody)
(assert
  (! (not (or patient_has_undergone_chimerized_monoclonal_antibody_therapy_inthehistory
              patient_has_undergone_murine_monoclonal_antibody_therapy_inthehistory
              patient_is_exposed_to_human_anti_mouse_antibody_inthehistory))
     :named REQ4_COMPONENT4_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT have received prior chimerized monoclonal antibody therapy OR prior murine monoclonal antibody therapy for any purpose OR have documented presence of human anti-mouse antibody"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_history_of_radiation_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had prior radiation therapy at any time before registration.","when_to_set_to_false":"Set to false if the patient has never had prior radiation therapy before registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had prior radiation therapy before registration.","meaning":"Boolean indicating whether the patient has had prior radiation therapy at any time before registration."} // "may have had prior radiation therapy"
(declare-const patient_has_recovered_from_all_radiation_therapy_associated_toxicities_at_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recovered from all toxicities associated with prior radiation therapy at the time of registration.","when_to_set_to_false":"Set to false if the patient has not recovered from all toxicities associated with prior radiation therapy at the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recovered from all toxicities associated with prior radiation therapy at the time of registration.","meaning":"Boolean indicating whether the patient has recovered from all toxicities associated with prior radiation therapy at the time of registration."} // "must have recovered from all associated toxicities at the time of registration"
(declare-const measurable_disease_has_progressed_since_radiation_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's measurable disease has progressed since receiving radiation therapy.","when_to_set_to_false":"Set to false if the patient's measurable disease has not progressed since receiving radiation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's measurable disease has progressed since receiving radiation therapy.","meaning":"Boolean indicating whether the patient's measurable disease has progressed since receiving radiation therapy."} // "measurable disease must have progressed"
(declare-const measurable_disease_is_within_previous_radiation_field Bool) ;; {"when_to_set_to_true":"Set to true if the patient's measurable disease is located within the previous radiation field.","when_to_set_to_false":"Set to false if the patient's measurable disease is not located within the previous radiation field.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's measurable disease is located within the previous radiation field.","meaning":"Boolean indicating whether the patient's measurable disease is located within the previous radiation field."} // "measurable disease must be outside the previous radiation field"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: measurable disease present if documented by CT or MRI
(assert
  (! (= (or patient_has_measurable_disease_documented_by_computed_tomography_scan
            patient_has_measurable_disease_documented_by_magnetic_resonance_imaging_scan)
        (or patient_has_measurable_disease_documented_by_computed_tomography_scan
            patient_has_measurable_disease_documented_by_magnetic_resonance_imaging_scan))
     :named REQ5_AUXILIARY0)) ;; "if measurable disease is present"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Must have recovered from all associated toxicities at registration (prior radiation therapy allowed)
(assert
  (! patient_has_recovered_from_all_radiation_therapy_associated_toxicities_at_registration
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have recovered from all associated toxicities at the time of registration"

;; Component 1: If measurable disease is present, it must be outside previous radiation field OR must have progressed
(assert
  (! (or (not (or patient_has_measurable_disease_documented_by_computed_tomography_scan
                  patient_has_measurable_disease_documented_by_magnetic_resonance_imaging_scan))
         (or (not measurable_disease_is_within_previous_radiation_field)
             measurable_disease_has_progressed_since_radiation_therapy))
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "if measurable disease is present, measurable disease must be outside the previous radiation field OR must have progressed"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_undergone_biopsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a biopsy procedure at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone a biopsy procedure at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a biopsy procedure in the history.","meaning":"Boolean indicating whether the patient has undergone a biopsy procedure at any time in the history."} // "biopsy procedure"
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure in the history.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure at any time in the history."} // "surgical procedure"
(declare-const patient_will_undergo_bevacizumab_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if it is planned for the patient to receive bevacizumab-containing therapy in the future.","when_to_set_to_false":"Set to false if it is not planned for the patient to receive bevacizumab-containing therapy in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether bevacizumab-containing therapy is planned for the patient in the future.","meaning":"Boolean indicating whether it is planned for the patient to receive bevacizumab-containing therapy in the future."} // "bevacizumab"
(declare-const time_from_surgical_procedure_or_biopsy_to_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days from the most recent surgical procedure or biopsy procedure to the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the most recent surgical procedure or biopsy procedure occurred.","meaning":"Numeric variable indicating the number of days from the most recent surgical procedure or biopsy procedure to the current time."} // "time from surgical procedure or biopsy procedure"
(declare-const time_from_surgical_procedure_or_biopsy_to_now_in_days@@dependent_on_planned_bevacizumab_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the time interval from the most recent surgical procedure or biopsy procedure to now is dependent on whether bevacizumab therapy is planned for the patient.","when_to_set_to_false":"Set to false if the time interval is not dependent on planned bevacizumab therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the time interval is dependent on planned bevacizumab therapy.","meaning":"Boolean qualifier indicating whether the time interval from procedure to now is dependent on planned bevacizumab therapy."} // "time from surgical procedure or biopsy procedure is dependent on whether it is planned for the patient to receive bevacizumab therapy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition in the requirement: The time interval from surgical or biopsy procedure to now is dependent on whether bevacizumab therapy is planned
(assert
  (! (= time_from_surgical_procedure_or_biopsy_to_now_in_days@@dependent_on_planned_bevacizumab_therapy
        true)
     :named REQ6_AUXILIARY0)) ;; "the time from surgical procedure or biopsy procedure is dependent on whether it is planned for the patient to receive bevacizumab therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: The time interval dependency must be enforced for eligibility
(assert
  (! time_from_surgical_procedure_or_biopsy_to_now_in_days@@dependent_on_planned_bevacizumab_therapy
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the time from surgical procedure or biopsy procedure is dependent on whether it is planned for the patient to receive bevacizumab therapy"

;; ===================== Declarations for the inclusion criterion (REQ 7) =====================
(declare-const bevacizumab_therapy_is_planned_now Bool) ;; {"when_to_set_to_true":"Set to true if bevacizumab therapy is currently planned for the patient.","when_to_set_to_false":"Set to false if bevacizumab therapy is not currently planned for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether bevacizumab therapy is currently planned for the patient.","meaning":"Boolean indicating whether bevacizumab therapy is currently planned for the patient."} // "bevacizumab therapy is planned"
(declare-const patient_is_bevacizumab_appropriate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered appropriate for bevacizumab therapy.","when_to_set_to_false":"Set to false if the patient is currently not considered appropriate for bevacizumab therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently considered appropriate for bevacizumab therapy.","meaning":"Boolean indicating whether the patient is currently considered appropriate for bevacizumab therapy."} // "bevacizumab-appropriate"
(declare-const patient_has_anticipation_of_need_for_major_surgical_procedure_during_protocol_treatment Bool) ;; {"when_to_set_to_true":"Set to true if there is an anticipation that the patient will need a major surgical procedure during protocol treatment.","when_to_set_to_false":"Set to false if there is no anticipation that the patient will need a major surgical procedure during protocol treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is an anticipation that the patient will need a major surgical procedure during protocol treatment.","meaning":"Boolean indicating whether there is an anticipation that the patient will need a major surgical procedure during protocol treatment."} // "anticipation of need for major surgical procedure during protocol treatment"
(declare-const patient_has_recovered_from_all_associated_toxicities_at_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recovered from all toxicities associated with prior procedures or injuries at the time of registration.","when_to_set_to_false":"Set to false if the patient has not recovered from all toxicities associated with prior procedures or injuries at the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recovered from all toxicities associated with prior procedures or injuries at the time of registration.","meaning":"Boolean indicating whether the patient has recovered from all toxicities associated with prior procedures or injuries at the time of registration."} // "recovered from all associated toxicities at the time of registration"
(declare-const patient_has_finding_of_traumatic_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a traumatic injury in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never had a traumatic injury in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a traumatic injury in the past.","meaning":"Boolean indicating whether the patient has ever had a traumatic injury in the past."} // "significant traumatic injury"
(declare-const time_from_major_surgical_procedure_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent major surgical procedure to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent major surgical procedure to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent major surgical procedure to the time of registration."} // "time since major surgical procedure"
(declare-const time_from_traumatic_injury_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent significant traumatic injury to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent significant traumatic injury to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent significant traumatic injury to the time of registration."} // "time since significant traumatic injury"
(declare-const patient_has_undergone_core_needle_biopsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a core needle biopsy in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone a core needle biopsy in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a core needle biopsy in the past.","meaning":"Boolean indicating whether the patient has ever undergone a core needle biopsy in the past."} // "core biopsy"
(declare-const time_from_core_biopsy_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent core biopsy to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent core biopsy to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent core biopsy to the time of registration."} // "time since core biopsy"
(declare-const patient_has_undergone_mediastinoscopy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone mediastinoscopy in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone mediastinoscopy in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone mediastinoscopy in the past.","meaning":"Boolean indicating whether the patient has ever undergone mediastinoscopy in the past."} // "mediastinoscopy"
(declare-const time_from_mediastinoscopy_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent mediastinoscopy to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent mediastinoscopy to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent mediastinoscopy to the time of registration."} // "time since mediastinoscopy"
(declare-const patient_has_undergone_pleurodesis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone pleurodesis in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone pleurodesis in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone pleurodesis in the past.","meaning":"Boolean indicating whether the patient has ever undergone pleurodesis in the past."} // "pleurodesis"
(declare-const time_from_pleurodesis_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent pleurodesis to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent pleurodesis to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent pleurodesis to the time of registration."} // "time since pleurodesis"
(declare-const patient_has_undergone_thoracoscopic_biopsy_of_pleura_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone video-assisted thoracoscopic surgery pleural biopsy in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone video-assisted thoracoscopic surgery pleural biopsy in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone video-assisted thoracoscopic surgery pleural biopsy in the past.","meaning":"Boolean indicating whether the patient has ever undergone video-assisted thoracoscopic surgery pleural biopsy in the past."} // "video-assisted thoracoscopic surgery pleural biopsy"
(declare-const time_from_thoracoscopic_biopsy_of_pleura_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent video-assisted thoracoscopic surgery pleural biopsy to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent video-assisted thoracoscopic surgery pleural biopsy to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent video-assisted thoracoscopic surgery pleural biopsy to the time of registration."} // "time since video-assisted thoracoscopic surgery pleural biopsy"
(declare-const patient_has_undergone_pericardiostomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone video-assisted thoracoscopic surgery pericardial window (pericardiostomy) in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone video-assisted thoracoscopic surgery pericardial window (pericardiostomy) in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone video-assisted thoracoscopic surgery pericardial window (pericardiostomy) in the past.","meaning":"Boolean indicating whether the patient has ever undergone video-assisted thoracoscopic surgery pericardial window (pericardiostomy) in the past."} // "video-assisted thoracoscopic surgery pericardial window"
(declare-const time_from_pericardiostomy_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent video-assisted thoracoscopic surgery pericardial window (pericardiostomy) to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent video-assisted thoracoscopic surgery pericardial window (pericardiostomy) to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent video-assisted thoracoscopic surgery pericardial window (pericardiostomy) to the time of registration."} // "time since video-assisted thoracoscopic surgery pericardial window"
(declare-const patient_has_undergone_fine_needle_biopsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone fine needle aspiration (biopsy) in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone fine needle aspiration (biopsy) in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone fine needle aspiration (biopsy) in the past.","meaning":"Boolean indicating whether the patient has ever undergone fine needle aspiration (biopsy) in the past."} // "fine needle aspiration"
(declare-const time_from_fine_needle_biopsy_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent fine needle aspiration (biopsy) to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent fine needle aspiration (biopsy) to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent fine needle aspiration (biopsy) to the time of registration."} // "time since fine needle aspiration"
(declare-const patient_has_undergone_thoracentesis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone thoracentesis in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone thoracentesis in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone thoracentesis in the past.","meaning":"Boolean indicating whether the patient has ever undergone thoracentesis in the past."} // "thoracentesis"
(declare-const time_from_thoracentesis_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent thoracentesis to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent thoracentesis to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent thoracentesis to the time of registration."} // "time since thoracentesis"
(declare-const patient_has_undergone_insertion_of_implantable_venous_access_port_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone central venous access device implantation (insertion of implantable venous access port) in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone central venous access device implantation (insertion of implantable venous access port) in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone central venous access device implantation (insertion of implantable venous access port) in the past.","meaning":"Boolean indicating whether the patient has ever undergone central venous access device implantation (insertion of implantable venous access port) in the past."} // "central venous access device implantation"
(declare-const time_from_insertion_of_implantable_venous_access_port_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from the patient's most recent central venous access device implantation (insertion of implantable venous access port) to the time of registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed from the patient's most recent central venous access device implantation (insertion of implantable venous access port) to the time of registration.","meaning":"Numeric value indicating the number of days elapsed from the patient's most recent central venous access device implantation (insertion of implantable venous access port) to the time of registration."} // "time since central venous access device implantation"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: (at least 28 days must have elapsed since major surgical procedure (with exhaustive subcategories (thoracotomy, video-assisted thoracoscopic surgery resection of lung cancer, open pleural biopsy, another major surgical procedure with non-exhaustive examples (abdominal surgery))) OR significant traumatic injury)
(assert
  (! (=> (and patient_is_bevacizumab_appropriate_now bevacizumab_therapy_is_planned_now)
         (or (>= time_from_major_surgical_procedure_to_registration_in_days 28)
             (>= time_from_traumatic_injury_to_registration_in_days 28)))
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "at least 28 days must have elapsed since major surgical procedure ... OR significant traumatic injury"

;; Component 1: have recovered from all associated toxicities at the time of registration
(assert
  (! (=> (and patient_is_bevacizumab_appropriate_now bevacizumab_therapy_is_planned_now)
         patient_has_recovered_from_all_associated_toxicities_at_registration)
     :named REQ7_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have recovered from all associated toxicities at the time of registration"

;; Component 2: NOT have anticipation of need for major surgical procedure during protocol treatment
(assert
  (! (=> (and patient_is_bevacizumab_appropriate_now bevacizumab_therapy_is_planned_now)
         (not patient_has_anticipation_of_need_for_major_surgical_procedure_during_protocol_treatment))
     :named REQ7_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "NOT have anticipation of need for major surgical procedure during protocol treatment"

;; Component 3: NOT have had a core biopsy OR mediastinoscopy OR pleurodesis OR video-assisted thoracoscopic surgery pleural biopsy OR video-assisted thoracoscopic surgery pericardial window within 14 days prior to registration
(assert
  (! (=> (and patient_is_bevacizumab_appropriate_now bevacizumab_therapy_is_planned_now)
         (and (or (not patient_has_undergone_core_needle_biopsy_inthehistory)
                  (>= time_from_core_biopsy_to_registration_in_days 14))
              (or (not patient_has_undergone_mediastinoscopy_inthehistory)
                  (>= time_from_mediastinoscopy_to_registration_in_days 14))
              (or (not patient_has_undergone_pleurodesis_inthehistory)
                  (>= time_from_pleurodesis_to_registration_in_days 14))
              (or (not patient_has_undergone_thoracoscopic_biopsy_of_pleura_inthehistory)
                  (>= time_from_thoracoscopic_biopsy_of_pleura_to_registration_in_days 14))
              (or (not patient_has_undergone_pericardiostomy_inthehistory)
                  (>= time_from_pericardiostomy_to_registration_in_days 14))))
     :named REQ7_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "NOT have had a core biopsy OR mediastinoscopy OR pleurodesis OR video-assisted thoracoscopic surgery pleural biopsy OR video-assisted thoracoscopic surgery pericardial window within 14 days prior to registration"

;; Component 4: NOT have had a percutaneous fine needle aspiration OR thoracentesis OR central venous access device implantation within 7 days prior to registration
(assert
  (! (=> (and patient_is_bevacizumab_appropriate_now bevacizumab_therapy_is_planned_now)
         (and (or (not patient_has_undergone_fine_needle_biopsy_inthehistory)
                  (>= time_from_fine_needle_biopsy_to_registration_in_days 7))
              (or (not patient_has_undergone_thoracentesis_inthehistory)
                  (>= time_from_thoracentesis_to_registration_in_days 7))
              (or (not patient_has_undergone_insertion_of_implantable_venous_access_port_inthehistory)
                  (>= time_from_insertion_of_implantable_venous_access_port_to_registration_in_days 7))))
     :named REQ7_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "NOT have had a percutaneous fine needle aspiration OR thoracentesis OR central venous access device implantation within 7 days prior to registration"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_undergone_abdominal_surgery_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone abdominal surgery at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone abdominal surgery at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone abdominal surgery at any time in the history.","meaning":"Boolean indicating whether the patient has undergone abdominal surgery at any time in the history."} // "abdominal surgery"
(declare-const patient_has_undergone_open_pleural_biopsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone open pleural biopsy at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone open pleural biopsy at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone open pleural biopsy at any time in the history.","meaning":"Boolean indicating whether the patient has undergone open pleural biopsy at any time in the history."} // "open pleural biopsy"
(declare-const patient_has_undergone_thoracotomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone thoracotomy at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone thoracotomy at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone thoracotomy at any time in the history.","meaning":"Boolean indicating whether the patient has undergone thoracotomy at any time in the history."} // "thoracotomy"
(declare-const patient_has_undergone_video_assisted_thoracoscopic_surgery_resection_of_lung_cancer_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone video-assisted thoracoscopic surgery resection of lung cancer at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone video-assisted thoracoscopic surgery resection of lung cancer at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone video-assisted thoracoscopic surgery resection of lung cancer at any time in the history.","meaning":"Boolean indicating whether the patient has undergone video-assisted thoracoscopic surgery resection of lung cancer at any time in the history."} // "video-assisted thoracoscopic surgery resection of lung cancer"
(declare-const time_from_abdominal_surgery_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from abdominal surgery to registration.","when_to_set_to_null":"Set to null if the number of days elapsed from abdominal surgery to registration is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days elapsed from abdominal surgery to registration."} // "time since abdominal surgery"
(declare-const time_from_open_pleural_biopsy_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from open pleural biopsy to registration.","when_to_set_to_null":"Set to null if the number of days elapsed from open pleural biopsy to registration is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days elapsed from open pleural biopsy to registration."} // "time since open pleural biopsy"
(declare-const time_from_thoracotomy_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from thoracotomy to registration.","when_to_set_to_null":"Set to null if the number of days elapsed from thoracotomy to registration is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days elapsed from thoracotomy to registration."} // "time since thoracotomy"
(declare-const time_from_video_assisted_thoracoscopic_surgery_resection_of_lung_cancer_to_registration_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days elapsed from video-assisted thoracoscopic surgery resection of lung cancer to registration.","when_to_set_to_null":"Set to null if the number of days elapsed from video-assisted thoracoscopic surgery resection of lung cancer to registration is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days elapsed from video-assisted thoracoscopic surgery resection of lung cancer to registration."} // "time since video-assisted thoracoscopic surgery resection of lung cancer"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Exhaustive subcategories for major surgical procedure:
;; List: thoracotomy, video-assisted thoracoscopic surgery resection of lung cancer, open pleural biopsy, another major surgical procedure (with non-exhaustive examples: abdominal surgery)
;; "major surgical procedure" ≡ (thoracotomy ∨ video-assisted thoracoscopic surgery resection of lung cancer ∨ open pleural biopsy ∨ another major surgical procedure)
;; "another major surgical procedure" includes abdominal surgery as a non-exhaustive example

;; Define umbrella for major surgical procedure
(declare-const patient_has_undergone_major_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any major surgical procedure at any time in the history, including thoracotomy, video-assisted thoracoscopic surgery resection of lung cancer, open pleural biopsy, or another major surgical procedure.","when_to_set_to_false":"Set to false if the patient has not undergone any major surgical procedure at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any major surgical procedure at any time in the history.","meaning":"Boolean indicating whether the patient has undergone any major surgical procedure at any time in the history."} // "major surgical procedure (umbrella)"

(assert
  (! (= patient_has_undergone_major_surgical_procedure_inthehistory
        (or patient_has_undergone_thoracotomy_inthehistory
            patient_has_undergone_video_assisted_thoracoscopic_surgery_resection_of_lung_cancer_inthehistory
            patient_has_undergone_open_pleural_biopsy_inthehistory
            patient_has_undergone_abdominal_surgery_inthehistory))
     :named REQ8_AUXILIARY0)) ;; "major surgical procedure" defined by exhaustive subcategories and non-exhaustive example

;; Non-exhaustive example: abdominal surgery implies another major surgical procedure
(declare-const patient_has_undergone_another_major_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone another major surgical procedure at any time in the history, not otherwise listed.","when_to_set_to_false":"Set to false if the patient has not undergone another major surgical procedure at any time in the history, not otherwise listed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone another major surgical procedure at any time in the history.","meaning":"Boolean indicating whether the patient has undergone another major surgical procedure at any time in the history, not otherwise listed."} // "another major surgical procedure"

(assert
  (! (=> patient_has_undergone_abdominal_surgery_inthehistory
        patient_has_undergone_another_major_surgical_procedure_inthehistory)
     :named REQ8_AUXILIARY1)) ;; "abdominal surgery" is a non-exhaustive example of "another major surgical procedure"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: (at least 28 days must have elapsed since major surgical procedure (with exhaustive subcategories...) OR significant traumatic injury)
(assert
  (! (or
        (and patient_has_undergone_major_surgical_procedure_inthehistory
             (or (>= time_from_thoracotomy_to_registration_in_days 28)
                 (>= time_from_video_assisted_thoracoscopic_surgery_resection_of_lung_cancer_to_registration_in_days 28)
                 (>= time_from_open_pleural_biopsy_to_registration_in_days 28)
                 (>= time_from_abdominal_surgery_to_registration_in_days 28)))
        (and patient_has_finding_of_traumatic_injury_inthehistory
             (>= time_from_traumatic_injury_to_registration_in_days 28)))
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "at least 28 days must have elapsed since major surgical procedure ... OR significant traumatic injury"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_neutrophil_count_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's absolute neutrophil count is recorded now in units of per microliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's absolute neutrophil count measured now, in units of per microliter."} // "absolute neutrophil count measured now, in units of per microliter"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (>= patient_neutrophil_count_value_recorded_now_withunit_per_microliter 1500.0)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an absolute neutrophil count ≥ 1,500 per microliter."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a platelet count (number per microliter) is recorded for the patient now.","when_to_set_to_null":"Set to null if no platelet count measurement (number per microliter) is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count (number per microliter) measured now."} // "platelet count"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (>= patient_platelet_count_finding_value_recorded_now_withunit_per_microliter 100000)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have platelet count ≥ 100,000 per microliter."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's hemoglobin concentration in grams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no current hemoglobin concentration measurement in grams per deciliter is available or the value is indeterminate.","meaning":"Numeric value for the patient's current hemoglobin concentration in grams per deciliter."} // "hemoglobin concentration"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (>= patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter 9.0)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hemoglobin concentration ≥ 9 grams per deciliter."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const institutional_upper_limit_of_normal_for_serum_creatinine_value_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the institutional upper limit of normal for serum creatinine concentration in mg/dL as defined by the institution at the current time.","when_to_set_to_null":"Set to null if the institutional upper limit of normal for serum creatinine concentration in mg/dL is not available or indeterminate.","meaning":"Numeric value of the institutional upper limit of normal for serum creatinine concentration in mg/dL at the current time."} // "serum creatinine concentration ≤ institutional upper limit of normal"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's serum creatinine concentration in mg/dL if available now.","when_to_set_to_null":"Set to null if no current serum creatinine concentration measurement in mg/dL is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum creatinine concentration in mg/dL."} // "serum creatinine concentration"
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min Real) ;; {"when_to_set_to_value":"Set to the calculated value of the patient's creatinine clearance in mL/min using the Cockroft-Gault formula if available now.","when_to_set_to_null":"Set to null if no current calculated creatinine clearance (Cockroft-Gault) in mL/min is available or the value is indeterminate.","meaning":"Numeric value of the patient's current creatinine clearance in mL/min calculated by Cockroft-Gault formula."} // "creatinine clearance"
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min@@calculated_by_cockroft_gault_formula Bool) ;; {"when_to_set_to_true":"Set to true if the creatinine clearance value was calculated using the Cockroft-Gault formula.","when_to_set_to_false":"Set to false if the creatinine clearance value was not calculated using the Cockroft-Gault formula.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the Cockroft-Gault formula was used.","meaning":"Boolean indicating whether the creatinine clearance value was calculated using the Cockroft-Gault formula."} // "calculated creatinine clearance using the Cockroft-Gault formula"
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min@@measured Bool) ;; {"when_to_set_to_true":"Set to true if the creatinine clearance value was directly measured (not calculated).","when_to_set_to_false":"Set to false if the creatinine clearance value was not directly measured (i.e., was calculated).","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value was measured or calculated.","meaning":"Boolean indicating whether the creatinine clearance value was directly measured."} // "measured creatinine clearance"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min@@calculated_by_cockroft_gault_formula
         true)
     :named REQ12_AUXILIARY0)) ;; "calculated creatinine clearance using the Cockroft-Gault formula"

(assert
  (! (=> patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min@@measured
         true)
     :named REQ12_AUXILIARY1)) ;; "measured creatinine clearance"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Component 0: To be included, the patient must have ((serum creatinine concentration ≤ institutional upper limit of normal) AND ((calculated creatinine clearance using the Cockroft-Gault formula ≥ 50 cubic centimeters per minute) OR (measured creatinine clearance ≥ 50 cubic centimeters per minute))).
(assert
  (! (and
        (<= patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl institutional_upper_limit_of_normal_for_serum_creatinine_value_now_withunit_mg_per_dl) ;; "serum creatinine concentration ≤ institutional upper limit of normal"
        (or
          (and patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min@@calculated_by_cockroft_gault_formula
               (>= patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min 50.0)) ;; "calculated creatinine clearance using the Cockroft-Gault formula ≥ 50 mL/min"
          (and patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min@@measured
               (>= patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min 50.0)) ;; "measured creatinine clearance ≥ 50 mL/min"
        )
     )
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_protein_measurement_urine_value_recorded_now_withunit_mg_per_dl@@screened_by_urine_analysis_for_urine_protein_creatinine_ratio Bool) ;; {"when_to_set_to_true":"Set to true if the urine protein concentration measurement was obtained by urine analysis for the purpose of calculating the urine protein creatinine ratio.","when_to_set_to_false":"Set to false if the measurement was not obtained by urine analysis for this purpose.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was obtained by urine analysis for this purpose.","meaning":"Boolean indicating whether the urine protein concentration measurement was obtained by urine analysis for the purpose of calculating the urine protein creatinine ratio."} // "screened by urine analysis for urine protein creatinine ratio"
(declare-const patient_protein_measurement_urine_value_recorded_now_withunit_mg_per_dl@@temporalcontext_within_14_days_prior_to_registration Bool) ;; {"when_to_set_to_true":"Set to true if the urine protein concentration measurement was obtained within 14 days prior to registration.","when_to_set_to_false":"Set to false if the measurement was not obtained within this window.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was obtained within 14 days prior to registration.","meaning":"Boolean indicating whether the urine protein concentration measurement was obtained within 14 days prior to registration."} // "obtained within 14 days prior to registration"
(declare-const patient_urine_protein_creatinine_ratio_measurement_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's urine protein creatinine ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's urine protein creatinine ratio measured now."} // "urine protein creatinine ratio"
(declare-const patient_protein_measurement_urine_quantitative_24_hour_value_recorded_now_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's 24-hour urine protein concentration is recorded now in milligrams.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's 24-hour urine protein concentration measured now in milligrams."} // "24-hour urine protein concentration"
(declare-const patient_protein_measurement_urine_quantitative_24_hour_value_recorded_within_14_days_prior_to_registration_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's 24-hour urine protein concentration is recorded within 14 days prior to registration in milligrams.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's 24-hour urine protein concentration measured within 14 days prior to registration in milligrams."} // "24-hour urine protein concentration measured within 14 days prior to registration"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable (screened by urine analysis for urine protein creatinine ratio)
(assert
  (! (=> patient_protein_measurement_urine_value_recorded_now_withunit_mg_per_dl@@screened_by_urine_analysis_for_urine_protein_creatinine_ratio
         true)
     :named REQ13_AUXILIARY0)) ;; "urine protein concentration must be screened by urine analysis for urine protein creatinine ratio"

;; Qualifier variable implies corresponding stem variable (obtained within 14 days prior to registration)
(assert
  (! (=> patient_protein_measurement_urine_value_recorded_now_withunit_mg_per_dl@@temporalcontext_within_14_days_prior_to_registration
         true)
     :named REQ13_AUXILIARY1)) ;; "urine protein concentration used to calculate the urine protein creatinine ratio must be obtained within 14 days prior to registration"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Component 0: If bevacizumab therapy is planned, urine protein concentration must be screened by urine analysis for urine protein creatinine ratio
(assert
  (! (or (not bevacizumab_therapy_is_planned_now)
         patient_protein_measurement_urine_value_recorded_now_withunit_mg_per_dl@@screened_by_urine_analysis_for_urine_protein_creatinine_ratio)
     :named REQ13_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient will be receiving bevacizumab therapy, urine protein concentration must be screened by urine analysis for urine protein creatinine ratio"

;; Component 1: If bevacizumab therapy is planned, the urine protein concentration used to calculate the urine protein creatinine ratio must be obtained within 14 days prior to registration
(assert
  (! (or (not bevacizumab_therapy_is_planned_now)
         patient_protein_measurement_urine_value_recorded_now_withunit_mg_per_dl@@temporalcontext_within_14_days_prior_to_registration)
     :named REQ13_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient will be receiving bevacizumab therapy, the urine protein concentration used to calculate the urine protein creatinine ratio must be obtained within 14 days prior to registration"

;; Component 2: If bevacizumab therapy is planned, and urine protein creatinine ratio > 0.5, 24-hour urine protein concentration must be obtained AND < 1,000 mg for enrollment
(assert
  (! (or (not bevacizumab_therapy_is_planned_now)
         (<= patient_urine_protein_creatinine_ratio_measurement_value_recorded_now_withunit_ratio 0.5)
         (and (not (= patient_urine_protein_creatinine_ratio_measurement_value_recorded_now_withunit_ratio 0.5))
              (> patient_urine_protein_creatinine_ratio_measurement_value_recorded_now_withunit_ratio 0.5)
              (< patient_protein_measurement_urine_quantitative_24_hour_value_recorded_now_withunit_mg 1000)))
     :named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "if urine protein creatinine ratio > 0.5, 24-hour urine protein concentration must be obtained AND 24-hour urine protein concentration < 1,000 milligrams for patient enrollment"

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const institutional_upper_limit_of_normal_for_serum_bilirubin_value_now_withunit_micromol_per_l Real) ;; {"when_to_set_to_value":"Set to the institutional upper limit of normal for serum bilirubin concentration (in μmol/L) if available for the current time.","when_to_set_to_null":"Set to null if the institutional upper limit of normal for serum bilirubin concentration is not available or indeterminate for the current time.","meaning":"Numeric value of the institutional upper limit of normal for serum bilirubin concentration in μmol/L at the current time."} // "institutional upper limit of normal for serum bilirubin concentration"
(declare-const patient_has_finding_of_liver_metastases_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver metastases.","when_to_set_to_false":"Set to false if the patient currently does not have liver metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver metastases.","meaning":"Boolean indicating whether the patient currently has liver metastases."} // "liver metastases"
(declare-const patient_serum_bilirubin_level_finding_value_recorded_now_withunit_micromol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum bilirubin concentration (in μmol/L) is available.","when_to_set_to_null":"Set to null if no current serum bilirubin concentration measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum bilirubin concentration in μmol/L."} // "serum bilirubin concentration"

;; ===================== Constraint Assertions (REQ 14) =====================
;; To be included, the patient must have ((serum bilirubin concentration ≤ 2 × institutional upper limit of normal) OR (if the patient has liver metastases, serum bilirubin concentration ≤ 5 × institutional upper limit of normal)).
(assert
  (! (or 
        (<= patient_serum_bilirubin_level_finding_value_recorded_now_withunit_micromol_per_l
            (* 2 institutional_upper_limit_of_normal_for_serum_bilirubin_value_now_withunit_micromol_per_l))
        (and patient_has_finding_of_liver_metastases_now
             (<= patient_serum_bilirubin_level_finding_value_recorded_now_withunit_micromol_per_l
                 (* 5 institutional_upper_limit_of_normal_for_serum_bilirubin_value_now_withunit_micromol_per_l))))
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "serum bilirubin concentration ≤ 2 × institutional upper limit of normal OR (if liver metastases, ≤ 5 × institutional upper limit of normal)"

;; ===================== Declarations for the criterion (REQ 15) =====================
(declare-const institutional_upper_limit_of_normal_for_alt_value_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the institutional upper limit of normal for ALT if it is available for the current time and with a valid unit.","when_to_set_to_null":"Set to null if the institutional upper limit of normal for ALT is not available or indeterminate.","meaning":"Numeric value representing the current institutional upper limit of normal for serum glutamate pyruvate transaminase (ALT), with appropriate units."} // "institutional upper limit of normal for ALT"
(declare-const institutional_upper_limit_of_normal_for_ast_value_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the institutional upper limit of normal for AST if it is available for the current time and with a valid unit.","when_to_set_to_null":"Set to null if the institutional upper limit of normal for AST is not available or indeterminate.","meaning":"Numeric value representing the current institutional upper limit of normal for serum glutamic oxaloacetic transaminase (AST), with appropriate units."} // "institutional upper limit of normal for AST"
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum glutamate pyruvate transaminase (ALT) concentration is recorded now with a valid unit.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum glutamate pyruvate transaminase (ALT) concentration."} // "serum glutamate pyruvate transaminase concentration"
(declare-const patient_ast_serum_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum glutamic oxaloacetic transaminase (AST) concentration is recorded now with a valid unit.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum glutamic oxaloacetic transaminase (AST) concentration."} // "serum glutamic oxaloacetic transaminase concentration"
(declare-const patient_has_finding_of_liver_metastases_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver metastases.","when_to_set_to_false":"Set to false if the patient currently does not have liver metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver metastases.","meaning":"Boolean indicating whether the patient currently has liver metastases."} // "liver metastases"

;; ===================== Constraint Assertions (REQ 15) =====================
;; To be included, the patient must have ((serum glutamic oxaloacetic transaminase concentration ≤ 2 × institutional upper limit of normal) OR (serum glutamate pyruvate transaminase concentration ≤ 2 × institutional upper limit of normal) OR (if the patient has liver metastases, (serum glutamic oxaloacetic transaminase concentration ≤ 5 × institutional upper limit of normal OR serum glutamate pyruvate transaminase concentration ≤ 5 × institutional upper limit of normal))).
(assert
  (!
    (or
      (<= patient_ast_serum_measurement_value_recorded_now_withunit_unit
          (* 2.0 institutional_upper_limit_of_normal_for_ast_value_now_withunit_unit)) ;; "serum glutamic oxaloacetic transaminase concentration ≤ 2 × institutional upper limit of normal"
      (<= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
          (* 2.0 institutional_upper_limit_of_normal_for_alt_value_now_withunit_unit)) ;; "serum glutamate pyruvate transaminase concentration ≤ 2 × institutional upper limit of normal"
      (and
        patient_has_finding_of_liver_metastases_now
        (or
          (<= patient_ast_serum_measurement_value_recorded_now_withunit_unit
              (* 5.0 institutional_upper_limit_of_normal_for_ast_value_now_withunit_unit)) ;; "serum glutamic oxaloacetic transaminase concentration ≤ 5 × institutional upper limit of normal (if liver metastases)"
          (<= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit
              (* 5.0 institutional_upper_limit_of_normal_for_alt_value_now_withunit_unit)) ;; "serum glutamate pyruvate transaminase concentration ≤ 5 × institutional upper limit of normal (if liver metastases)"
        )
      )
    )
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS
  )
) ;; "To be included, the patient must have ((serum glutamic oxaloacetic transaminase concentration ≤ 2 × institutional upper limit of normal) OR (serum glutamate pyruvate transaminase concentration ≤ 2 × institutional upper limit of normal) OR (if the patient has liver metastases, (serum glutamic oxaloacetic transaminase concentration ≤ 5 × institutional upper limit of normal OR serum glutamate pyruvate transaminase concentration ≤ 5 × institutional upper limit of normal)))."

;; ===================== Declarations for the criterion (REQ 16) =====================
(declare-const zubrod_performance_status_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value of the patient's Zubrod performance status as recorded now (e.g., 0, 1, 2, etc.).","when_to_set_to_null":"Set to null if the Zubrod performance status value is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the patient's Zubrod performance status value as recorded now, using integer scale."} // "Zubrod performance status value as recorded now"

;; ===================== Constraint Assertions (REQ 16) =====================
;; To be included, the patient must have ((Zubrod performance status = 0) OR (Zubrod performance status = 1)).
(assert
  (! (or (= zubrod_performance_status_value_recorded_now_withunit_integer 0)
         (= zubrod_performance_status_value_recorded_now_withunit_integer 1))
     :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Zubrod performance status = 0 OR Zubrod performance status = 1"

;; ===================== Declarations for the criterion (REQ 17) =====================
(declare-const patient_has_finding_of_sensory_neuropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sensory neuropathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sensory neuropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of sensory neuropathy.","meaning":"Boolean indicating whether the patient currently has sensory neuropathy."} // "sensory neuropathy"
(declare-const sensory_neuropathy_grade_value_recorded_now_withunit_nci_ctc_v3_0 Real) ;; {"when_to_set_to_value":"Set to the numeric grade value if the patient's current sensory neuropathy grade is documented using NCI CTCAE v3.0.","when_to_set_to_null":"Set to null if the grade of the patient's current sensory neuropathy is unknown, not documented, or cannot be determined using NCI CTCAE v3.0.","meaning":"Numeric value representing the grade of the patient's current sensory neuropathy according to NCI CTCAE v3.0."} // "grade 2 OR greater symptomatic sensory neuropathy (National Cancer Institute Common Terminology Criteria version 3.0)"
(declare-const sensory_neuropathy_grade_value_recorded_now_withunit_nci_ctc_v3_0@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sensory neuropathy is symptomatic.","when_to_set_to_false":"Set to false if the patient's current sensory neuropathy is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current sensory neuropathy is symptomatic.","meaning":"Boolean indicating whether the patient's current sensory neuropathy is symptomatic."} // "symptomatic sensory neuropathy"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> sensory_neuropathy_grade_value_recorded_now_withunit_nci_ctc_v3_0@@symptomatic
         patient_has_finding_of_sensory_neuropathy_now)
     :named REQ17_AUXILIARY0)) ;; "symptomatic sensory neuropathy" implies "sensory neuropathy"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Component 0: To be included, the patient must NOT have (grade 2 OR greater symptomatic sensory neuropathy (National Cancer Institute Common Terminology Criteria version 3.0)).
(assert
  (! (not (and sensory_neuropathy_grade_value_recorded_now_withunit_nci_ctc_v3_0@@symptomatic
               (>= sensory_neuropathy_grade_value_recorded_now_withunit_nci_ctc_v3_0 2)))
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have grade 2 OR greater symptomatic sensory neuropathy (NCI CTCAE v3.0)"

;; ===================== Declarations for the criterion (REQ 18) =====================
(declare-const patient_has_diagnosis_of_acute_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute hepatitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute hepatitis."} // "acute hepatitis"
(declare-const patient_has_documented_evidence_of_acute_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has documented evidence of acute hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have documented evidence of acute hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has documented evidence of acute hepatitis.","meaning":"Boolean indicating whether the patient currently has documented evidence of acute hepatitis."} // "documented evidence of acute hepatitis"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder due to infection (active infection).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder due to infection (active infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder due to infection (active infection).","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder due to infection (active infection)."} // "active infection"
(declare-const patient_has_uncontrolled_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an uncontrolled infection.","when_to_set_to_false":"Set to false if the patient currently does not have an uncontrolled infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an uncontrolled infection.","meaning":"Boolean indicating whether the patient currently has an uncontrolled infection."} // "uncontrolled infection"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not (or patient_has_documented_evidence_of_acute_hepatitis_now
              patient_has_diagnosis_of_disorder_due_to_infection_now
              patient_has_uncontrolled_infection_now))
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have ((documented evidence of acute hepatitis) OR (active infection) OR (uncontrolled infection))."

;; ===================== Declarations for the criterion (REQ 19) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident within the past 6 months.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident within the past 6 months."} // "history within the past 6 months of cerebrovascular accident"
(declare-const patient_has_finding_of_myocardial_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past 6 months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past 6 months."} // "history within the past 6 months of myocardial infarction"
(declare-const patient_has_finding_of_unstable_angina_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had unstable angina within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had unstable angina within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had unstable angina within the past 6 months.","meaning":"Boolean indicating whether the patient has had unstable angina within the past 6 months."} // "history within the past 6 months of unstable angina"
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled hypertension.","meaning":"Boolean indicating whether the patient currently has uncontrolled hypertension."} // "at the time of registration, uncontrolled hypertension"
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} // "at the time of registration, congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_2_or_greater Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure and the NYHA grade is 2 or greater.","when_to_set_to_false":"Set to false if the patient currently has congestive heart failure but the NYHA grade is less than 2.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the NYHA grade is 2 or greater in the context of current congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure and the NYHA grade is 2 or greater."} // "at the time of registration, New York Heart Association grade 2 OR greater congestive heart failure"
(declare-const patient_has_finding_of_serious_cardiac_arrhythmia_now@@requiring_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has serious cardiac arrhythmia and it requires medication.","when_to_set_to_false":"Set to false if the patient currently has serious cardiac arrhythmia but it does not require medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current serious cardiac arrhythmia requires medication.","meaning":"Boolean indicating whether the patient currently has serious cardiac arrhythmia and it requires medication."} // "at the time of registration, serious cardiac arrhythmia requiring medication"
(declare-const patient_has_finding_of_peripheral_vascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral vascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral vascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral vascular disease.","meaning":"Boolean indicating whether the patient currently has peripheral vascular disease."} // "at the time of registration, peripheral vascular disease"
(declare-const patient_has_finding_of_peripheral_vascular_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral vascular disease and it is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has peripheral vascular disease but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peripheral vascular disease is clinically significant.","meaning":"Boolean indicating whether the patient currently has peripheral vascular disease and it is clinically significant."} // "at the time of registration, clinically significant peripheral vascular disease"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies stem variable for congestive heart failure
(assert
  (! (=> patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_2_or_greater
         patient_has_finding_of_congestive_heart_failure_now)
     :named REQ19_AUXILIARY0)) ;; "at the time of registration, New York Heart Association grade 2 OR greater congestive heart failure"

;; Qualifier variable implies stem variable for peripheral vascular disease
(assert
  (! (=> patient_has_finding_of_peripheral_vascular_disease_now@@clinically_significant
         patient_has_finding_of_peripheral_vascular_disease_now)
     :named REQ19_AUXILIARY1)) ;; "at the time of registration, clinically significant peripheral vascular disease"

;; ===================== Constraint Assertions (REQ 19) =====================
;; The patient must NOT have any of the following:
(assert
  (! (not (or patient_has_finding_of_cerebrovascular_accident_inthepast6months
              patient_has_finding_of_myocardial_infarction_inthepast6months
              patient_has_finding_of_unstable_angina_inthepast6months
              patient_has_finding_of_poor_hypertension_control_now
              patient_has_finding_of_congestive_heart_failure_now@@nyha_grade_2_or_greater
              patient_has_finding_of_serious_cardiac_arrhythmia_now@@requiring_medication
              patient_has_finding_of_peripheral_vascular_disease_now@@clinically_significant))
     :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have ((history within the past 6 months of cerebrovascular accident) OR (history within the past 6 months of myocardial infarction) OR (history within the past 6 months of unstable angina) OR (at the time of registration, uncontrolled hypertension) OR (at the time of registration, New York Heart Association grade 2 OR greater congestive heart failure) OR (at the time of registration, serious cardiac arrhythmia requiring medication) OR (at the time of registration, clinically significant peripheral vascular disease))."

;; ===================== Declarations for the criterion (REQ 20) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity condition.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity condition.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity condition."} // "hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_now@@is_known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity condition is known (documented or established).","when_to_set_to_false":"Set to false if the patient's current hypersensitivity condition is not known (not documented, only suspected, or unknown).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition is known.","meaning":"Boolean indicating whether the patient's current hypersensitivity condition is known (documented or established)."} // "known hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_now@@to_cho_cell_product_or_recombinant_human_antibody Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity condition is to Chinese hamster ovary cell product or other recombinant human antibody (including but not limited to trastuzumab or epoetin alpha).","when_to_set_to_false":"Set to false if the patient's current hypersensitivity condition is not to Chinese hamster ovary cell product or other recombinant human antibody.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to Chinese hamster ovary cell product or other recombinant human antibody.","meaning":"Boolean indicating whether the patient's current hypersensitivity condition is to Chinese hamster ovary cell product or other recombinant human antibody (including but not limited to trastuzumab or epoetin alpha)."} // "hypersensitivity to (Chinese hamster ovary cell product OR other recombinant human antibody (with non-exhaustive examples (trastuzumab, epoetin alpha)))"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_hypersensitivity_condition_now@@is_known
         patient_has_finding_of_hypersensitivity_condition_now)
     :named REQ20_AUXILIARY0)) ;; "known hypersensitivity"

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_hypersensitivity_condition_now@@to_cho_cell_product_or_recombinant_human_antibody
         patient_has_finding_of_hypersensitivity_condition_now)
     :named REQ20_AUXILIARY1)) ;; "hypersensitivity to (Chinese hamster ovary cell product OR other recombinant human antibody (with non-exhaustive examples (trastuzumab, epoetin alpha)))"

;; ===================== Constraint Assertions (REQ 20) =====================
;; The patient must NOT have known hypersensitivity to (Chinese hamster ovary cell product OR other recombinant human antibody (with non-exhaustive examples (trastuzumab, epoetin alpha)))
(assert
  (! (not (and patient_has_finding_of_hypersensitivity_condition_now@@is_known
               patient_has_finding_of_hypersensitivity_condition_now@@to_cho_cell_product_or_recombinant_human_antibody))
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have known hypersensitivity to (Chinese hamster ovary cell product OR other recombinant human antibody (with non-exhaustive examples (trastuzumab, epoetin alpha)))."

;; ===================== Declarations for the criterion (REQ 21) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of tobacco smoking behavior at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of tobacco smoking behavior at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of tobacco smoking behavior.","meaning":"Boolean indicating whether the patient has a documented history of tobacco smoking behavior at any time in the past."} // "smoking history"
(declare-const patient_is_willing_to_provide_prior_smoking_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to provide information about their prior smoking history.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to provide information about their prior smoking history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to provide information about their prior smoking history.","meaning":"Boolean indicating whether the patient is willing to provide information about their prior smoking history."} // "willing to provide prior smoking history"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
  (! patient_is_willing_to_provide_prior_smoking_history
     :named REQ21_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to provide prior smoking history."

;; ===================== Declarations for the criterion (REQ 22) =====================
(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with basal cell carcinoma of the skin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with basal cell carcinoma of the skin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with basal cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of basal cell carcinoma of the skin in their history."} // "basal cell skin cancer"
(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory@@adequately_treated Bool) ;; {"when_to_set_to_true":"Set to true if the basal cell carcinoma of the skin was adequately treated.","when_to_set_to_false":"Set to false if the basal cell carcinoma of the skin was not adequately treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the basal cell carcinoma of the skin was adequately treated.","meaning":"Boolean indicating whether the basal cell carcinoma of the skin was adequately treated."} // "adequately treated basal cell skin cancer"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with squamous cell carcinoma of the skin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with squamous cell carcinoma of the skin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with squamous cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of squamous cell carcinoma of the skin in their history."} // "squamous cell skin cancer"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory@@adequately_treated Bool) ;; {"when_to_set_to_true":"Set to true if the squamous cell carcinoma of the skin was adequately treated.","when_to_set_to_false":"Set to false if the squamous cell carcinoma of the skin was not adequately treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the squamous cell carcinoma of the skin was adequately treated.","meaning":"Boolean indicating whether the squamous cell carcinoma of the skin was adequately treated."} // "adequately treated squamous cell skin cancer"
(declare-const patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with carcinoma in situ of the uterine cervix at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with carcinoma in situ of the uterine cervix at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with carcinoma in situ of the uterine cervix.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of carcinoma in situ of the uterine cervix in their history."} // "in situ cervical cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a malignant neoplastic disease (malignancy) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a malignant neoplastic disease (malignancy) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (malignancy) in their history."} // "malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@stage_i Bool) ;; {"when_to_set_to_true":"Set to true if the malignant neoplastic disease (cancer) was stage I.","when_to_set_to_false":"Set to false if the malignant neoplastic disease (cancer) was not stage I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease (cancer) was stage I.","meaning":"Boolean indicating whether the malignant neoplastic disease (cancer) was stage I."} // "stage I cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@stage_ii Bool) ;; {"when_to_set_to_true":"Set to true if the malignant neoplastic disease (cancer) was stage II.","when_to_set_to_false":"Set to false if the malignant neoplastic disease (cancer) was not stage II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease (cancer) was stage II.","meaning":"Boolean indicating whether the malignant neoplastic disease (cancer) was stage II."} // "stage II cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@adequately_treated Bool) ;; {"when_to_set_to_true":"Set to true if the malignant neoplastic disease (cancer) was adequately treated.","when_to_set_to_false":"Set to false if the malignant neoplastic disease (cancer) was not adequately treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease (cancer) was adequately treated.","meaning":"Boolean indicating whether the malignant neoplastic disease (cancer) was adequately treated."} // "adequately treated stage I/II cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@currently_in_complete_remission Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in complete remission from the malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient is not currently in complete remission from the malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in complete remission from the malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient is currently in complete remission from the malignant neoplastic disease (cancer)."} // "currently in complete remission"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@disease_free_for_at_least_5_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been disease-free from the malignant neoplastic disease (cancer) for at least 5 years.","when_to_set_to_false":"Set to false if the patient has not been disease-free from the malignant neoplastic disease (cancer) for at least 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been disease-free from the malignant neoplastic disease (cancer) for at least 5 years.","meaning":"Boolean indicating whether the patient has been disease-free from the malignant neoplastic disease (cancer) for at least 5 years."} // "disease-free for ≥ 5 years"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory@@adequately_treated
         patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory)
     :named REQ22_AUXILIARY0)) ;; "adequately treated basal cell skin cancer"

(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory@@adequately_treated
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory)
     :named REQ22_AUXILIARY1)) ;; "adequately treated squamous cell skin cancer"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@stage_i
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ22_AUXILIARY2)) ;; "stage I cancer"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@stage_ii
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ22_AUXILIARY3)) ;; "stage II cancer"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@adequately_treated
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ22_AUXILIARY4)) ;; "adequately treated stage I/II cancer"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@currently_in_complete_remission
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ22_AUXILIARY5)) ;; "currently in complete remission"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@disease_free_for_at_least_5_years
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ22_AUXILIARY6)) ;; "disease-free for ≥ 5 years"

;; ===================== Constraint Assertions (REQ 22) =====================
;; The patient must NOT have other prior malignancy EXCEPT for the following:
;; 1. adequately treated basal cell skin cancer
;; 2. adequately treated squamous cell skin cancer
;; 3. in situ cervical cancer
;; 4. adequately treated stage I cancer from which the patient is currently in complete remission
;; 5. adequately treated stage II cancer from which the patient is currently in complete remission
;; 6. any other cancer from which the patient has been disease-free for ≥ 5 years

(assert
  (! (not
        (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
             (not
               (or
                 (and patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory@@adequately_treated)
                 (and patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory@@adequately_treated)
                 patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory
                 (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@stage_i
                      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@adequately_treated
                      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@currently_in_complete_remission)
                 (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@stage_ii
                      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@adequately_treated
                      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@currently_in_complete_remission)
                 patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@disease_free_for_at_least_5_years
               )
             )
        )
     )
     :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have other prior malignancy EXCEPT for the following: adequately treated basal cell skin cancer, adequately treated squamous cell skin cancer, in situ cervical cancer, adequately treated stage I cancer from which the patient is currently in complete remission, adequately treated stage II cancer from which the patient is currently in complete remission, or any other cancer from which the patient has been disease-free for ≥ 5 years."

;; ===================== Declarations for the criterion (REQ 23) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "NOT be pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} // "NOT be nursing"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential, as defined by having had menses at any time in the preceding 12 consecutive months.","when_to_set_to_false":"Set to false if the patient does not currently have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "woman of reproductive potential (defined as having had menses at any time in the preceding 12 consecutive months)"
(declare-const patient_is_man_of_reproductive_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a man of reproductive potential.","when_to_set_to_false":"Set to false if the patient is currently not a man of reproductive potential.","when_to_set_to_null":"Set to null if the patient's current reproductive potential status as a man is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently a man of reproductive potential."} // "man of reproductive potential"
(declare-const patient_has_agreed_to_use_effective_contraceptive_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to use an effective contraceptive method now.","when_to_set_to_false":"Set to false if the patient has not agreed to use an effective contraceptive method now.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has agreed to use an effective contraceptive method now.","meaning":"Boolean value indicating whether the patient has agreed to use an effective contraceptive method at the current time."} // "agreed to use an effective contraceptive method"
(declare-const patient_has_agreed_to_use_heterosexual_celibacy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to use heterosexual celibacy as an effective contraceptive method now.","when_to_set_to_false":"Set to false if the patient has not agreed to use heterosexual celibacy as an effective contraceptive method now.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has agreed to use heterosexual celibacy as an effective contraceptive method now.","meaning":"Boolean value indicating whether the patient has agreed to use heterosexual celibacy as an effective contraceptive method at the current time."} // "heterosexual celibacy"
(declare-const patient_has_agreed_to_use_surgical_procedure_to_prevent_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to use a surgical procedure intended to prevent pregnancy as an effective contraceptive method now.","when_to_set_to_false":"Set to false if the patient has not agreed to use a surgical procedure intended to prevent pregnancy as an effective contraceptive method now.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has agreed to use a surgical procedure intended to prevent pregnancy as an effective contraceptive method now.","meaning":"Boolean value indicating whether the patient has agreed to use a surgical procedure intended to prevent pregnancy as an effective contraceptive method at the current time."} // "surgical procedure intended to prevent pregnancy"
(declare-const patient_has_agreed_to_use_surgical_procedure_to_prevent_pregnancy_now@@hysterectomy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to use hysterectomy as the surgical procedure intended to prevent pregnancy now.","when_to_set_to_false":"Set to false if the patient has not agreed to use hysterectomy as the surgical procedure intended to prevent pregnancy now.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has agreed to use hysterectomy as the surgical procedure intended to prevent pregnancy now.","meaning":"Boolean value indicating whether the patient has agreed to use hysterectomy as the surgical procedure intended to prevent pregnancy as an effective contraceptive method at the current time."} // "hysterectomy"
(declare-const patient_has_agreed_to_use_surgical_procedure_to_prevent_pregnancy_now@@bilateral_oophorectomy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to use bilateral oophorectomy as the surgical procedure intended to prevent pregnancy now.","when_to_set_to_false":"Set to false if the patient has not agreed to use bilateral oophorectomy as the surgical procedure intended to prevent pregnancy now.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has agreed to use bilateral oophorectomy as the surgical procedure intended to prevent pregnancy now.","meaning":"Boolean value indicating whether the patient has agreed to use bilateral oophorectomy as the surgical procedure intended to prevent pregnancy as an effective contraceptive method at the current time."} // "bilateral oophorectomy"
(declare-const patient_has_agreed_to_use_surgical_procedure_to_prevent_pregnancy_now@@bilateral_tubal_ligation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to use bilateral tubal ligation as the surgical procedure intended to prevent pregnancy now.","when_to_set_to_false":"Set to false if the patient has not agreed to use bilateral tubal ligation as the surgical procedure intended to prevent pregnancy now.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has agreed to use bilateral tubal ligation as the surgical procedure intended to prevent pregnancy now.","meaning":"Boolean value indicating whether the patient has agreed to use bilateral tubal ligation as the surgical procedure intended to prevent pregnancy as an effective contraceptive method at the current time."} // "bilateral tubal ligation"
(declare-const patient_has_agreed_to_begin_contraceptive_measures_if_becoming_heterosexually_active_during_protocol_time_period Bool) ;; {"when_to_set_to_true":"Set to true if a previously celibate patient has agreed to begin contraceptive measures if becoming heterosexually active during the protocol-defined time period.","when_to_set_to_false":"Set to false if a previously celibate patient has not agreed to begin contraceptive measures if becoming heterosexually active during the protocol-defined time period.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether a previously celibate patient has agreed to begin contraceptive measures if becoming heterosexually active during the protocol-defined time period.","meaning":"Boolean value indicating whether a previously celibate patient has agreed to begin contraceptive measures if the patient chooses to become heterosexually active during the time period for use of contraceptive measures outlined in the protocol."} // "agreed to begin contraceptive measures if becoming heterosexually active during protocol time period"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Surgical procedure intended to prevent pregnancy (umbrella: exhaustive subcategories)
(assert
  (! (= patient_has_agreed_to_use_surgical_procedure_to_prevent_pregnancy_now
        (or patient_has_agreed_to_use_surgical_procedure_to_prevent_pregnancy_now@@hysterectomy
            patient_has_agreed_to_use_surgical_procedure_to_prevent_pregnancy_now@@bilateral_oophorectomy
            patient_has_agreed_to_use_surgical_procedure_to_prevent_pregnancy_now@@bilateral_tubal_ligation))
     :named REQ23_AUXILIARY0)) ;; "surgical procedure intended to prevent pregnancy (with exhaustive subcategories (hysterectomy, bilateral oophorectomy, bilateral tubal ligation))"

;; Non-exhaustive examples for effective contraceptive method
(assert
  (! (=> (or patient_has_agreed_to_use_heterosexual_celibacy_now
            patient_has_agreed_to_use_surgical_procedure_to_prevent_pregnancy_now)
         patient_has_agreed_to_use_effective_contraceptive_method_now)
     :named REQ23_AUXILIARY1)) ;; "effective contraceptive method (with non-exhaustive examples (heterosexual celibacy, surgical procedure intended to prevent pregnancy))"

;; ===================== Constraint Assertions (REQ 23) =====================
;; Component 0: NOT be pregnant OR NOT be nursing
(assert
  (! (or (not patient_is_pregnant_now)
         (not patient_is_breastfeeding_now))
     :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (NOT be pregnant OR NOT be nursing)."

;; Component 1: If woman of reproductive potential (defined as menses in past 12 months) OR man of reproductive potential, must have agreed to use effective contraceptive method
(assert
  (! (or (not (or patient_has_childbearing_potential_now
                  patient_is_man_of_reproductive_potential_now))
         patient_has_agreed_to_use_effective_contraceptive_method_now)
     :named REQ23_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman of reproductive potential (defined as having had menses at any time in the preceding 12 consecutive months) OR if the patient is a man of reproductive potential, the patient must have agreed to use an effective contraceptive method"

;; Component 2: If previously celibate patient chooses to become heterosexually active during protocol time period, must begin contraceptive measures
(assert
  (! patient_has_agreed_to_begin_contraceptive_measures_if_becoming_heterosexually_active_during_protocol_time_period
     :named REQ23_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if a previously celibate patient chooses to become heterosexually active during the time period for use of contraceptive measures outlined in the protocol, the patient is responsible for beginning contraceptive measures"

;; ===================== Declarations for the criterion (REQ 24) =====================
(declare-const patient_or_legally_authorized_representative_has_been_informed_of_investigational_nature_of_this_study Bool) ;; {"when_to_set_to_true":"Set to true if either the patient or the legally authorized representative has been informed of the investigational nature of this study.","when_to_set_to_false":"Set to false if neither the patient nor the legally authorized representative has been informed of the investigational nature of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether either the patient or the legally authorized representative has been informed of the investigational nature of this study.","meaning":"Boolean indicating whether either the patient or the legally authorized representative has been informed of the investigational nature of this study."} // "the patient OR the legally authorized representative of the patient must be informed of the investigational nature of this study"
(declare-const patient_or_legally_authorized_representative_has_signed_written_informed_consent_in_accordance_with_institutional_and_federal_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if either the patient or the legally authorized representative has signed and given written informed consent in accordance with institutional guidelines and federal guidelines.","when_to_set_to_false":"Set to false if neither the patient nor the legally authorized representative has signed and given written informed consent in accordance with institutional guidelines and federal guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether either the patient or the legally authorized representative has signed and given written informed consent in accordance with institutional guidelines and federal guidelines.","meaning":"Boolean indicating whether either the patient or the legally authorized representative has signed and given written informed consent in accordance with institutional guidelines and federal guidelines."} // "the patient OR the legally authorized representative of the patient must sign AND give written informed consent (in accordance with institutional guidelines AND federal guidelines)"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
  (! patient_or_legally_authorized_representative_has_been_informed_of_investigational_nature_of_this_study
     :named REQ24_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient OR the legally authorized representative of the patient must be informed of the investigational nature of this study"

(assert
  (! patient_or_legally_authorized_representative_has_signed_written_informed_consent_in_accordance_with_institutional_and_federal_guidelines
     :named REQ24_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient OR the legally authorized representative of the patient must sign AND give written informed consent (in accordance with institutional guidelines AND federal guidelines)"
