;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_smoker_now)
(assert (not patient_is_exposed_to_chewing_tobacco_inthepast6months))
(assert (not patient_is_exposed_to_cigar_smoking_tobacco_inthepast6months))
(assert (not patient_is_exposed_to_pipe_smoking_tobacco_inthepast6months))
(assert (not patient_is_exposed_to_snuff_tobacco_inthepast6months))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_smoker_now) patient_is_exposed_to_pipe_smoking_tobacco_inthehistory patient_is_exposed_to_cigar_smoking_tobacco_inthehistory patient_is_exposed_to_snuff_tobacco_inthehistory patient_is_exposed_to_chewing_tobacco_inthehistory))
