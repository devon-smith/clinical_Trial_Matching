;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_coronary_arteriosclerosis_inthehistory))
(assert (not patient_has_diagnosis_of_coronary_arteriosclerosis_now))
(assert (not patient_has_undergone_hormone_replacement_therapy_inthepast6months))
(assert (not patient_has_finding_of_alcoholism_inthehistory))
(assert (not patient_has_finding_of_drinking_binge_inthehistory))
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))
(assert (not patient_has_diagnosis_of_angina_pectoris_inthehistory))
(assert (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory))
(assert (not patient_has_diagnosis_of_myocardial_infarction_inthehistory))
(assert (not patient_has_diagnosis_of_deep_venous_thrombosis_inthehistory))
(assert (not patient_has_diagnosis_of_pulmonary_embolism_inthehistory))
(assert (not patient_has_diagnosis_of_disease_of_liver_now))
(assert (not patient_has_finding_of_renal_impairment_now))
(assert (not patient_has_diagnosis_of_autoimmune_disease_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_squamous_cell_carcinoma_inthehistory patient_has_diagnosis_of_coronary_arteriosclerosis_now))
(assert (or patient_has_diagnosis_of_squamous_cell_carcinoma_inthehistory patient_has_diagnosis_of_disease_of_liver_now))
(assert (or patient_has_finding_of_renal_impairment_now patient_has_diagnosis_of_squamous_cell_carcinoma_inthehistory))
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory) patient_has_diagnosis_of_coronary_arteriosclerosis_now))
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory) patient_has_diagnosis_of_squamous_cell_carcinoma_inthehistory))
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory) patient_has_diagnosis_of_disease_of_liver_now))
(assert (or (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory) patient_has_finding_of_renal_impairment_now))
