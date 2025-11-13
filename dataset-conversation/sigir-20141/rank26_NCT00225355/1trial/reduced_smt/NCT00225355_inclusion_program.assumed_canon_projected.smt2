;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_exercise_tolerance_test_abnormal_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_can_undergo_coronary_artery_bypass_graft_now) (not patient_can_undergo_angioplasty_of_blood_vessel_now)))
