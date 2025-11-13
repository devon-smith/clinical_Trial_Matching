;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_clinical_signs_of_pharyngitis_now))
(assert (not patient_has_finding_of_throat_swab_culture_negative_now))
(assert (not patient_has_finding_of_allergy_to_penicillin_inthehistory))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 6.0))
(assert (<= patient_age_value_recorded_now_in_years 15.0))
