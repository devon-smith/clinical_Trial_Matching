;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_is_lactating_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_undergone_history_taking_now) (not patient_has_finding_of_problem_now)))
(assert (or (not patient_has_undergone_history_taking_self_administered_questionnaire_now) (not patient_has_finding_of_problem_now)))
