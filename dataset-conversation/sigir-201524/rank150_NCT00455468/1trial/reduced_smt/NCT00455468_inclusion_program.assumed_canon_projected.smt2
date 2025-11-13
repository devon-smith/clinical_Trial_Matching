;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_pneumonia_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_tachypnea_now) (>= patient_age_value_recorded_now_in_months 2.0)))
(assert (or (not patient_has_finding_of_tachypnea_now) (<= patient_age_value_recorded_now_in_months 11.0)))
(assert (or (not patient_has_finding_of_tachypnea_now) (>= patient_age_value_recorded_now_in_months 12.0)))
(assert (or (not patient_has_finding_of_tachypnea_now) (<= patient_age_value_recorded_now_in_months 59.0)))
(assert (or patient_has_symptoms_of_cough_now patient_has_symptoms_of_difficulty_breathing_now))
(assert (or (not (>= patient_age_value_recorded_now_in_months 2.0)) (not (<= patient_age_value_recorded_now_in_months 11.0)) patient_has_finding_of_tachypnea_now))
(assert (or (not (>= patient_age_value_recorded_now_in_months 12.0)) (not (<= patient_age_value_recorded_now_in_months 59.0)) patient_has_finding_of_tachypnea_now))
