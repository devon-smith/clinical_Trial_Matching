;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_cerebral_malaria_now))
(assert (not patient_has_clinical_signs_of_anemia_now))
(assert (not patient_has_clinical_signs_of_renal_failure_syndrome_now))
(assert (not patient_has_finding_of_pulmonary_edema_now))
(assert (not patient_has_clinical_signs_of_hypoglycemia_now))
(assert (not patient_has_finding_of_hypoglycemia_now))
(assert (not patient_has_finding_of_disseminated_intravascular_coagulation_now))
(assert (not patient_has_finding_of_spontaneous_hemorrhage_now))
(assert (not patient_has_finding_of_acidemia_now))
(assert (not patient_has_finding_of_jaundice_now))
(assert (not patient_has_finding_of_aids_inthehistory))
(assert (not patient_has_hypersensitivity_to_artesunate_inthehistory))
(assert (not patient_has_hypersensitivity_to_clindamycin_inthehistory))
(assert (not patient_has_hypersensitivity_to_mefloquine_inthehistory))
(assert (not patient_has_hypersensitivity_to_quinine_inthehistory))
(assert (not patient_has_hypersensitivity_to_tetracycline_inthehistory))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_exposed_to_antimalarial_inthepast7days))
(assert (not patient_has_finding_of_disturbance_of_consciousness_now))
(assert (not patient_has_finding_of_unable_to_drink_now))
(assert (not patient_has_finding_of_unable_to_eat_now))
(assert (not patient_has_finding_of_unable_to_sit_now))
(assert (not patient_has_finding_of_unable_to_stand_now))
(assert (not patient_has_undergone_splenectomy_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_cerebral_malaria_now patient_has_clinical_signs_of_malaria_now))
