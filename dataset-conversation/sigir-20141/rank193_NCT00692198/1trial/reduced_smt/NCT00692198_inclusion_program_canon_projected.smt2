;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
(assert patient_has_finding_of_dyspnea_now)
(assert patient_has_finding_of_disorder_of_lung_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 40.0))
