;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_left_ventricular_cardiac_dysfunction_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_undergone_coronary_angiography_inthehistory) patient_has_suspicion_of_coronary_arteriosclerosis_now))
(assert (or (not patient_has_finding_of_myocardial_infarction_inthehistory) patient_has_suspicion_of_coronary_arteriosclerosis_now))
(assert (or (not patient_has_finding_of_myocardial_ischemia_now) patient_has_suspicion_of_coronary_arteriosclerosis_now))
(assert (or patient_has_diagnosis_of_coronary_arteriosclerosis_now patient_has_suspicion_of_coronary_arteriosclerosis_now))
(assert (or (not patient_has_suspicion_of_coronary_arteriosclerosis_now) patient_has_undergone_coronary_angiography_inthehistory patient_has_finding_of_myocardial_infarction_inthehistory patient_has_finding_of_myocardial_ischemia_now))
