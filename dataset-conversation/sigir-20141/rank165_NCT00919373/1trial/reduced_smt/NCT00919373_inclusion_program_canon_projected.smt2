;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_coronary_arteriosclerosis_now)
(assert patient_has_finding_of_ventricular_tachycardia_inthehistory)

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_undergone_thrombolysis_inthehistory patient_has_undergone_heart_revascularization_inthehistory))
(assert (or patient_has_undergone_heart_revascularization_inthehistory patient_has_finding_of_myocardial_infarction_inthehistory))
(assert (or patient_has_undergone_thrombolysis_inthehistory patient_has_finding_of_myocardial_infarction_inthehistory))
(assert (or (not patient_has_diagnosis_of_coronary_arteriosclerosis_now) patient_has_finding_of_myocardial_infarction_inthehistory))
