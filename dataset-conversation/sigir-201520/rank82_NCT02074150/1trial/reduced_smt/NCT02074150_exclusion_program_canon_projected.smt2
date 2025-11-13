;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_breastfeeding_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_inthefuture)))
(assert (or (not patient_has_finding_of_decreased_range_of_wrist_movement_now) (not patient_has_finding_of_decreased_range_of_finger_movement_now)))
