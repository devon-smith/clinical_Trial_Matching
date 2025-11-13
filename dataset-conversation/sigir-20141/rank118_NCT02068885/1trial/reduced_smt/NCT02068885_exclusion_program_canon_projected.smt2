;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_tobacco_smoking_behavior_finding_inthepast7days))
(assert (not patient_has_finding_of_drinking_binge_inthepast6months))
(assert (not patient_has_diagnosis_of_eating_disorder_now))
(assert (not patient_has_diagnosis_of_mental_disorder_now))
(assert (not patient_has_diagnosis_of_serious_physical_health_problem_now))
(assert (not patient_has_finding_of_serum_tsh_level_abnormal_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_lactating_inthepast12months) patients_lactation_is_positive_inthehistory))
(assert (or patient_is_lactating_inthepast12months patients_lactation_is_positive_inthehistory))
(assert (or (not patient_sex_is_female_now) patients_lactation_is_positive_inthehistory))
(assert (or patient_has_finding_of_physical_activity_inthehistory patients_lactation_is_positive_inthehistory))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_inthepast12months)))
(assert (or patient_has_finding_of_physical_activity_inthehistory (not patient_is_lactating_inthepast12months)))
(assert (or (not patient_sex_is_female_now) patient_is_lactating_inthepast12months))
(assert (or patient_has_finding_of_physical_activity_inthehistory patient_is_lactating_inthepast12months))
(assert (or (not patient_sex_is_female_now) (not patient_has_finding_of_irregular_periods_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_inthepast12months)))
