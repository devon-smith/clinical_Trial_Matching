;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_tumor_of_unknown_origin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of unknown origin (carcinoma of unknown primary).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of unknown origin (carcinoma of unknown primary).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of unknown origin (carcinoma of unknown primary).","meaning":"Boolean indicating whether the patient currently has a malignant tumor of unknown origin (carcinoma of unknown primary)."}

(declare-const patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@histologic_proven Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant tumor of unknown origin (carcinoma of unknown primary) is histologically proven.","when_to_set_to_false":"Set to false if the patient's malignant tumor of unknown origin (carcinoma of unknown primary) is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the patient's malignant tumor of unknown origin (carcinoma of unknown primary) is histologically proven."}

(declare-const patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@cytologic_proven Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant tumor of unknown origin (carcinoma of unknown primary) is cytologically proven.","when_to_set_to_false":"Set to false if the patient's malignant tumor of unknown origin (carcinoma of unknown primary) is not cytologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is cytologically proven.","meaning":"Boolean indicating whether the patient's malignant tumor of unknown origin (carcinoma of unknown primary) is cytologically proven."}

(declare-const patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@non_resectable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant tumor of unknown origin (carcinoma of unknown primary) is non-resectable.","when_to_set_to_false":"Set to false if the patient's malignant tumor of unknown origin (carcinoma of unknown primary) is resectable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tumor is non-resectable.","meaning":"Boolean indicating whether the patient's malignant tumor of unknown origin (carcinoma of unknown primary) is non-resectable."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@histologic_proven
         patient_has_finding_of_malignant_tumor_of_unknown_origin_now)
     :named REQ0_AUXILIARY0)) ;; "have histologic proven carcinoma of unknown primary"

(assert
  (! (=> patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@cytologic_proven
         patient_has_finding_of_malignant_tumor_of_unknown_origin_now)
     :named REQ0_AUXILIARY1)) ;; "have cytologic proven carcinoma of unknown primary"

(assert
  (! (=> patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@non_resectable
         patient_has_finding_of_malignant_tumor_of_unknown_origin_now)
     :named REQ0_AUXILIARY2)) ;; "carcinoma of unknown primary is non-resectable"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must ((have histologic proven carcinoma of unknown primary AND carcinoma of unknown primary is non-resectable) OR (have cytologic proven carcinoma of unknown primary AND carcinoma of unknown primary is non-resectable))
(assert
  (! (or (and patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@histologic_proven
              patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@non_resectable)
         (and patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@cytologic_proven
              patient_has_finding_of_malignant_tumor_of_unknown_origin_now@@non_resectable))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have histologic proven carcinoma of unknown primary AND carcinoma of unknown primary is non-resectable) OR (have cytologic proven carcinoma of unknown primary AND carcinoma of unknown primary is non-resectable))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_tumor_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one tumor lesion.","when_to_set_to_false":"Set to false if the patient currently does not have any tumor lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tumor lesion.","meaning":"Boolean indicating whether the patient currently has a tumor lesion."} // "To be included, the patient must have at least one measurable tumor lesion according to Response Evaluation Criteria in Solid Tumors criteria."
