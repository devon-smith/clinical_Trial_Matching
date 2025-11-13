;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_carcinoma_of_ampulla_of_vater_now))
(assert (not patient_has_finding_of_preinfarction_syndrome_now))
(assert (not patient_has_undergone_hepatic_arterial_infusion_chemotherapy_inthehistory))
(assert (not patient_has_undergone_administration_of_antineoplastic_agent_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory (not patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory)))
(assert (or patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory (not patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory)))
(assert (or (not patient_is_pregnant_now) (not patient_is_breastfeeding_now)))
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory) patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory))
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory) (not patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory) (not patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory) (= (+ (ite patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
           1
           0)
      (* (- 1)
         (ite patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory
              1
              0))
      (* (- 1)
         (ite patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthehistory
              1
              0)))
   0)))
