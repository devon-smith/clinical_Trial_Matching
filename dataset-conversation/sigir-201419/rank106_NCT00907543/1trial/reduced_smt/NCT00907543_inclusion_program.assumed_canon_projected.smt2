;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_undergone_esophagogastroscopy_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_malignant_neoplasm_of_skin_now (not (<= patient_age_value_recorded_now_in_years 18.0))))
