;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_undergone_acupuncture_inthehistory))
(assert (not patient_has_finding_of_blood_coagulation_disorder_inthehistory))
(assert (not patient_has_diagnosis_of_kidney_disease_inthehistory))
(assert (not patient_has_diagnosis_of_liver_problem_inthehistory))
(assert (not patient_is_pregnant_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
