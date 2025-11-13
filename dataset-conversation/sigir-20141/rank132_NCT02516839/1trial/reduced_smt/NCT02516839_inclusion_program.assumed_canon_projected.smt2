;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_overweight_now)
(assert (not patient_has_finding_of_anorexia_nervosa_now))
(assert (not patient_has_finding_of_bulimia_nervosa_now))
(assert (not patient_has_finding_of_impaired_cognition_now))
(assert (not patient_has_finding_of_psychotic_disorder_now))
(assert (not patient_has_undergone_bariatric_operative_procedure_inthehistory))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 65.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_overweight_now) patient_has_finding_of_suicidal_thoughts_now))
(assert (or (not patients_lactation_is_positive_now) patient_is_lactating_now))
(assert (or (not patient_is_lactating_now) patients_lactation_is_positive_now))
(assert (or (not patient_is_pregnant_now) (not patient_is_pregnant_inthefuture2years) (not patient_is_lactating_now)))
