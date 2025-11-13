;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_exposed_to_butyric_acid_inthepast12months))
(assert (not patient_is_exposed_to_hydroxyurea_inthepast12months))
(assert (not patient_has_undergone_transfusion_of_blood_product_inthepast3months))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_lactating_now))
(assert (not patient_has_finding_of_cigarette_smoker_inthepast1months))
(assert (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory))
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))
(assert (not patient_has_finding_of_migraine_inthepast12months))
(assert (not patient_has_diagnosis_of_peripheral_vascular_disease_now))
(assert (not patient_has_finding_of_insulin_pump_present_now))
(assert (not patient_has_finding_of_metal_foreign_body_in_eye_region_now))
(assert (not patient_has_taken_aspirin_now))
(assert (not patient_has_taken_caffeine_now))
(assert (not patient_has_taken_non_steroidal_anti_inflammatory_agent_now))
(assert (not patient_is_taking_sildenafil_citrate_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 65.0))
