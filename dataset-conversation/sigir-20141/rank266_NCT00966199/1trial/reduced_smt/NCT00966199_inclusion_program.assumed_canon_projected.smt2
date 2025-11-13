;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@systolic)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 70.0))
