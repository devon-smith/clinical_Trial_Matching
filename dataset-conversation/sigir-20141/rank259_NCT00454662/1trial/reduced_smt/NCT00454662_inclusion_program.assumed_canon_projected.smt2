;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_is_exposed_to_hypotensive_agent_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 65.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_cerebrovascular_accident_inthehistory (not patient_has_diagnosis_of_cerebral_infarction_inthehistory)))
(assert (or (not patient_has_diagnosis_of_subarachnoid_hemorrhage_inthehistory) patient_has_diagnosis_of_cerebrovascular_accident_inthehistory))
(assert (or patient_has_diagnosis_of_cerebrovascular_accident_inthehistory (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory)))
(assert (or patient_has_diagnosis_of_cerebrovascular_accident_inthehistory (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)))
(assert (or (not (>= patient_age_value_recorded_now_in_years 85.0)) patient_has_diagnosis_of_cerebrovascular_accident_inthehistory))
(assert (or (not (>= patient_age_value_recorded_now_in_years 85.0)) (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory)))
(assert (or (not (>= patient_age_value_recorded_now_in_years 85.0)) (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)))
(assert (or (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory) patient_has_diagnosis_of_cerebral_infarction_inthehistory patient_has_diagnosis_of_subarachnoid_hemorrhage_inthehistory))
(assert (or patient_has_undergone_percutaneous_coronary_intervention_inthehistory patient_has_undergone_coronary_artery_bypass_graft_inthehistory patient_has_diagnosis_of_cerebrovascular_accident_inthehistory))
(assert (or (not (>= patient_age_value_recorded_now_in_years 85.0)) patient_has_undergone_percutaneous_coronary_intervention_inthehistory patient_has_undergone_coronary_artery_bypass_graft_inthehistory))
(assert (or patient_has_diagnosis_of_cerebrovascular_accident_inthehistory patient_has_diagnosis_of_cerebral_infarction_inthehistory patient_has_diagnosis_of_subarachnoid_hemorrhage_inthehistory patient_has_diagnosis_of_myocardial_infarction_inthehistory patients_risk_factor_is_positive_now))
