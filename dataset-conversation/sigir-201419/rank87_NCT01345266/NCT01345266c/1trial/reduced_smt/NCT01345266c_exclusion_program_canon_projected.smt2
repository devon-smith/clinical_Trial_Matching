;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_alcohol_abuse_inthehistory))
(assert (not patient_has_finding_of_respiratory_tract_infection_inthepast4weeks))
(assert (not patient_has_diagnosis_of_claustrophobia_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_has_diagnosis_of_asthma_now) (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)))
