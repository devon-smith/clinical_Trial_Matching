;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_blood_chemistry_abnormal_now))
(assert (not patient_has_undergone_cell_count_now_outcome_is_abnormal))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_breastfeeding_now) patients_breastfeeding_is_positive_now))
(assert (or (not patients_breastfeeding_is_positive_now) patient_is_breastfeeding_now))
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_breastfeeding_now)))
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years) patient_has_diagnosis_of_carcinoma_in_situ_of_uterine_cervix_inthepast5years))
