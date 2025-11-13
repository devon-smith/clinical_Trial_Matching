;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now patient_is_taking_angiotensin_ii_receptor_antagonist_containing_product_now))
(assert (or patient_is_undergoing_regional_anesthesia_now patient_is_undergoing_general_anesthesia_now))
