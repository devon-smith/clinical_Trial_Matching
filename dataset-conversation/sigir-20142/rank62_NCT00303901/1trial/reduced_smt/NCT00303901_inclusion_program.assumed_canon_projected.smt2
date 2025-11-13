;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_imaging_finding_now)
(assert patient_has_finding_of_lesion_of_lung_now)
(assert patient_has_undergone_ct_without_contrast_inthepast6weeks)
(assert patient_has_diagnosis_of_neoplasm_of_thorax_now)
(assert (not patient_has_finding_of_at_risk_for_noncompliance_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_pregnant_now) (not patient_is_breastfeeding_now)))
