;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
(assert patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory)
(assert patient_has_diagnosis_of_myocardial_infarction_inthehistory)
(assert patient_has_diagnosis_of_preinfarction_syndrome_inthehistory)
(assert (not patient_has_undergone_repair_of_abdominal_aortic_aneurysm_with_insertion_of_endovascular_stent_graft_inthehistory))
(assert (not patient_has_undergone_chemotherapy_inthehistory))
(assert (not patient_has_undergone_hormone_therapy_inthehistory))
(assert (not patient_has_undergone_prostatectomy_inthehistory))
(assert (not patient_has_undergone_radiotherapy_to_pelvis_inthehistory))
(assert (not patient_has_undergone_transplant_of_kidney_inthehistory))
