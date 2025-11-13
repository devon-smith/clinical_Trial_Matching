;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 21.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_chest_discomfort_now patient_has_finding_of_acute_coronary_syndrome_now))
