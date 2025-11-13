;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_has_finding_of_developmental_delay_now))
(assert (not patient_has_finding_of_difficulty_communicating_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_undergone_imaging_now) (not patient_has_finding_of_acute_perforated_appendicitis_now)))
