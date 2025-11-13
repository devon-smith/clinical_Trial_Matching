;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now))
(assert (not patient_has_finding_of_conduction_disorder_of_the_heart_now))
(assert (not patient_has_finding_of_allergy_to_esmolol_now))
(assert (not patient_has_finding_of_allergy_to_nicardipine_now))
(assert (not patient_has_finding_of_abnormal_liver_function_now))
(assert (not patient_has_finding_of_hemorrhagic_cerebral_infarction_inthepast6months))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
