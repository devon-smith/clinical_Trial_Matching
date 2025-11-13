;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_undergone_upper_gastrointestinal_operation_inthehistory))
(assert (not patient_is_taking_opioid_receptor_agonist_containing_product_now))
(assert (not patient_is_taking_benzodiazepine_containing_product_now))
(assert (not patient_is_exposed_to_psychotropic_agent_now))
(assert (not patient_has_finding_of_mental_health_impairment_inthehistory))
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))
(assert (not patient_has_finding_of_neuropathy_now))
(assert (not patient_has_finding_of_seizure_now))
(assert (not patient_has_finding_of_sleep_apnea_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
