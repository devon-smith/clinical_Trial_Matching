;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_asthma_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_symptoms_of_wheezing_inthepast12months patient_has_symptoms_of_persistent_cough_inthepast12months patient_has_symptoms_of_tight_chest_inthepast12months patient_has_symptoms_of_dyspnea_inthepast12months patient_has_taken_drug_or_medicament_inthepast12months))
