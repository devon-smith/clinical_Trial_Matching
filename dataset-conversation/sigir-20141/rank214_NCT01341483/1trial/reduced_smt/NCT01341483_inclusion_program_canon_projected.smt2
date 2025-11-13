;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_sex_is_male_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_is_undergoing_coronary_angiography_now patient_is_undergoing_peripheral_angiography_now))
