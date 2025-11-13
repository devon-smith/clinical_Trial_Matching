;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_undergone_emergency_cabg_inthehistory))
(assert (not patient_has_finding_of_suicidal_thoughts_inthepast2weeks))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_disorientation_for_person_now) patient_has_finding_of_disorientated_now))
(assert (or (not patient_has_finding_of_disorientated_in_place_now) patient_has_finding_of_disorientated_now))
(assert (or (not patient_has_finding_of_disorientation_for_person_now) (not patient_has_finding_of_disorientated_in_place_now)))
(assert (or (not patients_reading_is_negative_now) (not patients_understanding_is_negative_now)))
(assert (or (not patient_has_finding_of_disorientated_now) patient_has_finding_of_disorientation_for_person_now patient_has_finding_of_disorientated_in_place_now))
