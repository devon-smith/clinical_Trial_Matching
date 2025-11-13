;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_capsule_now)
(assert (not patient_has_finding_of_suicidal_now))
(assert (not patient_has_taken_topiramate_containing_product_inthepast6months))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_psychotic_disorder_now patient_has_diagnosis_of_bipolar_disorder_now))
(assert (or patient_has_undergone_pregnancy_detection_examination_now_outcome_is_negative (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
