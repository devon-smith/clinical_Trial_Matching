;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_chronic_infectious_disease_now))
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))
(assert (not patient_has_diagnosis_of_hyperlipidemia_now))
(assert (not patient_has_diagnosis_of_hypertensive_disorder_now))
(assert (not patient_has_finding_of_smoker_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_exposed_to_nutritional_supplement_inthepast3months) (not patient_is_exposed_to_nutritional_supplement_now)))
