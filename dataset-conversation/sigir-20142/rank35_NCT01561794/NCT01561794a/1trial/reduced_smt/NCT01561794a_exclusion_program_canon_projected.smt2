;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_nephrotic_syndrome_now))
(assert (not patient_has_finding_of_abscess_of_lung_now))
(assert (not patient_has_finding_of_empyema_now))
(assert (not patient_has_finding_of_bacteremia_due_to_staphylococcus_aureus_now))
(assert (not patient_has_undergone_urinary_pneumococcal_antigen_test_now_outcome_is_positive))
(assert (not patient_has_finding_of_postobstructive_pneumonia_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_exposed_to_sulbactam_sodium_now) (not patient_is_exposed_to_ampicillin_sodium_now)))
(assert (or patient_is_exposed_to_sulbactam_sodium_now patient_is_exposed_to_clindamycin_now))
(assert (or patient_is_exposed_to_ampicillin_sodium_now patient_is_exposed_to_clindamycin_now))
