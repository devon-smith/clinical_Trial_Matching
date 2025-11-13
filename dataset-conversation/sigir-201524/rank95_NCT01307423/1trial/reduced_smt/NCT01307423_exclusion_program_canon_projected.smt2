;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patients_breastfeeding_is_positive_now))
(assert (not patient_has_finding_of_congenital_immunodeficiency_disease_inthehistory))
(assert (not patient_has_finding_of_active_tuberculosis_now))
(assert (not patient_has_finding_of_substance_misuse_behavior_now))
(assert (not patient_has_finding_of_erythrodermic_psoriasis_now))
(assert (not patient_has_finding_of_guttate_psoriasis_now))
(assert (not patient_has_finding_of_pustular_psoriasis_now))
(assert (not patient_is_exposed_to_gamma_globulin_inthepast6months))
(assert (not patient_has_undergone_plasmapheresis_inthepast6months))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks patient_is_exposed_to_retinoid_inthepast4weeks))
