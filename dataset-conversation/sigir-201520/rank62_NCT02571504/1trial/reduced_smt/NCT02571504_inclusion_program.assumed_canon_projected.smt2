;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 35.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_can_undergo_electroencephalogram_now patient_can_undergo_magnetic_resonance_imaging_now))
