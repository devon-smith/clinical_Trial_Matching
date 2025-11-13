;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_smoker_inthepast6months))
(assert (not patient_has_finding_of_smoker_now))
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))
(assert (not patient_has_finding_of_allergy_to_egg_protein_now))
(assert (not patient_has_finding_of_intolerance_to_lactose_now))
(assert (not patient_has_diagnosis_of_diverticular_disease_now))
(assert (not patient_has_diagnosis_of_diverticulitis_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 21.0))
