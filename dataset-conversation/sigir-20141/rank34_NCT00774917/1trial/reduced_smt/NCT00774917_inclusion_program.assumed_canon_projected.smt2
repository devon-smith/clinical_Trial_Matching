;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_finding_of_lesion_now)
(assert patient_has_undergone_coronary_angiography_now)
(assert patient_can_undergo_coronary_artery_bypass_graft_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_single_coronary_vessel_disease_now patient_has_finding_of_double_coronary_vessel_disease_now))
