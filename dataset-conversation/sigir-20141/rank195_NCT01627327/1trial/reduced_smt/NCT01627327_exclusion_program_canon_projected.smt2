;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_asthma_now))
(assert (not patient_has_undergone_lung_volume_reduction_surgery_inthepast12months))
(assert (not patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory))
(assert (not patient_has_diagnosis_of_mental_disorder_inthehistory))
(assert (not patient_has_diagnosis_of_peptic_ulcer_inthehistory))
(assert (not patient_has_finding_of_alcohol_abuse_inthepast2years))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years))
(assert (not patient_is_undergoing_long_term_oxygen_therapy_now))
(assert (not patient_has_diagnosis_of_intellectual_disability_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_able_to_be_pregnant_inthefuture)))
