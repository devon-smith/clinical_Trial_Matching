;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_moderate_dehydration_now))
(assert (not patient_has_finding_of_orthostatic_hypotension_now))
(assert (not patient_has_finding_of_severe_dehydration_now))
(assert (not patient_has_diagnosis_of_celiac_disease_inthehistory))
(assert (not patient_has_diagnosis_of_chronic_pancreatitis_inthehistory))
(assert (not patient_has_diagnosis_of_crohn_s_disease_inthehistory))
(assert (not patient_has_diagnosis_of_irritable_bowel_syndrome_with_diarrhea_inthehistory))
(assert (not patient_has_diagnosis_of_malabsorption_syndrome_inthehistory))
(assert (not patient_has_diagnosis_of_ulcerative_colitis_inthehistory))
(assert (not patient_has_taken_azithromycin_containing_product_inthepast7days))
(assert (not patient_is_exposed_to_rifaximin_inthepast7days))
(assert (not patient_has_taken_sulfamethoxazole_and_trimethoprim_containing_product_inthepast7days))
(assert (not patient_has_hypersensitivity_to_rifamycin_now))
(assert (not patient_has_intolerance_to_rifamycin_now))
(assert (not patient_has_resistance_to_rifamycin_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_breastfeeding_now)))
