;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_advanced_non_hematologic_malignancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of advanced non-hematologic malignancy.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of advanced non-hematologic malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of advanced non-hematologic malignancy.","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of advanced non-hematologic malignancy."} // "a confirmed diagnosis of advanced non-hematologic malignancy"
(declare-const patient_has_diagnosis_of_measurable_non_hematologic_malignancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of measurable non-hematologic malignancy.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of measurable non-hematologic malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of measurable non-hematologic malignancy.","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of measurable non-hematologic malignancy."} // "a confirmed diagnosis of measurable non-hematologic malignancy"
(declare-const patient_has_diagnosis_of_evaluable_non_hematologic_malignancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of evaluable non-hematologic malignancy.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of evaluable non-hematologic malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of evaluable non-hematologic malignancy.","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of evaluable non-hematologic malignancy."} // "a confirmed diagnosis of evaluable non-hematologic malignancy"
(declare-const patient_has_diagnosis_of_nonresectable_non_hematologic_malignancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of nonresectable non-hematologic malignancy.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of nonresectable non-hematologic malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of nonresectable non-hematologic malignancy.","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of nonresectable non-hematologic malignancy."} // "a confirmed diagnosis of nonresectable non-hematologic malignancy"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of secondary (metastatic) malignant neoplastic disease (non-hematologic).","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of secondary (metastatic) malignant neoplastic disease (non-hematologic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of secondary (metastatic) malignant neoplastic disease (non-hematologic).","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary (metastatic) malignant neoplastic disease."} // "a confirmed diagnosis of metastatic non-hematologic malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of malignant neoplastic disease (non-hematologic).","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of malignant neoplastic disease (non-hematologic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of malignant neoplastic disease (non-hematologic).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} // "non-hematologic malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progressive_in_last_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient’s malignant neoplastic disease has shown to be progressive in the last 6 months.","when_to_set_to_false":"Set to false if the patient’s malignant neoplastic disease has not shown to be progressive in the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient’s malignant neoplastic disease has shown to be progressive in the last 6 months.","meaning":"Boolean indicating whether the patient’s malignant neoplastic disease is progressive in the last 6 months."} // "progressive in the last 6 months"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging Bool) ;; {"when_to_set_to_true":"Set to true if progression of the patient’s malignant neoplastic disease is demonstrated by serial imaging.","when_to_set_to_false":"Set to false if progression of the patient’s malignant neoplastic disease is not demonstrated by serial imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether progression is demonstrated by serial imaging.","meaning":"Boolean indicating whether progression of malignant neoplastic disease is demonstrated by serial imaging."} // "progression demonstrated by serial imaging"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now@@progressive_in_last_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient’s metastatic malignant neoplastic disease has shown to be progressive in the last 6 months.","when_to_set_to_false":"Set to false if the patient’s metastatic malignant neoplastic disease has not shown to be progressive in the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient’s metastatic malignant neoplastic disease has shown to be progressive in the last 6 months.","meaning":"Boolean indicating whether the patient’s metastatic malignant neoplastic disease is progressive in the last 6 months."} // "progressive in the last 6 months (metastatic)"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging Bool) ;; {"when_to_set_to_true":"Set to true if progression of the patient’s metastatic malignant neoplastic disease is demonstrated by serial imaging.","when_to_set_to_false":"Set to false if progression of the patient’s metastatic malignant neoplastic disease is not demonstrated by serial imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether progression is demonstrated by serial imaging.","meaning":"Boolean indicating whether progression of metastatic malignant neoplastic disease is demonstrated by serial imaging."} // "progression demonstrated by serial imaging (metastatic)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progressive_in_last_6_months
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY0)) ;; "the non-hematologic malignancy has shown to be progressive in the last 6 months"
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY1)) ;; "progression demonstrated by serial imaging"
(assert
  (! (=> patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now@@progressive_in_last_6_months
         patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY2)) ;; "metastatic malignancy progressive in last 6 months"
(assert
  (! (=> patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging
         patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY3)) ;; "progression demonstrated by serial imaging (metastatic)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have one of the specified confirmed diagnoses
(assert
  (! (or patient_has_diagnosis_of_advanced_non_hematologic_malignancy_now
         patient_has_diagnosis_of_measurable_non_hematologic_malignancy_now
         patient_has_diagnosis_of_evaluable_non_hematologic_malignancy_now
         patient_has_diagnosis_of_nonresectable_non_hematologic_malignancy_now
         patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a confirmed diagnosis of advanced, measurable, evaluable, nonresectable, or metastatic non-hematologic malignancy"

;; Component 1: The non-hematologic malignancy must be progressive in last 6 months as demonstrated by serial imaging
(assert
  (! (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progressive_in_last_6_months
          patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the non-hematologic malignancy has shown to be progressive in the last 6 months as demonstrated by serial imaging"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_failed_conventional_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has failed conventional treatment.","when_to_set_to_false":"Set to false if the patient has not failed conventional treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has failed conventional treatment.","meaning":"Boolean indicating whether the patient has failed conventional treatment."} // "have failed conventional treatment"
(declare-const therapy_of_proven_efficacy_is_available_to_patient Bool) ;; {"when_to_set_to_true":"Set to true if therapy of proven efficacy is available to the patient.","when_to_set_to_false":"Set to false if therapy of proven efficacy is not available to the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether therapy of proven efficacy is available to the patient.","meaning":"Boolean indicating whether therapy of proven efficacy is available to the patient."} // "have no therapy of proven efficacy available"
(declare-const patient_is_amenable_to_established_treatment_options Bool) ;; {"when_to_set_to_true":"Set to true if the patient is amenable to established treatment options.","when_to_set_to_false":"Set to false if the patient is not amenable to established treatment options.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is amenable to established treatment options.","meaning":"Boolean indicating whether the patient is amenable to established treatment options."} // "not be amenable to established treatment options"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must ((have failed conventional treatment) OR (have no therapy of proven efficacy available) OR (not be amenable to established treatment options)).
(assert
  (! (or patient_has_failed_conventional_treatment
         (not therapy_of_proven_efficacy_is_available_to_patient)
         (not patient_is_amenable_to_established_treatment_options))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_tumour_tissue_available_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tumour tissue available.","when_to_set_to_false":"Set to false if the patient currently does not have tumour tissue available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tumour tissue available.","meaning":"Boolean indicating whether the patient currently has tumour tissue available."} // "the patient must have tumour tissue available"
(declare-const patient_has_tumour_tissue_available_now@@for_determination_of_e_cadherin_expression Bool) ;; {"when_to_set_to_true":"Set to true if the patient's available tumour tissue is specifically available for determination of E-cadherin expression.","when_to_set_to_false":"Set to false if the patient's available tumour tissue is not specifically available for determination of E-cadherin expression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's available tumour tissue is specifically available for determination of E-cadherin expression.","meaning":"Boolean indicating whether the patient's available tumour tissue is specifically available for determination of E-cadherin expression."} // "for determination of E-cadherin expression"
(declare-const patient_has_tumour_tissue_available_now@@archived_or_fresh Bool) ;; {"when_to_set_to_true":"Set to true if the patient's available tumour tissue is either archived tumour tissue or fresh tumour biopsy.","when_to_set_to_false":"Set to false if the patient's available tumour tissue is neither archived tumour tissue nor fresh tumour biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's available tumour tissue is archived or fresh.","meaning":"Boolean indicating whether the patient's available tumour tissue is either archived tumour tissue or fresh tumour biopsy."} // "archived tumour tissue OR fresh tumour biopsy"
(declare-const patient_has_undergone_biopsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a biopsy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a biopsy.","meaning":"Boolean indicating whether the patient has undergone a biopsy at any time in the past."} // "biopsy"
(declare-const patient_has_undergone_biopsy_inthehistory@@fresh Bool) ;; {"when_to_set_to_true":"Set to true if the patient's biopsy is fresh.","when_to_set_to_false":"Set to false if the patient's biopsy is not fresh (e.g., archived).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's biopsy is fresh.","meaning":"Boolean indicating whether the patient's biopsy is fresh."} // "fresh tumour biopsy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_tumour_tissue_available_now@@for_determination_of_e_cadherin_expression
         patient_has_tumour_tissue_available_now)
     :named REQ2_AUXILIARY0)) ;; "for determination of E-cadherin expression"

(assert
  (! (=> patient_has_tumour_tissue_available_now@@archived_or_fresh
         patient_has_tumour_tissue_available_now)
     :named REQ2_AUXILIARY1)) ;; "archived tumour tissue OR fresh tumour biopsy"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must have tumour tissue available for determination of E-cadherin expression (archived tumour tissue OR fresh tumour biopsy)
(assert
  (! (and patient_has_tumour_tissue_available_now@@for_determination_of_e_cadherin_expression
          patient_has_tumour_tissue_available_now@@archived_or_fresh)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "tumour tissue available for determination of E-cadherin expression (archived tumour tissue OR fresh tumour biopsy)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_alopecia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alopecia.","when_to_set_to_false":"Set to false if the patient currently does not have alopecia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alopecia.","meaning":"Boolean indicating whether the patient currently has alopecia now."} // "alopecia"
(declare-const patient_has_recovered_from_reversible_toxicities_of_prior_anticancer_therapies_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time.","when_to_set_to_false":"Set to false if the patient has not recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time.","meaning":"Boolean indicating whether the patient has recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time."} // "recovered from reversible toxicities (alopecia excluded) of prior anti-cancer therapies"
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of antineoplastic agent at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of antineoplastic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of antineoplastic agent in the past.","meaning":"Boolean indicating whether the patient has undergone administration of antineoplastic agent in the past."} // "anti-cancer therapies"
(declare-const reversible_toxicity_grade_value_recorded_now_withunit_ctcae_grade Real) ;; {"when_to_set_to_value":"Set to the CTCAE grade value of any reversible toxicity (excluding alopecia) recorded at the current time.","when_to_set_to_null":"Set to null if the CTCAE grade value of reversible toxicity (excluding alopecia) at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the CTCAE grade of any reversible toxicity (excluding alopecia) recorded at the current time."} // "Common Terminology Criteria for Adverse Events grade < 2"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_has_undergone_administration_of_antineoplastic_agent_inthehistory
          patient_has_recovered_from_reversible_toxicities_of_prior_anticancer_therapies_now
          (< reversible_toxicity_grade_value_recorded_now_withunit_ctcae_grade 2))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have recovered from reversible toxicities (alopecia excluded) of prior anti-cancer therapies to Common Terminology Criteria for Adverse Events grade < 2."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "at least 18 years old"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be at least 18 years old."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "life expectancy of at least 3 months"
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the estimated number of months of life expectancy if such an estimate is available for the patient now.","when_to_set_to_null":"Set to null if no current estimate of life expectancy in months is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current estimated life expectancy in months."} // "life expectancy"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have a life expectancy of at least 3 months.
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_months 3.0)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a life expectancy of at least 3 months."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_has_provided_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent now.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent now.","meaning":"Boolean indicating whether the patient has provided written informed consent now."} // "the patient must have provided written informed consent"
(declare-const patient_has_provided_written_informed_consent_now@@in_accordance_with_ich_gcp_and_local_legislation Bool) ;; {"when_to_set_to_true":"Set to true if the written informed consent provided by the patient is in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation.","when_to_set_to_false":"Set to false if the written informed consent provided by the patient is not in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written informed consent provided by the patient is in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation.","meaning":"Boolean indicating whether the written informed consent provided by the patient is in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation."} // "in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation"
(declare-const patient_has_provided_written_informed_consent_now@@includes_consent_for_pharmacokinetic_sample_collection Bool) ;; {"when_to_set_to_true":"Set to true if the written informed consent provided by the patient now includes consent for pharmacokinetic sample collection.","when_to_set_to_false":"Set to false if the written informed consent provided by the patient now does not include consent for pharmacokinetic sample collection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written informed consent provided by the patient now includes consent for pharmacokinetic sample collection.","meaning":"Boolean indicating whether the written informed consent provided by the patient now includes consent for pharmacokinetic sample collection."} // "consent for pharmacokinetic sample collection"
(declare-const patient_has_provided_written_informed_consent_now@@includes_consent_for_using_archived_tumour_sample_for_determination_of_e_cadherin_status Bool) ;; {"when_to_set_to_true":"Set to true if the written informed consent provided by the patient now includes consent for using an archived tumour sample for determination of E-cadherin status.","when_to_set_to_false":"Set to false if the written informed consent provided by the patient now does not include consent for using an archived tumour sample for determination of E-cadherin status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written informed consent provided by the patient now includes consent for using an archived tumour sample for determination of E-cadherin status.","meaning":"Boolean indicating whether the written informed consent provided by the patient now includes consent for using an archived tumour sample for determination of E-cadherin status."} // "consent for using an archived tumour sample for determination of E-cadherin status"
(declare-const patient_has_provided_written_informed_consent_now@@includes_consent_for_reviewing_previous_tumour_scans Bool) ;; {"when_to_set_to_true":"Set to true if the written informed consent provided by the patient now includes consent for reviewing previous tumour scans.","when_to_set_to_false":"Set to false if the written informed consent provided by the patient now does not include consent for reviewing previous tumour scans.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written informed consent provided by the patient now includes consent for reviewing previous tumour scans.","meaning":"Boolean indicating whether the written informed consent provided by the patient now includes consent for reviewing previous tumour scans."} // "consent for reviewing previous tumour scans"
(declare-const patient_has_provided_written_informed_consent_now@@includes_consent_for_providing_skin_biopsies_for_patients_in_dose_finding_phase_enrolled_before_protocol_amendment_03 Bool) ;; {"when_to_set_to_true":"Set to true if the written informed consent provided by the patient now includes consent for providing skin biopsies, specifically for patients in the dose finding phase enrolled before protocol amendment 03.","when_to_set_to_false":"Set to false if the written informed consent provided by the patient now does not include consent for providing skin biopsies, specifically for patients in the dose finding phase enrolled before protocol amendment 03.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written informed consent provided by the patient now includes consent for providing skin biopsies, specifically for patients in the dose finding phase enrolled before protocol amendment 03.","meaning":"Boolean indicating whether the written informed consent provided by the patient now includes consent for providing skin biopsies, specifically for patients in the dose finding phase enrolled before protocol amendment 03."} // "consent for providing skin biopsies, in patients in dose finding phase enrolled before protocol amendment 03"
(declare-const patient_has_undergone_biopsy_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided a skin biopsy now.","when_to_set_to_false":"Set to false if the patient has not provided a skin biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided a skin biopsy now.","meaning":"Boolean indicating whether the patient has provided a skin biopsy now."} // "skin biopsies"
(declare-const patient_has_undergone_biopsy_of_skin_now@@for_patients_in_dose_finding_phase_enrolled_before_protocol_amendment_03 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is in the dose finding phase and was enrolled before protocol amendment 03 when providing a skin biopsy now.","when_to_set_to_false":"Set to false if the patient is not in the dose finding phase or was not enrolled before protocol amendment 03 when providing a skin biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is in the dose finding phase and was enrolled before protocol amendment 03 when providing a skin biopsy now.","meaning":"Boolean indicating whether the patient has provided a skin biopsy now, specifically for patients in the dose finding phase enrolled before protocol amendment 03."} // "skin biopsies, in patients in dose finding phase enrolled before protocol amendment 03"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_provided_written_informed_consent_now@@in_accordance_with_ich_gcp_and_local_legislation
         patient_has_provided_written_informed_consent_now)
     :named REQ6_AUXILIARY0)) ;; "in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation"

(assert
  (! (=> patient_has_provided_written_informed_consent_now@@includes_consent_for_pharmacokinetic_sample_collection
         patient_has_provided_written_informed_consent_now)
     :named REQ6_AUXILIARY1)) ;; "consent for pharmacokinetic sample collection"

(assert
  (! (=> patient_has_provided_written_informed_consent_now@@includes_consent_for_using_archived_tumour_sample_for_determination_of_e_cadherin_status
         patient_has_provided_written_informed_consent_now)
     :named REQ6_AUXILIARY2)) ;; "consent for using an archived tumour sample for determination of E-cadherin status"

(assert
  (! (=> patient_has_provided_written_informed_consent_now@@includes_consent_for_reviewing_previous_tumour_scans
         patient_has_provided_written_informed_consent_now)
     :named REQ6_AUXILIARY3)) ;; "consent for reviewing previous tumour scans"

(assert
  (! (=> patient_has_provided_written_informed_consent_now@@includes_consent_for_providing_skin_biopsies_for_patients_in_dose_finding_phase_enrolled_before_protocol_amendment_03
         patient_has_provided_written_informed_consent_now)
     :named REQ6_AUXILIARY4)) ;; "consent for providing skin biopsies, in patients in dose finding phase enrolled before protocol amendment 03"

;; The skin biopsy qualifier variable implies the stem variable
(assert
  (! (=> patient_has_undergone_biopsy_of_skin_now@@for_patients_in_dose_finding_phase_enrolled_before_protocol_amendment_03
         patient_has_undergone_biopsy_of_skin_now)
     :named REQ6_AUXILIARY5)) ;; "skin biopsies, in patients in dose finding phase enrolled before protocol amendment 03"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Written informed consent in accordance with ICH/GCP and local legislation
(assert
  (! patient_has_provided_written_informed_consent_now@@in_accordance_with_ich_gcp_and_local_legislation
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided written informed consent in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation"

;; Component 1: Consent for pharmacokinetic sample collection
(assert
  (! patient_has_provided_written_informed_consent_now@@includes_consent_for_pharmacokinetic_sample_collection
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "consent for pharmacokinetic sample collection"

;; Component 2: Consent for using archived tumour sample for E-cadherin status
(assert
  (! patient_has_provided_written_informed_consent_now@@includes_consent_for_using_archived_tumour_sample_for_determination_of_e_cadherin_status
     :named REQ6_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "consent for using an archived tumour sample for determination of E-cadherin status"

;; Component 3: Consent for reviewing previous tumour scans
(assert
  (! patient_has_provided_written_informed_consent_now@@includes_consent_for_reviewing_previous_tumour_scans
     :named REQ6_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "consent for reviewing previous tumour scans"

;; Component 4: For patients in dose finding phase enrolled before protocol amendment 03, consent for providing skin biopsies
(assert
  (! patient_has_provided_written_informed_consent_now@@includes_consent_for_providing_skin_biopsies_for_patients_in_dose_finding_phase_enrolled_before_protocol_amendment_03
     :named REQ6_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "consent for providing skin biopsies, in patients in dose finding phase enrolled before protocol amendment 03"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's current ECOG performance score as recorded.","when_to_set_to_null":"Set to null if the patient's current ECOG performance score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current ECOG performance score as an integer."} // "Eastern Cooperative Oncology Group performance score"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must ((have an Eastern Cooperative Oncology Group performance score of 0) OR (have an Eastern Cooperative Oncology Group performance score of 1)).
(assert
  (! (or (= eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer 0)
         (= eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer 1))
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have an Eastern Cooperative Oncology Group performance score of 0) OR (have an Eastern Cooperative Oncology Group performance score of 1))."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disease."} // "the patient must have measurable progressive disease"
(declare-const patient_has_diagnosis_of_disease_now@@progressive_in_last_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disease has demonstrated progression within the last 6 months.","when_to_set_to_false":"Set to false if the patient's disease has not demonstrated progression within the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disease has demonstrated progression within the last 6 months.","meaning":"Boolean indicating whether the patient's disease is progressive within the last 6 months."} // "progressive disease within the last 6 months"
(declare-const patient_has_diagnosis_of_disease_now@@defined_according_to_response_evaluation_criteria_in_solid_tumours_criteria_version_1_1_r09_0262 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disease is defined as measurable and progressive according to RECIST criteria (version 1.1, R09-0262).","when_to_set_to_false":"Set to false if the patient's disease is not defined as measurable and progressive according to RECIST criteria (version 1.1, R09-0262).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disease is defined as measurable and progressive according to RECIST criteria (version 1.1, R09-0262).","meaning":"Boolean indicating whether the patient's disease is defined as measurable and progressive according to RECIST criteria (version 1.1, R09-0262)."} // "measurable progressive disease ... according to Response Evaluation Criteria in Solid Tumours criteria (version 1.1, R09-0262)"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_disease_now@@progressive_in_last_6_months
         patient_has_diagnosis_of_disease_now)
     :named REQ8_AUXILIARY0)) ;; "progressive in last 6 months" implies "diagnosis of disease"

(assert
  (! (=> patient_has_diagnosis_of_disease_now@@defined_according_to_response_evaluation_criteria_in_solid_tumours_criteria_version_1_1_r09_0262
         patient_has_diagnosis_of_disease_now)
     :named REQ8_AUXILIARY1)) ;; "defined according to RECIST v1.1" implies "diagnosis of disease"

;; ===================== Constraint Assertions (REQ 8) =====================
;; The patient must have measurable progressive disease within the last 6 months according to RECIST v1.1
(assert
  (! (and patient_has_diagnosis_of_disease_now@@progressive_in_last_6_months
          patient_has_diagnosis_of_disease_now@@defined_according_to_response_evaluation_criteria_in_solid_tumours_criteria_version_1_1_r09_0262)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "measurable progressive disease within the last 6 months according to RECIST v1.1"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_can_undergo_biopsy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able and willing to undergo a biopsy procedure in the future.","when_to_set_to_false":"Set to false if the patient is unable or unwilling to undergo a biopsy procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo a biopsy procedure in the future.","meaning":"Boolean indicating whether the patient can undergo a biopsy procedure in the future."} // "the patient must be willing to provide paired tumour biopsies for pharmacodynamic determination"
(declare-const patient_can_undergo_biopsy_inthefuture@@paired_tumour_biopsies Bool) ;; {"when_to_set_to_true":"Set to true if the biopsy procedure the patient can undergo in the future is specifically paired tumour biopsies.","when_to_set_to_false":"Set to false if the biopsy procedure is not paired tumour biopsies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy is paired tumour biopsies.","meaning":"Boolean indicating whether the biopsy procedure is specifically paired tumour biopsies."} // "paired tumour biopsies"
(declare-const patient_can_undergo_biopsy_inthefuture@@for_pharmacodynamic_determination Bool) ;; {"when_to_set_to_true":"Set to true if the biopsy procedure the patient can undergo in the future is intended for pharmacodynamic determination.","when_to_set_to_false":"Set to false if the biopsy procedure is not intended for pharmacodynamic determination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy is for pharmacodynamic determination.","meaning":"Boolean indicating whether the biopsy procedure is for pharmacodynamic determination."} // "for pharmacodynamic determination"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_can_undergo_biopsy_inthefuture@@paired_tumour_biopsies
         patient_can_undergo_biopsy_inthefuture)
     :named REQ9_AUXILIARY0)) ;; "paired tumour biopsies"

(assert
  (! (=> patient_can_undergo_biopsy_inthefuture@@for_pharmacodynamic_determination
         patient_can_undergo_biopsy_inthefuture)
     :named REQ9_AUXILIARY1)) ;; "for pharmacodynamic determination"

;; ===================== Constraint Assertions (REQ 9) =====================
;; The patient must be willing to provide paired tumour biopsies for pharmacodynamic determination
(assert
  (! (and patient_can_undergo_biopsy_inthefuture@@paired_tumour_biopsies
          patient_can_undergo_biopsy_inthefuture@@for_pharmacodynamic_determination)
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to provide paired tumour biopsies for pharmacodynamic determination"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_adenocarcinoma_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has oesophageal carcinoma of adenocarcinoma histology.","when_to_set_to_false":"Set to false if the patient currently does not have oesophageal carcinoma of adenocarcinoma histology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has oesophageal carcinoma of adenocarcinoma histology.","meaning":"Boolean indicating whether the patient currently has oesophageal carcinoma of adenocarcinoma histology."} // "oesophageal carcinoma of adenocarcinoma histology"
(declare-const patient_has_finding_of_squamous_cell_carcinoma_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has oesophageal carcinoma of squamous cell histology.","when_to_set_to_false":"Set to false if the patient currently does not have oesophageal carcinoma of squamous cell histology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has oesophageal carcinoma of squamous cell histology.","meaning":"Boolean indicating whether the patient currently has oesophageal carcinoma of squamous cell histology."} // "oesophageal carcinoma of squamous cell histology"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (or patient_has_finding_of_adenocarcinoma_of_esophagus_now
         patient_has_finding_of_squamous_cell_carcinoma_of_esophagus_now)
     :named REQ10_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have oesophageal carcinoma of adenocarcinoma histology) OR (have oesophageal carcinoma of squamous cell histology))."

;; ===================== Declarations for the inclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_malignant_tumor_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of the esophagus (oesophageal carcinoma), regardless of histological subtype.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of the esophagus (oesophageal carcinoma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of the esophagus (oesophageal carcinoma).","meaning":"Boolean indicating whether the patient currently has a malignant tumor of the esophagus (oesophageal carcinoma), regardless of histological subtype."} // "the patient must have oesophageal carcinoma"
(declare-const number_of_previous_lines_of_systemic_treatment_for_metastatic_disease_value_recorded_ever_withunit_count Real) ;; {"when_to_set_to_value":"Set to the integer value representing the total number of previous lines of systemic treatment the patient has received for metastatic disease, recorded at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many previous lines of systemic treatment for metastatic disease the patient has received.","meaning":"Numeric variable indicating the total number of previous lines of systemic treatment the patient has received for metastatic disease, recorded at any time in the past. The unit is count (integer number of lines)."} // "not more than two previous lines of systemic treatment for metastatic disease"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Oesophageal carcinoma includes both adenocarcinoma and squamous cell carcinoma subtypes (exhaustive subcategories)
(assert
  (! (= patient_has_finding_of_malignant_tumor_of_esophagus_now
        (or patient_has_finding_of_adenocarcinoma_of_esophagus_now
            patient_has_finding_of_squamous_cell_carcinoma_of_esophagus_now))
     :named REQ11_AUXILIARY0)) ;; "oesophageal carcinoma" ≡ (adenocarcinoma of esophagus OR squamous cell carcinoma of esophagus)

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 0: Patient must have oesophageal carcinoma
(assert
  (! patient_has_finding_of_malignant_tumor_of_esophagus_now
     :named REQ11_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have oesophageal carcinoma"

;; Component 1: Patient must have received not more than two previous lines of systemic treatment for metastatic disease
(assert
  (! (<= number_of_previous_lines_of_systemic_treatment_for_metastatic_disease_value_recorded_ever_withunit_count 2)
     :named REQ11_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "not more than two previous lines of systemic treatment for metastatic disease"
