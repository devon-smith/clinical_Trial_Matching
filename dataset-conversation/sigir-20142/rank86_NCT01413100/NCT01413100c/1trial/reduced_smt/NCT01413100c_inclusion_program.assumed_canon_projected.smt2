;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_systemic_sclerosis_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_taken_mycophenolate_mofetil_inthehistory patient_has_taken_cyclophosphamide_inthehistory))
(assert (or (not patient_has_finding_of_lung_involvement_associated_with_another_disorder_now) patient_has_taken_mycophenolate_mofetil_inthehistory))
(assert (or (not patient_has_finding_of_lung_involvement_associated_with_another_disorder_now) patient_has_taken_cyclophosphamide_inthehistory))
(assert (or (not patient_has_finding_of_interstitial_lung_disease_now) patient_has_finding_of_lung_involvement_associated_with_another_disorder_now))
(assert (or (not patient_has_finding_of_simple_pulmonary_alveolitis_now) patient_has_finding_of_lung_involvement_associated_with_another_disorder_now))
(assert (or (not patient_has_finding_of_lung_involvement_associated_with_another_disorder_now) patient_has_finding_of_interstitial_lung_disease_now patient_has_finding_of_simple_pulmonary_alveolitis_now))
