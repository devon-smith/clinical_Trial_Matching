;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_sepsis_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_sepsis_now patient_has_finding_of_heart_valve_disorder_now))
