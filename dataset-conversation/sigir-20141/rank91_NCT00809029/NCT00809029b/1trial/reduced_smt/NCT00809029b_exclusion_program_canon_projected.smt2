;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_disorder_of_endocrine_system_now))
(assert (not patient_has_finding_of_thyroid_dysfunction_now))
(assert (not patient_has_finding_of_malignant_neoplastic_disease_now))
(assert (not patient_is_taking_antidepressant_now))
(assert (not patient_has_diagnosis_of_eating_disorder_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_is_exposed_to_alcohol_now patient_has_finding_of_thyroid_dysfunction_now))
(assert (or patient_is_exposed_to_alcohol_now patient_has_finding_of_disorder_of_endocrine_system_now))
(assert (or patient_is_exposed_to_alcohol_now patient_has_diagnosis_of_eating_disorder_inthehistory))
