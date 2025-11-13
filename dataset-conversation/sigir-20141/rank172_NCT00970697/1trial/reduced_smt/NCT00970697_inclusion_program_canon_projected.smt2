;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_ulcer_of_lower_extremity_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_diabetes_mellitus_now patient_has_finding_of_hypertensive_disorder_now))
