;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_undergone_single_lung_transplant_inthehistory))
(assert (not patient_can_undergo_measurement_of_respiratory_function_now))
(assert (not patient_has_finding_of_dependence_on_ventilator_now))
(assert (not patient_has_undergone_transplantation_inthepast2months))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (>= patient_age_value_recorded_now_in_months 0.0)) patient_has_undergone_transplantation_inthepast2months))
