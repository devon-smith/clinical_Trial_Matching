;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_respiratory_tract_infection_inthepast8weeks))
(assert (not patient_has_finding_of_chronic_disease_of_respiratory_system_now))
(assert (not patient_has_taken_angiotensin_converting_enzyme_inhibitor_containing_product_inthepast1weeks))
(assert (not patient_is_exposed_to_bronchodilator_inthepast1weeks))
(assert (not patient_has_finding_of_malignant_neoplastic_disease_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
