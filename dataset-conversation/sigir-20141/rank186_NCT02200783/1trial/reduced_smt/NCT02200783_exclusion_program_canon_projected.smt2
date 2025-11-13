;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_has_finding_of_bleeding_now))
(assert (not patient_has_finding_of_high_risk_of_bleeding_now))
(assert (not patient_has_finding_of_poor_hypertension_control_now))
(assert (not patient_has_finding_of_cardiogenic_shock_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
