;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_pharyngeal_dysphagia_now)
(assert patient_has_finding_of_restricted_diet_pattern_now)
(assert patient_has_finding_of_patient_status_finding_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 20.0))
(assert (<= patient_age_value_recorded_now_in_years 90.0))
