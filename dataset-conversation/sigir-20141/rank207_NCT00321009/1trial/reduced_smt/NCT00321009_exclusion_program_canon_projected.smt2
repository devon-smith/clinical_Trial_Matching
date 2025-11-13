;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_bleeding_now)
(assert (not patient_has_finding_of_cardiogenic_shock_now))
(assert (not patient_has_finding_of_renal_insufficiency_now))
(assert (not patient_has_finding_of_cerebrovascular_accident_inthepast6months))
(assert (not patient_has_finding_of_acute_pericarditis_now))
(assert (not patient_has_finding_of_allergy_to_aspirin_now))
(assert (not patient_has_finding_of_allergy_to_heparin_now))
(assert (not patient_has_finding_of_allergy_to_pork_now))
(assert (not patient_has_finding_of_allergy_to_warfarin_now))
(assert (not patient_has_finding_of_antithrombin_iii_deficiency_inthehistory))
(assert (not patient_has_finding_of_protein_c_deficiency_disease_inthehistory))
(assert (not patient_has_finding_of_protein_s_deficiency_disease_inthehistory))
(assert (not patient_is_taking_warfarin_containing_product_now))
