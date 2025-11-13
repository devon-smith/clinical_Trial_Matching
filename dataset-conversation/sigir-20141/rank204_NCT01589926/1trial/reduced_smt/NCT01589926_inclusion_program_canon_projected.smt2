;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now)
(assert patient_has_diagnosis_of_sickling_disorder_due_to_hemoglobin_s_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_sickle_cell_beta_0_thalassemia_now patient_has_diagnosis_of_sickle_cell_thalassemia_disease_now))
