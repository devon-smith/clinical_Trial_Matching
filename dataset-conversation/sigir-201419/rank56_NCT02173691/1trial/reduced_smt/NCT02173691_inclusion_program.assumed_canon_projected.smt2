;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
(assert patient_can_undergo_shuttle_test_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_moderate_chronic_obstructive_pulmonary_disease_now patient_has_diagnosis_of_severe_chronic_obstructive_pulmonary_disease_now))
