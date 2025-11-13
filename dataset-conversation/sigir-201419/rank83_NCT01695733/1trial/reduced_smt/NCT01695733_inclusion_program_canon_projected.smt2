;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_malignant_neoplastic_disease_now)
(assert patient_will_undergo_chemotherapy_inthefuture)
(assert (not patient_will_undergo_immunological_therapy_inthefuture))
