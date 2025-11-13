;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_anaphylaxis_inthehistory))
(assert (not patient_has_hypersensitivity_to_aspirin_inthehistory))
(assert (not patient_has_hypersensitivity_to_clopidogrel_inthehistory))
(assert (not patient_has_hypersensitivity_to_everolimus_inthehistory))
(assert (not patient_has_hypersensitivity_to_heparin_inthehistory))
(assert (not patient_has_hypersensitivity_to_zotarolimus_inthehistory))
(assert (not patient_has_finding_of_gastrointestinal_hemorrhage_inthepast3months))
(assert (not patient_has_finding_of_genitourinary_tract_hemorrhage_inthepast3months))
(assert (not patient_has_undergone_surgical_procedure_inthepast2months))
(assert (not patient_has_diagnosis_of_blood_coagulation_disorder_inthehistory))
(assert (not patient_has_diagnosis_of_heparin_induced_thrombocytopenia_inthehistory))
(assert (not patient_can_undergo_transfusion_of_blood_product_inthefuture))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (not patient_has_childbearing_potential_now) patient_has_undergone_pregnancy_detection_examination_inthepast1months_outcome_is_negative))
