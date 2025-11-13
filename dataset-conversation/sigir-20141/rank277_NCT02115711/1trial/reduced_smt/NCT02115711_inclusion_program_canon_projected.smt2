;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_diabetes_mellitus_now (not patient_has_finding_of_hypertensive_disorder_now)))
(assert (or (not patient_has_finding_of_diabetes_mellitus_now) (not patient_has_finding_of_hypertensive_disorder_now)))
(assert (or patient_has_finding_of_diabetes_mellitus_now patient_has_finding_of_hypertensive_disorder_now))
(assert (or (not patient_has_finding_of_diabetes_mellitus_now) patient_has_finding_of_hypertensive_disorder_now))
(assert (or patient_has_finding_of_smokes_tobacco_daily_now (not patient_has_finding_of_hypertensive_disorder_now)))
(assert (or patient_has_finding_of_smokes_tobacco_daily_now patient_has_finding_of_hypertensive_disorder_now))
(assert (or patient_has_finding_of_smokes_tobacco_daily_now patient_has_finding_of_diabetes_mellitus_now))
(assert (or patient_has_finding_of_smokes_tobacco_daily_now (not patient_has_finding_of_diabetes_mellitus_now)))
