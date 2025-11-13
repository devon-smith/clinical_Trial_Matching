;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 5 years AND age ≤ 60 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 5)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 5 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 60)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 60 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_axillary_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's current axillary temperature in degrees Celsius if available.","when_to_set_to_null":"Set to null if the patient's current axillary temperature is not measured, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current axillary temperature in degrees Celsius."} // "axillary temperature ≥ 37.5 °C"
(declare-const patient_has_finding_of_fever_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient had the clinical finding of fever at any time in the previous 24 hours.","when_to_set_to_false":"Set to false if the patient did not have the clinical finding of fever at any time in the previous 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had fever in the previous 24 hours.","meaning":"Boolean indicating whether the patient had fever in the previous 24 hours."} // "history of fever in the previous 24 hours"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: fever (defined as axillary temperature ≥ 37.5 °C)
(assert
  (! (= patient_has_finding_of_fever_now
        (>= patient_axillary_temperature_value_recorded_now_withunit_celsius 37.5))
     :named REQ1_AUXILIARY0)) ;; "fever (defined as axillary temperature ≥ 37.5 °C)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have (fever (defined as axillary temperature ≥ 37.5 °C) OR history of fever in the previous 24 hours)
(assert
  (! (or patient_has_finding_of_fever_now
         patient_has_finding_of_fever_inthepast24hours)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((fever (defined as axillary temperature ≥ 37.5 °C)) OR (history of fever in the previous 24 hours))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const parasitic_density_value_recorded_now_withunit_parasites_per_microliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's parasitic density measured now, in parasites per microliter.","when_to_set_to_null":"Set to null if the patient's parasitic density measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's parasitic density measured now, in parasites per microliter."} // "parasitic density ≥ 1,000 parasites per microliter AND parasitic density ≤ 200,000 parasites per microliter"
(declare-const patient_has_diagnosis_of_falciparum_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Plasmodium falciparum malaria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Plasmodium falciparum malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Plasmodium falciparum malaria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Plasmodium falciparum malaria."} // "Plasmodium falciparum infection"
(declare-const patient_has_diagnosis_of_falciparum_malaria_now@@is_monoinfection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of Plasmodium falciparum malaria is a monoinfection (no coinfection with other Plasmodium species).","when_to_set_to_false":"Set to false if the patient's diagnosis of Plasmodium falciparum malaria is not a monoinfection (i.e., there is coinfection with other Plasmodium species).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of Plasmodium falciparum malaria is a monoinfection.","meaning":"Boolean indicating whether the diagnosis of Plasmodium falciparum malaria is a monoinfection (no coinfection with other Plasmodium species)."} // "monoinfection with Plasmodium falciparum infection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_falciparum_malaria_now@@is_monoinfection
         patient_has_diagnosis_of_falciparum_malaria_now)
     :named REQ2_AUXILIARY0)) ;; "monoinfection with Plasmodium falciparum infection"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have monoinfection with Plasmodium falciparum infection
(assert
  (! patient_has_diagnosis_of_falciparum_malaria_now@@is_monoinfection
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "monoinfection with Plasmodium falciparum infection"

;; Component 1: Parasitic density ≥ 1,000 parasites per microliter
(assert
  (! (>= parasitic_density_value_recorded_now_withunit_parasites_per_microliter 1000)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "parasitic density ≥ 1,000 parasites per microliter"

;; Component 2: Parasitic density ≤ 200,000 parasites per microliter
(assert
  (! (<= parasitic_density_value_recorded_now_withunit_parasites_per_microliter 200000)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "parasitic density ≤ 200,000 parasites per microliter"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient themself has provided informed consent.","when_to_set_to_false":"Set to false if the patient themself has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient themself has provided informed consent.","meaning":"Boolean indicating whether the patient themself has provided informed consent."} // "the patient must have provided informed consent"
(declare-const parent_of_patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the parent of the patient has provided informed consent on behalf of the patient.","when_to_set_to_false":"Set to false if the parent of the patient has not provided informed consent on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent of the patient has provided informed consent on behalf of the patient.","meaning":"Boolean indicating whether the parent of the patient has provided informed consent on behalf of the patient."} // "informed consent has been provided by the parent of the patient"
(declare-const legal_tutor_of_patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the legal tutor of the patient has provided informed consent on behalf of the patient.","when_to_set_to_false":"Set to false if the legal tutor of the patient has not provided informed consent on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legal tutor of the patient has provided informed consent on behalf of the patient.","meaning":"Boolean indicating whether the legal tutor of the patient has provided informed consent on behalf of the patient."} // "informed consent has been provided by the legal tutor of the patient"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have provided informed consent OR (the parent OR legal tutor has provided informed consent)
(assert
  (! (or patient_has_provided_informed_consent
         parent_of_patient_has_provided_informed_consent
         legal_tutor_of_patient_has_provided_informed_consent)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have provided informed consent OR (informed consent has been provided by the parent of the patient OR informed consent has been provided by the legal tutor of the patient)"
