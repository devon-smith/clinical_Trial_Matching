;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_taking_metformin_containing_product_now) (not patient_has_undergone_plasma_creatinine_measurement_now_outcome_is_abnormal)))
(assert (or (not patient_has_finding_of_abdominal_pain_now) (not patient_has_finding_of_hemorrhagic_shock_now)))
