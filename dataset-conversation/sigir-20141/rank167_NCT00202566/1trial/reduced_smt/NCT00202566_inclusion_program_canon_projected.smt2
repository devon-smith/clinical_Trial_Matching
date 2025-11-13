;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_stable_angina_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_taken_atenolol_containing_product_inthehistory patient_has_taken_beta_adrenergic_receptor_antagonist_containing_product_inthehistory))
