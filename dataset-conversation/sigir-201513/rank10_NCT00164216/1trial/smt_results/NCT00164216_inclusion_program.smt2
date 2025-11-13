;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 1 year"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 1.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 1 year."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_axillary_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured axillary temperature value in degrees Celsius if a measurement is available for the patient at the current time.","when_to_set_to_null":"Set to null if no axillary temperature measurement is available for the patient at the current time or if the value is indeterminate.","meaning":"Numeric value representing the patient's axillary temperature measured now in degrees Celsius."} // "axillary temperature"
(declare-const patient_has_finding_of_fever_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of fever at any time in the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of fever at any time in the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of fever in the past 48 hours.","meaning":"Boolean indicating whether the patient has had fever in the past 48 hours."} // "history of fever in the previous 48 hours"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_has_finding_of_fever_now@@no_other_evident_cause Bool) ;; {"when_to_set_to_true":"Set to true if there is no other evident cause for the patient's current fever.","when_to_set_to_false":"Set to false if there is another evident cause for the patient's current fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is another evident cause for the patient's current fever.","meaning":"Boolean indicating whether there is no other evident cause for the patient's current fever."} // "no other evident cause"
(declare-const patient_has_other_evident_cause_of_fever_in_the_past_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any other evident cause of fever in the past 48 hours.","when_to_set_to_false":"Set to false if the patient does not have any other evident cause of fever in the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any other evident cause of fever in the past 48 hours.","meaning":"Boolean indicating whether the patient has any other evident cause of fever in the past 48 hours."} // "any other evident cause of fever in the previous 48 hours"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_fever_now@@no_other_evident_cause
         patient_has_finding_of_fever_now)
     :named REQ1_AUXILIARY0)) ;; "no other evident cause" implies "fever now"

;; "No other evident cause" in the context of fever in the past 48 hours
(assert
  (! (= patient_has_finding_of_fever_now@@no_other_evident_cause
        (not patient_has_other_evident_cause_of_fever_in_the_past_48_hours))
     :named REQ1_AUXILIARY1)) ;; "no other evident cause" is the negation of "any other evident cause of fever in the past 48 hours"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must have ((axillary temperature ≥ 37.5 degrees Celsius) OR (history of fever in the previous 48 hours AND NOT have any other evident cause of fever)).
(assert
  (! (or (>= patient_axillary_temperature_value_recorded_now_withunit_celsius 37.5)
         (and patient_has_finding_of_fever_inthepast48hours
              (not patient_has_other_evident_cause_of_fever_in_the_past_48_hours)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "axillary temperature ≥ 37.5°C OR (history of fever in previous 48 hours AND NOT have any other evident cause of fever)"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_falciparum_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of falciparum malaria (infection with Plasmodium falciparum).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of falciparum malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of falciparum malaria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of falciparum malaria (infection with Plasmodium falciparum)."} // "infection with Plasmodium falciparum"
(declare-const patient_has_diagnosis_of_falciparum_malaria_now@@unmixed_infection Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of falciparum malaria is an unmixed infection (not mixed with other Plasmodium species).","when_to_set_to_false":"Set to false if the diagnosis of falciparum malaria is a mixed infection (with other Plasmodium species).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is unmixed.","meaning":"Boolean indicating whether the diagnosis of falciparum malaria is an unmixed infection."} // "unmixed infection with Plasmodium falciparum"
(declare-const patient_parasite_quantitation_value_recorded_now_withunit_parasites_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current asexual Plasmodium parasite count per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current asexual Plasmodium parasite count per cubic millimeter."} // "parasite count"
(declare-const patient_parasite_quantitation_value_recorded_now_withunit_parasites_per_cubic_millimeter@@determined_by_microscopic_examination_of_thick_or_thin_blood_smear Bool) ;; {"when_to_set_to_true":"Set to true if the parasite count measurement was determined by microscopic examination of a thick or thin blood smear.","when_to_set_to_false":"Set to false if the parasite count measurement was not determined by these methods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was determined by these methods.","meaning":"Boolean indicating whether the parasite count measurement was determined by microscopic examination of a thick or thin blood smear."} // "as determined by microscopic examination of a thick blood smear OR microscopic examination of a thin blood smear"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_falciparum_malaria_now@@unmixed_infection
         patient_has_diagnosis_of_falciparum_malaria_now)
     :named REQ2_AUXILIARY0)) ;; "unmixed infection with Plasmodium falciparum"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_parasite_quantitation_value_recorded_now_withunit_parasites_per_cubic_millimeter@@determined_by_microscopic_examination_of_thick_or_thin_blood_smear
         true)
     :named REQ2_AUXILIARY1)) ;; "as determined by microscopic examination of a thick blood smear OR microscopic examination of a thin blood smear"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: unmixed infection with Plasmodium falciparum
