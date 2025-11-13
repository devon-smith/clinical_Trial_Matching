;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_sore_throat_symptom_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 13.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) patient_has_childbearing_potential_now))
(assert (or patient_has_childbearing_potential_now patient_has_diagnosis_of_streptococcal_sore_throat_now))
(assert (or patient_has_childbearing_potential_now patient_has_finding_of_swallowing_painful_now))
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
(assert (or (not patient_has_childbearing_potential_now) patient_has_diagnosis_of_streptococcal_sore_throat_now))
(assert (or (not patient_has_childbearing_potential_now) patient_has_finding_of_swallowing_painful_now))
(assert (or patient_has_diagnosis_of_acute_tonsillitis_now patient_has_childbearing_potential_now))
(assert (or patient_has_diagnosis_of_acute_tonsillitis_now (not patient_has_childbearing_potential_now)))
(assert (or (not patient_sex_is_female_now) patient_has_diagnosis_of_acute_tonsillitis_now))
(assert (or patient_has_diagnosis_of_acute_tonsillitis_now patient_has_diagnosis_of_streptococcal_sore_throat_now))
(assert (or patient_has_diagnosis_of_acute_tonsillitis_now patient_has_finding_of_swallowing_painful_now))
(assert (or (not patient_sex_is_female_now) patient_has_diagnosis_of_streptococcal_sore_throat_now))
(assert (or (not patient_sex_is_female_now) patient_has_finding_of_swallowing_painful_now))
(assert (or patient_has_diagnosis_of_streptococcal_sore_throat_now patient_has_finding_of_swallowing_painful_now))
