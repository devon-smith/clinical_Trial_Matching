;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_cirrhosis_of_liver_inthehistory))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_lactating_now))
(assert (not patient_has_finding_of_thrombocytopenic_disorder_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_thrombocytopenic_disorder_now patient_has_finding_of_bleeding_now))
