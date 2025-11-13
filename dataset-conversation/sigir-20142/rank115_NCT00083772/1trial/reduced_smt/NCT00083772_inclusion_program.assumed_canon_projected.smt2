;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_acute_heart_failure_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 85.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_pulmonary_edema_now patient_has_symptoms_of_fatigue_now patient_has_symptoms_of_dyspnea_now patient_has_symptoms_of_edema_now patient_has_clinical_signs_of_hypervolemia_now))
