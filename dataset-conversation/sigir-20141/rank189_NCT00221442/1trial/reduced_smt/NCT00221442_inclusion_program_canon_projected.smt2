;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_binge_eating_disorder_inthehistory)
(assert patient_has_finding_of_distress_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 65.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
