;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_normal_renal_function_now)
(assert patient_has_diagnosis_of_malignant_neoplastic_disease_now)
(assert patient_can_undergo_radical_nephrectomy_now)
(assert patient_can_undergo_kidney_excision_now)
(assert patient_has_finding_of_traumatic_injury_now)
(assert (not patient_has_finding_of_urolithiasis_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 65.0))
