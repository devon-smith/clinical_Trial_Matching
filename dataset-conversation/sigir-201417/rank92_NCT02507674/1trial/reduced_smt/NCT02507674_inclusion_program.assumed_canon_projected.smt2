;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_abdominal_pain_now)

;; Numeric unit constraints (entailed)
(assert (<= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_ultrasonography_of_abdomen_inthehistory patient_has_undergone_ct_of_abdomen_inthehistory))
