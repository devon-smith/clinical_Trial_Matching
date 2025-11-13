;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patients_creatine_kinase_isoenzyme_mb_fraction_is_positive_now)
(assert patient_has_diagnosis_of_myocardial_infarction_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 80.0))
