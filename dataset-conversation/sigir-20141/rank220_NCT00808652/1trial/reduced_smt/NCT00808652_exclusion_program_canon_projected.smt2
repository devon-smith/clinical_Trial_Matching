;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_patient_unsuitable_for_procedure_now))
(assert (not patient_is_pregnant_now))
(assert (not patient_has_finding_of_cerebrovascular_accident_inthehistory))
(assert (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
(assert (not patient_has_undergone_fluoroscopic_angiography_of_coronary_artery_and_insertion_of_stent_inthehistory))
(assert (not patient_has_finding_of_myocardial_infarction_inthehistory))
(assert (not patient_has_finding_of_alcohol_abuse_inthehistory))
(assert (not patient_has_finding_of_chronic_liver_disease_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_undergone_coronary_angiography_inthehistory) (not patient_has_undergone_angioplasty_of_blood_vessel_inthehistory)))
(assert (or (not patient_has_finding_of_peripheral_vascular_disease_inthehistory) (not patient_has_finding_of_electrocardiogram_abnormal_inthehistory)))
(assert (or (not patient_has_finding_of_peripheral_vascular_disease_inthehistory) (not patient_has_finding_of_echocardiogram_abnormal_inthehistory)))
