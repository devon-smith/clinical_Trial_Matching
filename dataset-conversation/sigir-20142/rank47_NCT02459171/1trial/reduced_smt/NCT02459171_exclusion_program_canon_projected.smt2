;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now))
(assert (not patient_is_undergoing_immunosuppressive_therapy_now))
(assert (not patient_has_finding_of_terminal_illness_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 2.0))
