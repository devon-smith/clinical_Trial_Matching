;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_ex_smoker_inthehistory patient_has_finding_of_smoker_now))
(assert (or patient_has_finding_of_ex_smoker_inthehistory (not (<= patient_age_value_recorded_now_in_years 18.0))))
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) patient_has_finding_of_smoker_now))
