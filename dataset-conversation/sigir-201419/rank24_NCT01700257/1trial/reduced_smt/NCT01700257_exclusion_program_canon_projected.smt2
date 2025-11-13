;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_severe_chronic_obstructive_pulmonary_disease_now)
(assert (not patient_has_undergone_ct_of_chest_inthepast24months))
(assert (not patient_is_exposed_to_oxygen_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast10years) patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthepast10years patient_has_diagnosis_of_malignant_tumor_of_cervix_inthepast10years))
