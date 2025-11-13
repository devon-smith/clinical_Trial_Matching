;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_has_undergone_clinical_trial_inthepast1months))
(assert (not patient_is_undergoing_clinical_trial_now))
(assert (not patient_has_undergone_lung_volume_reduction_surgery_5a6303_inthehistory))
(assert (not patient_has_finding_of_human_immunodeficiency_virus_infection_now))
(assert (not patient_has_finding_of_alcohol_abuse_now))
(assert (not patient_has_finding_of_misuses_drugs_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_childbearing_potential_now) (not patient_has_finding_of_menstrual_bleeding_present_now)))
(assert (or (not patient_has_childbearing_potential_now) (not (>= patient_age_value_recorded_now_in_years 18.0)) (not (<= patient_age_value_recorded_now_in_years 50.0))))
