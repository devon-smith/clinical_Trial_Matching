;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_electrocardiogram_abnormal_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_electrocardiogram_abnormal_now patient_has_finding_of_atypical_chest_pain_inthepast24hours))
(assert (or patient_has_finding_of_electrocardiogram_abnormal_now (not patient_has_finding_of_atypical_chest_pain_inthepast24hours)))
