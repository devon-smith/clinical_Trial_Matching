;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_disorder_of_nervous_system_inthehistory))
(assert (not patient_has_finding_of_seizure_inthehistory))
(assert (not patient_has_finding_of_anemia_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_illness_now (not patient_has_finding_of_illness_now@@significant)))
