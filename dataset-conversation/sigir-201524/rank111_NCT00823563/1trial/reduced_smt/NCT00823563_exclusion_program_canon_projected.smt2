;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_asymptomatic_now))
(assert (not patient_has_undergone_transplantation_of_heart_inthehistory))
(assert (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
(assert (not patient_has_finding_of_renal_insufficiency_now))
(assert (not patient_has_finding_of_acute_coronary_syndrome_now))
(assert (not patients_cardiac_ejection_fraction_is_abnormal_now))
(assert (not patient_has_finding_of_cardiogenic_shock_now))
(assert (not patient_has_finding_of_takotsubo_cardiomyopathy_now))
(assert (not patient_has_finding_of_ventricular_fibrillation_now))
(assert (not patient_has_finding_of_ventricular_tachycardia_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
