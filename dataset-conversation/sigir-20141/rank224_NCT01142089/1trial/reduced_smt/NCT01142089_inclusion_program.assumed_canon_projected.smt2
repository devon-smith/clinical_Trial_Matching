;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patients_recent_countries_visited_is_positive_inthehistory)
(assert patient_has_finding_of_diarrhea_inthepast24hours)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_diarrhea_inthepast24hours) (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
