;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_symptoms_of_acute_myocardial_infarction_now)
(assert patient_has_undergone_electrocardiographic_procedure_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_able_to_be_pregnant_now) patient_sex_is_female_now))
(assert (or (not patient_sex_is_female_now) patient_is_able_to_be_pregnant_now))
(assert (or patient_has_finding_of_left_bundle_branch_block_now (not patient_is_able_to_be_pregnant_now)))
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
(assert (or patient_sex_is_male_now (>= patient_age_value_recorded_now_in_years 30.0)))
(assert (or patient_sex_is_male_now (<= patient_age_value_recorded_now_in_years 75.0)))
