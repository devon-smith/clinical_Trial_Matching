;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_chronic_hepatitis_now))
(assert (not patient_has_finding_of_congenital_heart_disease_now))
(assert (not patient_has_finding_of_mental_disorder_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_inthehistory) (not patient_is_attending_clinical_study_on_enteroviral_vesicular_stomatitis_with_exanthem_now)))
