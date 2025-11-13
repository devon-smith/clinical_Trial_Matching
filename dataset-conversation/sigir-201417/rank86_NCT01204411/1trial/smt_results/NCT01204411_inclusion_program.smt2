;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "aged ≥ 6 months AND aged ≤ 59 months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_months 6)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 6 months."

(assert
  (! (<= patient_age_value_recorded_now_in_months 59)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 59 months."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight measured now, in kilograms."} // "weight"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have weight ≥ 5 kilograms.
(assert
  (! (>= patient_body_weight_value_recorded_now_withunit_kilograms 5.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have weight ≥ 5 kilograms."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_plasmodium_falciparum_monoinfection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Plasmodium falciparum monoinfection.","when_to_set_to_false":"Set to false if the patient currently does not have Plasmodium falciparum monoinfection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Plasmodium falciparum monoinfection.","meaning":"Boolean indicating whether the patient currently has Plasmodium falciparum monoinfection."} // "the patient must have Plasmodium falciparum monoinfection"
(declare-const patient_has_finding_of_plasmodium_falciparum_monoinfection_now@@confirmed_on_thick_blood_film Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Plasmodium falciparum monoinfection is confirmed on a thick blood film.","when_to_set_to_false":"Set to false if the patient's Plasmodium falciparum monoinfection is not confirmed on a thick blood film.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Plasmodium falciparum monoinfection is confirmed on a thick blood film.","meaning":"Boolean indicating whether the patient's Plasmodium falciparum monoinfection is confirmed on a thick blood film."} // "confirmed on a thick blood film"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_plasmodium_falciparum_monoinfection_now@@confirmed_on_thick_blood_film
         patient_has_finding_of_plasmodium_falciparum_monoinfection_now)
     :named REQ2_AUXILIARY0)) ;; "confirmed on a thick blood film" implies "Plasmodium falciparum monoinfection"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_plasmodium_falciparum_monoinfection_now@@confirmed_on_thick_blood_film
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have Plasmodium falciparum monoinfection (confirmed on a thick blood film)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const parasitic_density_value_recorded_now_withunit_asexual_forms_per_microliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's parasitic density measured now, in asexual forms per microliter of blood.","when_to_set_to_null":"Set to null if the patient's parasitic density is unknown, not documented, or cannot be determined now.","meaning":"Numeric value of the patient's parasitic density measured now, in asexual forms per microliter of blood."} // "parasitic density ≥ 1,000 asexual forms per microliter of blood AND parasitic density ≤ 200,000 asexual forms per microliter of blood"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: parasitic density ≥ 1,000 asexual forms per microliter of blood
(assert
  (! (>= parasitic_density_value_recorded_now_withunit_asexual_forms_per_microliter 1000)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "parasitic density ≥ 1,000 asexual forms per microliter of blood"

;; Component 1: parasitic density ≤ 200,000 asexual forms per microliter of blood
(assert
  (! (<= parasitic_density_value_recorded_now_withunit_asexual_forms_per_microliter 200000)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "parasitic density ≤ 200,000 asexual forms per microliter of blood"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_axillary_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's axillary temperature in degrees Celsius if such a measurement is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's measured axillary temperature recorded now, in degrees Celsius."} // "measured axillary temperature ≥ 37.5 degrees Celsius"
(declare-const patient_has_finding_of_fever_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a finding of fever at any time during the previous 24 hours.","when_to_set_to_false":"Set to false if the patient has not had a finding of fever at any time during the previous 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a finding of fever during the previous 24 hours.","meaning":"Boolean indicating whether the patient has had a finding of fever at any time during the previous 24 hours."} // "history of fever during the previous 24 hours"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must have (measured axillary temperature ≥ 37.5 degrees Celsius) OR (history of fever during the previous 24 hours).
(assert
  (! (or (>= patient_axillary_temperature_value_recorded_now_withunit_degrees_celsius 37.5)
         patient_has_finding_of_fever_inthepast24hours)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_weight_for_height_value_recorded_now_withunit_z_score Real) ;; {"when_to_set_to_value":"Set to the measured z-score value if a numeric measurement of the patient's weight-for-height ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current weight-for-height ratio in z-scores."} // "weight to height ratio"

(declare-const patient_has_finding_of_severe_malnutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe malnutrition as defined by the study protocol.","when_to_set_to_false":"Set to false if the patient currently does not have severe malnutrition as defined by the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe malnutrition.","meaning":"Boolean indicating whether the patient currently has severe malnutrition."} // "severe malnutrition"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition in the requirement: severe malnutrition is defined as weight-for-height ratio < -3 z-scores
(assert
  (! (= patient_has_finding_of_severe_malnutrition_now
        (< patient_weight_for_height_value_recorded_now_withunit_z_score -3.0))
     :named REQ5_AUXILIARY0)) ;; "severe malnutrition (defined as weight to height ratio < minus 3 z-scores)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_severe_malnutrition_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have severe malnutrition (defined as weight to height ratio < minus 3 z-scores)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_high_probability_of_compliance_with_follow_up_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient is assessed to have a high probability of compliance with follow-up visits.","when_to_set_to_false":"Set to false if the patient is assessed to not have a high probability of compliance with follow-up visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a high probability of compliance with follow-up visits.","meaning":"Boolean indicating whether the patient is assessed to have a high probability of compliance with follow-up visits."} // "high probability of compliance with follow-up visits"
(declare-const patient_has_near_term_travel_plans Bool) ;; {"when_to_set_to_true":"Set to true if the patient has travel plans in the near term.","when_to_set_to_false":"Set to false if the patient does not have travel plans in the near term.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has travel plans in the near term.","meaning":"Boolean indicating whether the patient has travel plans in the near term."} // "no near-term travel plans"
(declare-const patient_home_distance_to_outpatient_department_walk_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours required to walk from the patient's home to the outpatient department.","when_to_set_to_null":"Set to null if the walking time from the patient's home to the outpatient department is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of hours required to walk from the patient's home to the outpatient department."} // "home is within two hours of walk from the outpatient department"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition in the requirement: high probability of compliance with follow-up visits is defined as (home is within two hours of walk from the outpatient department AND no near-term travel plans)
(assert
  (! (= patient_has_high_probability_of_compliance_with_follow_up_visits
        (and (<= patient_home_distance_to_outpatient_department_walk_hours 2.0)
             (not patient_has_near_term_travel_plans)))
     :named REQ6_AUXILIARY0)) ;; "high probability of compliance with follow-up visits (home is within two hours of walk from the outpatient department AND no near-term travel plans)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_high_probability_of_compliance_with_follow_up_visits
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (high probability of compliance with follow-up visits (home is within two hours of walk from the outpatient department AND no near-term travel plans))."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const parent_or_guardian_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the age in years of the parent or guardian providing consent at the current time.","when_to_set_to_null":"Set to null if the age of the parent or guardian providing consent is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the age in years of the parent or guardian providing consent at the current time."} // "parent or guardian is aged ≥ 18 years"
(declare-const patient_has_consent_from_parent_or_guardian_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has consent from a parent or guardian.","when_to_set_to_false":"Set to false if the patient currently does not have consent from a parent or guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has consent from a parent or guardian.","meaning":"Boolean indicating whether the patient currently has consent from a parent or guardian."} // "the patient must have consent from a parent or guardian"
(declare-const patient_has_consent_from_parent_or_guardian_now@@parent_or_guardian_is_aged_18_years_or_older Bool) ;; {"when_to_set_to_true":"Set to true if the parent or guardian providing consent is aged 18 years or older.","when_to_set_to_false":"Set to false if the parent or guardian providing consent is younger than 18 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent or guardian providing consent is aged 18 years or older.","meaning":"Boolean indicating whether the parent or guardian providing consent is aged 18 years or older."} // "parent or guardian is aged ≥ 18 years"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_consent_from_parent_or_guardian_now@@parent_or_guardian_is_aged_18_years_or_older
         patient_has_consent_from_parent_or_guardian_now)
     :named REQ7_AUXILIARY0)) ;; "the patient must have consent from a parent or guardian (parent or guardian is aged ≥ 18 years)"

;; Definition of qualifier variable in terms of age
(assert
  (! (= patient_has_consent_from_parent_or_guardian_now@@parent_or_guardian_is_aged_18_years_or_older
        (and patient_has_consent_from_parent_or_guardian_now
             (>= parent_or_guardian_age_value_recorded_now_in_years 18)))
     :named REQ7_AUXILIARY1)) ;; "parent or guardian is aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_consent_from_parent_or_guardian_now@@parent_or_guardian_is_aged_18_years_or_older
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have consent from a parent or guardian (parent or guardian is aged ≥ 18 years)"
