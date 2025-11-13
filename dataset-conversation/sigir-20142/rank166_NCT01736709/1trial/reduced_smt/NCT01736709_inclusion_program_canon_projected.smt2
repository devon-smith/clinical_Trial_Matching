;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_well_adult_now patient_has_finding_of_well_elder_now))
(assert (or patient_has_finding_of_well_adult_now (not (<= patient_age_value_recorded_now_in_years 60.0))))
(assert (or (<= patient_age_value_recorded_now_in_years 60.0) patient_has_finding_of_well_elder_now))
(assert (or (<= patient_age_value_recorded_now_in_years 60.0) (not (<= patient_age_value_recorded_now_in_years 60.0))))
