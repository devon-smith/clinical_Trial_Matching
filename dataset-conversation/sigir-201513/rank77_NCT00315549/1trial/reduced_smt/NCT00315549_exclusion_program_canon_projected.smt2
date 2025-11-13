;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_rheumatic_heart_disease_inthehistory))
(assert (not patient_has_diagnosis_of_myasthenia_gravis_now))
(assert (not patient_has_taken_carbamazepine_containing_product_inthepast14days))
(assert (not patient_is_exposed_to_hypericum_perforatum_extract_inthepast14days))
(assert (not patient_has_taken_phenytoin_containing_product_inthepast14days))
(assert (not patient_has_taken_rifampin_containing_product_inthepast14days))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_tonsillitis_now patient_has_finding_of_pharyngitis_now))
