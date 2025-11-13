;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_disease_now)
(assert patient_has_finding_of_neoplastic_disease_now)
(assert (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_is_exposed_to_human_tissue_now patient_has_finding_of_human_cells_now))
