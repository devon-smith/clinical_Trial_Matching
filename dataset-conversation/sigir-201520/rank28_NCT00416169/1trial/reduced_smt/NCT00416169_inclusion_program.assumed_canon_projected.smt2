;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patients_activity_of_daily_living_is_positive_now)
(assert patient_can_undergo_neuropsychological_testing_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_magnetic_resonance_imaging_now patient_has_undergone_computerized_axial_tomography_now))
