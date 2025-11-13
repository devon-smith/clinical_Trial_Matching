;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_can_undergo_percutaneous_coronary_intervention_now)
(assert patient_has_finding_of_culprit_lesion_of_coronary_artery_now)
(assert patient_can_undergo_endovascular_insertion_of_stent_now)
(assert patient_has_diagnosis_of_acute_coronary_syndrome_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_diagnosis_of_acute_coronary_syndrome_now) patient_has_diagnosis_of_myocardial_infarction_now))
(assert (or (not patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now) patient_has_diagnosis_of_myocardial_infarction_now))
(assert (or (not patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now) patient_has_diagnosis_of_myocardial_infarction_now))
(assert (or (not patient_has_finding_of_inverted_t_wave_now) patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now))
(assert (or (not patient_has_finding_of_myocardial_ischemia_now) patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now))
(assert (or (not patient_has_finding_of_culprit_lesion_of_coronary_artery_now) patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now))
(assert (or (not patient_has_diagnosis_of_myocardial_infarction_now) patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now))
