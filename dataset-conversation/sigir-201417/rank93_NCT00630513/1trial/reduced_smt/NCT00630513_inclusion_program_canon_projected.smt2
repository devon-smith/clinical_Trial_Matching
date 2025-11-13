;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_acute_appendicitis_now)
(assert patient_has_finding_of_diverticulitis_now)
(assert patient_has_diagnosis_of_acute_cholecystitis_now)
(assert patient_has_finding_of_peritonitis_now)
(assert patient_has_finding_of_abdominal_abscess_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) patient_has_finding_of_acute_perforated_appendicitis_now))
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) patient_has_finding_of_acute_appendicitis_with_appendix_abscess_now))
(assert (or patient_has_finding_of_perforation_of_stomach_now patient_has_finding_of_duodenal_perforation_now))
