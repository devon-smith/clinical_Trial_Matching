;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_sleep_disorder_now))
(assert (not patient_has_finding_of_overweight_now))
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))
(assert (not patient_has_finding_of_disease_condition_finding_now))
(assert (not patient_has_finding_of_tobacco_smoking_behavior_finding_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_excessive_caffeine_intake_now) (not patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_now)))
