;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_tumor_of_advanced_extent_now patient_has_diagnosis_of_tumor_surgically_unresectable_now patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now))
