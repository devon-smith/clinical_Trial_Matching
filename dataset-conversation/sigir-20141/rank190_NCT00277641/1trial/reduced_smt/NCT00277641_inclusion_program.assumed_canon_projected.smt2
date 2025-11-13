;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_binge_eating_disorder_inthepast6months)
(assert patient_has_finding_of_obesity_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_obesity_now) patient_has_finding_of_overeating_now))
