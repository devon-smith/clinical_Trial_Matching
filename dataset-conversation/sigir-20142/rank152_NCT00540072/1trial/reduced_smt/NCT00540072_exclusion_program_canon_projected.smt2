;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_cystic_fibrosis_now))
(assert (not patient_has_finding_of_postobstructive_pneumonia_inthehistory))
(assert (not patient_has_finding_of_primary_malignant_neoplasm_of_lung_now))
(assert (not patient_has_finding_of_secondary_malignant_neoplasm_of_lung_now))
(assert (not patient_has_intolerance_to_ceftriaxone_inthehistory))
(assert (not patient_is_exposed_to_daptomycin_inthehistory))
(assert (not patient_has_suspicion_of_legionella_pneumonia_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_allergy_to_beta_lactam_antibacterial_inthehistory) patient_has_finding_of_eruption_inthehistory))
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_breastfeeding_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
(assert (or (not patient_has_finding_of_human_immunodeficiency_virus_infection_now) (not patient_has_finding_of_infection_by_pneumocystis_jirovecii_now)))
