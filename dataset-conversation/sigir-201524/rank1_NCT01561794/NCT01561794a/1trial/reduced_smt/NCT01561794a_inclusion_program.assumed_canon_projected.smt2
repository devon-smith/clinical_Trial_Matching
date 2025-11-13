;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_bacterial_pneumonia_now)
(assert patient_has_diagnosis_of_pneumonia_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 20.0))
