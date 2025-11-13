;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_allergic_reaction_caused_by_nonsteroidal_antiinflammatory_agent_now))
(assert (not patient_has_finding_of_allergy_to_aspirin_now))
(assert (not patient_has_finding_of_allergy_to_non_steroidal_anti_inflammatory_agent_now))
(assert (not patient_has_finding_of_gastrointestinal_ulcer_inthepast60days))
(assert (not patient_has_diagnosis_of_disease_of_liver_inthehistory))
(assert (not patient_has_diagnosis_of_renal_impairment_inthehistory))
(assert (not patient_has_taken_mifepristone_containing_product_inthepast12days))
(assert (not patient_has_finding_of_mouth_breathing_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks (not patient_has_taken_albuterol_containing_product_inthepast1weeks)))
