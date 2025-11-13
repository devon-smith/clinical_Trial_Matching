;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_is_exposed_to_aspirin_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_female_now patient_sex_is_male_now))
(assert (or patient_has_diagnosis_of_hypertensive_disorder_now patient_has_diagnosis_of_diabetes_mellitus_now patient_has_diagnosis_of_ischemic_heart_disease_now patient_has_diagnosis_of_cardiac_arrhythmia_now patient_has_diagnosis_of_dyslipidemia_now))
