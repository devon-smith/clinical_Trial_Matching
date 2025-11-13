;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 3.0))
(assert (<= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
(assert (or patient_has_diagnosis_of_cerebral_palsy_now patient_has_diagnosis_of_intellectual_disability_now patient_has_diagnosis_of_neurological_deficit_now patient_has_diagnosis_of_disorder_of_nervous_system_now))
