;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_allergy_to_drug_now))
(assert (not patient_has_suspicion_of_allergy_to_drug_now))
(assert (not patient_has_finding_of_non_allergic_hypersensitivity_to_drug_or_medicament_now))
(assert (not patient_has_suspicion_of_non_allergic_hypersensitivity_to_drug_or_medicament_now))
(assert (not patient_has_finding_of_viral_pneumonia_now))
(assert (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now))
(assert (not patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now))
(assert (not patient_is_exposed_to_drug_or_medicament_inthepast30days))
(assert (not patient_has_diagnosis_of_active_tuberculosis_now))
(assert (not patient_has_diagnosis_of_cystic_fibrosis_now))
(assert (not patient_has_undergone_transplantation_of_bone_marrow_inthehistory))
(assert (not patient_has_finding_of_hypoxia_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
