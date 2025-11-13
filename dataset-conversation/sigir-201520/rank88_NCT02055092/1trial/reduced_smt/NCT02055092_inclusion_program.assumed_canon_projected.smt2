;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_dementia_inthehistory)
(assert patient_has_diagnosis_of_frontotemporal_dementia_now)
(assert patient_has_finding_of_aphasia_now)
(assert patient_has_diagnosis_of_alzheimer_s_disease_now)

;; Numeric unit constraints (entailed)
(assert (<= patient_age_value_recorded_now_in_years 70.0))
