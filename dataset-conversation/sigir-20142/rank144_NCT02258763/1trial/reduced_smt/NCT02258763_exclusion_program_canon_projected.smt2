;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_community_acquired_pneumonia_now)
(assert (not patient_has_undergone_transfer_of_care_from_hospital_inthehistory))
(assert (not patient_has_diagnosis_of_asthma_now))
(assert (not patient_has_diagnosis_of_bronchiolitis_now))
(assert (not patient_has_finding_of_acute_disease_now))
(assert (not patient_can_undergo_follow_up_visit_now))
(assert (not patient_has_undergone_noninvasive_ventilation_inthehistory))
(assert (not patient_is_exposed_to_macrolide_antibacterial_now))
(assert (not patient_has_finding_of_meningitis_now))
(assert (not patient_has_finding_of_allergy_to_penicillin_now))
