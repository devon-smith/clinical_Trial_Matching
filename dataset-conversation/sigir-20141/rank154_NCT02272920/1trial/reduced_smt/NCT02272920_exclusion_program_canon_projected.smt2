;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_oriented_to_person_now)
(assert patient_has_finding_of_oriented_to_place_now)
(assert patient_has_finding_of_oriented_to_time_now)
(assert (not patient_has_finding_of_akatamathesia_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_is_able_to_be_pregnant_now)))
(assert (or patient_is_able_to_be_pregnant_now (not patient_has_finding_of_fertility_now)))
