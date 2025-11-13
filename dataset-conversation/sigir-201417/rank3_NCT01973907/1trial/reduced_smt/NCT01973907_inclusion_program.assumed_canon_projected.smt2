;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_shock_now)
(assert patient_has_finding_of_septic_shock_now)
(assert patient_has_undergone_resuscitation_using_intravenous_fluid_inthepast6hours)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_days 29.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (>= patient_age_value_recorded_now_in_years 18.0)) patient_has_finding_of_low_blood_pressure_now))
