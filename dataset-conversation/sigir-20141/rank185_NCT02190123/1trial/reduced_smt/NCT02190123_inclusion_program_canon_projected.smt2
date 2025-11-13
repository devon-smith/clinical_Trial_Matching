;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_female_now patient_sex_is_male_now))
(assert (or patient_sex_is_female_now (>= patient_age_value_recorded_now_in_years 18.0)))
(assert (or patient_is_taking_ticagrelor_containing_product_now patient_is_taking_clopidogrel_containing_product_now patient_is_taking_prasugrel_containing_product_now))
