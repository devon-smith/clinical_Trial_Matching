;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_undergoing_admission_to_intensive_care_unit_now))
(assert (not patient_is_undergoing_noninvasive_ventilation_now))
(assert (not patient_has_diagnosis_of_leukemia_now))
(assert (not patient_has_diagnosis_of_malignant_lymphoma_now))
(assert (not patient_has_finding_of_patient_immunocompromised_now))
(assert (not patient_has_undergone_splenectomy_inthehistory))
(assert (not patient_has_finding_of_neutropenic_disorder_now))
(assert (not patient_is_exposed_to_immunosuppressant_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now) patient_has_finding_of_patient_immunocompromised_now))
(assert (or (not patient_is_taking_prednisone_containing_product_now) patient_is_exposed_to_immunosuppressant_now))
