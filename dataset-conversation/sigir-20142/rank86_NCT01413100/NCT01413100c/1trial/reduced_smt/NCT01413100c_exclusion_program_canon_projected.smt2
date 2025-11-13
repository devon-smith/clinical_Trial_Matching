;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_decreased_respiratory_function_now))
(assert (not patient_has_finding_of_hepatitis_b_surface_antigen_positive_now))
(assert (not patient_has_finding_of_polymerase_chain_reaction_test_for_hepatitis_c_positive_now))
(assert (not patient_has_finding_of_human_immunodeficiency_virus_antibody_positive_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_exposed_to_double_stranded_anti_dna_antibody_now) patient_has_diagnosis_of_systemic_lupus_erythematosus_now))
