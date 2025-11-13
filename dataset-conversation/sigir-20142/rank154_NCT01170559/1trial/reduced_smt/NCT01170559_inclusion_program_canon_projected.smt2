;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_intermittent_palpitations_inthehistory)
(assert patient_has_finding_of_palpitations_inthehistory)
(assert patient_has_finding_of_symptom_started_suddenly_inthehistory)
(assert patient_has_finding_of_tachycardia_inthehistory)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_dyspnea_inthehistory patient_has_finding_of_dizziness_inthehistory))
