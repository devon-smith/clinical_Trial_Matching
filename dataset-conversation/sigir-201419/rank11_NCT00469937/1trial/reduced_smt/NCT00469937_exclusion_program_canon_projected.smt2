;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patient_has_finding_of_seizure_disorder_now))
(assert (not patient_has_finding_of_bipolar_disorder_now))
(assert (not patient_has_finding_of_disorder_of_thyroid_gland_now))
(assert (not patient_has_undergone_chemotherapy_inthepast2weeks))
(assert (not patient_is_undergoing_chemotherapy_now))
(assert (not patient_is_exposed_to_acetazolamide_inthepast2weeks))
(assert (not patient_is_exposed_to_acetazolamide_now))
(assert (not patient_is_exposed_to_calcium_channel_blocker_inthepast2weeks))
(assert (not patient_is_exposed_to_calcium_channel_blocker_now))
(assert (not patient_is_exposed_to_cyclooxygenase_2_inhibitor_inthepast2weeks))
(assert (not patient_is_exposed_to_cyclooxygenase_2_inhibitor_now))
(assert (not patient_is_exposed_to_diuretic_inthepast2weeks))
(assert (not patient_is_exposed_to_diuretic_now))
(assert (not patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast2weeks))
(assert (not patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now))
(assert (not patient_is_exposed_to_sodium_bicarbonate_inthepast2weeks))
(assert (not patient_is_exposed_to_sodium_bicarbonate_now))
(assert (not patient_is_exposed_to_urea_inthepast2weeks))
(assert (not patient_is_exposed_to_urea_now))
(assert (not patient_is_exposed_to_xanthine_inthepast2weeks))
(assert (not patient_is_exposed_to_xanthine_now))
(assert (not patient_has_undergone_stereotactic_radiosurgery_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_contraception_now (not patient_has_childbearing_potential_now)))
