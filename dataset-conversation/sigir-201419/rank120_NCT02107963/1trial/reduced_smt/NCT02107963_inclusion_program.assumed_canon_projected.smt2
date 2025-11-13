;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_undergone_opening_of_chest_now)
(assert patients_general_physical_performance_status_is_normal_now)
(assert patients_cardiac_function_is_normal_now)
(assert patients_liver_function_is_normal_now)
(assert patient_has_finding_of_toxic_liver_disease_now)
(assert (not patient_has_undergone_chemotherapy_inthepast3weeks))
