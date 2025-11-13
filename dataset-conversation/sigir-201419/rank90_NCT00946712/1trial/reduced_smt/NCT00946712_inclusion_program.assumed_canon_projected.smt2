;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_is_exposed_to_human_tissue_now)
(assert (not patient_has_diagnosis_of_disorder_due_to_infection_now))
(assert (not patient_has_finding_of_cerebrovascular_accident_inthepast6months))
(assert (not patient_has_finding_of_myocardial_infarction_inthepast6months))
(assert (not patient_has_finding_of_poor_hypertension_control_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory) patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory))
(assert (or (not patient_is_pregnant_now) (not patient_is_breastfeeding_now)))
