;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_disorder_of_respiratory_system_now))
(assert (not patient_is_undergoing_long_term_oxygen_therapy_now))
(assert (not patient_has_diagnosis_of_disorder_of_thyroid_gland_inthehistory))
(assert (not patient_has_diagnosis_of_intellectual_disability_inthehistory))
(assert (not patient_has_diagnosis_of_mental_disorder_inthehistory))
(assert (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast2years))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_is_undergoing_oxygen_therapy_now) patient_is_undergoing_long_term_oxygen_therapy_now))
