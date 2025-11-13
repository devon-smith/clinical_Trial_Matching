;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_weight_steady_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_weight_steady_inthehistory) (not patient_has_finding_of_european_origin_now)))
(assert (or (not patient_has_finding_of_european_origin_now) (not patient_has_finding_of_indian_origin_now)))
(assert (or (not patient_has_finding_of_weight_steady_inthehistory) patient_has_finding_of_european_origin_now))
(assert (or patient_has_finding_of_european_origin_now (not patient_has_finding_of_indian_origin_now)))
(assert (or patient_has_finding_of_indian_origin_now (not patient_has_finding_of_european_origin_now)))
(assert (or patient_has_finding_of_indian_origin_now patient_has_finding_of_european_origin_now))
(assert (or patient_has_finding_of_indian_origin_now (not patient_has_finding_of_weight_steady_inthehistory)))
(assert (or (not patient_has_finding_of_weight_steady_inthehistory) (not patient_has_finding_of_indian_origin_now)))
