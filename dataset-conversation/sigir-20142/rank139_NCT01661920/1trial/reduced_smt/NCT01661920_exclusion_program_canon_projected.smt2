;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_human_immunodeficiency_virus_infection_now))
(assert (not patient_has_finding_of_neutropenia_now))
(assert (not patient_has_finding_of_patient_immunosuppressed_now))
(assert (not patient_has_undergone_solid_organ_transplant_inthehistory))
(assert (not patient_has_undergone_splenectomy_inthehistory))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_exposed_to_prednisone_now) patient_has_finding_of_patient_immunosuppressed_now))
(assert (or patient_has_finding_of_pneumonia_now patient_has_finding_of_patient_immunosuppressed_now))
(assert (or patient_has_finding_of_pneumonia_now (not patient_is_exposed_to_prednisone_now)))
