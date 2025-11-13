;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_average_intellect_now)
(assert patient_has_finding_of_fit_and_well_now)
(assert patient_has_undergone_physical_examination_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_months 3.0))
(assert (<= patient_age_value_recorded_now_in_months 5.0))
