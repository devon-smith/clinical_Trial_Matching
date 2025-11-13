;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_has_diagnosis_of_disease_now))
(assert (not patient_is_taking_drug_or_medicament_now))
(assert (not patient_has_taken_autonomic_agent_inthepast24hours))
(assert (not patient_is_exposed_to_autonomic_agent_inthepast24hours))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
