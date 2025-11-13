;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_allergy_to_dust_now)
(assert patient_has_hypersensitivity_to_fume_now)
(assert patient_has_finding_of_intolerant_of_cold_now)
(assert patient_has_undergone_plain_chest_x_ray_now_outcome_is_normal)
(assert (not patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 17.0))
(assert (<= patient_age_value_recorded_now_in_years 70.0))
