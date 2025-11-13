;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_acute_coronary_syndrome_inthehistory))
(assert (not patient_has_finding_of_acute_coronary_syndrome_now))
(assert (not patient_has_finding_of_acute_myocardial_infarction_inthehistory))
(assert (not patient_has_finding_of_acute_myocardial_infarction_now))
(assert (not patient_has_finding_of_heart_failure_inthehistory))
(assert (not patient_has_finding_of_heart_failure_now))
(assert (not patient_has_finding_of_allergy_to_contrast_media_inthehistory))
(assert (not patient_has_finding_of_acute_rejection_of_renal_transplant_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_breastfeeding_now)))
