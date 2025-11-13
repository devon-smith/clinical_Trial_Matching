;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_undergoing_clinical_trial_now))
(assert (not patient_has_finding_of_inpatient_stay_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory (not patient_has_undergone_non_invasive_study_of_peripheral_vessel_inthehistory)))
