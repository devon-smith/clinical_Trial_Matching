;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_suppression_of_ovulation_inthehistory)
(assert patient_has_undergone_manual_pelvic_examination_inthepast60days_outcome_is_normal)
(assert patient_has_undergone_microscopic_examination_of_cervical_papanicolaou_smear_inthehistory_outcome_is_normal)
(assert (not patient_has_finding_of_amenorrhea_now))
(assert (not patient_has_finding_of_abnormal_menstrual_cycle_now))
(assert (not patient_has_finding_of_contraindication_now))
