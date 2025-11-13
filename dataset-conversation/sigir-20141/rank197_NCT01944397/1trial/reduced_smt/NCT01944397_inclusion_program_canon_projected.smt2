;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_atrial_fibrillation_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
(assert (or (not patient_sex_is_female_now) (not patient_sex_is_male_now)))
