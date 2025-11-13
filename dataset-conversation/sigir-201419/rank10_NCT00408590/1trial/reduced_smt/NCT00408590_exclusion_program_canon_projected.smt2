;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_germ_cell_tumor_of_ovary_now))
(assert (not patient_has_finding_of_sex_cord_tumor_of_ovary_now))
(assert (not patient_has_finding_of_ecog_performance_status_grade_3_now))
(assert (not patient_has_finding_of_ecog_performance_status_grade_4_now))
(assert (not patient_has_finding_of_mantoux_positive_inthehistory))
(assert (not patient_has_diagnosis_of_tuberculosis_inthehistory))
(assert (not patient_has_undergone_biological_treatment_inthepast4weeks))
(assert (not patient_has_undergone_chemotherapy_inthepast3weeks))
(assert (not patient_has_undergone_immunological_therapy_inthepast4weeks))
(assert (not patient_has_undergone_gene_therapy_inthehistory))
(assert (not patient_has_symptoms_of_coronary_arteriosclerosis_now))
(assert (not patient_is_undergoing_support_transfusion_therapy_now))
(assert (not patient_has_finding_of_secondary_malignant_neoplasm_of_central_nervous_system_now))
(assert (not patient_has_finding_of_seizure_disorder_now))
(assert (not patient_has_finding_of_hiv_positive_now))
(assert (not patient_has_finding_of_immunodeficiency_disorder_inthehistory))
(assert (not patient_has_undergone_transplantation_inthehistory))
(assert (not patient_has_finding_of_chronic_hepatitis_c_inthehistory))
(assert (not patient_has_finding_of_chronic_type_b_viral_hepatitis_inthehistory))
(assert (not patient_is_undergoing_chemotherapy_now))
(assert (not patient_is_undergoing_immunological_therapy_now))
(assert (not patient_has_finding_of_disease_of_liver_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_operation_on_abdominal_region_inthepast3weeks (not patient_has_undergone_incision_of_intestine_inthepast3weeks)))
(assert (or (not patient_has_finding_of_allergy_to_contrast_media_now) (not patient_has_finding_of_allergy_to_iodine_compound_now)))
(assert (or (not patient_has_finding_of_allergy_to_iodine_compound_now) patient_has_finding_of_allergy_to_contrast_media_now))
(assert (or (not patient_has_undergone_operation_on_abdominal_region_inthepast3weeks) patient_has_undergone_lysis_of_adhesions_now))
