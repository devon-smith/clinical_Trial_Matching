;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_inthepast1months))
(assert (not patient_has_diagnosis_of_prinzmetal_angina_now))
(assert (not patient_has_finding_of_abnormal_liver_function_now))
(assert (not patient_has_finding_of_renal_failure_syndrome_now))
(assert (not patient_has_finding_of_diabetic_poor_control_now))
(assert (not patient_has_finding_of_limited_life_expectancy_of_approximately_one_year_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
