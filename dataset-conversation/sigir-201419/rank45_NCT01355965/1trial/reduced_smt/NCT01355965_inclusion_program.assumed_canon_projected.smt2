;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert patient_has_finding_of_malignant_mesothelioma_of_pleura_now)
(assert patient_can_undergo_apheresis_now)

;; Additional OR-clauses (SAT-filtered)
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) patient_has_diagnosis_of_venous_thrombosis_now))
(assert (or (not (<= patient_age_value_recorded_now_in_years 18.0)) patient_has_finding_of_obstruction_of_bile_duct_now))
