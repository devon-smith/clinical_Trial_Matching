;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_cardiac_mri_now)
(assert (not patient_is_taking_metformin_containing_product_now))
(assert (not patient_has_finding_of_decreased_liver_function_now))
(assert (not patient_has_finding_of_heart_failure_now))
(assert (not patient_has_finding_of_malignant_neoplastic_disease_now))
(assert (not patient_has_finding_of_renal_impairment_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_lactating_now))
(assert (not patient_has_finding_of_claustrophobia_now))
