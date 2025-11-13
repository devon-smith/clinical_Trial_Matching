;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_undergoing_chemotherapy_now) patient_is_undergoing_hormone_therapy_now))
(assert (or (not patient_is_undergoing_immunological_therapy_now) patient_is_undergoing_hormone_therapy_now))
(assert (or (not patient_is_undergoing_biological_treatment_now) patient_is_undergoing_hormone_therapy_now))
(assert (or patient_is_undergoing_chemotherapy_now patient_is_undergoing_immunological_therapy_now patient_is_undergoing_biological_treatment_now))
