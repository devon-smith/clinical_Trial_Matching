;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patients_ability_to_swallow_is_positive_now)
(assert patient_has_undergone_electroencephalogram_inthepast3months)
(assert patient_has_undergone_mri_of_brain_and_brain_stem_inthepast6months)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
