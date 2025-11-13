;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patients_tobacco_smoking_consumption_is_positive_now))
(assert (not patient_has_finding_of_acute_hepatitis_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patient_has_finding_of_allergy_to_lidocaine_inthehistory))
(assert (not patient_has_active_medical_problem_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 75.0))
