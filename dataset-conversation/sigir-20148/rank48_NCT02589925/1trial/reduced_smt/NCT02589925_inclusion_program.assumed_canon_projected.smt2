;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_parkinson_s_disease_now)
(assert patient_has_diagnosis_of_dementia_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 35.0))
(assert (<= patient_age_value_recorded_now_in_years 75.0))
