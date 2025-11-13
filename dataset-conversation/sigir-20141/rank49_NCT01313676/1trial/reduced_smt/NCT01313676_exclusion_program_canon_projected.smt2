;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_pregnant_now))
(assert (not patient_is_lactating_now))
(assert (not patient_has_finding_of_bronchiectasis_now))
(assert (not patient_has_finding_of_fibrosis_of_lung_now))
(assert (not patient_has_finding_of_interstitial_lung_disease_now))
(assert (not patient_has_finding_of_primary_malignant_neoplasm_of_lung_now))
(assert (not patient_has_finding_of_pulmonary_hypertension_now))
(assert (not patient_has_finding_of_sarcoidosis_now))
(assert (not patient_has_undergone_transplant_of_lung_inthehistory))
(assert (not patient_is_undergoing_long_term_oxygen_therapy_now))
(assert (not patient_has_finding_of_intellectual_disability_inthehistory))
(assert (not patient_has_finding_of_mental_disorder_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_asthma_now) patient_has_diagnosis_of_asthma_inthehistory))
(assert (or (not patient_has_diagnosis_of_asthma_now) patient_has_diagnosis_of_chronic_obstructive_lung_disease_now))
