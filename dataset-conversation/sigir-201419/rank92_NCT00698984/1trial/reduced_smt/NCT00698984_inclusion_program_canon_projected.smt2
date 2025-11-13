;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_sex_is_female_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_normal_menopause_inthehistory patient_has_undergone_total_abdominal_hysterectomy_with_bilateral_salpingo_oophorectomy_inthehistory))
