;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_allergy_to_penicillin_inthehistory))
(assert (not patient_has_finding_of_neutropenia_now))
(assert (not patient_has_finding_of_rigor_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patient_has_finding_of_alcohol_abuse_now))
(assert (not patient_has_taken_azithromycin_containing_product_inthepast14days))
(assert (not patient_has_taken_penicillin_g_benzathine_inthepast30days))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_seizure_disorder_now) patient_has_finding_of_febrile_convulsion_inthehistory))
(assert (or (not patient_has_finding_of_lowered_convulsive_threshold_now) patient_has_finding_of_febrile_convulsion_inthehistory))
