;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 70.0))
(assert (<= patient_age_value_recorded_now_in_years 90.0))
