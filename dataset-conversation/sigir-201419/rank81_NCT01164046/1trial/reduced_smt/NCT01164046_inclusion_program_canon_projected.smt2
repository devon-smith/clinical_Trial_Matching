;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_malignant_neoplastic_disease_now)
(assert patient_is_exposed_to_anticoagulant_inthepast12months)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_deep_venous_thrombosis_of_lower_extremity_now patient_has_diagnosis_of_pulmonary_embolism_now))
