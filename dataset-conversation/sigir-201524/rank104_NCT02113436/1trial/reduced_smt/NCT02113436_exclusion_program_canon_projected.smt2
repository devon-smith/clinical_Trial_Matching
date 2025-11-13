;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_infection_to_which_no_effective_antibacterial_is_available_now))
(assert (not patient_is_suspected_to_have_infection_to_which_no_effective_antibacterial_is_available_now))
(assert (not patient_has_finding_of_deep_mycosis_now))
(assert (not patient_has_suspicion_of_deep_mycosis_now))
(assert (not patient_has_finding_of_respiratory_syncytial_virus_infection_now))
(assert (not patient_has_finding_of_obstruction_of_airway_by_foreign_body_now))
(assert (not patient_has_finding_of_non_allergic_hypersensitivity_to_drug_or_medicament_now))
(assert (not patient_has_suspicion_of_non_allergic_hypersensitivity_to_drug_or_medicament_now))
(assert (not patient_has_finding_of_child_in_care_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_upper_respiratory_infection_inthehistory) (not patient_has_finding_of_lower_respiratory_tract_infection_inthehistory)))
