;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patient_has_hypersensitivity_to_azole_inthehistory))
(assert (not patient_has_hypersensitivity_to_voriconazole_inthehistory))
(assert (not patient_has_intolerance_to_azole_inthehistory))
(assert (not patient_has_intolerance_to_voriconazole_inthehistory))
(assert (not patient_has_finding_of_acute_graft_versus_host_disease_now))
(assert (not patient_has_finding_of_chronic_graft_versus_host_disease_now))
(assert (not patient_has_undergone_allogeneic_bone_marrow_transplantation_inthehistory))
(assert (not patient_has_undergone_allogeneic_peripheral_blood_stem_cell_transplant_inthehistory))
(assert (not patient_has_undergone_solid_organ_transplant_inthehistory))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 2.0))
