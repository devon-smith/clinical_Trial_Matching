;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_diagnosis_of_malignant_neoplastic_disease_now)
(assert patient_is_exposed_to_fluorouracil_now)
(assert patient_is_exposed_to_folinic_acid_now)

;; Numeric unit constraints (entailed)
(assert (>= patient_age_value_recorded_now_in_years 18.0))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_is_exposed_to_irinotecan_now patient_is_exposed_to_oxaliplatin_now))
