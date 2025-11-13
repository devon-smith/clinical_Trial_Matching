;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_alcohol_abuse_inthehistory))
(assert (not patient_has_finding_of_alcohol_abuse_now))
(assert (not patient_has_finding_of_alcohol_dependence_inthehistory))
(assert (not patient_has_finding_of_alcohol_dependence_now))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now))
(assert (not patient_has_finding_of_psychoactive_substance_dependence_inthehistory))
(assert (not patient_has_finding_of_psychoactive_substance_dependence_now))
(assert (not patient_has_diagnosis_of_mild_cognitive_disorder_now))
(assert (not patient_is_pregnant_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_diagnosis_of_alzheimer_s_disease_now patients_activity_of_daily_living_is_abnormal_now patient_has_diagnosis_of_mild_cognitive_disorder_now))
