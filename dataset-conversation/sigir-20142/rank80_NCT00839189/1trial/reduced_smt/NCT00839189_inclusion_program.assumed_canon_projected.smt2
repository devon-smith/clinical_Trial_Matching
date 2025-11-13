;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_immediate_skin_test_reaction_now)
(assert patients_pulmonary_function_is_normal_now)
(assert patient_has_diagnosis_of_allergic_rhinitis_now)
(assert (not patient_has_taken_bronchodilator_inthepast12hours))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_mild_intermittent_asthma_now patient_has_diagnosis_of_mild_persistent_asthma_now))
