;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_does_walk_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_overweight_now patient_has_finding_of_obese_class_i_now patient_has_finding_of_obese_class_ii_now))