(assert
  (! patient_has_diagnosis_of_falciparum_malaria_now@@unmixed_infection
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "unmixed infection with Plasmodium falciparum"

;; Component 1: parasite count between 250 and 100,000 asexual parasites per cubic millimeter as determined by thick or thin blood smear
(assert
  (! (and patient_parasite_quantitation_value_recorded_now_withunit_parasites_per_cubic_millimeter@@determined_by_microscopic_examination_of_thick_or_thin_blood_smear
          (>= patient_parasite_quantitation_value_recorded_now_withunit_parasites_per_cubic_millimeter 250.0)
          (<= patient_parasite_quantitation_value_recorded_now_withunit_parasites_per_cubic_millimeter 100000.0))
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "parasite count ≥ 250 asexual parasites per cubic millimeter AND parasite count ≤ 100,000 asexual parasites per cubic millimeter as determined by microscopic examination of a thick blood smear OR microscopic examination of a thin blood smear"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const informed_consent_obtained_from_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the patient at the current time.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from the patient at the current time.","meaning":"Boolean indicating whether informed consent has been obtained from the patient at the current time."} // "informed consent obtained from the patient"
(declare-const informed_consent_obtained_from_guardian_of_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been obtained from the guardian of the patient at the current time.","when_to_set_to_false":"Set to false if informed consent has not been obtained from the guardian of the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been obtained from the guardian of the patient at the current time.","meaning":"Boolean indicating whether informed consent has been obtained from the guardian of the patient at the current time."} // "informed consent obtained from the guardian of the patient"
(declare-const assent_obtained_from_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if assent has been obtained from the patient at the current time.","when_to_set_to_false":"Set to false if assent has not been obtained from the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether assent has been obtained from the patient at the current time.","meaning":"Boolean indicating whether assent has been obtained from the patient at the current time."} // "assent obtained from the patient"
;; patient_age_value_recorded_now_in_years already declared

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: ((informed consent obtained from the patient) OR ((patient age ≤ 18 years) AND (informed consent obtained from the guardian of the patient)))
(assert
  (! (or informed_consent_obtained_from_patient_now
         (and (<= patient_age_value_recorded_now_in_years 18.0)
              informed_consent_obtained_from_guardian_of_patient_now))
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have ((informed consent obtained from the patient) OR ((patient age ≤ 18 years) AND (informed consent obtained from the guardian of the patient)))."

;; Component 1: If (patient age ≥ 8 years AND patient age ≤ 18 years), assent must be obtained from the patient.
(assert
  (! (or (not (and (>= patient_age_value_recorded_now_in_years 8.0)
                   (<= patient_age_value_recorded_now_in_years 18.0)))
         assent_obtained_from_patient_now)
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if (patient age ≥ 8 years AND patient age ≤ 18 years), assent must be obtained from the patient."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_willing_to_come_to_health_facility_for_28_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to come to the health facility for the following 28 days.","when_to_set_to_false":"Set to false if the patient does not express willingness to come to the health facility for the following 28 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to come to the health facility for the following 28 days.","meaning":"Boolean indicating whether the patient is willing to come to the health facility for the following 28 days."} // "the patient must be willing to come to the health facility for the following 28 days"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_willing_to_come_to_health_facility_for_28_days
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to come to the health facility for the following 28 days"
