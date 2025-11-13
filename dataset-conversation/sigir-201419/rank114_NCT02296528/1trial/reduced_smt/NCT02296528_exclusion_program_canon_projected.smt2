;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_eosinophilic_esophagitis_now))
(assert (not patient_has_finding_of_esophageal_dysmotility_now))
(assert (not patient_has_finding_of_esophageal_dysphagia_now))
(assert (not patient_has_finding_of_hiatal_hernia_now))
(assert (not patient_has_finding_of_stricture_of_esophagus_now))
(assert (not patient_has_finding_of_infectious_disorder_of_cartilage_now))
(assert (not patient_has_finding_of_infective_disorder_of_head_now))
(assert (not patient_has_finding_of_zenker_s_diverticulum_inthehistory))
(assert (not patient_has_finding_of_zenker_s_diverticulum_now))
(assert (not patient_has_finding_of_excessive_salivation_now))
(assert (not patient_has_finding_of_orocutaneous_fistula_now))
(assert (not patient_has_finding_of_pharyngocutaneous_fistula_now))
(assert (not patient_has_diagnosis_of_immunodeficiency_disorder_inthehistory))
(assert (not patient_has_finding_of_immunosuppression_inthehistory))
(assert (not patient_has_finding_of_immunosuppression_now))
(assert (not patient_has_finding_of_blood_coagulation_disorder_inthehistory))
(assert (not patient_has_finding_of_blood_coagulation_disorder_now))
(assert (not patient_is_exposed_to_alcohol_now))
(assert (not patient_is_exposed_to_anxiolytic_agent_now))
(assert (not patient_is_exposed_to_cannabis_now))
(assert (not patient_is_taking_nicotine_containing_product_now))
(assert (not patient_is_taking_opioid_receptor_agonist_containing_product_now))
(assert (not patient_is_exposed_to_sedative_now))
(assert (not patient_is_exposed_to_skeletal_muscle_relaxant_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_pregnant_now) (>= patient_age_value_recorded_now_in_years 60.0)))
