;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_acute_myocardial_infarction_inthehistory)
(assert patient_has_undergone_percutaneous_coronary_intervention_inthehistory_outcome_is_positive)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_timi_grade_1_penetration_without_perfusion_inthepast1days patient_has_finding_of_timi_grade_0_no_perfusion_inthepast1days))
