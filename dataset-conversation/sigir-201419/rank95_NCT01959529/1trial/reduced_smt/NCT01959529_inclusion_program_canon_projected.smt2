;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_type_2_diabetes_mellitus_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 50.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patients_risk_factor_is_positive_now patient_has_diagnosis_of_kidney_disease_inthehistory patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory))
(assert (or (>= patient_age_value_recorded_now_in_years 60.0) patient_has_diagnosis_of_kidney_disease_inthehistory patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory))
