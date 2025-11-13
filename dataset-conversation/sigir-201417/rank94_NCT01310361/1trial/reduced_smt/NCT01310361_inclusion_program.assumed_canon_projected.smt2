;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_throat_swab_culture_positive_inthehistory)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 6.0))
(assert (<= patient_age_value_recorded_now_in_years 15.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_fever_now patient_has_finding_of_erythema_now patient_has_finding_of_exudate_on_tonsils_now patient_has_finding_of_lymphadenopathy_now))
