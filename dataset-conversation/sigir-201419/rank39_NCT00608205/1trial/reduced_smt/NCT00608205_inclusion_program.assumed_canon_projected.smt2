;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patients_primary_tumor_site_is_positive_now)
(assert (not patient_has_diagnosis_of_primary_carcinoma_of_accessory_sinus_now))
(assert (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_nasopharynx_now))
(assert (not patient_has_finding_of_at_risk_for_noncompliance_now))
