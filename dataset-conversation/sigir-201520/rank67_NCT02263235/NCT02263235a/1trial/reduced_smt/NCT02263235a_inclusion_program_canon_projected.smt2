;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_hydrocephalus_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_alzheimer_s_disease_now patient_has_diagnosis_of_frontotemporal_dementia_now patient_has_diagnosis_of_diffuse_lewy_body_disease_now patient_has_diagnosis_of_parkinson_s_disease_now))
