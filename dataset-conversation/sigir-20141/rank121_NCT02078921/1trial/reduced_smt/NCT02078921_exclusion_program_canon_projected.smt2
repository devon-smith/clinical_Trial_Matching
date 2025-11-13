;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_can_undergo_exercise_tolerance_test_now))
(assert (not patient_has_undergone_heart_revascularization_inthepast2months))
(assert (not patient_has_diagnosis_of_myocardial_infarction_inthepast2months))
(assert (not patient_has_finding_of_left_bundle_branch_block_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
