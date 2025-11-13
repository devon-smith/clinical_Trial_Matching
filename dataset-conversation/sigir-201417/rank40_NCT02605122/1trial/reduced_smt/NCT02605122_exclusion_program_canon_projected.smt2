;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_hospital_acquired_pneumonia_now))
(assert (not patient_has_finding_of_ventilator_associated_pneumonia_now))
(assert (not patient_is_pregnant_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_breastfeeding_now) (not patient_sex_is_female_now)))
