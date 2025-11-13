;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_falls_inthepast1years))
(assert (not patient_has_finding_of_falling_injury_inthepast5years))
(assert (not patient_has_finding_of_wide_base_of_support_now))
(assert (not patient_has_diagnosis_of_arthropathy_now))
(assert (not patient_has_diagnosis_of_disorder_of_connective_tissue_now))
(assert (not patient_has_finding_of_disorder_of_nervous_system_now))
(assert (not patient_has_diagnosis_of_disorder_of_musculoskeletal_system_now))
(assert (not patient_has_finding_of_disorder_of_immune_function_now))
(assert (not patient_has_finding_of_sleep_disorder_now))
(assert (not patient_has_finding_of_abnormal_chronobiologic_state_now))
(assert (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_now))
(assert (not patient_has_finding_of_disorder_of_respiratory_system_now))
(assert (not patient_has_finding_of_disorder_of_urinary_tract_now))
(assert (not patient_has_finding_of_kidney_disease_now))
(assert (not patient_has_finding_of_disorder_due_to_infection_now))
(assert (not patient_has_finding_of_disorder_of_gastrointestinal_tract_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 85.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (>= patient_age_value_recorded_now_in_years 36.0)) (not (<= patient_age_value_recorded_now_in_years 59.0))))
