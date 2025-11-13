;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now))
(assert (not patient_has_diagnosis_of_asthma_now))
(assert (not patient_has_finding_of_disorder_of_lung_now))
(assert (not patient_has_finding_of_tuberculosis_now))
(assert (not patient_has_diagnosis_of_allergic_disorder_now))
(assert (not patient_has_diagnosis_of_autoimmune_disease_now))
(assert (not patient_has_finding_of_disorder_due_to_infection_now))
(assert (not patient_has_finding_of_human_immunodeficiency_virus_infection_now))
(assert (not patient_has_finding_of_immunodeficiency_disorder_now))
(assert (not patient_has_finding_of_disease_caused_by_parasite_now))
(assert (not patient_has_diagnosis_of_malignant_neoplastic_disease_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 40.0))
(assert (<= patient_age_value_recorded_now_in_years 75.0))
