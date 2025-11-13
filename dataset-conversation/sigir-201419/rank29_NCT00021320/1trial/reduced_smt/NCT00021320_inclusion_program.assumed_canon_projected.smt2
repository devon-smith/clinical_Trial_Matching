;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_disease_now)
(assert (not patient_has_diagnosis_of_carcinoma_of_cervical_part_of_esophagus_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patient_has_undergone_radiotherapy_to_thorax_inthehistory))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast3years (not patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthepast3years)))
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast3years) patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthepast3years patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthepast3years))
