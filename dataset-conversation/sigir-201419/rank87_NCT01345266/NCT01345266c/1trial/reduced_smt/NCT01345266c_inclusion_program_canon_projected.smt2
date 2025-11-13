;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_sex_is_female_now)
(assert patient_has_childbearing_potential_now)
(assert patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_smoker_now patient_has_finding_of_ex_smoker_now))
