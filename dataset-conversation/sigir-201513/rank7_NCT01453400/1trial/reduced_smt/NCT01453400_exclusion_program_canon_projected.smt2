;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_exposed_to_analgesic_inthepast12hours))
(assert (not patient_is_exposed_to_analgesic_inthepast4hours))
(assert (not patient_has_finding_of_mouth_breathing_now))
(assert (not patient_has_finding_of_chronic_sinusitis_now))
(assert (not patient_has_finding_of_gastrointestinal_hemorrhage_inthehistory))
(assert (not patient_has_finding_of_blood_coagulation_disorder_inthehistory))
(assert (not patient_has_finding_of_blood_coagulation_disorder_now))
(assert (not patient_has_finding_of_acute_disease_now))
(assert (not patient_has_finding_of_localized_infection_now))
(assert (not patient_is_exposed_to_anticoagulant_now))
(assert (not patient_is_taking_steroid_containing_product_now))
(assert (not patient_has_undergone_antidepressant_therapy_inthepast30days))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_lactating_now)))
