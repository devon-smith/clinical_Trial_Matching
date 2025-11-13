;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_will_undergo_orthotopic_liver_transplant_inthefuture))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_chronic_renal_failure_now) (not patient_is_undergoing_dialysis_procedure_now)))
