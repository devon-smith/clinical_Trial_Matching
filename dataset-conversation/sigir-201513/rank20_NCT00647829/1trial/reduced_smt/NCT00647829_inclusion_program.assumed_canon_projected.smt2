;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_cough_now))
(assert (not patient_has_finding_of_mouth_breathing_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_moderate_pain_now patient_has_finding_of_severe_pain_now))
