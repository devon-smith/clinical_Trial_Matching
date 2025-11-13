;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) patient_has_undergone_surgical_procedure_inthehistory))
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) (not patient_has_undergone_administration_of_antineoplastic_agent_inthehistory)))
(assert (or patient_has_finding_of_clinical_stage_4_now (not (<= patient_age_value_recorded_now_in_years 18.0))))
