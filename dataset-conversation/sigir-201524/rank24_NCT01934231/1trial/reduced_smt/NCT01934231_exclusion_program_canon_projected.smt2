;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_symptom_generalized_now))
(assert (not patient_has_finding_of_congenital_disease_now))
(assert (not patient_has_hypersensitivity_to_amoxicillin_and_clavulanic_acid_containing_product_now))
(assert (not patient_has_diagnosis_of_infectious_mononucleosis_now))
(assert (not patient_has_finding_of_renal_impairment_inthehistory))
(assert (not patient_is_undergoing_immunosuppressive_therapy_now))
(assert (not patient_has_diagnosis_of_disorder_of_immune_function_inthehistory))
(assert (not patient_has_diagnosis_of_disorder_of_immune_function_now))
(assert (not patient_has_diagnosis_of_immunodeficiency_disorder_inthehistory))
(assert (not patient_has_diagnosis_of_immunodeficiency_disorder_now))
(assert (not patient_is_exposed_to_probenecid_inthefuture))
(assert (not patient_is_exposed_to_probenecid_now))
(assert (not patient_has_finding_of_alcohol_abuse_inthehistory))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patients_menstruation_is_positive_now) (not patient_has_childbearing_potential_now)))
