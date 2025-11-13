;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_spontaneous_pneumothorax_inthehistory)
(assert patients_liver_function_is_normal_now)
(assert patient_has_finding_of_normal_renal_function_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 15.0))
(assert (<= patient_age_value_recorded_now_in_years 40.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_normal_renal_function_now) patient_is_undergoing_aspiration_now))
(assert (or (not patients_liver_function_is_normal_now) patient_is_undergoing_aspiration_now))
(assert (or patient_has_symptoms_of_dyspnea_now patient_has_symptoms_of_chest_pain_now))
