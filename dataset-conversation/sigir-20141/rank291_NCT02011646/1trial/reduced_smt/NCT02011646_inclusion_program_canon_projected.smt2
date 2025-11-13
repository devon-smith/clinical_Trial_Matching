;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_overweight_now)
(assert (not patient_has_finding_of_obesity_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 12.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (>= patient_age_value_recorded_now_in_years 21.0)) (not (<= patient_age_value_recorded_now_in_years 24.0))))
(assert (or (not patient_has_finding_of_overweight_now) (>= patient_age_value_recorded_now_in_years 21.0)))
(assert (or (not patient_has_finding_of_overweight_now) (<= patient_age_value_recorded_now_in_years 24.0)))
