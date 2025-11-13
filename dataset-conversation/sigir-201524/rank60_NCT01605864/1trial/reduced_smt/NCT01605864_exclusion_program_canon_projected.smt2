;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_disorder_of_cellular_component_of_blood_now))
(assert (not patient_has_finding_of_disorder_of_immune_function_now))
(assert (not patient_is_breastfeeding_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_pregnant_now) (not patient_sex_is_female_now)))
