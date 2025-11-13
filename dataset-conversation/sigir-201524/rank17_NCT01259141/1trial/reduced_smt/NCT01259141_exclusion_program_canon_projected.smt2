;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patient_has_finding_of_human_immunodeficiency_virus_infection_now))
(assert (not patient_has_finding_of_lives_in_a_nursing_home_now))
(assert (not patient_has_taken_macrolide_antibacterial_inthehistory))
(assert (not patient_has_taken_quinolone_antibacterial_inthehistory))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 60.0))
