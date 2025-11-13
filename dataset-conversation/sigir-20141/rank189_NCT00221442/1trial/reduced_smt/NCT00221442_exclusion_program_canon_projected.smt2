;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_euthyroid_now)
(assert (not patient_has_diagnosis_of_psychoactive_substance_dependence_now))
(assert (not patient_has_taken_zonisamide_containing_product_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
