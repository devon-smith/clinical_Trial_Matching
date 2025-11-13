;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_oral_tablet_now)
(assert (not patient_is_pregnant_now))
(assert (not patient_has_undergone_oral_chemotherapy_inthepast6weeks))
(assert (not patient_is_undergoing_chemotherapy_now))
(assert (not patient_is_undergoing_immunological_therapy_now))
