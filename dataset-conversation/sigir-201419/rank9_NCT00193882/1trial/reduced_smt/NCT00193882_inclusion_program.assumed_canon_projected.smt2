;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_chemotherapy_now)
(assert patients_hematologic_function_is_normal_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patients_hematologic_function_is_normal_now) patient_has_finding_of_disease_now))
(assert (or (not patients_hematologic_function_is_normal_now) patient_has_finding_of_secondary_malignant_neoplastic_disease_now patient_has_finding_of_intercurrent_disease_now))
