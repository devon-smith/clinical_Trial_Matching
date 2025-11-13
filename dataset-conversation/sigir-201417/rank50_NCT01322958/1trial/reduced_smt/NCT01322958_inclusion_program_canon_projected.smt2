;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_sex_is_female_now)
(assert patient_is_pregnant_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_abdominal_pain_now patient_has_finding_of_pain_in_pelvis_now patient_has_finding_of_vaginal_bleeding_now))
