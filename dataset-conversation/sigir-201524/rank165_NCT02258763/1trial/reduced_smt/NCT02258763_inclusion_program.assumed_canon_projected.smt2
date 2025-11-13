;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_undergone_intravenous_antibiotic_therapy_now)
(assert patient_can_undergo_oral_antibiotic_therapy_now)
(assert patient_has_undergone_plain_chest_x_ray_now_outcome_is_abnormal)
(assert patient_has_finding_of_fever_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_months 3.0))
(assert (<= patient_age_value_recorded_now_in_months 59.0))
