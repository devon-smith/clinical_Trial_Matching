;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_interstitial_lung_disease_now))
(assert (not patient_has_finding_of_croup_now))
(assert (not patient_has_finding_of_pulmonary_aspiration_now))
(assert (not patient_has_diagnosis_of_chronic_lung_disease_inthehistory))
(assert (not patient_has_diagnosis_of_cystic_fibrosis_inthehistory))
(assert (not patient_has_finding_of_disease_of_liver_now))
(assert (not patient_has_finding_of_kidney_disease_now))
(assert (not patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now))
(assert (not patient_is_undergoing_artificial_respiration_now))
(assert (not patient_has_finding_of_bronchomalacia_now))
(assert (not patient_has_finding_of_tracheomalacia_now))
(assert (not patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast72hours))

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_months 2.0))
(assert (<= patient_age_value_recorded_now_in_months 12.0))
