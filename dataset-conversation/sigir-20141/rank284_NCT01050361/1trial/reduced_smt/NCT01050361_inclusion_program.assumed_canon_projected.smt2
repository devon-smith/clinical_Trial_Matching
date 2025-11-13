;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_diabetes_mellitus_now)
(assert patient_has_finding_of_obesity_now)
(assert patient_has_finding_of_renal_insufficiency_now)
(assert patient_has_finding_of_tobacco_user_now)
(assert patient_has_finding_of_hypercholesterolemia_now)
(assert patient_has_finding_of_heart_valve_disorder_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 65.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_has_finding_of_obesity_now) patient_has_finding_of_sleep_apnea_now))
(assert (or (not patient_has_finding_of_obesity_now) patient_has_finding_of_transient_cerebral_ischemia_inthehistory))
(assert (or patient_has_finding_of_cerebrovascular_accident_inthehistory (not patient_has_finding_of_obesity_now)))
(assert (or patient_has_finding_of_cerebrovascular_accident_inthehistory patient_has_finding_of_sleep_apnea_now))
(assert (or patient_has_finding_of_cerebrovascular_accident_inthehistory patient_has_finding_of_transient_cerebral_ischemia_inthehistory))
(assert (or patient_has_finding_of_transient_cerebral_ischemia_inthehistory patient_has_finding_of_sleep_apnea_now))
