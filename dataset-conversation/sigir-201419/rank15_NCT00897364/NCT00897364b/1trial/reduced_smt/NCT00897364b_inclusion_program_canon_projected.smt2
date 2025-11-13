;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_smoker_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (<= patient_age_value_recorded_now_in_years 50.0)) (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)))
