;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_prediabetes_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 25.0))
(assert (<= patient_age_value_recorded_now_in_years 70.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_impaired_glucose_tolerance_now patient_has_finding_of_impaired_fasting_glycaemia_now))
(assert (or (<= patient_age_value_recorded_now_in_years 45.0) (>= patient_age_value_recorded_now_in_years 55.0)))
(assert (or patient_has_finding_of_obesity_now patient_has_finding_of_overweight_now))
(assert (or (not patient_has_finding_of_impaired_fasting_glycaemia_now) patient_has_finding_of_obesity_now))
(assert (or patient_has_finding_of_impaired_fasting_glycaemia_now patient_has_finding_of_obesity_now))
(assert (or (not patient_has_finding_of_impaired_glucose_tolerance_now) patient_has_finding_of_obesity_now))
(assert (or patient_has_finding_of_impaired_glucose_tolerance_now patient_has_finding_of_obesity_now))
(assert (or patient_has_finding_of_obesity_now (not patient_has_finding_of_smoker_now)))
(assert (or (not patient_has_finding_of_impaired_fasting_glycaemia_now) (not patient_has_finding_of_obesity_now)))
(assert (or patient_has_finding_of_impaired_fasting_glycaemia_now (not patient_has_finding_of_obesity_now)))
(assert (or (not patient_has_finding_of_impaired_glucose_tolerance_now) (not patient_has_finding_of_obesity_now)))
(assert (or patient_has_finding_of_impaired_glucose_tolerance_now (not patient_has_finding_of_obesity_now)))
(assert (or (not patient_has_finding_of_obesity_now) (not patient_has_finding_of_smoker_now)))
(assert (or (not patient_has_finding_of_impaired_glucose_tolerance_now) (not patient_has_finding_of_impaired_fasting_glycaemia_now)))
(assert (or patient_has_finding_of_impaired_glucose_tolerance_now (not patient_has_finding_of_impaired_fasting_glycaemia_now)))
(assert (or (not patient_has_finding_of_impaired_fasting_glycaemia_now) (not patient_has_finding_of_smoker_now)))
(assert (or (not patient_has_finding_of_impaired_glucose_tolerance_now) patient_has_finding_of_impaired_fasting_glycaemia_now))
(assert (or patient_has_finding_of_impaired_fasting_glycaemia_now (not patient_has_finding_of_smoker_now)))
(assert (or (not patient_has_finding_of_impaired_glucose_tolerance_now) (not patient_has_finding_of_smoker_now)))
(assert (or patient_has_finding_of_impaired_glucose_tolerance_now (not patient_has_finding_of_smoker_now)))
(assert (or patient_has_finding_of_smoker_now patient_has_finding_of_obesity_now))
(assert (or patient_has_finding_of_smoker_now (not patient_has_finding_of_obesity_now)))
(assert (or patient_has_finding_of_smoker_now (not patient_has_finding_of_impaired_fasting_glycaemia_now)))
(assert (or patient_has_finding_of_smoker_now patient_has_finding_of_impaired_fasting_glycaemia_now))
(assert (or patient_has_finding_of_smoker_now (not patient_has_finding_of_impaired_glucose_tolerance_now)))
(assert (or patient_has_finding_of_smoker_now patient_has_finding_of_impaired_glucose_tolerance_now))
