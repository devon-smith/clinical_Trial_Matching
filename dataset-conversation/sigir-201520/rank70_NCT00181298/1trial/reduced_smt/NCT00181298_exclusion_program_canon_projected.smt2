;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_non_compliant_behavior_inthehistory))
(assert (not patient_is_pregnant_now))
(assert (not patient_has_finding_of_hepatic_failure_now))
(assert (not patient_has_finding_of_renal_insufficiency_now))
(assert (not patient_has_finding_of_alcohol_abuse_now))
(assert (not patient_has_finding_of_illicit_medication_use_now))
(assert (not patient_is_taking_donepezil_containing_product_now))
(assert (not patient_is_taking_memantine_containing_product_now))
(assert (not patient_is_taking_modafinil_containing_product_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
