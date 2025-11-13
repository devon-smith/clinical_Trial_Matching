;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_undergoing_oxygen_therapy_now))
(assert (not patient_has_undergone_ct_of_chest_inthepast6months))
(assert (not patient_has_undergone_plain_chest_x_ray_inthepast6months))
(assert (not patient_has_undergone_total_pneumonectomy_inthehistory))
(assert (not patient_has_undergone_lobectomy_of_lung_inthepast5years))
(assert (not patient_has_finding_of_common_cold_inthepast6weeks))
(assert (not patient_has_finding_of_hemoptysis_inthepast6weeks))
(assert (not patient_has_finding_of_pneumonia_inthepast6weeks))
(assert (not patient_has_finding_of_respiratory_tract_infection_inthepast6weeks))
