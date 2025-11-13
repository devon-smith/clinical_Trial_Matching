;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_allergy_to_angiotensin_converting_enzyme_inhibitor_now))
(assert (not patient_has_intolerance_to_angiotensin_converting_enzyme_inhibitor_now))
(assert (not patient_has_allergy_to_angiotensin_ii_receptor_antagonist_containing_product_now))
(assert (not patient_has_intolerance_to_angiotensin_ii_receptor_antagonist_containing_product_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
