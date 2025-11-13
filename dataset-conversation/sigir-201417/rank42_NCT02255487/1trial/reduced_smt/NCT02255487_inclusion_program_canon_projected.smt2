;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_undergone_laparotomy_inthehistory)
(assert patient_has_finding_of_acute_abdomen_inthehistory)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_sex_is_male_now patient_sex_is_female_now))
(assert (or patient_has_finding_of_blunt_injury_of_abdomen_inthehistory patient_has_finding_of_penetrating_wound_of_abdomen_inthehistory))
