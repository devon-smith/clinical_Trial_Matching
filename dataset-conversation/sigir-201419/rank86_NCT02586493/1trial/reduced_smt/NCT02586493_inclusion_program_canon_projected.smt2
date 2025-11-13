;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory)
(assert patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_cigarette_smoker_inthehistory patient_has_finding_of_cigarette_smoker_now))
