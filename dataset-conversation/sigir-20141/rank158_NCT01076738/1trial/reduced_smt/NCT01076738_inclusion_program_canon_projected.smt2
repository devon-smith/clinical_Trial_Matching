;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_acute_coronary_syndrome_inthehistory) patient_has_diagnosis_of_non_q_wave_myocardial_infarction_inthehistory))
(assert (or patient_has_diagnosis_of_acute_coronary_syndrome_inthehistory (not patient_has_diagnosis_of_non_q_wave_myocardial_infarction_inthehistory)))
(assert (or patient_has_diagnosis_of_acute_coronary_syndrome_inthehistory patient_has_diagnosis_of_ischemic_stroke_inthehistory))
