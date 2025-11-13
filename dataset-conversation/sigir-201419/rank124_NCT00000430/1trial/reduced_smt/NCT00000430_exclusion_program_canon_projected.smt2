;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patients_thyrotrophin_is_normal_now)
(assert (not patient_has_finding_of_alcoholism_now))
(assert (not patient_has_finding_of_chronic_liver_disease_now))
(assert (not patient_has_taken_calcitonin_containing_product_inthepast6months))
(assert (not patient_has_taken_estrogen_containing_product_inthepast6months))
(assert (not patient_has_taken_selective_estrogen_receptor_modulator_containing_product_inthepast6months))
(assert (not patient_has_undergone_administration_of_steroid_inthepast6months))
(assert (not patient_has_undergone_anticonvulsant_therapy_inthepast1years))
(assert (not patient_has_finding_of_poor_hypertension_control_now))
(assert (not patient_has_finding_of_preinfarction_syndrome_now))
(assert (not patient_has_finding_of_myocardial_infarction_inthepast1years))
(assert (not patient_has_finding_of_hyperparathyroidism_now))
(assert (not patient_has_finding_of_hypoparathyroidism_now))
(assert (not patient_has_finding_of_metabolic_bone_disease_now))
(assert (not patient_has_finding_of_osteitis_deformans_now))
(assert (not patient_has_finding_of_osteogenesis_imperfecta_now))
(assert (not patient_has_finding_of_osteomalacia_now))
(assert (not patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years))
(assert (not patient_has_diagnosis_of_crohn_s_disease_inthepast1years))
(assert (not patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years))
(assert (not patient_has_diagnosis_of_peptic_ulcer_inthepast1years))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_taking_thyroid_hormone_containing_product_now) patient_has_finding_of_euthyroid_now))
