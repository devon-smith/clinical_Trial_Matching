;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_heavy_cigarette_smoker_now))
(assert (not patient_has_finding_of_heavy_drinker_now))
(assert (not patient_has_finding_of_obesity_of_endocrine_origin_now))
(assert (not patient_has_finding_of_chronic_metabolic_disorder_now))
(assert (not patient_has_finding_of_disorder_of_gastrointestinal_tract_now))
(assert (not patient_has_finding_of_gastrointestinal_obstruction_now))
(assert (not patient_has_diagnosis_of_mental_disorder_now))
(assert (not patient_has_undergone_operation_on_gastrointestinal_tract_inthepast3months))
(assert (not patient_has_finding_of_abnormal_deglutition_now))
(assert (not patient_is_pregnant_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_male_now) patient_has_finding_of_heavy_drinker_now))
(assert (or (not patient_sex_is_female_now) patient_has_finding_of_heavy_drinker_now))
