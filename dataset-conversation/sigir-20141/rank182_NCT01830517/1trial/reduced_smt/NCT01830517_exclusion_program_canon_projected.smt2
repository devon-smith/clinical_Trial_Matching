;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_hemorrhagic_cerebral_infarction_inthehistory))
(assert (not patient_has_diagnosis_of_malignant_neoplastic_disease_now))
(assert (not patient_is_pregnant_inthehistory))
(assert (not patient_is_lactating_inthehistory))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 35.0))
(assert (<= patient_age_value_recorded_now_in_years 86.0))
