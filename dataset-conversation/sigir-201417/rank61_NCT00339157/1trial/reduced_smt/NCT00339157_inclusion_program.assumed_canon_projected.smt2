;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_systemic_onset_juvenile_chronic_arthritis_inthehistory)
(assert patient_has_finding_of_arthritis_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_negative patient_has_undergone_delayed_hypersensitivity_skin_test_for_tuberculin_ppd_inthehistory_outcome_is_positive))
