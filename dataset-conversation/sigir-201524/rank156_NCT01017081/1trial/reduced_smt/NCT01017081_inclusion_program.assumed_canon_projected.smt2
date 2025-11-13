;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_community_acquired_pneumonia_now)
(assert patient_has_finding_of_cough_now)
(assert patient_has_finding_of_fever_now)
(assert patient_has_undergone_plain_chest_x_ray_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 1.0))
(assert (<= patient_age_value_recorded_now_in_years 12.0))
