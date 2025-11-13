;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_undergone_antibiotic_therapy_inthehistory))
(assert (not patient_is_undergoing_antibiotic_therapy_now))
(assert (not patient_has_undergone_appendectomy_inthehistory))
(assert (not patient_is_pregnant_now))
(assert (not patient_has_diagnosis_of_inflammatory_bowel_disease_inthehistory))
(assert (not patient_has_suspicion_of_inflammatory_bowel_disease_now))
