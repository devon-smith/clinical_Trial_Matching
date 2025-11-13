;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_preinfarction_syndrome_inthehistory))
(assert (not patient_has_finding_of_allergy_to_aspirin_now))
(assert (not patient_has_finding_of_hydronephrosis_now))
(assert (not patient_has_finding_of_nephritis_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_childbearing_potential_now) (not patient_is_pregnant_now)))
