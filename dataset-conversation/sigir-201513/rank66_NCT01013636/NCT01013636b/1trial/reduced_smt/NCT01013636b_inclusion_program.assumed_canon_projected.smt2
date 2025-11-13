;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_fever_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_thrombocytopenic_disorder_now patient_has_finding_of_decreased_blood_leukocyte_number_now patient_has_finding_of_inflammatory_disease_of_liver_now))
