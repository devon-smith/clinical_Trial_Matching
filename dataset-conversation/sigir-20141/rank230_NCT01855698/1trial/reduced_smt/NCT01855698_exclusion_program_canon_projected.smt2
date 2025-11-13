;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_superficial_vein_thrombosis_now) patient_has_finding_of_thrombosis_now))
(assert (or (not patient_has_finding_of_blocked_central_line_now) patient_has_finding_of_venous_thrombosis_due_to_central_venous_access_device_now))
