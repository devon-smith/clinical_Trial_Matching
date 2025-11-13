;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_diastolic_dysfunction_now)
(assert patient_has_finding_of_left_ventricular_hypertrophy_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_heart_failure_inthehistory) (not patient_has_finding_of_heart_failure_now)))
