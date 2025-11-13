;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_is_undergoing_home_oxygen_therapy_now))
(assert (not patient_is_undergoing_artificial_respiration_now))
(assert (not patient_is_undergoing_incision_of_trachea_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or patient_has_finding_of_heart_disease_now (not patient_has_finding_of_cyanotic_congenital_heart_disease_now)))
(assert (or (not patient_has_finding_of_cyanotic_congenital_heart_disease_now) patient_has_finding_of_ventricular_septal_defect_now patient_has_finding_of_atrial_septal_defect_now patient_has_finding_of_coarctation_of_aorta_now))
