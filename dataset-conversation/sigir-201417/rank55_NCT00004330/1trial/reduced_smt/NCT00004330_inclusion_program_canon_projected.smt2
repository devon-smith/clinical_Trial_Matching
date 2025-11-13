;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_porphyria_now)
(assert patient_sex_is_female_now)
(assert patient_has_childbearing_potential_now)
(assert patient_has_finding_of_abdominal_pain_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_acute_intermittent_porphyria_now patient_has_diagnosis_of_hereditary_coproporphyria_now patient_has_diagnosis_of_variegate_porphyria_now))
