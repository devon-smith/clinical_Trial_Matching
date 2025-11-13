;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_is_undergoing_surgical_procedure_now)
(assert patient_has_finding_of_treatment_plan_given_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_malignant_neoplastic_disease_now patient_has_diagnosis_of_malignant_tumor_of_neck_now))
