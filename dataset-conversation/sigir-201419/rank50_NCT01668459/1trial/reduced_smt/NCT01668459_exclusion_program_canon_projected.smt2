;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_undergone_administration_of_antineoplastic_agent_inthepast4weeks))
(assert (not patient_has_undergone_chemotherapy_inthepast4weeks))
(assert (not patient_has_undergone_surgical_procedure_inthepast4weeks))
(assert (not patient_has_undergone_therapeutic_procedure_inthepast4weeks))
(assert (not patient_has_finding_of_diabetic_poor_control_now))
(assert (not patient_has_diagnosis_of_inflammatory_bowel_disease_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_neoplastic_disease_inthehistory) patient_has_finding_of_carcinoma_in_situ_of_uterine_cervix_inthehistory))
(assert (or (not patient_sex_is_female_now) (not patient_is_breastfeeding_now)))
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
