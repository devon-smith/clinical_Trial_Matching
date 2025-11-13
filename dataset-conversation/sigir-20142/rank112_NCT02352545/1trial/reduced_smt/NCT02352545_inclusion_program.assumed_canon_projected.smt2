;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_undergone_plain_chest_x_ray_now)
(assert (not patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now))

;; Numeric unit constraints (entailed)
(assert (= patient_age_value_recorded_now_in_years 18.0))
