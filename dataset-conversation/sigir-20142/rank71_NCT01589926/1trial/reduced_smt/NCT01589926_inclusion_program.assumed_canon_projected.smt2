;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_acute_chest_syndrome_now)
(assert patient_has_finding_of_radiologic_infiltrate_of_lung_now)
(assert patient_can_undergo_transfusion_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_tachypnea_now patient_has_finding_of_cough_now))
(assert (or (not patient_can_undergo_transfusion_now) patient_has_finding_of_hypoxemia_now))
(assert (or (not patient_has_diagnosis_of_acute_chest_syndrome_now) patient_has_finding_of_fever_now patient_has_finding_of_chest_pain_now))
