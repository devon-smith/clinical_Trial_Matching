;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_cough_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_cough_now) patient_has_symptoms_of_dry_cough_now))
