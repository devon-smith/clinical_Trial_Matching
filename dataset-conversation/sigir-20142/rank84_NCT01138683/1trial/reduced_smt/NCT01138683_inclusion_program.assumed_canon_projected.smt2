;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_systolic_heart_failure_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) patient_has_finding_of_pulmonary_edema_now))
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) patient_has_finding_of_pleural_effusion_now))
