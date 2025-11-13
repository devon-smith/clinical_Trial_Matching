;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_abscess_of_liver_now)
(assert patient_has_undergone_antibiotic_therapy_inthehistory_outcome_is_negative)
(assert patient_has_undergone_drainage_of_abscess_inthehistory_outcome_is_negative)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 75.0))
