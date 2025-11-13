;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "male or female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "at least 18 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: The patient must be at least 18 years of age.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be at least 18 years of age."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} ;; "To be included, the patient must provide written informed consent."
(declare-const patient_is_able_to_adhere_to_study_specified_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to adhere to the study-specified procedures.","when_to_set_to_false":"Set to false if the patient is not able to adhere to the study-specified procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to adhere to the study-specified procedures.","meaning":"Boolean indicating whether the patient is able to adhere to the study-specified procedures."} ;; "To be included, the patient must be willing and able to adhere to the study-specified procedures."
(declare-const patient_is_able_to_adhere_to_study_specified_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to adhere to the study-specified restrictions.","when_to_set_to_false":"Set to false if the patient is not able to adhere to the study-specified restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to adhere to the study-specified restrictions.","meaning":"Boolean indicating whether the patient is able to adhere to the study-specified restrictions."} ;; "To be included, the patient must be willing and able to adhere to the study-specified restrictions."
(declare-const patient_is_willing_to_adhere_to_study_specified_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to adhere to the study-specified procedures.","when_to_set_to_false":"Set to false if the patient is not willing to adhere to the study-specified procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to adhere to the study-specified procedures.","meaning":"Boolean indicating whether the patient is willing to adhere to the study-specified procedures."} ;; "To be included, the patient must be willing and able to adhere to the study-specified procedures."
(declare-const patient_is_willing_to_adhere_to_study_specified_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to adhere to the study-specified restrictions.","when_to_set_to_false":"Set to false if the patient is not willing to adhere to the study-specified restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to adhere to the study-specified restrictions.","meaning":"Boolean indicating whether the patient is willing to adhere to the study-specified restrictions."} ;; "To be included, the patient must be willing and able to adhere to the study-specified restrictions."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must provide written informed consent
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide written informed consent."

;; Component 1: Patient must be willing and able to adhere to study-specified procedures
(assert
  (! (and patient_is_willing_to_adhere_to_study_specified_procedures
          patient_is_able_to_adhere_to_study_specified_procedures)
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing and able to adhere to the study-specified procedures."

;; Component 2: Patient must be willing and able to adhere to study-specified restrictions
(assert
  (! (and patient_is_willing_to_adhere_to_study_specified_restrictions
          patient_is_able_to_adhere_to_study_specified_restrictions)
     :named REQ1_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing and able to adhere to the study-specified restrictions."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute illness.","when_to_set_to_false":"Set to false if the patient currently does not have an acute illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute illness.","meaning":"Boolean indicating whether the patient currently has an acute illness."} ;; "acute illness"
(declare-const patient_has_finding_of_acute_illness_duration_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days of the patient's current acute illness duration.","when_to_set_to_null":"Set to null if the duration in days of the patient's current acute illness is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration in days of the patient's current acute illness."} ;; "acute illness of duration ≤ 7 days"

(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."} ;; "dyspnea"
(declare-const patient_has_finding_of_dyspnea_now@@consistent_with_lower_respiratory_tract_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dyspnea is consistent with a lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient's dyspnea is not consistent with a lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dyspnea is consistent with a lower respiratory tract infection.","meaning":"Boolean indicating whether the patient's dyspnea is consistent with a lower respiratory tract infection."} ;; "dyspnea consistent with lower respiratory tract infection"
(declare-const patient_has_finding_of_dyspnea_now@@new_or_worsening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dyspnea is new or worsening.","when_to_set_to_false":"Set to false if the patient's dyspnea is not new or worsening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dyspnea is new or worsening.","meaning":"Boolean indicating whether the patient's dyspnea is new or worsening."} ;; "dyspnea new or worsening"

(declare-const patient_has_finding_of_new_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a new cough.","when_to_set_to_false":"Set to false if the patient currently does not have a new cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a new cough.","meaning":"Boolean indicating whether the patient currently has a new cough."} ;; "new cough"
(declare-const patient_has_finding_of_new_cough_now@@new_or_worsening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's new cough is new or worsening.","when_to_set_to_false":"Set to false if the patient's new cough is not new or worsening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's new cough is new or worsening.","meaning":"Boolean indicating whether the patient's new cough is new or worsening."} ;; "new cough new or worsening"

(declare-const patient_has_finding_of_increased_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased cough.","when_to_set_to_false":"Set to false if the patient currently does not have increased cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased cough.","meaning":"Boolean indicating whether the patient currently has increased cough."} ;; "increased cough"
(declare-const patient_has_finding_of_increased_cough_now@@new_or_worsening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's increased cough is new or worsening.","when_to_set_to_false":"Set to false if the patient's increased cough is not new or worsening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's increased cough is new or worsening.","meaning":"Boolean indicating whether the patient's increased cough is new or worsening."} ;; "increased cough new or worsening"

(declare-const patient_is_exposed_to_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to sputum.","when_to_set_to_false":"Set to false if the patient is currently not exposed to sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to sputum.","meaning":"Boolean indicating whether the patient is currently exposed to sputum."} ;; "purulent sputum production"
(declare-const patient_is_exposed_to_sputum_now@@purulent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sputum is purulent.","when_to_set_to_false":"Set to false if the patient's sputum is not purulent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sputum is purulent.","meaning":"Boolean indicating whether the patient's sputum is purulent."} ;; "purulent sputum"
(declare-const patient_is_exposed_to_sputum_now@@production_new_or_worsening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sputum production is new or worsening.","when_to_set_to_false":"Set to false if the patient's sputum production is not new or worsening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sputum production is new or worsening.","meaning":"Boolean indicating whether the patient's sputum production is new or worsening."} ;; "purulent sputum production new or worsening"

(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@due_to_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest pain is due to pneumonia.","when_to_set_to_false":"Set to false if the patient's chest pain is not due to pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest pain is due to pneumonia.","meaning":"Boolean indicating whether the patient's chest pain is due to pneumonia."} ;; "chest pain due to pneumonia"
(declare-const patient_has_finding_of_chest_pain_now@@new_or_worsening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest pain is new or worsening.","when_to_set_to_false":"Set to false if the patient's chest pain is not new or worsening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest pain is new or worsening.","meaning":"Boolean indicating whether the patient's chest pain is new or worsening."} ;; "chest pain new or worsening"

(declare-const patient_has_finding_of_lower_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have a lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lower respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has a lower respiratory tract infection."} ;; "lower respiratory tract infection"
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_now@@symptoms_new_or_worsening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's symptoms of lower respiratory tract infection are new or worsening.","when_to_set_to_false":"Set to false if the patient's symptoms of lower respiratory tract infection are not new or worsening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's symptoms of lower respiratory tract infection are new or worsening.","meaning":"Boolean indicating whether the patient's symptoms of lower respiratory tract infection are new or worsening."} ;; "lower respiratory tract infection symptoms new or worsening"

(declare-const patient_has_finding_of_number_of_symptoms_consistent_with_lower_respiratory_tract_infection_now_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the count of symptoms currently present that are consistent with a lower respiratory tract infection.","when_to_set_to_null":"Set to null if the number of symptoms consistent with a lower respiratory tract infection is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of symptoms currently present that are consistent with a lower respiratory tract infection."} ;; "number of symptoms consistent with lower respiratory tract infection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@consistent_with_lower_respiratory_tract_infection
         patient_has_finding_of_dyspnea_now)
     :named REQ2_AUXILIARY0)) ;; "dyspnea consistent with lower respiratory tract infection"
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@new_or_worsening
         patient_has_finding_of_dyspnea_now)
     :named REQ2_AUXILIARY1)) ;; "dyspnea new or worsening"
(assert
  (! (=> patient_has_finding_of_new_cough_now@@new_or_worsening
         patient_has_finding_of_new_cough_now)
     :named REQ2_AUXILIARY2)) ;; "new cough new or worsening"
(assert
  (! (=> patient_has_finding_of_increased_cough_now@@new_or_worsening
         patient_has_finding_of_increased_cough_now)
     :named REQ2_AUXILIARY3)) ;; "increased cough new or worsening"
(assert
  (! (=> patient_is_exposed_to_sputum_now@@purulent
         patient_is_exposed_to_sputum_now)
     :named REQ2_AUXILIARY4)) ;; "purulent sputum"
(assert
  (! (=> patient_is_exposed_to_sputum_now@@production_new_or_worsening
         patient_is_exposed_to_sputum_now)
     :named REQ2_AUXILIARY5)) ;; "purulent sputum production new or worsening"
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@due_to_pneumonia
         patient_has_finding_of_chest_pain_now)
     :named REQ2_AUXILIARY6)) ;; "chest pain due to pneumonia"
(assert
  (! (=> patient_has_finding_of_chest_pain_now@@new_or_worsening
         patient_has_finding_of_chest_pain_now)
     :named REQ2_AUXILIARY7)) ;; "chest pain new or worsening"
(assert
  (! (=> patient_has_finding_of_lower_respiratory_tract_infection_now@@symptoms_new_or_worsening
         patient_has_finding_of_lower_respiratory_tract_infection_now)
     :named REQ2_AUXILIARY8)) ;; "lower respiratory tract infection symptoms new or worsening"

;; Non-exhaustive examples: listed symptoms are examples of symptoms consistent with lower respiratory tract infection and new or worsening
(assert
  (! (=> (or patient_has_finding_of_dyspnea_now@@consistent_with_lower_respiratory_tract_infection
             patient_has_finding_of_dyspnea_now@@new_or_worsening
             patient_has_finding_of_new_cough_now@@new_or_worsening
             patient_has_finding_of_increased_cough_now@@new_or_worsening
             patient_is_exposed_to_sputum_now@@purulent
             patient_is_exposed_to_sputum_now@@production_new_or_worsening
             patient_has_finding_of_chest_pain_now@@due_to_pneumonia
             patient_has_finding_of_chest_pain_now@@new_or_worsening)
         patient_has_finding_of_lower_respiratory_tract_infection_now@@symptoms_new_or_worsening)
     :named REQ2_AUXILIARY9)) ;; "at least 3 symptoms (with non-exhaustive examples...) consistent with lower respiratory tract infection and new or worsening"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: acute illness of duration ≤ 7 days
(assert
  (! (and patient_has_finding_of_acute_disease_now
          (<= patient_has_finding_of_acute_illness_duration_value_recorded_now_withunit_days 7.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "acute illness of duration ≤ 7 days"

;; Component 1: at least 3 symptoms consistent with lower respiratory tract infection and new or worsening
(assert
  (! (and (>= patient_has_finding_of_number_of_symptoms_consistent_with_lower_respiratory_tract_infection_now_value_recorded_now_withunit_count 3)
          patient_has_finding_of_lower_respiratory_tract_infection_now@@symptoms_new_or_worsening)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at least 3 symptoms consistent with lower respiratory tract infection and new or worsening"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const body_temperature_value_recorded_now_in_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the value of the patient's body temperature measured now, in degrees Celsius.","when_to_set_to_null":"Set to null if the patient's body temperature measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's body temperature measured now, in degrees Celsius."} ;; "body temperature measured orally > 38.0 degrees Celsius OR equivalent body temperature from an alternate body site > 38.0 degrees Celsius"
(declare-const body_temperature_value_recorded_now_in_degrees_celsius@@measured_orally Bool) ;; {"when_to_set_to_true":"Set to true if the body temperature value was measured orally.","when_to_set_to_false":"Set to false if the body temperature value was not measured orally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the body temperature value was measured orally.","meaning":"Boolean indicating whether the body temperature value was measured orally."} ;; "body temperature measured orally"
(declare-const body_temperature_value_recorded_now_in_degrees_celsius@@measured_at_alternate_body_site Bool) ;; {"when_to_set_to_true":"Set to true if the body temperature value was measured at an alternate body site (not orally).","when_to_set_to_false":"Set to false if the body temperature value was not measured at an alternate body site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the body temperature value was measured at an alternate body site.","meaning":"Boolean indicating whether the body temperature value was measured at an alternate body site (not orally)."} ;; "equivalent body temperature from an alternate body site"
(declare-const heart_rate_value_recorded_now_in_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the value of the patient's heart rate measured now, in beats per minute.","when_to_set_to_null":"Set to null if the patient's heart rate measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's heart rate measured now, in beats per minute."} ;; "heart rate > 100 beats per minute"
(declare-const respiratory_rate_value_recorded_now_in_breaths_per_minute Real) ;; {"when_to_set_to_value":"Set to the value of the patient's respiratory rate measured now, in breaths per minute.","when_to_set_to_null":"Set to null if the patient's respiratory rate measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's respiratory rate measured now, in breaths per minute."} ;; "respiratory rate > 20 breaths per minute"
(declare-const systolic_blood_pressure_value_recorded_now_in_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the value of the patient's systolic blood pressure measured now, in millimeters of mercury.","when_to_set_to_null":"Set to null if the patient's systolic blood pressure measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's systolic blood pressure measured now, in millimeters of mercury."} ;; "systolic blood pressure < 90 millimeters of mercury"
(declare-const patient_has_finding_of_abnormal_vital_signs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any abnormal vital sign.","when_to_set_to_false":"Set to false if the patient currently does not have any abnormal vital sign.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal vital signs.","meaning":"Boolean indicating whether the patient currently has abnormal vital signs."} ;; "vital sign abnormalities"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_has_finding_of_hypothermia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypothermia.","when_to_set_to_false":"Set to false if the patient currently does not have hypothermia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypothermia.","meaning":"Boolean indicating whether the patient currently has hypothermia."} ;; "hypothermia"
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)."} ;; "hypotension"
(declare-const patient_has_finding_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachycardia.","meaning":"Boolean indicating whether the patient currently has tachycardia."} ;; "tachycardia"
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not have tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea.","meaning":"Boolean indicating whether the patient currently has tachypnea."} ;; "tachypnea"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition of fever: body temperature measured orally > 38.0°C OR equivalent body temperature from an alternate body site > 38.0°C
(assert
  (! (= patient_has_finding_of_fever_now
        (or (and body_temperature_value_recorded_now_in_degrees_celsius@@measured_orally
                 (> body_temperature_value_recorded_now_in_degrees_celsius 38.0))
            (and body_temperature_value_recorded_now_in_degrees_celsius@@measured_at_alternate_body_site
                 (> body_temperature_value_recorded_now_in_degrees_celsius 38.0))))
     :named REQ3_AUXILIARY0)) ;; "fever (body temperature measured orally > 38.0 degrees Celsius OR equivalent body temperature from an alternate body site > 38.0 degrees Celsius)"

;; Definition of hypothermia: body temperature measured orally < 35.0°C OR equivalent body temperature from an alternate body site < 35.0°C
(assert
  (! (= patient_has_finding_of_hypothermia_now
        (or (and body_temperature_value_recorded_now_in_degrees_celsius@@measured_orally
                 (< body_temperature_value_recorded_now_in_degrees_celsius 35.0))
            (and body_temperature_value_recorded_now_in_degrees_celsius@@measured_at_alternate_body_site
                 (< body_temperature_value_recorded_now_in_degrees_celsius 35.0))))
     :named REQ3_AUXILIARY1)) ;; "hypothermia (body temperature measured orally < 35.0 degrees Celsius OR equivalent body temperature from an alternate body site < 35.0 degrees Celsius)"

;; Definition of hypotension: systolic blood pressure < 90 mmHg
(assert
  (! (= patient_has_finding_of_low_blood_pressure_now
        (< systolic_blood_pressure_value_recorded_now_in_millimeters_of_mercury 90.0))
     :named REQ3_AUXILIARY2)) ;; "hypotension (systolic blood pressure < 90 millimeters of mercury)"

;; Definition of tachycardia: heart rate > 100 beats per minute
(assert
  (! (= patient_has_finding_of_tachycardia_now
        (> heart_rate_value_recorded_now_in_beats_per_minute 100.0))
     :named REQ3_AUXILIARY3)) ;; "tachycardia (heart rate > 100 beats per minute)"

;; Definition of tachypnea: respiratory rate > 20 breaths per minute
(assert
  (! (= patient_has_finding_of_tachypnea_now
        (> respiratory_rate_value_recorded_now_in_breaths_per_minute 20.0))
     :named REQ3_AUXILIARY4)) ;; "tachypnea (respiratory rate > 20 breaths per minute)"

;; Non-exhaustive examples: each abnormality listed is an example of abnormal vital signs
(assert
  (! (=> (or patient_has_finding_of_fever_now
             patient_has_finding_of_hypothermia_now
             patient_has_finding_of_low_blood_pressure_now
             patient_has_finding_of_tachycardia_now
             patient_has_finding_of_tachypnea_now)
         patient_has_finding_of_abnormal_vital_signs_now)
     :named REQ3_AUXILIARY5)) ;; "with non-exhaustive examples ((fever ...) OR (hypothermia ...) OR (hypotension ...) OR (tachycardia ...) OR (tachypnea ...))"

;; Count the number of vital sign abnormalities present (from the listed examples)
(define-fun vital_sign_abnormalities_count () Int
  (+ (ite patient_has_finding_of_fever_now 1 0)
     (ite patient_has_finding_of_hypothermia_now 1 0)
     (ite patient_has_finding_of_low_blood_pressure_now 1 0)
     (ite patient_has_finding_of_tachycardia_now 1 0)
     (ite patient_has_finding_of_tachypnea_now 1 0))) ;; "at least 2 vital sign abnormalities (with non-exhaustive examples ...)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= vital_sign_abnormalities_count 2)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least 2 vital sign abnormalities."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_clinical_signs_of_sign_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical sign of community-acquired bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical sign of community-acquired bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical sign of community-acquired bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has a clinical sign of community-acquired bacterial pneumonia."} ;; "clinical sign"
(declare-const patient_has_finding_of_bacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has a clinical finding of bacterial pneumonia."} ;; "bacterial pneumonia"
(declare-const patient_has_finding_of_egophony_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of egophony.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of egophony.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of egophony.","meaning":"Boolean indicating whether the patient currently has a clinical finding of egophony."} ;; "egophony"
(declare-const patient_has_finding_of_finding_by_auscultation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding by auscultation.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding by auscultation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding by auscultation.","meaning":"Boolean indicating whether the patient currently has a clinical finding by auscultation."} ;; "auscultatory findings"
(declare-const patient_has_finding_of_finding_by_auscultation_now@@consistent_with_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's auscultatory finding is consistent with pneumonia.","when_to_set_to_false":"Set to false if the patient's auscultatory finding is not consistent with pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the auscultatory finding is consistent with pneumonia.","meaning":"Boolean indicating whether the patient's auscultatory finding is consistent with pneumonia."} ;; "auscultatory findings consistent with pneumonia"
(declare-const patient_has_finding_of_finding_by_percussion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding by percussion.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding by percussion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding by percussion.","meaning":"Boolean indicating whether the patient currently has a clinical finding by percussion."} ;; "percussion findings"
(declare-const patient_has_finding_of_finding_by_percussion_now@@consistent_with_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's percussion finding is consistent with pneumonia.","when_to_set_to_false":"Set to false if the patient's percussion finding is not consistent with pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percussion finding is consistent with pneumonia.","meaning":"Boolean indicating whether the patient's percussion finding is consistent with pneumonia."} ;; "percussion findings consistent with pneumonia"
(declare-const patient_has_finding_of_hypoxemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hypoxemia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hypoxemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hypoxemia.","meaning":"Boolean indicating whether the patient currently has a clinical finding of hypoxemia."} ;; "hypoxemia"
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of respiratory crackles.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of respiratory crackles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of respiratory crackles.","meaning":"Boolean indicating whether the patient currently has a clinical finding of respiratory crackles."} ;; "crackles"
(declare-const patient_immature_neutrophil_count_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if an immature neutrophil count (bands) as a percentage is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current immature neutrophil count (bands) as a percentage."} ;; "immature neutrophil count > 15 percent (bands)"
(declare-const patient_is_receiving_supplemental_oxygen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving supplemental oxygen.","when_to_set_to_false":"Set to false if the patient is not currently receiving supplemental oxygen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving supplemental oxygen.","meaning":"Boolean indicating whether the patient is currently receiving supplemental oxygen."} ;; "receiving supplemental oxygen"
(declare-const patient_oxygen_saturation_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if an oxygen saturation percentage is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current oxygen saturation as a percentage."} ;; "oxygen saturation < 90 percent"
(declare-const patient_partial_pressure_of_oxygen_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a partial pressure of oxygen in millimeters of mercury is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current partial pressure of oxygen in millimeters of mercury."} ;; "partial pressure of oxygen < 60 millimeters of mercury"
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a white blood cell count in cells per cubic millimeter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count in cells per cubic millimeter."} ;; "white blood cell count > 10,000 cells per cubic millimeter OR white blood cell count < 4,500 cells per cubic millimeter"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples: crackles, egophony, dullness imply percussion/auscultatory findings consistent with pneumonia
(assert
  (! (=> patient_has_finding_of_respiratory_crackles_now
         patient_has_finding_of_finding_by_auscultation_now@@consistent_with_pneumonia)
     :named REQ4_AUXILIARY0)) ;; "crackles" is a non-exhaustive example of auscultatory findings consistent with pneumonia

(assert
  (! (=> patient_has_finding_of_egophony_now
         patient_has_finding_of_finding_by_percussion_now@@consistent_with_pneumonia)
     :named REQ4_AUXILIARY1)) ;; "egophony" is a non-exhaustive example of percussion findings consistent with pneumonia

;; "dullness" is a non-exhaustive example of percussion findings consistent with pneumonia
(declare-const patient_has_finding_of_dullness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of dullness on percussion.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of dullness on percussion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of dullness on percussion.","meaning":"Boolean indicating whether the patient currently has a clinical finding of dullness on percussion."} ;; "dullness"
(assert
  (! (=> patient_has_finding_of_dullness_now
         patient_has_finding_of_finding_by_percussion_now@@consistent_with_pneumonia)
     :named REQ4_AUXILIARY2))

;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_finding_by_auscultation_now@@consistent_with_pneumonia
         patient_has_finding_of_finding_by_auscultation_now)
     :named REQ4_AUXILIARY3)) ;; auscultatory finding consistent with pneumonia implies auscultatory finding

(assert
  (! (=> patient_has_finding_of_finding_by_percussion_now@@consistent_with_pneumonia
         patient_has_finding_of_finding_by_percussion_now)
     :named REQ4_AUXILIARY4)) ;; percussion finding consistent with pneumonia implies percussion finding

;; Hypoxemia definition: O2 saturation < 90% (on room air OR while receiving supplemental O2 at baseline) OR PaO2 < 60 mmHg
(define-fun patient_meets_hypoxemia_criteria_now () Bool
  (or (< patient_oxygen_saturation_value_recorded_now_withunit_percent 90.0)
      (< patient_partial_pressure_of_oxygen_value_recorded_now_withunit_millimeters_of_mercury 60.0)))
;; "hypoxemia (oxygen saturation < 90 percent on room air OR while receiving supplemental oxygen at the patient's baseline requirement OR partial pressure of oxygen < 60 millimeters of mercury)"

(assert
  (! (= patient_has_finding_of_hypoxemia_now
        patient_meets_hypoxemia_criteria_now)
     :named REQ4_AUXILIARY5)) ;; definition of hypoxemia

;; Laboratory findings: WBC > 10,000 OR WBC < 4,500 OR immature neutrophil count > 15%
(define-fun patient_meets_laboratory_criteria_now () Bool
  (or (> patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_cubic_millimeter 10000.0)
      (< patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_cubic_millimeter 4500.0)
      (> patient_immature_neutrophil_count_value_recorded_now_withunit_percent 15.0)))
;; "white blood cell count > 10,000 cells per cubic millimeter OR white blood cell count < 4,500 cells per cubic millimeter OR immature neutrophil count > 15 percent (bands)"

;; Composite: at least 1 other clinical sign OR laboratory finding of community-acquired bacterial pneumonia
(define-fun patient_has_at_least_one_other_clinical_sign_or_lab_finding_of_cabp_now () Bool
  (or patient_has_finding_of_hypoxemia_now
      patient_has_finding_of_finding_by_auscultation_now@@consistent_with_pneumonia
      patient_has_finding_of_finding_by_percussion_now@@consistent_with_pneumonia
      patient_meets_laboratory_criteria_now))
;; "at least 1 other clinical sign OR laboratory finding of community-acquired bacterial pneumonia"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_at_least_one_other_clinical_sign_or_lab_finding_of_cabp_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least 1 other clinical sign OR laboratory finding of community-acquired bacterial pneumonia."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_radiographically_documented_pneumonia_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient had radiographically-documented pneumonia within the past 48 hours before enrollment.","when_to_set_to_false":"Set to false if the patient did not have radiographically-documented pneumonia within the past 48 hours before enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had radiographically-documented pneumonia within the past 48 hours before enrollment.","meaning":"Boolean indicating whether the patient had radiographically-documented pneumonia within the past 48 hours before enrollment."} ;; "radiographically-documented pneumonia within 48 hours before enrollment"
(declare-const patient_has_finding_of_single_lobe_lung_infiltrate_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient had a radiographically-documented single lobe lung infiltrate within the past 48 hours before enrollment.","when_to_set_to_false":"Set to false if the patient did not have a radiographically-documented single lobe lung infiltrate within the past 48 hours before enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a radiographically-documented single lobe lung infiltrate within the past 48 hours before enrollment.","meaning":"Boolean indicating whether the patient had a radiographically-documented single lobe lung infiltrate within the past 48 hours."} ;; "infiltrates in a lobar distribution"
(declare-const patient_has_finding_of_multilobar_lung_infiltrate_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient had a radiographically-documented multilobar lung infiltrate within the past 48 hours before enrollment.","when_to_set_to_false":"Set to false if the patient did not have a radiographically-documented multilobar lung infiltrate within the past 48 hours before enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a radiographically-documented multilobar lung infiltrate within the past 48 hours before enrollment.","meaning":"Boolean indicating whether the patient had a radiographically-documented multilobar lung infiltrate within the past 48 hours."} ;; "infiltrates in a multilobar distribution"
(declare-const patient_has_finding_of_abnormal_radiologic_density_diffuse_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient had radiographically-documented diffuse opacities on chest x-ray within the past 48 hours before enrollment.","when_to_set_to_false":"Set to false if the patient did not have radiographically-documented diffuse opacities on chest x-ray within the past 48 hours before enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had radiographically-documented diffuse opacities on chest x-ray within the past 48 hours before enrollment.","meaning":"Boolean indicating whether the patient had radiographically-documented diffuse opacities on chest x-ray within the past 48 hours."} ;; "diffuse opacities on chest x-ray"
(declare-const patient_has_finding_of_abnormal_radiologic_density_diffuse_inthepast48hours@@consistent_with_acute_bacterial_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the radiographically-documented diffuse opacities on chest computed tomography scan within the past 48 hours are consistent with acute bacterial pneumonia.","when_to_set_to_false":"Set to false if the radiographically-documented diffuse opacities on chest computed tomography scan within the past 48 hours are not consistent with acute bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiographically-documented diffuse opacities on chest computed tomography scan within the past 48 hours are consistent with acute bacterial pneumonia.","meaning":"Boolean indicating whether the radiographically-documented diffuse opacities on chest computed tomography scan within the past 48 hours are consistent with acute bacterial pneumonia."} ;; "diffuse opacities on chest computed tomography scan consistent with acute bacterial pneumonia"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples: If any of the listed findings are present, then radiographically-documented pneumonia is present, but other findings may also qualify.
(assert
  (! (=> (or patient_has_finding_of_single_lobe_lung_infiltrate_inthepast48hours
             patient_has_finding_of_multilobar_lung_infiltrate_inthepast48hours
             patient_has_finding_of_abnormal_radiologic_density_diffuse_inthepast48hours
             patient_has_finding_of_abnormal_radiologic_density_diffuse_inthepast48hours@@consistent_with_acute_bacterial_pneumonia)
         patient_has_finding_of_radiographically_documented_pneumonia_inthepast48hours)
     :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (infiltrates in a lobar distribution OR infiltrates in a multilobar distribution OR diffuse opacities on chest x-ray OR diffuse opacities on chest computed tomography scan consistent with acute bacterial pneumonia)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_abnormal_radiologic_density_diffuse_inthepast48hours@@consistent_with_acute_bacterial_pneumonia
         patient_has_finding_of_abnormal_radiologic_density_diffuse_inthepast48hours)
     :named REQ5_AUXILIARY1)) ;; "diffuse opacities on chest computed tomography scan consistent with acute bacterial pneumonia" is a type of "diffuse opacities on chest x-ray"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_radiographically_documented_pneumonia_inthepast48hours
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have radiographically-documented pneumonia within 48 hours before enrollment."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const pneumonia_outcomes_research_team_risk_class_value_recorded_now_withunit_class Real) ;; {"when_to_set_to_value":"Set to the value corresponding to the patient's Pneumonia Outcomes Research Team Risk Class (e.g., 1 for I, 2 for II, 3 for III, etc.) as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's Pneumonia Outcomes Research Team Risk Class is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's Pneumonia Outcomes Research Team Risk Class, recorded now, with unit 'class'."} ;; "To be included, the patient must have a Pneumonia Outcomes Research Team Risk Class ≥ III."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (>= pneumonia_outcomes_research_team_risk_class_value_recorded_now_withunit_class 3)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Pneumonia Outcomes Research Team Risk Class ≥ III."
