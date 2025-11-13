;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_cystic_fibrosis_now))
(assert (not patient_has_diagnosis_of_malignant_neoplastic_disease_now))
(assert (not patient_has_finding_of_bronchiectasis_now))
(assert (not patient_has_diagnosis_of_abscess_of_lung_inthepast6months))
(assert (not patient_has_diagnosis_of_pneumonia_inthepast6months))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now (not (<= patient_age_value_recorded_now_in_months 6.0))))
