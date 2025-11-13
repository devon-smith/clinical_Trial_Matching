;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 12 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 12.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 12 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_black_water_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of blackwater fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of blackwater fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of blackwater fever.","meaning":"Boolean indicating whether the patient currently has blackwater fever."} // "with or without blackwater fever"
(declare-const patient_has_finding_of_falciparum_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Plasmodium falciparum malaria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Plasmodium falciparum malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of Plasmodium falciparum malaria.","meaning":"Boolean indicating whether the patient currently has Plasmodium falciparum malaria."} // "Plasmodium falciparum malaria"
(declare-const patient_has_finding_of_falciparum_malaria_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Plasmodium falciparum malaria is severe.","when_to_set_to_false":"Set to false if the patient's Plasmodium falciparum malaria is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Plasmodium falciparum malaria is severe.","meaning":"Boolean indicating whether the patient's Plasmodium falciparum malaria is severe."} // "severe Plasmodium falciparum malaria"
(declare-const patient_has_finding_of_falciparum_malaria_now@@moderately_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Plasmodium falciparum malaria is moderately severe.","when_to_set_to_false":"Set to false if the patient's Plasmodium falciparum malaria is not moderately severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Plasmodium falciparum malaria is moderately severe.","meaning":"Boolean indicating whether the patient's Plasmodium falciparum malaria is moderately severe."} // "moderately severe Plasmodium falciparum malaria"
(declare-const patient_has_finding_of_falciparum_malaria_now@@confirmed_by_positive_blood_smear_showing_asexual_forms_of_falciparum_malaria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Plasmodium falciparum malaria is confirmed by positive blood smear showing asexual forms of Plasmodium falciparum.","when_to_set_to_false":"Set to false if the patient's Plasmodium falciparum malaria is not confirmed by positive blood smear showing asexual forms of Plasmodium falciparum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's Plasmodium falciparum malaria is confirmed by positive blood smear showing asexual forms of Plasmodium falciparum.","meaning":"Boolean indicating whether the patient's Plasmodium falciparum malaria is confirmed by positive blood smear showing asexual forms of Plasmodium falciparum."} // "confirmed by positive blood smear showing asexual forms of Plasmodium falciparum"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_falciparum_malaria_now@@severe
         patient_has_finding_of_falciparum_malaria_now)
     :named REQ1_AUXILIARY0)) ;; "severe Plasmodium falciparum malaria"

(assert
  (! (=> patient_has_finding_of_falciparum_malaria_now@@moderately_severe
         patient_has_finding_of_falciparum_malaria_now)
     :named REQ1_AUXILIARY1)) ;; "moderately severe Plasmodium falciparum malaria"

(assert
  (! (=> patient_has_finding_of_falciparum_malaria_now@@confirmed_by_positive_blood_smear_showing_asexual_forms_of_falciparum_malaria
         patient_has_finding_of_falciparum_malaria_now)
     :named REQ1_AUXILIARY2)) ;; "confirmed by positive blood smear showing asexual forms of Plasmodium falciparum"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have ((severe Plasmodium falciparum malaria) OR (moderately severe Plasmodium falciparum malaria)) (with or without blackwater fever), confirmed by positive blood smear showing asexual forms of Plasmodium falciparum.
(assert
  (! (and
        (or patient_has_finding_of_falciparum_malaria_now@@severe
            patient_has_finding_of_falciparum_malaria_now@@moderately_severe)
        patient_has_finding_of_falciparum_malaria_now@@confirmed_by_positive_blood_smear_showing_asexual_forms_of_falciparum_malaria)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((severe Plasmodium falciparum malaria) OR (moderately severe Plasmodium falciparum malaria)) (with or without blackwater fever), confirmed by positive blood smear showing asexual forms of Plasmodium falciparum."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded at the time of admission.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body temperature measured at admission, in degrees Celsius."} // "temperature > 38 degrees Celsius on admission"
(declare-const patient_has_finding_of_fever_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient had fever during the preceding 24 hours.","when_to_set_to_false":"Set to false if the patient did not have fever during the preceding 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had fever during the preceding 24 hours.","meaning":"Boolean indicating whether the patient had fever during the preceding 24 hours."} // "history of fever during the preceding 24 hours"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have (temperature > 38°C on admission) OR (history of fever during the preceding 24 hours)
(assert
  (! (or (> patient_body_temperature_value_recorded_now_withunit_celsius 38.0)
         patient_has_finding_of_fever_inthepast24hours)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has personally provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not personally provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has personally provided written informed consent.","meaning":"Boolean indicating whether the patient has personally provided written informed consent."} // "provided written informed consent"
(declare-const attending_relative_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if an attending relative has provided written informed consent on behalf of the patient.","when_to_set_to_false":"Set to false if an attending relative has not provided written informed consent on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an attending relative has provided written informed consent on behalf of the patient.","meaning":"Boolean indicating whether an attending relative has provided written informed consent on behalf of the patient."} // "an attending relative able AND willing to give written informed consent"
(declare-const attending_relative_is_able_to_give_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if an attending relative is able to give written informed consent on behalf of the patient.","when_to_set_to_false":"Set to false if an attending relative is not able to give written informed consent on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an attending relative is able to give written informed consent on behalf of the patient.","meaning":"Boolean indicating whether an attending relative is able to give written informed consent on behalf of the patient."} // "an attending relative able ... to give written informed consent"
(declare-const attending_relative_is_willing_to_give_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if an attending relative is willing to give written informed consent on behalf of the patient.","when_to_set_to_false":"Set to false if an attending relative is not willing to give written informed consent on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an attending relative is willing to give written informed consent on behalf of the patient.","meaning":"Boolean indicating whether an attending relative is willing to give written informed consent on behalf of the patient."} // "an attending relative ... willing to give written informed consent"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: attending_relative_has_provided_written_informed_consent is true iff attending relative is both able and willing to give written informed consent
(assert
  (! (= attending_relative_has_provided_written_informed_consent
        (and attending_relative_is_able_to_give_written_informed_consent
             attending_relative_is_willing_to_give_written_informed_consent))
     :named REQ3_AUXILIARY0)) ;; "an attending relative able AND willing to give written informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have ((provided written informed consent) OR (an attending relative able AND willing to give written informed consent)).
(assert
  (! (or patient_has_provided_written_informed_consent
         attending_relative_has_provided_written_informed_consent)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "provided written informed consent OR an attending relative able AND willing to give written informed consent"
