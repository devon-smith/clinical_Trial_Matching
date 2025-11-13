;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_pancreatitis_inthehistory))
(assert (not patient_has_finding_of_electrocardiogram_abnormal_now))
(assert (not patient_has_diagnosis_of_diabetes_mellitus_inthehistory))
(assert (not patient_has_finding_of_diabetes_mellitus_now))
(assert (not patient_is_taking_exenatide_containing_product_now))
(assert (not patient_is_taking_insulin_containing_product_now))
(assert (not patient_has_finding_of_prediabetes_now))
(assert (not patient_has_finding_of_disorder_of_nervous_system_now))
(assert (not patient_has_finding_of_intellectual_disability_now))
(assert (not patient_is_undergoing_anticonvulsant_therapy_now))
(assert (not patient_is_undergoing_antipsychotic_drug_therapy_now))
(assert (not patient_has_diagnosis_of_dysthymia_now))
(assert (not patient_has_taken_exenatide_containing_product_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
