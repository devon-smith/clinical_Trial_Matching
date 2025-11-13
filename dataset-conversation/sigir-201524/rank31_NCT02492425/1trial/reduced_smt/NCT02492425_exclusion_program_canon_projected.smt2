;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_undergoing_clinical_trial_now))
(assert (not patient_has_finding_of_hospital_acquired_pneumonia_now))
(assert (not patient_has_diagnosis_of_active_tuberculosis_now))
(assert (not patient_is_undergoing_tb_chemotherapy_now))
(assert (not patient_has_finding_of_human_immunodeficiency_virus_infection_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 14.0))
