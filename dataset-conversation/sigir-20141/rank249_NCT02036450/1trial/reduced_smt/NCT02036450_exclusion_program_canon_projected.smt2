;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_atrial_fibrillation_inthehistory))
(assert (not patient_has_diagnosis_of_atrial_flutter_inthehistory))
(assert (not patient_is_exposed_to_direct_acting_anticoagulant_now))
(assert (not patient_is_undergoing_low_molecular_weight_heparin_therapy_now))
(assert (not patient_has_finding_of_constrictive_pericarditis_now))
(assert (not patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now))
(assert (not patient_has_undergone_operation_on_heart_inthepast3months))
(assert (not patient_has_undergone_surgical_procedure_on_thorax_inthepast3months))
(assert (not patient_has_undergone_transplant_of_kidney_inthehistory))
(assert (not patient_has_undergone_transplant_of_lung_inthehistory))
(assert (not patient_has_undergone_transplantation_inthehistory))
(assert (not patient_has_undergone_transplantation_of_heart_inthehistory))
(assert (not patient_has_undergone_transplantation_of_liver_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory patient_has_diagnosis_of_cervical_intraepithelial_neoplasia_inthehistory))
