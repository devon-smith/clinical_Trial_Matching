;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_acute_disease_now)
(assert patients_risk_factor_is_positive_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_malignant_neoplastic_disease_now patient_has_finding_of_inflammatory_bowel_disease_now))
(assert (or patient_has_finding_of_myeloproliferative_disorder_now patient_has_finding_of_malignant_neoplastic_disease_now))
(assert (or patient_is_undergoing_androgen_deprivation_therapy_now patient_has_finding_of_malignant_neoplastic_disease_now))
(assert (or patient_is_undergoing_estrogen_hormone_therapy_now patient_has_finding_of_malignant_neoplastic_disease_now))
(assert (or patient_has_finding_of_myeloproliferative_disorder_now patient_has_finding_of_inflammatory_bowel_disease_now))
(assert (or patient_is_undergoing_androgen_deprivation_therapy_now patient_has_finding_of_myeloproliferative_disorder_now))
(assert (or patient_is_undergoing_estrogen_hormone_therapy_now patient_has_finding_of_myeloproliferative_disorder_now))
(assert (or patient_is_undergoing_androgen_deprivation_therapy_now patient_has_finding_of_inflammatory_bowel_disease_now))
(assert (or patient_is_undergoing_estrogen_hormone_therapy_now patient_is_undergoing_androgen_deprivation_therapy_now))
(assert (or patient_is_undergoing_estrogen_hormone_therapy_now patient_has_finding_of_inflammatory_bowel_disease_now))
(assert (or (not patients_risk_factor_is_positive_now) (>= patient_age_value_recorded_now_in_years 75.0) patient_has_finding_of_malignant_neoplastic_disease_inthepast6months patient_has_finding_of_thromboembolism_of_vein_inthehistory patient_has_finding_of_obesity_now patient_has_finding_of_chronic_heart_failure_now patient_has_finding_of_chronic_respiratory_failure_now))
