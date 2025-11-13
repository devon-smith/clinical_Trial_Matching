;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_has_finding_of_cardiac_pacemaker_in_situ_now))
(assert (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now))
(assert (not patient_has_diagnosis_of_heart_failure_now))
(assert (not patient_has_diagnosis_of_malignant_neoplastic_disease_now))
(assert (not patient_has_finding_of_dementia_now))
(assert (not patient_has_finding_of_mental_disorder_now))
(assert (not patient_has_finding_of_exacerbation_of_asthma_now))
(assert (not patient_has_finding_of_upper_respiratory_infection_inthepast3weeks))
(assert (not patient_has_finding_of_upper_respiratory_infection_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 16.0))
