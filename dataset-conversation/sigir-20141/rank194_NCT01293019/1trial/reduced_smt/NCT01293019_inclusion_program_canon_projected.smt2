;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_cystic_fibrosis_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_cystic_fibrosis_now) patient_has_finding_of_sweat_test_abnormal_now))
(assert (or patient_has_finding_of_chronic_neck_pain_now patient_has_finding_of_chronic_back_pain_now patient_has_finding_of_chest_pain_now))
