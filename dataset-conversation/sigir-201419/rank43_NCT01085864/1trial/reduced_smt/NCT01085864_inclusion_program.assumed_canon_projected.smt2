;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 85.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_excision_now patient_has_undergone_biopsy_now patient_has_undergone_computerized_axial_tomography_now))
