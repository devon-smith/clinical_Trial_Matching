;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))
(assert (not patient_has_finding_of_hepatic_failure_now))
(assert (not patient_has_finding_of_renal_failure_syndrome_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_breastfeeding_now) patients_breastfeeding_is_positive_now))
(assert (or (not patients_breastfeeding_is_positive_now) patient_is_breastfeeding_now))
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
(assert (or (not patient_is_breastfeeding_now) patient_has_finding_of_hepatic_failure_now))
(assert (or (not patient_is_breastfeeding_now) patient_has_finding_of_renal_failure_syndrome_now))
