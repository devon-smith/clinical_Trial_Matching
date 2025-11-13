;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_diagnosis_of_myocarditis_now))
(assert (not patient_has_suspicion_of_myocarditis_now))
(assert (not patient_has_diagnosis_of_neoplasm_of_heart_inthehistory))
(assert (not patient_has_finding_of_autoimmune_disease_inthepast5years))
(assert (not patient_has_finding_of_autoimmune_disease_now))
(assert (not patient_has_finding_of_disorder_of_connective_tissue_inthepast5years))
(assert (not patient_has_finding_of_disorder_of_connective_tissue_now))
(assert (not patient_is_exposed_to_immunosuppressant_inthehistory))
(assert (not patient_is_exposed_to_immunosuppressant_now))
(assert (not patient_has_undergone_implantation_of_internal_cardiac_defibrillator_inthehistory))
(assert (not patient_has_diagnosis_of_arrhythmogenic_right_ventricular_dysplasia_now))
(assert (not patient_has_finding_of_alcohol_abuse_now))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now))
(assert (not patient_has_diagnosis_of_viral_hepatitis_now))
(assert (not patient_has_finding_of_diabetic_poor_control_now))
(assert (not patient_has_finding_of_sustained_ventricular_tachycardia_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now)))
