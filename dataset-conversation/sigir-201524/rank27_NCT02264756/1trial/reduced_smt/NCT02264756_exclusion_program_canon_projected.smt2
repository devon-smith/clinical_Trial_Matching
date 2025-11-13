;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_neutropenia_now))
(assert (not patient_has_diagnosis_of_leukemia_now))
(assert (not patient_has_diagnosis_of_malignant_lymphoma_now))
(assert (not patient_has_finding_of_patient_immunocompromised_now))
(assert (not patient_has_undergone_splenectomy_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_is_exposed_to_prednisone_now patient_has_finding_of_neutropenia_now))
(assert (or patient_is_exposed_to_prednisone_now patient_has_finding_of_patient_immunocompromised_now))
(assert (or patient_is_exposed_to_prednisone_now patient_is_undergoing_administration_of_antineoplastic_agent_now))
(assert (or patient_is_undergoing_administration_of_antineoplastic_agent_now patient_has_finding_of_neutropenia_now))
(assert (or (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now) patient_has_finding_of_patient_immunocompromised_now))
(assert (or patient_is_undergoing_administration_of_antineoplastic_agent_now patient_has_finding_of_patient_immunocompromised_now))
