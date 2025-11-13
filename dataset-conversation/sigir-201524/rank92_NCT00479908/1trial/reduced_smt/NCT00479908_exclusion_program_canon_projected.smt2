;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_angina_pectoris_inthepast3months))
(assert (not patient_has_finding_of_cerebrovascular_accident_inthepast3months))
(assert (not patient_has_finding_of_myocardial_infarction_inthepast3months))
(assert (not patient_has_finding_of_transient_cerebral_ischemia_inthepast3months))
(assert (not patient_has_finding_of_orthostatic_hypotension_now))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_orthostatic_hypotension_now patient_is_taking_nicorandil_containing_product_now))
