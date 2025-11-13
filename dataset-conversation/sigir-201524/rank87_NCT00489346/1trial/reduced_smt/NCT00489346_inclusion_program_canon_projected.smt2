;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_cough_inthehistory)
(assert patient_has_finding_of_tight_chest_inthehistory)
(assert patient_has_finding_of_wheezing_inthehistory)
(assert patient_has_diagnosis_of_asthma_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
(assert (or patient_sex_is_male_now (>= patient_age_value_recorded_now_in_years 6.0)))
(assert (or patient_sex_is_male_now (<= patient_age_value_recorded_now_in_years 14.0)))
(assert (or patient_sex_is_male_now patient_has_finding_of_mild_persistent_asthma_now))
