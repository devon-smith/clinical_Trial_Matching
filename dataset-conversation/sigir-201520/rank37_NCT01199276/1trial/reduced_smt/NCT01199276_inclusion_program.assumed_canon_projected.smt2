;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_now)
(assert patient_will_undergo_surgical_procedure_inthefuture)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 75.0))
