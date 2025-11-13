;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; "malignancy" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of malignant neoplastic disease."}
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@measurable Bool) ;; "measurable malignancy" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of malignant neoplastic disease and the malignancy is measurable.","when_to_set_to_false":"Set to false if the patient currently has a confirmed diagnosis of malignant neoplastic disease but the malignancy is not measurable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy is measurable.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease is measurable."}
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@evaluable Bool) ;; "evaluable malignancy" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of malignant neoplastic disease and the malignancy is evaluable.","when_to_set_to_false":"Set to false if the patient currently has a confirmed diagnosis of malignant neoplastic disease but the malignancy is not evaluable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy is evaluable.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease is evaluable."}
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@nonresectable Bool) ;; "nonresectable malignancy" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of malignant neoplastic disease and the malignancy is nonresectable.","when_to_set_to_false":"Set to false if the patient currently has a confirmed diagnosis of malignant neoplastic disease but the malignancy is resectable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy is nonresectable.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease is nonresectable."}
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@metastatic_non_hematologic Bool) ;; "metastatic non-hematologic malignancy" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of malignant neoplastic disease and the malignancy is metastatic non-hematologic.","when_to_set_to_false":"Set to false if the patient currently has a confirmed diagnosis of malignant neoplastic disease but the malignancy is not metastatic non-hematologic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy is metastatic non-hematologic.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease is metastatic non-hematologic."}
(declare-const patient_has_diagnosis_of_tumor_of_advanced_extent_now Bool) ;; "advanced malignancy" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of advanced malignancy.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of advanced malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of advanced malignancy.","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of advanced malignancy."}
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progressive_in_last_6_months Bool) ;; "malignancy has been shown to be progressive in the last 6 months" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of malignant neoplastic disease and the malignancy has been shown to be progressive in the last 6 months.","when_to_set_to_false":"Set to false if the patient currently has a confirmed diagnosis of malignant neoplastic disease but the malignancy has not been shown to be progressive in the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy has been shown to be progressive in the last 6 months.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease is progressive in the last 6 months."}
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging Bool) ;; "progression as demonstrated by serial imaging" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of malignant neoplastic disease and progression has been demonstrated by serial imaging.","when_to_set_to_false":"Set to false if the patient currently has a confirmed diagnosis of malignant neoplastic disease but progression has not been demonstrated by serial imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether progression has been demonstrated by serial imaging.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease progression is demonstrated by serial imaging."}
(declare-const patient_has_diagnosis_of_tumor_of_advanced_extent_now@@progressive_in_last_6_months Bool) ;; "advanced malignancy has been shown to be progressive in the last 6 months" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of advanced malignancy and the malignancy has been shown to be progressive in the last 6 months.","when_to_set_to_false":"Set to false if the patient currently has a confirmed diagnosis of advanced malignancy but the malignancy has not been shown to be progressive in the last 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy has been shown to be progressive in the last 6 months.","meaning":"Boolean indicating whether the patient's advanced malignancy is progressive in the last 6 months."}
(declare-const patient_has_diagnosis_of_tumor_of_advanced_extent_now@@progression_demonstrated_by_serial_imaging Bool) ;; "progression of advanced malignancy as demonstrated by serial imaging" {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of advanced malignancy and progression has been demonstrated by serial imaging.","when_to_set_to_false":"Set to false if the patient currently has a confirmed diagnosis of advanced malignancy but progression has not been demonstrated by serial imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether progression has been demonstrated by serial imaging.","meaning":"Boolean indicating whether the patient's advanced malignancy progression is demonstrated by serial imaging."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@measurable
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY0)) ;; "measurable malignancy"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@evaluable
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY1)) ;; "evaluable malignancy"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@nonresectable
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY2)) ;; "nonresectable malignancy"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@metastatic_non_hematologic
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY3)) ;; "metastatic non-hematologic malignancy"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progressive_in_last_6_months
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY4)) ;; "malignancy progressive in last 6 months"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY5)) ;; "progression demonstrated by serial imaging"

