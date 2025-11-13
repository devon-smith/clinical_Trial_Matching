;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_poor_muscle_tone_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (>= patient_age_value_recorded_now_in_years 18.0) (not patient_has_finding_of_digit_sucking_now)))
