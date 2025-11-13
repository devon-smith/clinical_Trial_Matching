;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_amyotrophic_lateral_sclerosis_now))
(assert (not patient_has_diagnosis_of_myasthenia_gravis_now))
(assert (not patient_has_undergone_operation_on_submaxillary_gland_inthehistory))
(assert (not patient_is_exposed_to_acetylcholine_receptor_antagonist_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 6.0))
(assert (<= patient_age_value_recorded_now_in_years 21.0))
