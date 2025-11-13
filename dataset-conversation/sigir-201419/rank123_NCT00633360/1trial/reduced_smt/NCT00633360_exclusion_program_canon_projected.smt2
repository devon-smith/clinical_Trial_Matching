;; ===================== PROJECTED CANON (QE) =====================
;; Each clause below is entailed by Proj = ∃W.F over the canonical vocabulary.
;; Units appear first for clarity; OR-clauses (SAT-filtered) follow.
;; ==================================================================

;; Unit Bool constraints (entailed)
(assert (not patient_has_finding_of_amenorrhea_inthepast6months))
(assert (not patient_has_finding_of_irregular_periods_inthepast6months))
(assert (not patient_is_pregnant_now))
(assert (not patient_is_breastfeeding_now))
(assert (not patients_breastfeeding_is_positive_now))
(assert (not patient_has_diagnosis_of_hypomania_inthehistory))
(assert (not patient_has_diagnosis_of_mania_inthehistory))
(assert (not patient_is_exposed_to_benzodiazepine_now))
(assert (not patient_is_exposed_to_carbamazepine_now))
(assert (not patient_is_exposed_to_ketoconazole_now))
(assert (not patient_is_exposed_to_modafinil_now))
(assert (not patient_is_exposed_to_oxcarbazepine_now))
(assert (not patient_is_exposed_to_phenobarbital_now))
(assert (not patient_is_exposed_to_phenytoin_now))
(assert (not patient_is_exposed_to_rifampin_now))
(assert (not patient_is_exposed_to_topiramate_now))
(assert (not patient_is_taking_aldosterone_receptor_antagonist_now))
(assert (not patient_is_taking_angiotensin_converting_enzyme_inhibitor_now))
(assert (not patient_is_taking_angiotensin_ii_receptor_antagonist_now))
(assert (not patient_is_taking_heparin_now))
(assert (not patient_is_taking_non_steroidal_anti_inflammatory_agent_now))
(assert (not patient_is_taking_potassium_sparing_diuretic_now))
(assert (not patient_is_taking_spironolactone_now))

;; Additional OR-clauses (SAT-filtered)
(assert (or (not patient_sex_is_female_now) (<= patient_age_value_recorded_now_in_years 34.0)))
