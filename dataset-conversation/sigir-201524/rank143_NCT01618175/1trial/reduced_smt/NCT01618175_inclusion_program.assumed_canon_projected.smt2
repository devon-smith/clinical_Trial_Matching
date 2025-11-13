;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_acute_bronchiolitis_now)
(assert patient_has_finding_of_cough_now)
(assert patient_has_finding_of_nasal_congestion_now)
(assert patient_has_diagnosis_of_bronchiolitis_now)
(assert patient_has_undergone_plain_chest_x_ray_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_months 2.0))
(assert (<= patient_age_value_recorded_now_in_months 24.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_wheezing_now patient_has_finding_of_respiratory_crackles_now))
(assert (or patient_has_finding_of_tachypnea_now patient_has_finding_of_chest_wall_retraction_now))
