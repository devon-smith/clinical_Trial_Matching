;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_erythema_now)
(assert patient_has_finding_of_exudate_on_tonsils_now)
(assert patient_has_finding_of_swelling_of_tonsil_now)
(assert patient_has_finding_of_anterior_cervical_lymphadenopathy_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_fever_now patient_has_finding_of_fever_inthepast24hours))
(assert (or (not patient_has_finding_of_fever_inthepast24hours) patient_has_finding_of_fever_now))
(assert (or patient_has_finding_of_fever_now patient_has_finding_of_petechiae_now))
(assert (or patient_has_finding_of_fever_inthepast24hours (not patient_has_finding_of_fever_now)))
(assert (or (not patient_has_finding_of_fever_inthepast24hours) (not patient_has_finding_of_fever_now)))
(assert (or (not patient_has_finding_of_fever_now) patient_has_finding_of_petechiae_now))
(assert (or patient_has_finding_of_fever_inthepast24hours patient_has_finding_of_petechiae_now))
(assert (or (not patient_has_finding_of_fever_inthepast24hours) patient_has_finding_of_petechiae_now))
(assert (or patient_has_finding_of_erythema_scarlatiniforme_now patient_has_finding_of_disorder_of_tympanic_membrane_now))
