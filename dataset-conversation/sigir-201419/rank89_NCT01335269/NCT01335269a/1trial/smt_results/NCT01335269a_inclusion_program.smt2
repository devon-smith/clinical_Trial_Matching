;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_evaluable_malignant_neoplastic_disease_now@@confirmed_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of evaluable malignant neoplastic disease (evaluable non-hematologic malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of evaluable malignant neoplastic disease (evaluable non-hematologic malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of evaluable malignant neoplastic disease (evaluable non-hematologic malignancy).","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of evaluable malignant neoplastic disease (evaluable non-hematologic malignancy)."}

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (non-hematologic malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (non-hematologic malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (non-hematologic malignancy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (non-hematologic malignancy)."}

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@confirmed_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease (non-hematologic malignancy) is confirmed.","when_to_set_to_false":"Set to false if the diagnosis is not confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is confirmed.","meaning":"Boolean indicating whether the diagnosis of malignant neoplastic disease (non-hematologic malignancy) is confirmed."}

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging Bool) ;; {"when_to_set_to_true":"Set to true if progression of malignant neoplastic disease (non-hematologic malignancy) in the last 6 months is demonstrated by serial imaging.","when_to_set_to_false":"Set to false if progression is not demonstrated by serial imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether progression is demonstrated by serial imaging.","meaning":"Boolean indicating whether progression of malignant neoplastic disease (non-hematologic malignancy) in the last 6 months is demonstrated by serial imaging."}

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progressive_in_last_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the malignant neoplastic disease (non-hematologic malignancy) has shown to be progressive in the last 6 months.","when_to_set_to_false":"Set to false if the disease has not shown to be progressive in the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease has shown to be progressive in the last 6 months.","meaning":"Boolean indicating whether the malignant neoplastic disease (non-hematologic malignancy) has shown to be progressive in the last 6 months."}

(declare-const patient_has_diagnosis_of_measurable_malignant_neoplastic_disease_now@@confirmed_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of measurable malignant neoplastic disease (measurable non-hematologic malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of measurable malignant neoplastic disease (measurable non-hematologic malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of measurable malignant neoplastic disease (measurable non-hematologic malignancy).","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of measurable malignant neoplastic disease (measurable non-hematologic malignancy)."}

(declare-const patient_has_diagnosis_of_nonresectable_malignant_neoplastic_disease_now@@confirmed_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of nonresectable malignant neoplastic disease (nonresectable non-hematologic malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of nonresectable malignant neoplastic disease (nonresectable non-hematologic malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of nonresectable malignant neoplastic disease (nonresectable non-hematologic malignancy).","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of nonresectable malignant neoplastic disease (nonresectable non-hematologic malignancy)."}

(declare-const patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplastic disease (metastatic non-hematologic malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplastic disease (metastatic non-hematologic malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplastic disease (metastatic non-hematologic malignancy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplastic disease (metastatic non-hematologic malignancy)."}

(declare-const patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now@@confirmed_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of secondary malignant neoplastic disease (metastatic non-hematologic malignancy) is confirmed.","when_to_set_to_false":"Set to false if the diagnosis is not confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is confirmed.","meaning":"Boolean indicating whether the diagnosis of secondary malignant neoplastic disease (metastatic non-hematologic malignancy) is confirmed."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@confirmed_diagnosis
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY0)) ;; "confirmed diagnosis of non-hematologic malignancy"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progressive_in_last_6_months
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY1)) ;; "non-hematologic malignancy has shown to be progressive in the last 6 months"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY2)) ;; "progression in the last 6 months as demonstrated by serial imaging"

(assert
  (! (=> patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now@@confirmed_diagnosis
         patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY3)) ;; "confirmed diagnosis of metastatic non-hematologic malignancy"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: At least one of the following confirmed diagnoses must be present
(assert
  (! (or patient_has_diagnosis_of_evaluable_malignant_neoplastic_disease_now@@confirmed_diagnosis
         patient_has_diagnosis_of_measurable_malignant_neoplastic_disease_now@@confirmed_diagnosis
         patient_has_diagnosis_of_nonresectable_malignant_neoplastic_disease_now@@confirmed_diagnosis
         patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now@@confirmed_diagnosis
         patient_has_diagnosis_of_malignant_neoplastic_disease_now@@confirmed_diagnosis)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "confirmed diagnosis of advanced, measurable, evaluable, nonresectable, or metastatic non-hematologic malignancy"

;; Component 1: The non-hematologic malignancy must be progressive in the last 6 months as demonstrated by serial imaging
(assert
  (! (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progressive_in_last_6_months
          patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "non-hematologic malignancy has shown to be progressive in the last 6 months as demonstrated by serial imaging"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_failed_conventional_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has failed conventional treatment.","when_to_set_to_false":"Set to false if the patient has not failed conventional treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has failed conventional treatment.","meaning":"Boolean indicating whether the patient has failed conventional treatment."} // "failed conventional treatment"
(declare-const patient_has_no_therapy_of_proven_efficacy_available Bool) ;; {"when_to_set_to_true":"Set to true if there is no therapy of proven efficacy available for the patient.","when_to_set_to_false":"Set to false if there is at least one therapy of proven efficacy available for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a therapy of proven efficacy available for the patient.","meaning":"Boolean indicating whether there is no therapy of proven efficacy available for the patient."} // "have no therapy of proven efficacy available"
(declare-const patient_is_not_amenable_to_established_treatment_options Bool) ;; {"when_to_set_to_true":"Set to true if the patient is NOT amenable to established treatment options.","when_to_set_to_false":"Set to false if the patient is amenable to established treatment options.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is amenable to established treatment options.","meaning":"Boolean indicating whether the patient is NOT amenable to established treatment options."} // "NOT be amenable to established treatment options"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (failed conventional treatment OR have no therapy of proven efficacy available OR NOT be amenable to established treatment options).
(assert
  (! (or patient_has_failed_conventional_treatment
         patient_has_no_therapy_of_proven_efficacy_available
         patient_is_not_amenable_to_established_treatment_options)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (failed conventional treatment OR have no therapy of proven efficacy available OR NOT be amenable to established treatment options)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_tumour_tissue_available_for_e_cadherin_expression_determination Bool) ;; {"when_to_set_to_true":"Set to true if the patient has tumour tissue available for the determination of E-cadherin expression.","when_to_set_to_false":"Set to false if the patient does not have tumour tissue available for the determination of E-cadherin expression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has tumour tissue available for the determination of E-cadherin expression.","meaning":"Boolean indicating whether the patient has tumour tissue available for the determination of E-cadherin expression."} // "the patient must have tumour tissue available for the determination of E-cadherin expression"
(declare-const patient_has_tumour_tissue_available_for_e_cadherin_expression_determination@@archived Bool) ;; {"when_to_set_to_true":"Set to true if the tumour tissue available for the determination of E-cadherin expression is archived.","when_to_set_to_false":"Set to false if the tumour tissue available for the determination of E-cadherin expression is not archived.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumour tissue available for the determination of E-cadherin expression is archived.","meaning":"Boolean indicating whether the tumour tissue available for the determination of E-cadherin expression is archived."} // "archived tumour tissue"
(declare-const patient_has_tumour_tissue_available_for_e_cadherin_expression_determination@@fresh Bool) ;; {"when_to_set_to_true":"Set to true if the tumour tissue available for the determination of E-cadherin expression is fresh (not archived).","when_to_set_to_false":"Set to false if the tumour tissue available for the determination of E-cadherin expression is not fresh (i.e., it is archived).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumour tissue available for the determination of E-cadherin expression is fresh.","meaning":"Boolean indicating whether the tumour tissue available for the determination of E-cadherin expression is fresh (not archived)."} // "fresh tumour biopsy"
(declare-const patient_has_undergone_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a biopsy now.","when_to_set_to_false":"Set to false if the patient has not undergone a biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a biopsy now.","meaning":"Boolean indicating whether the patient has undergone a biopsy now."} // "biopsy"
(declare-const patient_has_undergone_biopsy_now@@fresh Bool) ;; {"when_to_set_to_true":"Set to true if the biopsy undergone now is fresh (not archived).","when_to_set_to_false":"Set to false if the biopsy undergone now is not fresh (i.e., it is archived).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy undergone now is fresh.","meaning":"Boolean indicating whether the biopsy undergone now is fresh."} // "fresh tumour biopsy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_tumour_tissue_available_for_e_cadherin_expression_determination@@archived
         patient_has_tumour_tissue_available_for_e_cadherin_expression_determination)
     :named REQ2_AUXILIARY0)) ;; "archived tumour tissue" is a type of available tumour tissue

(assert
  (! (=> patient_has_tumour_tissue_available_for_e_cadherin_expression_determination@@fresh
         patient_has_tumour_tissue_available_for_e_cadherin_expression_determination)
     :named REQ2_AUXILIARY1)) ;; "fresh tumour biopsy" is a type of available tumour tissue

;; "fresh tumour biopsy" means both a fresh biopsy was done and the tissue is available for E-cadherin expression determination as fresh
(assert
  (! (= patient_has_tumour_tissue_available_for_e_cadherin_expression_determination@@fresh
        (and patient_has_undergone_biopsy_now@@fresh
             patient_has_undergone_biopsy_now))
     :named REQ2_AUXILIARY2)) ;; "fresh tumour biopsy" definition

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have tumour tissue available for E-cadherin expression determination, either as archived tissue or as a fresh tumour biopsy
(assert
  (! (or patient_has_tumour_tissue_available_for_e_cadherin_expression_determination@@archived
         patient_has_tumour_tissue_available_for_e_cadherin_expression_determination@@fresh)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "archived tumour tissue OR fresh tumour biopsy"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_recovered_from_reversible_toxicities_of_prior_anti_cancer_therapies_to_ctcae_grade_value Real) ;; {"when_to_set_to_value":"Set to the CTCAE grade value to which the patient has recovered from reversible toxicities (excluding alopecia) caused by prior anti-cancer therapies.","when_to_set_to_null":"Set to null if the CTCAE grade value to which the patient has recovered from reversible toxicities (excluding alopecia) caused by prior anti-cancer therapies is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the CTCAE grade to which the patient has recovered from reversible toxicities (excluding alopecia) caused by prior anti-cancer therapies."} // "the patient must have recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies to CTCAE grade < 2"
(declare-const patient_has_recovered_from_reversible_toxicities_of_prior_anti_cancer_therapies_to_ctcae_grade_value@@excluding_alopecia Bool) ;; {"when_to_set_to_true":"Set to true if the CTCAE grade value pertains to reversible toxicities excluding alopecia.","when_to_set_to_false":"Set to false if the CTCAE grade value includes alopecia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether alopecia is excluded from the CTCAE grade value.","meaning":"Boolean indicating whether alopecia is excluded from the CTCAE grade value for reversible toxicities."} // "excluding alopecia"
(declare-const patient_has_recovered_from_reversible_toxicities_of_prior_anti_cancer_therapies_to_ctcae_grade_value@@caused_by_prior_anti_cancer_therapies Bool) ;; {"when_to_set_to_true":"Set to true if the reversible toxicities are caused by prior anti-cancer therapies.","when_to_set_to_false":"Set to false if the reversible toxicities are not caused by prior anti-cancer therapies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reversible toxicities are caused by prior anti-cancer therapies.","meaning":"Boolean indicating whether the reversible toxicities are caused by prior anti-cancer therapies."} // "of prior anti-cancer therapies"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable is relevant
(assert
  (! (=> patient_has_recovered_from_reversible_toxicities_of_prior_anti_cancer_therapies_to_ctcae_grade_value@@excluding_alopecia
         true)
     :named REQ3_AUXILIARY0)) ;; "excluding alopecia" qualifier is present

(assert
  (! (=> patient_has_recovered_from_reversible_toxicities_of_prior_anti_cancer_therapies_to_ctcae_grade_value@@caused_by_prior_anti_cancer_therapies
         true)
     :named REQ3_AUXILIARY1)) ;; "caused by prior anti-cancer therapies" qualifier is present

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must have recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies to CTCAE grade < 2
(assert
  (! (and
        (< patient_has_recovered_from_reversible_toxicities_of_prior_anti_cancer_therapies_to_ctcae_grade_value 2)
        patient_has_recovered_from_reversible_toxicities_of_prior_anti_cancer_therapies_to_ctcae_grade_value@@excluding_alopecia
        patient_has_recovered_from_reversible_toxicities_of_prior_anti_cancer_therapies_to_ctcae_grade_value@@caused_by_prior_anti_cancer_therapies)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies to CTCAE grade < 2."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged 18 years"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (= patient_age_value_recorded_now_in_years 18.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be aged 18 years."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the estimated number of months if the patient's current life expectancy is documented or assessed.","when_to_set_to_null":"Set to null if the patient's current life expectancy is not documented, indeterminate, or cannot be estimated.","meaning":"Numeric value representing the patient's current life expectancy in months."} ;; "life expectancy"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: "To be included, the patient must have a life expectancy ≥ 3 months."
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_months 3.0)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_provided_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent at the current time.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent at the current time.","meaning":"Boolean indicating whether the patient has provided written informed consent at the current time."} // "provided written informed consent"
(declare-const patient_has_provided_written_informed_consent_now@@in_accordance_with_ich_gcp_and_local_legislation Bool) ;; {"when_to_set_to_true":"Set to true if the written informed consent provided by the patient is in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation.","when_to_set_to_false":"Set to false if the written informed consent provided by the patient is not in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written informed consent provided by the patient is in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation.","meaning":"Boolean indicating whether the written informed consent provided by the patient is in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation."} // "in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation"
(declare-const patient_has_provided_consent_for_pharmacokinetic_samples_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent for pharmacokinetic samples at the current time.","when_to_set_to_false":"Set to false if the patient has not provided consent for pharmacokinetic samples at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for pharmacokinetic samples at the current time.","meaning":"Boolean indicating whether the patient has provided consent for pharmacokinetic samples at the current time."} // "provided consent for pharmacokinetic samples"
(declare-const patient_has_provided_consent_for_archived_tumour_sample_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent for using an archived tumour sample at the current time.","when_to_set_to_false":"Set to false if the patient has not provided consent for using an archived tumour sample at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for using an archived tumour sample at the current time.","meaning":"Boolean indicating whether the patient has provided consent for using an archived tumour sample at the current time."} // "provided consent for using an archived tumour sample"
(declare-const patient_has_provided_consent_for_archived_tumour_sample_now@@for_determination_of_e_cadherin_status Bool) ;; {"when_to_set_to_true":"Set to true if the consent for using an archived tumour sample is specifically for determination of E-cadherin status.","when_to_set_to_false":"Set to false if the consent for using an archived tumour sample is not for determination of E-cadherin status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the consent for using an archived tumour sample is for determination of E-cadherin status.","meaning":"Boolean indicating whether the consent for using an archived tumour sample is for determination of E-cadherin status."} // "for determination of E-cadherin status"
(declare-const patient_has_provided_consent_for_reviewing_previous_tumour_scans_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent for reviewing previous tumour scans at the current time.","when_to_set_to_false":"Set to false if the patient has not provided consent for reviewing previous tumour scans at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for reviewing previous tumour scans at the current time.","meaning":"Boolean indicating whether the patient has provided consent for reviewing previous tumour scans at the current time."} // "provided consent for reviewing previous tumour scans"
(declare-const patient_has_undergone_biopsy_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided (undergone) a skin biopsy at the current time.","when_to_set_to_false":"Set to false if the patient has not provided (undergone) a skin biopsy at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided (undergone) a skin biopsy at the current time.","meaning":"Boolean indicating whether the patient has provided (undergone) a skin biopsy at the current time."} // "provided skin biopsies"
(declare-const patient_has_undergone_biopsy_of_skin_now@@dose_finding_phase_enrolled_before_protocol_amendment_03 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is in the dose finding phase and was enrolled before protocol amendment 03 when providing a skin biopsy now.","when_to_set_to_false":"Set to false if the patient is not in the dose finding phase or was not enrolled before protocol amendment 03 when providing a skin biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is in the dose finding phase and was enrolled before protocol amendment 03 when providing a skin biopsy now.","meaning":"Boolean indicating whether the patient providing a skin biopsy now is in the dose finding phase and was enrolled before protocol amendment 03."} // "in patients in dose finding phase enrolled before protocol amendment 03"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for written informed consent
(assert
  (! (=> patient_has_provided_written_informed_consent_now@@in_accordance_with_ich_gcp_and_local_legislation
         patient_has_provided_written_informed_consent_now)
     :named REQ6_AUXILIARY0)) ;; "provided written informed consent in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation"

;; Qualifier variable implies corresponding stem variable for archived tumour sample consent
(assert
  (! (=> patient_has_provided_consent_for_archived_tumour_sample_now@@for_determination_of_e_cadherin_status
         patient_has_provided_consent_for_archived_tumour_sample_now)
     :named REQ6_AUXILIARY1)) ;; "provided consent for using an archived tumour sample for determination of E-cadherin status"

;; Qualifier variable implies corresponding stem variable for skin biopsy consent
(assert
  (! (=> patient_has_undergone_biopsy_of_skin_now@@dose_finding_phase_enrolled_before_protocol_amendment_03
         patient_has_undergone_biopsy_of_skin_now)
     :named REQ6_AUXILIARY2)) ;; "provided skin biopsies, in patients in dose finding phase enrolled before protocol amendment 03"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Written informed consent in accordance with ICH/GCP and local legislation
(assert
  (! patient_has_provided_written_informed_consent_now@@in_accordance_with_ich_gcp_and_local_legislation
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided written informed consent in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation"

;; Component 1: Consent for pharmacokinetic samples
(assert
  (! patient_has_provided_consent_for_pharmacokinetic_samples_now
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided consent for pharmacokinetic samples"

;; Component 2: Consent for archived tumour sample for E-cadherin status
(assert
  (! patient_has_provided_consent_for_archived_tumour_sample_now@@for_determination_of_e_cadherin_status
     :named REQ6_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided consent for using an archived tumour sample for determination of E-cadherin status"

;; Component 3: Consent for reviewing previous tumour scans
(assert
  (! patient_has_provided_consent_for_reviewing_previous_tumour_scans_now
     :named REQ6_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided consent for reviewing previous tumour scans"

;; Component 4: Consent for skin biopsies in dose finding phase enrolled before protocol amendment 03
(assert
  (! patient_has_undergone_biopsy_of_skin_now@@dose_finding_phase_enrolled_before_protocol_amendment_03
     :named REQ6_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided skin biopsies, in patients in dose finding phase enrolled before protocol amendment 03"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value of the patient's ECOG performance score as recorded now.","when_to_set_to_null":"Set to null if the ECOG performance score is unknown, not documented, or cannot be determined now.","meaning":"Numeric value representing the patient's ECOG performance score at the current time, as an integer."} ;; "the patient must have (an Eastern Cooperative Oncology Group performance score of 0 OR an Eastern Cooperative Oncology Group performance score of 1)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (or (= eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer 0)
         (= eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer 1))
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have (an Eastern Cooperative Oncology Group performance score of 0 OR an Eastern Cooperative Oncology Group performance score of 1)"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_tumor_progression_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had tumor progression (progressive disease) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had tumor progression (progressive disease) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had tumor progression (progressive disease) within the past 6 months.","meaning":"Boolean indicating whether the patient has had tumor progression (progressive disease) within the past 6 months."} ;; "measurable progressive disease within the last 6 months"
(declare-const patient_has_finding_of_tumor_progression_inthepast6months@@determined_according_to_recist_v1_1_r09_0262 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tumor progression (progressive disease) within the past 6 months is determined according to Response Evaluation Criteria in Solid Tumours criteria (version 1.1, R09-0262).","when_to_set_to_false":"Set to false if the patient's tumor progression (progressive disease) within the past 6 months is not determined according to Response Evaluation Criteria in Solid Tumours criteria (version 1.1, R09-0262).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is determined according to Response Evaluation Criteria in Solid Tumours criteria (version 1.1, R09-0262).","meaning":"Boolean indicating whether the patient's tumor progression (progressive disease) within the past 6 months is determined according to Response Evaluation Criteria in Solid Tumours criteria (version 1.1, R09-0262)."} ;; "according to Response Evaluation Criteria in Solid Tumours criteria (version 1.1, R09-0262)"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_tumor_progression_inthepast6months@@determined_according_to_recist_v1_1_r09_0262
         patient_has_finding_of_tumor_progression_inthepast6months)
     :named REQ8_AUXILIARY0)) ;; "measurable progressive disease within the last 6 months according to Response Evaluation Criteria in Solid Tumours criteria (version 1.1, R09-0262)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_finding_of_tumor_progression_inthepast6months@@determined_according_to_recist_v1_1_r09_0262
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have measurable progressive disease within the last 6 months according to Response Evaluation Criteria in Solid Tumours criteria (version 1.1, R09-0262)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_can_undergo_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing and able to undergo a biopsy procedure.","when_to_set_to_false":"Set to false if the patient is currently unwilling or unable to undergo a biopsy procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing and able to undergo a biopsy procedure.","meaning":"Boolean indicating whether the patient is currently willing and able to undergo a biopsy procedure."} ;; "the patient must be willing to provide paired tumour biopsies for pharmacodynamic determination"
(declare-const patient_can_undergo_biopsy_now@@paired_tumour_biopsies_for_pharmacodynamic_determination Bool) ;; {"when_to_set_to_true":"Set to true if the biopsies the patient is willing and able to provide are paired tumour biopsies for pharmacodynamic determination.","when_to_set_to_false":"Set to false if the biopsies are not paired, not tumour biopsies, or not for pharmacodynamic determination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsies are paired tumour biopsies for pharmacodynamic determination.","meaning":"Boolean indicating whether the biopsies provided are paired tumour biopsies for pharmacodynamic determination."} ;; "the patient must be willing to provide paired tumour biopsies for pharmacodynamic determination"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_can_undergo_biopsy_now@@paired_tumour_biopsies_for_pharmacodynamic_determination
         patient_can_undergo_biopsy_now)
     :named REQ9_AUXILIARY0)) ;; "the patient must be willing to provide paired tumour biopsies for pharmacodynamic determination"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_can_undergo_biopsy_now@@paired_tumour_biopsies_for_pharmacodynamic_determination
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to provide paired tumour biopsies for pharmacodynamic determination"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_number_of_systemic_treatment_lines_for_metastatic_disease_value_recorded_in_history_withunit_count Int) ;; {"when_to_set_to_value":"Set to the total number of distinct lines of systemic treatment the patient has received for metastatic disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many lines of systemic treatment for metastatic disease the patient has received.","meaning":"Numeric value representing the total number of systemic treatment lines for metastatic disease received by the patient in their history (unit: count)."} // "received at least one line of systemic treatment for metastatic disease"
(declare-const patient_number_of_prior_regimens_for_metastatic_disease_value_recorded_in_history_withunit_count Int) ;; {"when_to_set_to_value":"Set to the total number of prior regimens the patient has received for metastatic disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many prior regimens for metastatic disease the patient has received.","meaning":"Numeric value representing the total number of prior regimens for metastatic disease received by the patient in their history (unit: count)."} // "not more than 2 prior regimens for metastatic disease"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: The patient should preferably have received at least one line of systemic treatment for metastatic disease
(assert
  (! (>= patient_number_of_systemic_treatment_lines_for_metastatic_disease_value_recorded_in_history_withunit_count 1)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "received at least one line of systemic treatment for metastatic disease"

;; Component 1: The patient should preferably not have received more than 2 prior regimens for metastatic disease
(assert
  (! (<= patient_number_of_prior_regimens_for_metastatic_disease_value_recorded_in_history_withunit_count 2)
     :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "not more than 2 prior regimens for metastatic disease"
