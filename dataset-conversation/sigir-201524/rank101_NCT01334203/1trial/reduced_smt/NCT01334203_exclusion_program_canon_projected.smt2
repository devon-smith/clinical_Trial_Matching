;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_exercise_physically_impossible_now))
(assert (not patient_has_finding_of_decompensated_cardiac_failure_now))
(assert (not patient_has_diagnosis_of_acute_coronary_syndrome_inthepast2months))
(assert (not patient_has_undergone_myocardial_revascularization_inthepast6months))
(assert (not patient_has_finding_of_cerebrovascular_accident_inthepast6months))
(assert (not patient_has_finding_of_transient_cerebral_ischemia_inthepast6months))
(assert (not patient_has_diagnosis_of_atrial_fibrillation_now))
(assert (not patient_has_diagnosis_of_hypertrophic_cardiomyopathy_now))
(assert (not patient_has_finding_of_poor_hypertension_control_now))
(assert (not patient_has_taken_ranolazine_containing_product_inthehistory))
(assert (not patient_has_finding_of_illicit_drug_use_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_breastfeeding_now) patients_breastfeeding_is_positive_now))
(assert (or (not patients_breastfeeding_is_positive_now) patient_is_breastfeeding_now))
(assert (or (not patient_sex_is_female_now) (not patient_is_breastfeeding_now)))
