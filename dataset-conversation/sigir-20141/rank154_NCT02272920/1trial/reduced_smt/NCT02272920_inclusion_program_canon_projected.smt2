;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_acute_coronary_syndrome_now)
(assert patient_has_undergone_percutaneous_coronary_intervention_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_acute_coronary_syndrome_now) patient_has_diagnosis_of_hypertensive_disorder_now))
(assert (or patient_has_diagnosis_of_hypertensive_disorder_inthehistory (not patient_has_diagnosis_of_acute_coronary_syndrome_now)))
(assert (or patient_has_diagnosis_of_hypertensive_disorder_inthehistory patient_has_diagnosis_of_hypertensive_disorder_now))
(assert (or patient_sex_is_female_now patient_sex_is_male_now))
(assert (or patient_sex_is_female_now (>= patient_age_value_recorded_now_in_years 18.0)))
(assert (or patient_sex_is_female_now (<= patient_age_value_recorded_now_in_years 80.0)))
