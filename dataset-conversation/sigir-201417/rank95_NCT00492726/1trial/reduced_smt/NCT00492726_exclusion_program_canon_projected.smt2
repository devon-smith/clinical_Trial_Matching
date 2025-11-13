;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_4_quinolones_adverse_reaction_now))
(assert (not patient_has_finding_of_adverse_reaction_to_pharmaceutical_excipient_now))
(assert (not patient_has_finding_of_allergy_to_carbapenem_now))
(assert (not patient_has_hypersensitivity_to_beta_lactam_antibacterial_now))
(assert (not patient_is_exposed_to_class_ia_antiarrhythmic_agent_now))
(assert (not patient_is_exposed_to_class_iii_antiarrhythmic_agent_now))
(assert (not patient_is_exposed_to_tricyclic_antidepressant_now))
(assert (not patient_has_finding_of_abscess_of_liver_now))
(assert (not patient_has_finding_of_splenic_abscess_now))
(assert (not patient_has_diagnosis_of_acute_cholangitis_now))
(assert (not patient_is_undergoing_introduction_of_antibiotic_into_peritoneal_cavity_now))
(assert (not patient_is_undergoing_marsupialization_now))
(assert (not patient_has_finding_of_female_genital_tract_infection_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
