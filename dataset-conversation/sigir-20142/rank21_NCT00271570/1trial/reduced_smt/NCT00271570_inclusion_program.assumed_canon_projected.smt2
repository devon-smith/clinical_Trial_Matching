;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_acute_febrile_mucocutaneous_lymph_node_syndrome_now)
(assert patient_has_undergone_plain_chest_x_ray_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (>= patient_age_value_recorded_now_in_years 18.0)) patient_has_undergone_echocardiography_inthehistory))
