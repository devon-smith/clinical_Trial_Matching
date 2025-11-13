;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_accessory_sinus_now))
(assert (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_nasopharynx_now))
(assert (not patient_has_finding_of_angina_control_poor_now))
(assert (not patient_has_finding_of_preinfarction_syndrome_now))
(assert (not patient_has_finding_of_at_risk_for_noncompliance_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patients_breastfeeding_is_positive_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_contraception_now (not patient_has_childbearing_potential_now)))
