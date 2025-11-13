;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_pneumonia_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now) patient_has_undergone_serum_pregnancy_test_now_outcome_is_negative))
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now) (not patient_is_lactating_now)))
