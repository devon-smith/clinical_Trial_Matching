;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_is_undergoing_ct_of_abdomen_now)
(assert patient_has_finding_of_abdominal_pain_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_abdominal_pain_now) patient_has_finding_of_abdominal_tenderness_now))
