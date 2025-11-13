;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_myelosuppression_now))
(assert (not patient_has_finding_of_diabetic_poor_control_now))
(assert (not patient_has_taken_quinacrine_containing_product_inthepast6months))
(assert (not patient_is_taking_quinacrine_containing_product_now))
(assert (not patient_has_finding_of_quinacrine_now))
(assert (not patient_is_exposed_to_antiarrhythmic_agent_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