(declare-const patient_has_finding_of_tumor_finding_now@@measurable_according_to_recist Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tumor lesion is measurable according to RECIST criteria.","when_to_set_to_false":"Set to false if the patient's tumor lesion is not measurable according to RECIST criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tumor lesion is measurable according to RECIST criteria.","meaning":"Boolean indicating whether the patient's tumor lesion is measurable according to RECIST criteria."} // "To be included, the patient must have at least one measurable tumor lesion according to Response Evaluation Criteria in Solid Tumors criteria."
(declare-const patient_number_of_measurable_tumor_lesions_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of measurable tumor lesions the patient currently has according to RECIST criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many measurable tumor lesions the patient currently has according to RECIST criteria.","meaning":"Numeric value representing the number of measurable tumor lesions the patient currently has according to RECIST criteria. Unit: count."} // "To be included, the patient must have at least one measurable tumor lesion according to Response Evaluation Criteria in Solid Tumors criteria."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_tumor_finding_now@@measurable_according_to_recist
         patient_has_finding_of_tumor_finding_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have at least one measurable tumor lesion according to Response Evaluation Criteria in Solid Tumors criteria."

;; Number of measurable tumor lesions according to RECIST implies measurable finding
(assert
  (! (=> (> patient_number_of_measurable_tumor_lesions_now_withunit_count 0)
         patient_has_finding_of_tumor_finding_now@@measurable_according_to_recist)
     :named REQ1_AUXILIARY1)) ;; "To be included, the patient must have at least one measurable tumor lesion according to Response Evaluation Criteria in Solid Tumors criteria."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_number_of_measurable_tumor_lesions_now_withunit_count 0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one measurable tumor lesion according to Response Evaluation Criteria in Solid Tumors criteria."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const world_health_organization_performance_status_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value of the patient's World Health Organization performance status as recorded now.","when_to_set_to_null":"Set to null if the patient's World Health Organization performance status is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's World Health Organization performance status, recorded now, as an integer."} // "To be included, the patient must have World Health Organization performance status ≥ 0 AND World Health Organization performance status ≤ 1."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: World Health Organization performance status ≥ 0
(assert
  (! (>= world_health_organization_performance_status_value_recorded_now_withunit_integer 0)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have World Health Organization performance status ≥ 0."

;; Component 1: World Health Organization performance status ≤ 1
(assert
  (! (<= world_health_organization_performance_status_value_recorded_now_withunit_integer 1)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have World Health Organization performance status ≤ 1."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_adeno_carcinoma_of_unknown_primary_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has adeno carcinoma of unknown primary.","when_to_set_to_false":"Set to false if the patient currently does not have adeno carcinoma of unknown primary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adeno carcinoma of unknown primary.","meaning":"Boolean indicating whether the patient currently has adeno carcinoma of unknown primary."} // "adeno carcinoma of unknown primary"
(declare-const patient_has_finding_of_undifferentiated_carcinoma_of_unknown_primary_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has undifferentiated carcinoma of unknown primary.","when_to_set_to_false":"Set to false if the patient currently does not have undifferentiated carcinoma of unknown primary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has undifferentiated carcinoma of unknown primary.","meaning":"Boolean indicating whether the patient currently has undifferentiated carcinoma of unknown primary."} // "undifferentiated carcinoma of unknown primary"
(declare-const patient_is_eligible_for_pacet_cup_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible for the PACET-CUP protocol.","when_to_set_to_false":"Set to false if the patient is currently not eligible for the PACET-CUP protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently eligible for the PACET-CUP protocol.","meaning":"Boolean indicating whether the patient is currently eligible for the PACET-CUP protocol."} // "eligible for paclitaxel and carboplatin treatment with or without cetuximab in adeno carcinoma of unknown primary and undifferentiated carcinoma of unknown primary (PACET-CUP)"
(declare-const patient_is_exposed_to_carboplatin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible to be exposed to carboplatin as part of treatment.","when_to_set_to_false":"Set to false if the patient is currently not eligible to be exposed to carboplatin as part of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently eligible to be exposed to carboplatin.","meaning":"Boolean indicating whether the patient is currently eligible to be exposed to carboplatin."} // "carboplatin"
(declare-const patient_is_exposed_to_cetuximab_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible to be exposed to cetuximab as part of treatment.","when_to_set_to_false":"Set to false if the patient is currently not eligible to be exposed to cetuximab as part of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently eligible to be exposed to cetuximab.","meaning":"Boolean indicating whether the patient is currently eligible to be exposed to cetuximab."} // "cetuximab"
(declare-const patient_is_exposed_to_paclitaxel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible to be exposed to paclitaxel as part of treatment.","when_to_set_to_false":"Set to false if the patient is currently not eligible to be exposed to paclitaxel as part of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently eligible to be exposed to paclitaxel.","meaning":"Boolean indicating whether the patient is currently eligible to be exposed to paclitaxel."} // "paclitaxel"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: eligibility for PACET-CUP protocol requires eligibility for paclitaxel and carboplatin, with or without cetuximab, in adeno carcinoma of unknown primary or undifferentiated carcinoma of unknown primary
(assert
  (! (= patient_is_eligible_for_pacet_cup_protocol_now
        (and
          (or patient_has_finding_of_adeno_carcinoma_of_unknown_primary_now
              patient_has_finding_of_undifferentiated_carcinoma_of_unknown_primary_now)
          patient_is_exposed_to_paclitaxel_now
          patient_is_exposed_to_carboplatin_now
          ;; Cetuximab is optional ("with or without cetuximab")
          ;; No constraint on cetuximab exposure for eligibility
        ))
     :named REQ3_AUXILIARY0)) ;; "eligible for paclitaxel and carboplatin treatment with or without cetuximab in adeno carcinoma of unknown primary and undifferentiated carcinoma of unknown primary (PACET-CUP)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_eligible_for_pacet_cup_protocol_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be eligible for paclitaxel and carboplatin treatment with or without cetuximab in adeno carcinoma of unknown primary and undifferentiated carcinoma of unknown primary (PACET-CUP)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_signed_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent and the consent is signed.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent or the consent is not signed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided signed written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent that is signed."} // "To be included, the patient must have signed written informed consent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_signed_written_informed_consent
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed written informed consent."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be aged ≥ 18 years."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the biological potential to contribute to conception (e.g., is fertile and not permanently infertile).","when_to_set_to_false":"Set to false if the patient does not currently have childbearing potential (e.g., is permanently infertile, post-menopausal, or has undergone sterilization).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the biological potential to contribute to conception (i.e., has childbearing potential)."} // "risk of conception exists (applies to both male subjects and female subjects)"
(declare-const patient_is_using_effective_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an effective method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any effective method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an effective method of contraception.","meaning":"Boolean indicating whether the patient is currently using an effective method of contraception."} // "must use effective contraception"
(declare-const patient_is_using_effective_contraception_now@@if_risk_of_conception_exists Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an effective method of contraception and the risk of conception exists.","when_to_set_to_false":"Set to false if the patient is currently not using an effective method of contraception and the risk of conception exists.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an effective method of contraception when the risk of conception exists.","meaning":"Boolean indicating whether the patient is currently using an effective method of contraception when the risk of conception exists."} // "must use effective contraception if the risk of conception exists"
(declare-const risk_of_conception_exists_now Bool) ;; {"when_to_set_to_true":"Set to true if there is currently a risk that the patient could contribute to conception.","when_to_set_to_false":"Set to false if there is currently no risk that the patient could contribute to conception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is currently a risk that the patient could contribute to conception.","meaning":"Boolean indicating whether there is currently a risk that the patient could contribute to conception."} // "risk of conception exists (applies to both male subjects and female subjects)"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: risk_of_conception_exists_now is equivalent to patient_has_childbearing_potential_now
(assert
  (! (= risk_of_conception_exists_now patient_has_childbearing_potential_now)
     :named REQ6_AUXILIARY0)) ;; "risk of conception exists (applies to both male subjects and female subjects)"

;; Definition: qualifier variable for contraception use when risk exists
(assert
  (! (= patient_is_using_effective_contraception_now@@if_risk_of_conception_exists
        (and risk_of_conception_exists_now patient_is_using_effective_contraception_now))
     :named REQ6_AUXILIARY1)) ;; "must use effective contraception if the risk of conception exists"

;; ===================== Constraint Assertions (REQ 6) =====================
;; If risk of conception exists, patient must use effective contraception
(assert
  (! (or (not risk_of_conception_exists_now)
         patient_is_using_effective_contraception_now)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must use effective contraception if the risk of conception exists (applies to both male subjects and female subjects)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_neutrophil_count_value_recorded_now_withunit_10e9_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a current neutrophil blood cell count in 10^9/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current neutrophil blood cell count in 10^9/L."} // "neutrophil blood cell count ≥ 1.5 × 10^9/L"
(declare-const patient_platelet_count_value_recorded_now_withunit_10e9_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a current platelet count in 10^9/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current platelet count in 10^9/L."} // "platelet count ≥ 100 × 10^9/L"
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a current hemoglobin concentration in mmol/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current hemoglobin concentration in mmol/L."} // "hemoglobin concentration ≥ 5.00 mmol/L (8 g/dL)"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: neutrophil blood cell count ≥ 1.5 × 10^9/L
(assert
  (! (>= patient_neutrophil_count_value_recorded_now_withunit_10e9_per_l 1.5)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have neutrophil blood cell count ≥ 1.5 × 10^9/L."

;; Component 1: platelet count ≥ 100 × 10^9/L
(assert
  (! (>= patient_platelet_count_value_recorded_now_withunit_10e9_per_l 100.0)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have platelet count ≥ 100 × 10^9/L."

;; Component 2: hemoglobin concentration ≥ 5.00 mmol/L (8 g/dL)
(assert
  (! (>= patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_mmol_per_l 5.00)
     :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hemoglobin concentration ≥ 5.00 mmol/L (8 g/dL)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_bilirubin_level_finding_value_recorded_now_withunit_micromol_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured bilirubin concentration value in micromol per liter if available for the patient now.","when_to_set_to_null":"Set to null if no bilirubin concentration measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current bilirubin concentration in micromol per liter."} // "bilirubin concentration"
(declare-const patient_bilirubin_level_finding_value_recorded_now_withunit_micromol_per_liter@@not_increasing_more_than_25_percent_within_last_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bilirubin concentration has not increased by more than 25% within the last 4 weeks.","when_to_set_to_false":"Set to false if the patient's bilirubin concentration has increased by more than 25% within the last 4 weeks.","when_to_set_to_null":"Set to null if the change in bilirubin concentration over the last 4 weeks is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's bilirubin concentration has not increased by more than 25% within the last 4 weeks."} // "bilirubin concentration not increasing more than 25% within the last 4 weeks"
(declare-const upper_normal_level_for_bilirubin_concentration_in_micromol_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference upper normal level for bilirubin concentration in micromol per liter as defined by the laboratory or clinical guidelines.","when_to_set_to_null":"Set to null if the reference upper normal level for bilirubin concentration is unknown or indeterminate.","meaning":"Numeric value representing the upper normal reference level for bilirubin concentration in micromol per liter."} // "upper normal level"

(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_unit_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured aspartate aminotransferase concentration value in unit per liter if available for the patient now.","when_to_set_to_null":"Set to null if no aspartate aminotransferase concentration measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase concentration in unit per liter."} // "aspartate aminotransferase concentration"
(declare-const upper_normal_level_for_aspartate_aminotransferase_concentration_in_unit_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference upper normal level for aspartate aminotransferase concentration in unit per liter as defined by the laboratory or clinical guidelines.","when_to_set_to_null":"Set to null if the reference upper normal level for aspartate aminotransferase concentration is unknown or indeterminate.","meaning":"Numeric value representing the upper normal reference level for aspartate aminotransferase concentration in unit per liter."} // "upper normal level"

(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured alanine aminotransferase concentration value in unit per liter if available for the patient now.","when_to_set_to_null":"Set to null if no alanine aminotransferase concentration measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase concentration in unit per liter."} // "alanine aminotransferase concentration"
(declare-const upper_normal_level_for_alanine_aminotransferase_concentration_in_unit_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference upper normal level for alanine aminotransferase concentration in unit per liter as defined by the laboratory or clinical guidelines.","when_to_set_to_null":"Set to null if the reference upper normal level for alanine aminotransferase concentration is unknown or indeterminate.","meaning":"Numeric value representing the upper normal reference level for alanine aminotransferase concentration in unit per liter."} // "upper normal level"

(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver metastases (secondary malignant neoplasm of liver).","when_to_set_to_false":"Set to false if the patient currently does not have liver metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver metastases.","meaning":"Boolean indicating whether the patient currently has liver metastases (secondary malignant neoplasm of liver)."} // "in case of liver metastases"

(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_micromol_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured serum creatinine concentration value in micromol per liter if available for the patient now.","when_to_set_to_null":"Set to null if no serum creatinine concentration measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine concentration in micromol per liter."} // "serum creatinine concentration"
(declare-const upper_normal_level_for_serum_creatinine_concentration_in_micromol_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference upper normal level for serum creatinine concentration in micromol per liter as defined by the laboratory or clinical guidelines.","when_to_set_to_null":"Set to null if the reference upper normal level for serum creatinine concentration is unknown or indeterminate.","meaning":"Numeric value representing the upper normal reference level for serum creatinine concentration in micromol per liter."} // "upper normal level"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: Bilirubin concentration ≤ 1.5 × upper normal level AND not increasing more than 25% within last 4 weeks
(assert
  (! (and (<= patient_bilirubin_level_finding_value_recorded_now_withunit_micromol_per_liter
              (* 1.5 upper_normal_level_for_bilirubin_concentration_in_micromol_per_liter))
          patient_bilirubin_level_finding_value_recorded_now_withunit_micromol_per_liter@@not_increasing_more_than_25_percent_within_last_4_weeks)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "bilirubin concentration ≤ 1.5 × upper normal level AND bilirubin concentration not increasing more than 25% within the last 4 weeks"

;; Component 1: ((AST ≤ 2.5 × UNL AND ALT ≤ 2.5 × UNL) OR (if liver metastases, AST ≤ 5 × UNL AND ALT ≤ 5 × UNL))
(assert
  (! (or
        (and (<= patient_aspartate_transaminase_level_value_recorded_now_withunit_unit_per_liter
                 (* 2.5 upper_normal_level_for_aspartate_aminotransferase_concentration_in_unit_per_liter))
             (<= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit_per_liter
                 (* 2.5 upper_normal_level_for_alanine_aminotransferase_concentration_in_unit_per_liter)))
        (and patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now
             (<= patient_aspartate_transaminase_level_value_recorded_now_withunit_unit_per_liter
                 (* 5.0 upper_normal_level_for_aspartate_aminotransferase_concentration_in_unit_per_liter))
             (<= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_unit_per_liter
                 (* 5.0 upper_normal_level_for_alanine_aminotransferase_concentration_in_unit_per_liter))))
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "((aspartate aminotransferase concentration ≤ 2.5 × upper normal level AND alanine aminotransferase concentration ≤ 2.5 × upper normal level) OR (in case of liver metastases, aspartate aminotransferase concentration ≤ 5 × upper normal level AND alanine aminotransferase concentration ≤ 5 × upper normal level))"

;; Component 2: Serum creatinine concentration ≤ 1.5 × upper normal level
(assert
  (! (<= patient_serum_creatinine_level_finding_value_recorded_now_withunit_micromol_per_liter
         (* 1.5 upper_normal_level_for_serum_creatinine_concentration_in_micromol_per_liter))
     :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "serum creatinine concentration ≤ 1.5 × upper normal level"
