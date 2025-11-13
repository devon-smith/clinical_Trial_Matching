;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_myocardial_infarction_inthepast1months))
(assert (not patient_has_finding_of_active_tuberculosis_now))
(assert (not patient_has_taken_ipratropium_containing_product_inthehistory))
(assert (not patient_is_taking_ipratropium_containing_product_now))
(assert (not patient_has_taken_oxitropium_containing_product_inthehistory))
(assert (not patient_is_taking_oxitropium_containing_product_now))
(assert (not patient_has_taken_tiotropium_containing_product_inthehistory))
(assert (not patient_is_taking_tiotropium_containing_product_now))
(assert (not patient_has_finding_of_allergy_to_atropine_now))
(assert (not patient_has_diagnosis_of_asthma_inthehistory))
(assert (not patient_has_diagnosis_of_moderate_chronic_obstructive_pulmonary_disease_inthehistory))
(assert (not patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_inthehistory))
(assert (not patient_has_finding_of_retention_of_urine_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_lactating_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
