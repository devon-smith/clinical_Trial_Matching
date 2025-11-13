;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_common_cold_now)
(assert patient_has_finding_of_nasal_discharge_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 2.0))
(assert (<= patient_age_value_recorded_now_in_years 5.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_common_cold_now) patient_has_finding_of_swollen_nasal_mucosa_now patient_has_finding_of_fever_now))
