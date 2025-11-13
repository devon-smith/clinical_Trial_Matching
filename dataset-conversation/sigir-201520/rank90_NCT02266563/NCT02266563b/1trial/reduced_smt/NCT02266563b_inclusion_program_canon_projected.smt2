;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_sex_is_male_now)
(assert patient_has_finding_of_mild_cognitive_disorder_now)
(assert patients_activity_of_daily_living_is_positive_now)
(assert patient_has_finding_of_impaired_cognition_now)
(assert patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 40.0))
(assert (<= patient_age_value_recorded_now_in_years 85.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_concussion_injury_of_brain_inthehistory) (not patient_has_finding_of_traumatic_brain_injury_inthehistory)))
