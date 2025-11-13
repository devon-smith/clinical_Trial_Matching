;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_taking_hydralazine_containing_product_now))
(assert (not patient_is_exposed_to_nitrate_salt_now))
(assert (not patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now))
(assert (not patient_is_undergoing_dialysis_procedure_now))
(assert (not patient_has_diagnosis_of_systemic_lupus_erythematosus_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
