;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_illiteracy_now))
(assert (not patient_has_finding_of_visual_impairment_now))
(assert (not patient_is_exposed_to_anti_psychotic_agent_inthepast3months))
(assert (not patient_is_exposed_to_antidepressant_inthepast3months))
(assert (not patient_has_finding_of_manic_behavior_now))
(assert (not patient_has_diagnosis_of_congenital_long_qt_syndrome_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_prolonged_qt_interval_now) patient_sex_is_male_now))
(assert (or (not patient_has_finding_of_prolonged_qt_interval_now) patient_sex_is_female_now))
(assert (or (not patient_has_finding_of_prolonged_qt_interval_now) (not patient_is_exposed_to_citalopram_now)))
(assert (or (not patient_sex_is_male_now) patient_has_finding_of_prolonged_qt_interval_now))
(assert (or (not patient_sex_is_female_now) patient_has_finding_of_prolonged_qt_interval_now))
