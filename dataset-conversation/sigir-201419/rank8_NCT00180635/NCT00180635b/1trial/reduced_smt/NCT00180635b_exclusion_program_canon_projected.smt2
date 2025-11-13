;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_alcohol_abuse_inthehistory))
(assert (not patient_has_finding_of_alcohol_abuse_now))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
