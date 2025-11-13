;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_spinal_injury_now))
(assert (not patient_has_suspicion_of_spinal_injury_now))
(assert (not patient_has_finding_of_pressure_ulcer_of_heel_inthehistory))
(assert (not patient_has_finding_of_pressure_ulcer_of_sacral_region_inthehistory))
(assert (not patient_has_finding_of_heel_injury_now))
(assert (not patient_has_finding_of_traumatic_injury_of_sacrum_now))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
