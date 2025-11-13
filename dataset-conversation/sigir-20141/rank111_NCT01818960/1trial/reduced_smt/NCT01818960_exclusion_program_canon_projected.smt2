;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
(assert (not patient_has_undergone_thrombolytic_therapy_inthehistory))
(assert (not patient_can_undergo_cardiac_mri_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) patient_has_finding_of_stenosis_of_artery_now))
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) (not patient_has_finding_of_hemodynamic_instability_now)))
(assert (or (not patient_has_finding_of_hemodynamic_instability_now) (not patient_is_exposed_to_inotropic_agent_now)))
