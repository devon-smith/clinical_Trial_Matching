;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_has_hypersensitivity_to_anticoagulant_now))
(assert (not patient_has_hypersensitivity_to_platelet_aggregation_inhibitor_containing_product_now))
(assert (not patient_has_finding_of_high_risk_of_bleeding_now))
(assert (not patient_has_finding_of_cardiogenic_shock_now))
(assert (not patient_has_undergone_clinical_drug_trial_inthepast30days))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
