;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_acute_heart_failure_now))
(assert (not patient_has_finding_of_cardiogenic_shock_now))
(assert (not patient_has_diagnosis_of_atrial_fibrillation_now))
(assert (not patient_is_undergoing_cardioassist_by_aortic_balloon_pump_now))
(assert (not patient_has_finding_of_constrictive_pericarditis_now))
(assert (not patient_has_finding_of_hypertrophic_cardiomyopathy_now))
(assert (not patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now))
(assert (not patient_has_finding_of_restrictive_cardiomyopathy_now))
(assert (not patient_has_finding_of_sustained_ventricular_tachycardia_now))
(assert (not patient_has_finding_of_ventricular_fibrillation_now))
(assert (not patient_has_finding_of_cerebrovascular_accident_inthepast3months))
(assert (not patient_has_finding_of_acute_renal_failure_syndrome_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_breastfeeding_now)))
