;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_persistent_vomiting_now)
(assert patient_has_undergone_oral_rehydration_therapy_inthehistory_outcome_is_negative)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 1.0))
(assert (<= patient_age_value_recorded_now_in_years 14.0))
