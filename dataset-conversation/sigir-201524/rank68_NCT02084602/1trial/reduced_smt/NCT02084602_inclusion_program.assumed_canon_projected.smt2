;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_monoinfection_with_plasmodium_falciparum_now@@confirmed_by_microscopy)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 5.0))
(assert (<= patient_age_value_recorded_now_in_years 65.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_fever_now patient_has_finding_of_fever_inthepast48hours))
