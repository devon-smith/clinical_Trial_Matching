;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_acute_exacerbation_of_chronic_bronchitis_now)
(assert patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_inthepast1years)
(assert patient_has_finding_of_purulent_sputum_now)
(assert patient_is_exposed_to_sputum_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 35.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_dyspnea_now patient_has_finding_of_sputum_volume_now))
