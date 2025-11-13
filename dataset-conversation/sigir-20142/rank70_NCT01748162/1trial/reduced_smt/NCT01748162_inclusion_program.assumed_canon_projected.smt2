;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (= (and (>= patient_age_value_recorded_now_in_months 6.0)
        (<= patient_age_value_recorded_now_in_years 15.0))
   (and (>= patient_age_value_recorded_now_in_months 6.0)
        (<= patient_age_value_recorded_now_in_months 180.0))))
(assert (>= patient_age_value_recorded_now_in_months 6.0))
(assert (<= patient_age_value_recorded_now_in_years 15.0))
(assert (<= patient_age_value_recorded_now_in_months 180.0))
