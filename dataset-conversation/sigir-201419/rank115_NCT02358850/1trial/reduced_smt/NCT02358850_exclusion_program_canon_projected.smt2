;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_chronic_pain_inthehistory))
(assert (not patient_has_diagnosis_of_disease_of_liver_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_pregnant_now) (not patient_sex_is_female_now)))
