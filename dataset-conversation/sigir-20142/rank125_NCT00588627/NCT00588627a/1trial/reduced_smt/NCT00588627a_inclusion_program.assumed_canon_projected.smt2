;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_posterior_rhinorrhea_now)
(assert patient_has_finding_of_cough_now)
(assert patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now)
(assert (not patient_has_diagnosis_of_cough_variant_asthma_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_methacholine_challenge_inthepast1years_outcome_is_negative patient_has_finding_of_chronic_cough_now))
(assert (or patient_has_undergone_plain_chest_x_ray_inthehistory_outcome_is_negative patient_has_undergone_ct_of_chest_inthepast6months_outcome_is_negative))
