;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_symptoms_of_abdominal_pain_now)
(assert patient_has_diagnosis_of_acute_respiratory_distress_syndrome_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_high_lipase_level_in_serum_now patient_has_finding_of_serum_amylase_raised_now))
