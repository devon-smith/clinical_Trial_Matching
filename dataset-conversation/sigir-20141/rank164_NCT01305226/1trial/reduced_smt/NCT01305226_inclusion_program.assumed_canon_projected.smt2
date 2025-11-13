;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_able_to_be_pregnant_now) patient_sex_is_female_now))
(assert (or (not patient_sex_is_female_now) patient_is_able_to_be_pregnant_now))
(assert (or (not patient_is_able_to_be_pregnant_now) patient_has_undergone_urine_pregnancy_test_now_outcome_is_negative))