(assert
  (! (=> patient_has_diagnosis_of_tumor_of_advanced_extent_now@@progressive_in_last_6_months
         patient_has_diagnosis_of_tumor_of_advanced_extent_now)
     :named REQ0_AUXILIARY6)) ;; "advanced malignancy progressive in last 6 months"

(assert
  (! (=> patient_has_diagnosis_of_tumor_of_advanced_extent_now@@progression_demonstrated_by_serial_imaging
         patient_has_diagnosis_of_tumor_of_advanced_extent_now)
     :named REQ0_AUXILIARY7)) ;; "progression of advanced malignancy demonstrated by serial imaging"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: (a confirmed diagnosis of advanced malignancy OR a confirmed diagnosis of measurable malignancy OR a confirmed diagnosis of evaluable malignancy OR a confirmed diagnosis of nonresectable malignancy OR a confirmed diagnosis of metastatic non-hematologic malignancy)
(assert
  (! (or patient_has_diagnosis_of_tumor_of_advanced_extent_now
         patient_has_diagnosis_of_malignant_neoplastic_disease_now@@measurable
         patient_has_diagnosis_of_malignant_neoplastic_disease_now@@evaluable
         patient_has_diagnosis_of_malignant_neoplastic_disease_now@@nonresectable
         patient_has_diagnosis_of_malignant_neoplastic_disease_now@@metastatic_non_hematologic)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a confirmed diagnosis of advanced malignancy OR a confirmed diagnosis of measurable malignancy OR a confirmed diagnosis of evaluable malignancy OR a confirmed diagnosis of nonresectable malignancy OR a confirmed diagnosis of metastatic non-hematologic malignancy)."

;; Component 1: the malignancy has been shown to be progressive in the last 6 months as demonstrated by serial imaging
(assert
  (! (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progressive_in_last_6_months
          patient_has_diagnosis_of_malignant_neoplastic_disease_now@@progression_demonstrated_by_serial_imaging)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the malignancy has been shown to be progressive in the last 6 months as demonstrated by serial imaging"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_therapeutic_procedure_inthehistory_outcome_is_negative@@is_conventional Bool) ;; "failed conventional treatment" {"when_to_set_to_true":"Set to true if the therapeutic procedure undergone by the patient is conventional.","when_to_set_to_false":"Set to false if the therapeutic procedure undergone by the patient is not conventional.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapeutic procedure is conventional.","meaning":"Boolean indicating whether the therapeutic procedure is conventional."}
(declare-const patient_has_undergone_therapeutic_procedure_inthehistory_outcome_is_negative Bool) ;; "failed conventional treatment" {"when_to_set_to_true":"Set to true if the patient has undergone a therapeutic procedure (treatment) in the history and the outcome was negative (treatment failed).","when_to_set_to_false":"Set to false if the patient has undergone a therapeutic procedure (treatment) in the history and the outcome was not negative (treatment did not fail).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a therapeutic procedure (treatment) in the history and the outcome was negative.","meaning":"Boolean indicating whether the patient has undergone a therapeutic procedure (treatment) in the history and the outcome was negative (treatment failed)."}
(declare-const therapy_of_proven_efficacy_is_available_now Bool) ;; "have no therapy of proven efficacy available" {"when_to_set_to_true":"Set to true if a therapy of proven efficacy is currently available for the patient.","when_to_set_to_false":"Set to false if a therapy of proven efficacy is not currently available for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a therapy of proven efficacy is currently available for the patient.","meaning":"Boolean indicating whether a therapy of proven efficacy is currently available for the patient."}
(declare-const patient_can_undergo_therapeutic_procedure_now Bool) ;; "amenable to established treatment options" {"when_to_set_to_true":"Set to true if the patient can currently undergo a therapeutic procedure (treatment) now.","when_to_set_to_false":"Set to false if the patient cannot currently undergo a therapeutic procedure (treatment) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a therapeutic procedure (treatment) now.","meaning":"Boolean indicating whether the patient can currently undergo a therapeutic procedure (treatment) now."}
(declare-const patient_can_undergo_therapeutic_procedure_now@@is_established Bool) ;; "amenable to established treatment options" {"when_to_set_to_true":"Set to true if the therapeutic procedure is established.","when_to_set_to_false":"Set to false if the therapeutic procedure is not established.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapeutic procedure is established.","meaning":"Boolean indicating whether the therapeutic procedure is established."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for failed conventional treatment implies both failure and conventionality
(assert
  (! (=> patient_has_undergone_therapeutic_procedure_inthehistory_outcome_is_negative@@is_conventional
         patient_has_undergone_therapeutic_procedure_inthehistory_outcome_is_negative)
     :named REQ1_AUXILIARY0)) ;; "failed conventional treatment"

;; Qualifier variable for established treatment amenability implies general amenability
(assert
  (! (=> patient_can_undergo_therapeutic_procedure_now@@is_established
         patient_can_undergo_therapeutic_procedure_now)
     :named REQ1_AUXILIARY1)) ;; "amenable to established treatment options"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have (failed conventional treatment OR have no therapy of proven efficacy available OR NOT be amenable to established treatment options)
(assert
  (! (or patient_has_undergone_therapeutic_procedure_inthehistory_outcome_is_negative@@is_conventional
         (not therapy_of_proven_efficacy_is_available_now)
         (not patient_can_undergo_therapeutic_procedure_now@@is_established))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (failed conventional treatment OR have no therapy of proven efficacy available OR NOT be amenable to established treatment options)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_e_cadherin_expression_determination_possible_now Bool) ;; "tumour tissue available for the determination of E-cadherin expression" {"when_to_set_to_true":"Set to true if it is currently possible to determine E-cadherin expression from the patient's available tumour tissue.","when_to_set_to_false":"Set to false if it is currently not possible to determine E-cadherin expression from the patient's available tumour tissue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether E-cadherin expression can be determined from the patient's available tumour tissue.","meaning":"Boolean indicating whether it is currently possible to determine E-cadherin expression from the patient's available tumour tissue."}
(declare-const patient_has_tumour_tissue_available_now Bool) ;; "tumour tissue available" {"when_to_set_to_true":"Set to true if the patient currently has tumour tissue available.","when_to_set_to_false":"Set to false if the patient currently does not have tumour tissue available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tumour tissue available.","meaning":"Boolean indicating whether the patient currently has tumour tissue available."}
(declare-const patient_has_tumour_tissue_available_now@@archived Bool) ;; "archived tumour tissue" {"when_to_set_to_true":"Set to true if the patient's currently available tumour tissue is archived.","when_to_set_to_false":"Set to false if the patient's currently available tumour tissue is not archived (e.g., is fresh).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's currently available tumour tissue is archived.","meaning":"Boolean indicating whether the patient's currently available tumour tissue is archived."}
(declare-const patient_has_undergone_biopsy_inthehistory Bool) ;; "fresh tumour biopsy" {"when_to_set_to_true":"Set to true if the patient has undergone a biopsy procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a biopsy procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a biopsy procedure in the past.","meaning":"Boolean indicating whether the patient has undergone a biopsy procedure at any time in the past."}
(declare-const patient_has_undergone_biopsy_inthehistory@@fresh Bool) ;; "fresh tumour biopsy" {"when_to_set_to_true":"Set to true if the biopsy procedure was performed on fresh tissue.","when_to_set_to_false":"Set to false if the biopsy procedure was not performed on fresh tissue (e.g., was archived or otherwise not fresh).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy was performed on fresh tissue.","meaning":"Boolean indicating whether the biopsy procedure was performed on fresh tissue."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Archived tumour tissue or fresh tumour biopsy are both sufficient for "tumour tissue available"
(assert
  (! (= patient_has_tumour_tissue_available_now
        (or patient_has_tumour_tissue_available_now@@archived
            (and patient_has_undergone_biopsy_inthehistory
                 patient_has_undergone_biopsy_inthehistory@@fresh)))
     :named REQ2_AUXILIARY0)) ;; "archived tumour tissue OR fresh tumour biopsy"

;; If tumour tissue is available, E-cadherin expression determination is possible
(assert
  (! (=> patient_has_tumour_tissue_available_now
         patient_has_e_cadherin_expression_determination_possible_now)
     :named REQ2_AUXILIARY1)) ;; "tumour tissue available for the determination of E-cadherin expression"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_e_cadherin_expression_determination_possible_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have tumour tissue available for the determination of E-cadherin expression (archived tumour tissue OR fresh tumour biopsy)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_alopecia_now Bool) ;; "alopecia" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alopecia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alopecia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alopecia.","meaning":"Boolean indicating whether the patient currently has alopecia."}
(declare-const patient_has_recovered_from_reversible_toxicities_of_prior_anticancer_therapies_now Bool) ;; "recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time" {"when_to_set_to_true":"Set to true if the patient has recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time.","when_to_set_to_false":"Set to false if the patient has not recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time.","meaning":"Boolean indicating whether the patient has recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time."}
(declare-const patient_has_recovered_from_reversible_toxicities_of_prior_anticancer_therapies_now@@graded_by_common_terminology_criteria_for_adverse_events Bool) ;; "recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies at the current time, and the toxicities are graded by the Common Terminology Criteria for Adverse Events" {"when_to_set_to_true":"Set to true if the reversible toxicities (excluding alopecia) of prior anti-cancer therapies are graded by the Common Terminology Criteria for Adverse Events.","when_to_set_to_false":"Set to false if the reversible toxicities (excluding alopecia) of prior anti-cancer therapies are not graded by the Common Terminology Criteria for Adverse Events.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reversible toxicities (excluding alopecia) of prior anti-cancer therapies are graded by the Common Terminology Criteria for Adverse Events.","meaning":"Boolean indicating whether the reversible toxicities (excluding alopecia) of prior anti-cancer therapies are graded by the Common Terminology Criteria for Adverse Events."}
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory Bool) ;; "anti-cancer therapies" {"when_to_set_to_true":"Set to true if the patient has undergone administration of antineoplastic agent(s) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of antineoplastic agent(s).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of antineoplastic agent(s) in the past.","meaning":"Boolean indicating whether the patient has undergone administration of antineoplastic agent(s) in the past."}
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@toxicity_grading_by_common_terminology_criteria_for_adverse_events Bool) ;; "toxicities associated with the patient's prior administration of antineoplastic agent(s) are graded according to the Common Terminology Criteria for Adverse Events" {"when_to_set_to_true":"Set to true if the toxicities from prior administration of antineoplastic agent(s) are graded according to the Common Terminology Criteria for Adverse Events.","when_to_set_to_false":"Set to false if the toxicities are not graded according to the Common Terminology Criteria for Adverse Events.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the toxicities are graded by the Common Terminology Criteria for Adverse Events.","meaning":"Boolean indicating whether toxicities from prior administration of antineoplastic agent(s) are graded by the Common Terminology Criteria for Adverse Events."}
(declare-const patient_toxicity_grade_of_prior_anticancer_therapies_now_value_in_integer Int) ;; "Common Terminology Criteria for Adverse Events grade (integer value) of the patient's reversible toxicities (excluding alopecia) from prior anti-cancer therapies at the current time" {"when_to_set_to_value":"Set to the integer value representing the Common Terminology Criteria for Adverse Events grade of the patient's reversible toxicities (excluding alopecia) from prior anti-cancer therapies at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the Common Terminology Criteria for Adverse Events grade is for the patient's reversible toxicities (excluding alopecia) from prior anti-cancer therapies at the current time.","meaning":"Numeric variable indicating the Common Terminology Criteria for Adverse Events grade (integer value) of the patient's reversible toxicities (excluding alopecia) from prior anti-cancer therapies at the current time."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_recovered_from_reversible_toxicities_of_prior_anticancer_therapies_now@@graded_by_common_terminology_criteria_for_adverse_events
         patient_has_recovered_from_reversible_toxicities_of_prior_anticancer_therapies_now)
     :named REQ3_AUXILIARY0)) ;; "the patient must have recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies to Common Terminology Criteria for Adverse Events grade less than 2."

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_undergone_administration_of_antineoplastic_agent_inthehistory@@toxicity_grading_by_common_terminology_criteria_for_adverse_events
         patient_has_undergone_administration_of_antineoplastic_agent_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "anti-cancer therapies" and "graded by the Common Terminology Criteria for Adverse Events"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_has_recovered_from_reversible_toxicities_of_prior_anticancer_therapies_now
          patient_has_recovered_from_reversible_toxicities_of_prior_anticancer_therapies_now@@graded_by_common_terminology_criteria_for_adverse_events
          (< patient_toxicity_grade_of_prior_anticancer_therapies_now_value_in_integer 2))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have recovered from reversible toxicities (excluding alopecia) of prior anti-cancer therapies to Common Terminology Criteria for Adverse Events grade less than 2."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "aged ≥ 18 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; "life expectancy of ≥ 3 months" {"when_to_set_to_value":"Set to the estimated number of months of life expectancy for the patient, as assessed now, if available.","when_to_set_to_null":"Set to null if no current estimate of life expectancy in months is available or cannot be determined.","meaning":"Numeric value (in months) representing the patient's current estimated life expectancy."}

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: The patient must have a life expectancy of ≥ 3 months.
(assert
  (! (>= patient_longevity_value_recorded_now_withunit_months 3.0)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a life expectancy of ≥ 3 months."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_provided_written_informed_consent_now Bool) ;; "To be included, the patient must have provided written informed consent in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation." {"when_to_set_to_true":"Set to true if the patient has provided written informed consent at the current time.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent at the current time.","meaning":"Boolean indicating whether the patient has provided written informed consent at the current time."}
(declare-const patient_has_provided_written_informed_consent_now@@in_accordance_with_ich_gcp_and_local_legislation Bool) ;; "To be included, the patient must have provided written informed consent in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation." {"when_to_set_to_true":"Set to true if the written informed consent provided by the patient is in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation.","when_to_set_to_false":"Set to false if the written informed consent provided by the patient is not in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the written informed consent is in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation.","meaning":"Boolean indicating whether the written informed consent is in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation."}
(declare-const patient_has_provided_consent_for_pharmacokinetic_sample_collection_now Bool) ;; "To be included, the patient must have provided consent for pharmacokinetic sample collection." {"when_to_set_to_true":"Set to true if the patient has provided consent for pharmacokinetic sample collection at the current time.","when_to_set_to_false":"Set to false if the patient has not provided consent for pharmacokinetic sample collection at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for pharmacokinetic sample collection at the current time.","meaning":"Boolean indicating whether the patient has provided consent for pharmacokinetic sample collection at the current time."}
(declare-const patient_has_provided_consent_for_use_of_archived_tumour_sample_now Bool) ;; "To be included, the patient must have provided consent for using an archived tumour sample for determination of E-cadherin status." {"when_to_set_to_true":"Set to true if the patient has provided consent for use of an archived tumour sample at the current time.","when_to_set_to_false":"Set to false if the patient has not provided consent for use of an archived tumour sample at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for use of an archived tumour sample at the current time.","meaning":"Boolean indicating whether the patient has provided consent for use of an archived tumour sample at the current time."}
(declare-const patient_has_provided_consent_for_use_of_archived_tumour_sample_now@@for_determination_of_e_cadherin_status Bool) ;; "To be included, the patient must have provided consent for using an archived tumour sample for determination of E-cadherin status." {"when_to_set_to_true":"Set to true if the consent for use of an archived tumour sample is specifically for determination of E-cadherin status.","when_to_set_to_false":"Set to false if the consent for use of an archived tumour sample is not for determination of E-cadherin status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the consent for use of an archived tumour sample is for determination of E-cadherin status.","meaning":"Boolean indicating whether the consent for use of an archived tumour sample is for determination of E-cadherin status."}
(declare-const patient_has_provided_consent_for_review_of_previous_tumour_scans_now Bool) ;; "To be included, the patient must have provided consent for reviewing previous tumour scans." {"when_to_set_to_true":"Set to true if the patient has provided consent for review of previous tumour scans at the current time.","when_to_set_to_false":"Set to false if the patient has not provided consent for review of previous tumour scans at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for review of previous tumour scans at the current time.","meaning":"Boolean indicating whether the patient has provided consent for review of previous tumour scans at the current time."}
(declare-const patient_has_undergone_biopsy_of_skin_now Bool) ;; "To be included, for patients in dose finding phase enrolled before protocol amendment 03, the patient must have provided consent for providing skin biopsies." {"when_to_set_to_true":"Set to true if the patient has provided a skin biopsy at the current time.","when_to_set_to_false":"Set to false if the patient has not provided a skin biopsy at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided a skin biopsy at the current time.","meaning":"Boolean indicating whether the patient has provided a skin biopsy now."}
(declare-const patient_has_undergone_biopsy_of_skin_now@@dose_finding_phase_enrolled_before_protocol_amendment_03 Bool) ;; "To be included, for patients in dose finding phase enrolled before protocol amendment 03, the patient must have provided consent for providing skin biopsies." {"when_to_set_to_true":"Set to true if the patient is in the dose finding phase and was enrolled before protocol amendment 03 when providing a skin biopsy now.","when_to_set_to_false":"Set to false if the patient is not in the dose finding phase enrolled before protocol amendment 03 when providing a skin biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is in the dose finding phase enrolled before protocol amendment 03 when providing a skin biopsy now.","meaning":"Boolean indicating whether the patient providing a skin biopsy now is in the dose finding phase enrolled before protocol amendment 03."}

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for written informed consent
(assert
  (! (=> patient_has_provided_written_informed_consent_now@@in_accordance_with_ich_gcp_and_local_legislation
         patient_has_provided_written_informed_consent_now)
     :named REQ6_AUXILIARY0)) ;; "provided written informed consent in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation"

;; Qualifier variable implies corresponding stem variable for archived tumour sample consent
(assert
  (! (=> patient_has_provided_consent_for_use_of_archived_tumour_sample_now@@for_determination_of_e_cadherin_status
         patient_has_provided_consent_for_use_of_archived_tumour_sample_now)
     :named REQ6_AUXILIARY1)) ;; "provided consent for using an archived tumour sample for determination of E-cadherin status"

;; Qualifier variable implies corresponding stem variable for skin biopsy consent in dose finding phase before protocol amendment 03
(assert
  (! (=> patient_has_undergone_biopsy_of_skin_now@@dose_finding_phase_enrolled_before_protocol_amendment_03
         patient_has_undergone_biopsy_of_skin_now)
     :named REQ6_AUXILIARY2)) ;; "provided consent for providing skin biopsies in dose finding phase enrolled before protocol amendment 03"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Written informed consent in accordance with ICH/GCP and local legislation
(assert
  (! patient_has_provided_written_informed_consent_now@@in_accordance_with_ich_gcp_and_local_legislation
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided written informed consent in accordance with International Conference on Harmonisation/Good Clinical Practice and local legislation"

;; Component 1: Consent for pharmacokinetic sample collection
(assert
  (! patient_has_provided_consent_for_pharmacokinetic_sample_collection_now
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided consent for pharmacokinetic sample collection"

;; Component 2: Consent for using archived tumour sample for E-cadherin status
(assert
  (! patient_has_provided_consent_for_use_of_archived_tumour_sample_now@@for_determination_of_e_cadherin_status
     :named REQ6_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided consent for using an archived tumour sample for determination of E-cadherin status"

;; Component 3: Consent for reviewing previous tumour scans
(assert
  (! patient_has_provided_consent_for_review_of_previous_tumour_scans_now
     :named REQ6_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided consent for reviewing previous tumour scans"

;; Component 4: For patients in dose finding phase enrolled before protocol amendment 03, consent for providing skin biopsies
(assert
  (! patient_has_undergone_biopsy_of_skin_now@@dose_finding_phase_enrolled_before_protocol_amendment_03
     :named REQ6_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided consent for providing skin biopsies in dose finding phase enrolled before protocol amendment 03"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer Int) ;; "Numeric variable indicating the patient's Eastern Cooperative Oncology Group (ECOG) performance score, recorded at the current time, as an integer value." {"when_to_set_to_value":"Set to the integer value of the patient's ECOG performance score as recorded at the current time.","when_to_set_to_null":"Set to null if the ECOG performance score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric variable representing the patient's ECOG performance score (integer) at the current time."}

;; ===================== Constraint Assertions (REQ 7) =====================
;; To be included, the patient must have (an Eastern Cooperative Oncology Group performance score of 0 OR an Eastern Cooperative Oncology Group performance score of 1).
(assert
  (! (or (= eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer 0)
         (= eastern_cooperative_oncology_group_performance_score_value_recorded_now_withunit_integer 1))
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (an Eastern Cooperative Oncology Group performance score of 0 OR an Eastern Cooperative Oncology Group performance score of 1)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_progressive_disease_in_last_6_months_according_to_recist_v1_1 Bool) ;; "measurable progressive disease within the last 6 months according to RECIST criteria version 1.1" {"when_to_set_to_true":"Set to true if the patient has measurable progressive disease within the last 6 months as determined by RECIST criteria version 1.1.","when_to_set_to_false":"Set to false if the patient does not have measurable progressive disease within the last 6 months as determined by RECIST criteria version 1.1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has measurable progressive disease within the last 6 months according to RECIST criteria version 1.1.","meaning":"Boolean indicating whether the patient has measurable progressive disease within the last 6 months according to RECIST criteria version 1.1."}
(declare-const patient_has_finding_of_progressive_disease_in_last_6_months_according_to_recist_v1_1@@recist_v1_1_r09_0262 Bool) ;; "measurable progressive disease within the last 6 months according to RECIST criteria version 1.1 (R09-0262)" {"when_to_set_to_true":"Set to true if the assessment of measurable progressive disease within the last 6 months is performed according to RECIST criteria version 1.1 (R09-0262).","when_to_set_to_false":"Set to false if the assessment is not performed according to RECIST criteria version 1.1 (R09-0262).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the assessment was performed according to RECIST criteria version 1.1 (R09-0262).","meaning":"Boolean indicating whether the assessment of measurable progressive disease within the last 6 months is performed according to RECIST criteria version 1.1 (R09-0262)."}
(declare-const patient_has_finding_of_tumor_progression_now Bool) ;; "progressive disease" {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of tumor progression.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of tumor progression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of tumor progression.","meaning":"Boolean indicating whether the patient currently has a clinical finding of tumor progression."}

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_progressive_disease_in_last_6_months_according_to_recist_v1_1@@recist_v1_1_r09_0262
         patient_has_finding_of_progressive_disease_in_last_6_months_according_to_recist_v1_1)
     :named REQ8_AUXILIARY0)) ;; "measurable progressive disease within the last 6 months according to RECIST criteria version 1.1 (R09-0262)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_finding_of_progressive_disease_in_last_6_months_according_to_recist_v1_1@@recist_v1_1_r09_0262
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have measurable progressive disease within the last 6 months according to RECIST criteria (version 1.1, R09-0262)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_can_undergo_biopsy_now Bool) ;; "To be included, the patient must be willing to provide paired tumour biopsies for pharmacodynamic determination." {"when_to_set_to_true":"Set to true if the patient is currently willing and able to undergo a biopsy.","when_to_set_to_false":"Set to false if the patient is currently not willing or unable to undergo a biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing and able to undergo a biopsy now.","meaning":"Boolean indicating whether the patient is currently willing and able to undergo a biopsy."}
(declare-const patient_can_undergo_biopsy_now@@paired Bool) ;; "paired tumour biopsies" {"when_to_set_to_true":"Set to true if the patient can undergo biopsy now and the biopsies are paired.","when_to_set_to_false":"Set to false if the patient can undergo biopsy now but the biopsies are not paired.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsies are paired.","meaning":"Boolean indicating whether the biopsies provided are paired."}
(declare-const patient_can_undergo_biopsy_now@@tumour_tissue Bool) ;; "tumour biopsies" {"when_to_set_to_true":"Set to true if the patient can undergo biopsy now and the biopsies are of tumour tissue.","when_to_set_to_false":"Set to false if the patient can undergo biopsy now but the biopsies are not of tumour tissue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsies are of tumour tissue.","meaning":"Boolean indicating whether the biopsies provided are of tumour tissue."}
(declare-const patient_can_undergo_biopsy_now@@for_pharmacodynamic_determination Bool) ;; "for pharmacodynamic determination" {"when_to_set_to_true":"Set to true if the patient can undergo biopsy now and the biopsies are for pharmacodynamic determination.","when_to_set_to_false":"Set to false if the patient can undergo biopsy now but the biopsies are not for pharmacodynamic determination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsies are for pharmacodynamic determination.","meaning":"Boolean indicating whether the biopsies provided are for pharmacodynamic determination."}

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_can_undergo_biopsy_now@@paired
         patient_can_undergo_biopsy_now)
     :named REQ9_AUXILIARY0)) ;; "paired tumour biopsies"

(assert
  (! (=> patient_can_undergo_biopsy_now@@tumour_tissue
         patient_can_undergo_biopsy_now)
     :named REQ9_AUXILIARY1)) ;; "tumour biopsies"

(assert
  (! (=> patient_can_undergo_biopsy_now@@for_pharmacodynamic_determination
         patient_can_undergo_biopsy_now)
     :named REQ9_AUXILIARY2)) ;; "for pharmacodynamic determination"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: patient must be willing to provide paired tumour biopsies for pharmacodynamic determination
(assert
  (! (and patient_can_undergo_biopsy_now@@paired
          patient_can_undergo_biopsy_now@@tumour_tissue
          patient_can_undergo_biopsy_now@@for_pharmacodynamic_determination)
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to provide paired tumour biopsies for pharmacodynamic determination."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_ovary_now Bool) ;; "ovarian carcinoma" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of the ovary (ovarian carcinoma).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of the ovary (ovarian carcinoma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of the ovary (ovarian carcinoma).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of the ovary (ovarian carcinoma)."}

(declare-const patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@platinum_resistant_defined_as_recurrence_within_6_months_after_completion_of_prior_platinum_based_chemotherapy Bool) ;; "platinum-resistant ovarian carcinoma (defined as recurrence within 6 months after completion of prior platinum-based chemotherapy)" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of the ovary (ovarian carcinoma) and the carcinoma is platinum-resistant, defined as recurrence within 6 months after completion of prior platinum-based chemotherapy.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malignant tumor of the ovary (ovarian carcinoma) but the carcinoma is not platinum-resistant as defined.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is platinum-resistant as defined.","meaning":"Boolean indicating whether the patient's ovarian carcinoma is platinum-resistant, defined as recurrence within 6 months after completion of prior platinum-based chemotherapy."}

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies the stem variable (definition in requirement)
(assert
  (! (=> patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@platinum_resistant_defined_as_recurrence_within_6_months_after_completion_of_prior_platinum_based_chemotherapy
         patient_has_diagnosis_of_malignant_tumor_of_ovary_now)
     :named REQ10_AUXILIARY0)) ;; "platinum-resistant ovarian carcinoma (defined as recurrence within 6 months after completion of prior platinum-based chemotherapy)"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! patient_has_diagnosis_of_malignant_tumor_of_ovary_now@@platinum_resistant_defined_as_recurrence_within_6_months_after_completion_of_prior_platinum_based_chemotherapy
     :named REQ10_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have platinum-resistant ovarian carcinoma (defined as recurrence within 6 months after completion of prior platinum-based chemotherapy)."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const number_of_previous_lines_of_systemic_treatment_for_metastatic_disease_value_recorded_in_history_withunit_count Int) ;; "no more than 5 previous lines of systemic treatment for metastatic disease" {"when_to_set_to_value":"Set to the total number of previous lines of systemic treatment received for metastatic disease as documented in the patient's history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many previous lines of systemic treatment for metastatic disease the patient has received.","meaning":"Numeric variable indicating the total number of previous lines of systemic treatment the patient has received specifically for metastatic disease, recorded in the patient's history. The unit is count."}
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now Bool) ;; "metastatic disease" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplastic disease (metastatic disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplastic disease (metastatic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplastic disease (metastatic disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplastic neoplastic disease (metastatic disease)."}

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 0: "To be included, the patient should preferably have received no more than 5 previous lines of systemic treatment for metastatic disease."
(assert
  (! (<= number_of_previous_lines_of_systemic_treatment_for_metastatic_disease_value_recorded_in_history_withunit_count 5)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "no more than 5 previous lines of systemic treatment for metastatic disease"
