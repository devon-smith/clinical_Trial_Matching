;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_hemodynamic_instability_now))
(assert (not patient_has_finding_of_patient_s_condition_unstable_now))
(assert (not patient_has_finding_of_ventricular_tachycardia_now))
(assert (not patient_has_diagnosis_of_asthma_now))
(assert (not patient_has_diagnosis_of_reactive_airway_disease_now))
(assert (not patient_has_finding_of_atrial_fibrillation_now))
(assert (not patient_has_intolerance_to_beta_adrenergic_receptor_antagonist_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_chest_pain_now patient_has_finding_of_patient_s_condition_unstable_now))
(assert (or (not patient_is_exposed_to_metformin_now) patient_has_finding_of_patient_s_condition_unstable_now))
(assert (or (not patient_is_exposed_to_metformin_now) patient_has_finding_of_chest_pain_now))
