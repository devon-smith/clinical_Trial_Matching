;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_magnetic_resonance_imaging_now)
(assert (not patient_is_undergoing_operation_on_heart_now))
(assert (not patient_is_undergoing_carotid_endarterectomy_now))
(assert (not patient_is_undergoing_operation_on_nervous_system_now))
(assert (not patient_has_diagnosis_of_cerebral_alteration_inthehistory))
(assert (not patient_has_diagnosis_of_cerebrovascular_disease_inthehistory))
(assert (not patient_has_finding_of_alcohol_abuse_now))
(assert (not patient_has_finding_of_claustrophobia_now))
