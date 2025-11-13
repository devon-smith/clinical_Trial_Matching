;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_has_diagnosis_of_major_depressive_disorder_inthehistory))
(assert (not patient_has_undergone_bariatric_operative_procedure_inthehistory))
(assert (not patient_has_undergone_operation_on_stomach_inthehistory))
(assert (not patient_has_finding_of_achalasia_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 60.0))
