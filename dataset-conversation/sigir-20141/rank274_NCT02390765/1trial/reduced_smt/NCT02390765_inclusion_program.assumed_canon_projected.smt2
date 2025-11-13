;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_body_weight_value_recorded_now_withunit_kg)
(assert patient_has_finding_of_general_health_good_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 8.0))
(assert (<= patient_age_value_recorded_now_in_years 17.0))
