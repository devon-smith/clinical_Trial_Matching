;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_malignant_tumor_of_esophagus_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_adenocarcinoma_of_esophagus_now patient_has_finding_of_squamous_cell_carcinoma_of_esophagus_now))
