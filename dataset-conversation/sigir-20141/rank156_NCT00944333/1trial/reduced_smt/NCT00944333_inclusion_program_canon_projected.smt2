;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_is_taking_drug_eluting_stent_now)
(assert patient_is_taking_second_generation_drug_eluting_stent_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_preinfarction_syndrome_now) (not patient_has_diagnosis_of_angina_pectoris_now)))
(assert (or patient_has_diagnosis_of_preinfarction_syndrome_now (not patient_has_diagnosis_of_angina_pectoris_now)))
(assert (or (not patient_has_diagnosis_of_preinfarction_syndrome_now) patient_has_diagnosis_of_angina_pectoris_now))
(assert (or patient_has_diagnosis_of_preinfarction_syndrome_now patient_has_diagnosis_of_angina_pectoris_now))
