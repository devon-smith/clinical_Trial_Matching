;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 75.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_respiratory_tract_infection_now patient_has_suspicion_of_respiratory_tract_infection_now patients_susceptibility_to_infections_is_positive_now patients_susceptibility_to_infections_is_abnormal_now))
