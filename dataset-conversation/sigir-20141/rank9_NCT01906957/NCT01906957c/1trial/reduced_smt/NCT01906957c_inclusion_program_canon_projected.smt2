;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_female_now patient_sex_is_male_now))
(assert (or patient_has_finding_of_myocardial_ischemia_inthehistory patient_has_diagnosis_of_myocardial_infarction_inthehistory patient_has_undergone_coronary_angiography_inthehistory patient_has_undergone_coronary_angioplasty_inthehistory))
