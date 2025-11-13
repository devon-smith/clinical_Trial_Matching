;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_hypotensive_agent_now)
(assert patient_can_undergo_magnetic_resonance_imaging_now)
(assert (not patient_has_diagnosis_of_diabetes_mellitus_now))
(assert (not patient_has_diagnosis_of_atrial_fibrillation_now))
(assert (not patient_has_diagnosis_of_dementia_now))
