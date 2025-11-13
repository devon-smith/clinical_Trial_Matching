;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_acute_myocardial_infarction_inthepast1months))
(assert (not patient_has_diagnosis_of_heart_valve_disorder_now))
(assert (not patient_has_finding_of_preinfarction_syndrome_now))
(assert (not patient_has_finding_of_blood_coagulation_disorder_now))
(assert (not patient_has_finding_of_thrombocytopenic_disorder_now))
(assert (not patient_has_finding_of_contraindication_to_heparin_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_has_finding_of_acute_disease_now))
(assert (not patient_has_finding_of_sepsis_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 80.0))
