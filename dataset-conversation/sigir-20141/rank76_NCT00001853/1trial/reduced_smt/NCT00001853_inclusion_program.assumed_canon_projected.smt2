;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_general_health_good_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))
(assert (<= patient_age_value_recorded_now_in_years 70.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_angina_pectoris_now patient_has_diagnosis_of_myocardial_infarction_inthehistory patient_has_undergone_coronary_artery_bypass_graft_inthehistory patient_has_undergone_coronary_angioplasty_inthehistory))
