;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_surgical_procedure_now)
(assert (not patient_has_finding_of_disorder_of_nervous_system_now))
(assert (not patient_has_finding_of_impaired_cognition_now))
(assert (not patient_has_finding_of_blood_coagulation_disorder_now))
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))
(assert (not patient_has_diagnosis_of_hypertensive_disorder_now))
(assert (not patient_has_diagnosis_of_metabolic_disease_now))
(assert (not patient_has_finding_of_disorder_due_to_infection_now))
(assert (not patient_has_finding_of_human_immunodeficiency_virus_infection_now))
(assert (not patient_has_finding_of_inflammatory_disease_of_liver_now))
(assert (not patient_has_finding_of_tuberculosis_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 65.0))
