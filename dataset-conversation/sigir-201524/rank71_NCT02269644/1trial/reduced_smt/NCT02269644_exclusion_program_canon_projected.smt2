;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_aspiration_pneumonia_now))
(assert (not patient_has_finding_of_hospital_acquired_pneumonia_now))
(assert (not patient_has_finding_of_ventilator_associated_pneumonia_now))
(assert (not patient_has_diagnosis_of_cystic_fibrosis_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now))
(assert (not patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now))
(assert (not patient_has_finding_of_postobstructive_pneumonia_inthehistory))
(assert (not patient_is_undergoing_admission_to_intensive_care_unit_now))
(assert (not patient_has_taken_pharmaceutical_biologic_product_inthepast30days))
(assert (not patient_has_undergone_clinical_trial_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
(assert (or (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now) (not patient_has_diagnosis_of_aids_associated_disorder_inthehistory)))
(assert (or (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now) (not patient_has_diagnosis_of_aids_associated_disorder_now)))
