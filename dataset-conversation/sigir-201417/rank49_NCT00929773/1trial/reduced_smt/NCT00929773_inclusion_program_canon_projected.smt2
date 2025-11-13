;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_musculoskeletal_pain_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_strain_of_neck_muscle_now patient_has_finding_of_shoulder_strain_now))
(assert (or patient_has_finding_of_chronic_pain_now patient_has_finding_of_chronic_neck_pain_now patient_has_finding_of_acute_pain_now))
