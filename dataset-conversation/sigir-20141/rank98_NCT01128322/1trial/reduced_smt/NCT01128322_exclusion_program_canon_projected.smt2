;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patients_ability_to_swallow_is_positive_now)
(assert (not patient_has_finding_of_myocardial_infarction_inthepast3months))
(assert (not patient_has_finding_of_cerebrovascular_disease_now))
(assert (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now))
(assert (not patient_has_finding_of_abnormal_liver_function_now))
(assert (not patient_has_finding_of_renal_impairment_now))
(assert (not patient_has_diagnosis_of_alcohol_dependence_inthehistory))
(assert (not patient_has_diagnosis_of_psychoactive_substance_dependence_inthehistory))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_type_2_diabetes_mellitus_now) (not patient_has_finding_of_poor_glycemic_control_now)))
