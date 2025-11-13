;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_suppurative_tonsillitis_now))
(assert (not patient_has_diagnosis_of_chronic_congestive_heart_failure_now))
(assert (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now))
(assert (not patient_has_diagnosis_of_disease_of_liver_now))
(assert (not patient_has_diagnosis_of_kidney_disease_now))
(assert (not patient_has_finding_of_obesity_now))
(assert (not patient_has_finding_of_immunodeficiency_disorder_now))
(assert (not patient_has_finding_of_alcohol_abuse_inthehistory))
(assert (not patient_has_suspicion_of_alcohol_abuse_now))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory))
(assert (not patient_has_suspicion_of_finding_relating_to_drug_misuse_behavior_now))
(assert (not patient_has_finding_of_acute_respiratory_infections_inthepast2weeks))
(assert (not patient_has_finding_of_otitis_inthepast2weeks))
(assert (not patient_will_undergo_influenza_vaccination_inthefuture))
(assert (not patient_has_undergone_influenza_vaccination_inthehistory))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 65.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_pregnant_now)))
(assert (or (not patient_sex_is_female_now) (not patient_is_able_to_be_pregnant_now)))
