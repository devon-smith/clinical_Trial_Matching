;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_encephalitis_now)
(assert patient_has_finding_of_fever_inthehistory)
(assert patient_has_undergone_gram_stain_method_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 1.0))
(assert (<= patient_age_value_recorded_now_in_years 14.0))
