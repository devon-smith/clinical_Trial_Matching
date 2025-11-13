;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 45.0))
(assert (<= patient_age_value_recorded_now_in_years 55.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_non_smoker_now patient_has_finding_of_cigarette_smoker_now))
(assert (or (not patient_has_finding_of_non_smoker_now) (not patient_has_finding_of_cigarette_smoker_now)))
