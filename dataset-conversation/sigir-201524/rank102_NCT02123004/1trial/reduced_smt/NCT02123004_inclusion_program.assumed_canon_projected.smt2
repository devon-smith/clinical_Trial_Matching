;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (>= patient_age_value_recorded_now_in_years 80.0)) (not patient_has_finding_of_chest_pain_now)))
(assert (or (not (>= patient_age_value_recorded_now_in_years 80.0)) patient_has_finding_of_chest_pain_now))
