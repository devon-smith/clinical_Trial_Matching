;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
(assert patient_has_finding_of_patient_s_condition_stable_inthepast3months)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 50.0))
(assert (<= patient_age_value_recorded_now_in_years 85.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
