;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_acute_intermittent_porphyria_inthehistory))
(assert (not patient_has_diagnosis_of_glucose_6_phosphate_dehydrogenase_deficiency_anemia_inthehistory))
(assert (not patient_has_diagnosis_of_hemolytic_anemia_inthehistory))
(assert (not patient_has_finding_of_allergy_to_sulfonamide_now))
(assert (not patient_has_allergy_to_zonisamide_now))
(assert (not patient_is_taking_carbonic_anhydrase_inhibitor_containing_product_now))
(assert (not patient_has_finding_of_kidney_stone_inthehistory))
(assert (not patient_has_taken_zonisamide_containing_product_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_finding_of_lactation_now (not patient_is_lactating_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
