;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 60.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_will_undergo_coronary_artery_bypass_graft_inthefuture patient_will_undergo_heart_valve_replacement_inthefuture))
