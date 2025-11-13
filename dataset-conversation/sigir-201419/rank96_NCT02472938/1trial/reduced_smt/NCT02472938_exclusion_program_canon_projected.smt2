;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_primary_progressive_multiple_sclerosis_now))
(assert (not patient_has_finding_of_progressive_relapsing_multiple_sclerosis_now))
(assert (not patient_has_finding_of_secondary_progressive_multiple_sclerosis_now))
(assert (not patient_has_taken_dimethyl_fumarate_containing_product_inthehistory))
(assert (not patient_is_exposed_to_fumarate_inthehistory))
(assert (not patients_antibody_to_hepatitis_c_virus_is_positive_now))
(assert (not patients_hepatitis_b_surface_antigen_is_positive_now))
(assert (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory))
(assert (not patient_has_finding_of_human_immunodeficiency_virus_infection_now))
(assert (not patient_has_finding_of_exacerbation_of_multiple_sclerosis_inthepast30days))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory) patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory))
