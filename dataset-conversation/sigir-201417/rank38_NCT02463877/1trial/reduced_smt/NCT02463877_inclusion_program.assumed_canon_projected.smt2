;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now)
(assert patient_has_finding_of_disorder_of_peritoneum_now)
(assert patient_can_undergo_surgical_procedure_now)
(assert patient_has_finding_of_liver_function_now)
(assert patients_creatinine_is_normal_now)
(assert patients_urea_nitrogen_is_normal_now)
(assert patient_can_undergo_debulking_of_neoplasm_of_abdominal_cavity_now)
(assert (not patient_has_finding_of_jaundice_now))
(assert (not patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now))
(assert (not patient_has_finding_of_acute_myocardial_infarction_inthepast6months))
(assert (not patient_has_finding_of_mental_disorder_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_liver_function_now) patient_has_diagnosis_of_gilberts_syndrome_now))
