;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_long_qt_syndrome_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_lactating_now))
(assert (not patients_lactation_is_positive_now))
(assert (not patient_has_finding_of_secondary_hypertension_inthehistory))
(assert (not patient_has_finding_of_secondary_hypertension_now))
(assert (not patient_has_finding_of_cerebrovascular_accident_inthehistory))
(assert (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
(assert (not patient_has_finding_of_myocardial_infarction_inthehistory))
(assert (not patient_has_undergone_percutaneous_coronary_intervention_inthepast12months))
(assert (not patient_has_finding_of_transient_cerebral_ischemia_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) patient_is_pregnant_now))
