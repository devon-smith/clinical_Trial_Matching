;; ===================== Declarations for the inclusion criteria (REQ 0) =====================

(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

(declare-const patient_has_diagnosis_of_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malaria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malaria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malaria."} ;; "malaria"

(declare-const patient_has_finding_of_uncomplicated_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of uncomplicated malaria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of uncomplicated malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of uncomplicated malaria.","meaning":"Boolean indicating whether the patient currently has uncomplicated malaria."} ;; "uncomplicated malaria"

(declare-const patient_has_finding_of_plasmodium_falciparum_asexual_parasitemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Plasmodium falciparum asexual parasitemia detected by blood smear.","when_to_set_to_false":"Set to false if the patient currently does not have Plasmodium falciparum asexual parasitemia detected by blood smear.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Plasmodium falciparum asexual parasitemia detected by blood smear.","meaning":"Boolean indicating whether the patient currently has Plasmodium falciparum asexual parasitemia detected by blood smear."} ;; "blood smears positive for Plasmodium falciparum asexual parasitemia"

(declare-const patient_parasite_count_value_recorded_now_withunit_parasites_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the patient's current parasite count in parasites per milliliter if measured and documented by blood smear.","when_to_set_to_null":"Set to null if the patient's current parasite count in parasites per milliliter is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current parasite count in parasites per milliliter, as measured by blood smear."} ;; "parasite count ≥ 1,000 parasites/milliliter AND parasite count ≤ 100,000 parasites/milliliter"

(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"

(declare-const patient_has_finding_of_fever_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of fever at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of fever at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of fever.","meaning":"Boolean indicating whether the patient has a history of fever at any time in the past."} ;; "history of fever"

(declare-const patient_has_finding_of_fever_inthehistory@@temporalcontext_within_24_hours_prior Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of fever occurred within the prior 24 hours.","when_to_set_to_false":"Set to false if the patient's history of fever did not occur within the prior 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of fever occurred within the prior 24 hours.","meaning":"Boolean indicating whether the patient's history of fever occurred within the prior 24 hours."} ;; "history of fever ... within the prior 24 hours"

(declare-const patient_rectal_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's current rectal temperature in degrees Celsius if measured and documented.","when_to_set_to_null":"Set to null if the patient's current rectal temperature in degrees Celsius is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current rectal temperature in degrees Celsius."} ;; "rectal temperature ≥ 38.5 degrees Celsius"

(declare-const patient_rectal_temperature_value_recorded_now_withunit_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the patient's current rectal temperature in degrees Fahrenheit if measured and documented.","when_to_set_to_null":"Set to null if the patient's current rectal temperature in degrees Fahrenheit is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current rectal temperature in degrees Fahrenheit."} ;; "rectal temperature ≥ 101.2 degrees Fahrenheit"

(declare-const patient_tympanic_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's current tympanic temperature in degrees Celsius if measured and documented.","when_to_set_to_null":"Set to null if the patient's current tympanic temperature in degrees Celsius is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current tympanic temperature in degrees Celsius."} ;; "tympanic temperature ≥ 38.5 degrees Celsius"

(declare-const patient_tympanic_temperature_value_recorded_now_withunit_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the patient's current tympanic temperature in degrees Fahrenheit if measured and documented.","when_to_set_to_null":"Set to null if the patient's current tympanic temperature in degrees Fahrenheit is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current tympanic temperature in degrees Fahrenheit."} ;; "tympanic temperature ≥ 101.2 degrees Fahrenheit"

(declare-const patient_axillary_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's current axillary temperature in degrees Celsius if measured and documented.","when_to_set_to_null":"Set to null if the patient's current axillary temperature in degrees Celsius is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current axillary temperature in degrees Celsius."} ;; "axillary temperature ≥ 37.5 degrees Celsius"

(declare-const patient_axillary_temperature_value_recorded_now_withunit_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the patient's current axillary temperature in degrees Fahrenheit if measured and documented.","when_to_set_to_null":"Set to null if the patient's current axillary temperature in degrees Fahrenheit is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current axillary temperature in degrees Fahrenheit."} ;; "axillary temperature ≥ 99.5 degrees Fahrenheit"

(declare-const patient_oral_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's current oral temperature in degrees Celsius if measured and documented.","when_to_set_to_null":"Set to null if the patient's current oral temperature in degrees Celsius is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current oral temperature in degrees Celsius."} ;; "oral temperature ≥ 38 degrees Celsius"

(declare-const patient_oral_temperature_value_recorded_now_withunit_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the patient's current oral temperature in degrees Fahrenheit if measured and documented.","when_to_set_to_null":"Set to null if the patient's current oral temperature in degrees Fahrenheit is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current oral temperature in degrees Fahrenheit."} ;; "oral temperature ≥ 100.4 degrees Fahrenheit"

(declare-const patient_rectal_temperature_value_recorded_inthehistory_withunit_degrees_celsius@@temporalcontext_within_24_hours_prior Real) ;; {"when_to_set_to_value":"Set to the patient's rectal temperature in degrees Celsius recorded within the prior 24 hours if measured and documented.","when_to_set_to_null":"Set to null if the patient's rectal temperature in degrees Celsius recorded within the prior 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's rectal temperature in degrees Celsius recorded within the prior 24 hours."} ;; "rectal temperature ≥ 38.5 degrees Celsius ... within the prior 24 hours"

(declare-const patient_rectal_temperature_value_recorded_inthehistory_withunit_degrees_fahrenheit@@temporalcontext_within_24_hours_prior Real) ;; {"when_to_set_to_value":"Set to the patient's rectal temperature in degrees Fahrenheit recorded within the prior 24 hours if measured and documented.","when_to_set_to_null":"Set to null if the patient's rectal temperature in degrees Fahrenheit recorded within the prior 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's rectal temperature in degrees Fahrenheit recorded within the prior 24 hours."} ;; "rectal temperature ≥ 101.2 degrees Fahrenheit ... within the prior 24 hours"

(declare-const patient_tympanic_temperature_value_recorded_inthehistory_withunit_degrees_celsius@@temporalcontext_within_24_hours_prior Real) ;; {"when_to_set_to_value":"Set to the patient's tympanic temperature in degrees Celsius recorded within the prior 24 hours if measured and documented.","when_to_set_to_null":"Set to null if the patient's tympanic temperature in degrees Celsius recorded within the prior 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's tympanic temperature in degrees Celsius recorded within the prior 24 hours."} ;; "tympanic temperature ≥ 38.5 degrees Celsius ... within the prior 24 hours"

(declare-const patient_tympanic_temperature_value_recorded_inthehistory_withunit_degrees_fahrenheit@@temporalcontext_within_24_hours_prior Real) ;; {"when_to_set_to_value":"Set to the patient's tympanic temperature in degrees Fahrenheit recorded within the prior 24 hours if measured and documented.","when_to_set_to_null":"Set to null if the patient's tympanic temperature in degrees Fahrenheit recorded within the prior 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's tympanic temperature in degrees Fahrenheit recorded within the prior 24 hours."} ;; "tympanic temperature ≥ 101.2 degrees Fahrenheit ... within the prior 24 hours"

(declare-const patient_axillary_temperature_value_recorded_inthehistory_withunit_degrees_celsius@@temporalcontext_within_24_hours_prior Real) ;; {"when_to_set_to_value":"Set to the patient's axillary temperature in degrees Celsius recorded within the prior 24 hours if measured and documented.","when_to_set_to_null":"Set to null if the patient's axillary temperature in degrees Celsius recorded within the prior 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's axillary temperature in degrees Celsius recorded within the prior 24 hours."} ;; "axillary temperature ≥ 37.5 degrees Celsius ... within the prior 24 hours"

(declare-const patient_axillary_temperature_value_recorded_inthehistory_withunit_degrees_fahrenheit@@temporalcontext_within_24_hours_prior Real) ;; {"when_to_set_to_value":"Set to the patient's axillary temperature in degrees Fahrenheit recorded within the prior 24 hours if measured and documented.","when_to_set_to_null":"Set to null if the patient's axillary temperature in degrees Fahrenheit recorded within the prior 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's axillary temperature in degrees Fahrenheit recorded within the prior 24 hours."} ;; "axillary temperature ≥ 99.5 degrees Fahrenheit ... within the prior 24 hours"

(declare-const patient_oral_temperature_value_recorded_inthehistory_withunit_degrees_celsius@@temporalcontext_within_24_hours_prior Real) ;; {"when_to_set_to_value":"Set to the patient's oral temperature in degrees Celsius recorded within the prior 24 hours if measured and documented.","when_to_set_to_null":"Set to null if the patient's oral temperature in degrees Celsius recorded within the prior 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's oral temperature in degrees Celsius recorded within the prior 24 hours."} ;; "oral temperature ≥ 38 degrees Celsius ... within the prior 24 hours"

(declare-const patient_oral_temperature_value_recorded_inthehistory_withunit_degrees_fahrenheit@@temporalcontext_within_24_hours_prior Real) ;; {"when_to_set_to_value":"Set to the patient's oral temperature in degrees Fahrenheit recorded within the prior 24 hours if measured and documented.","when_to_set_to_null":"Set to null if the patient's oral temperature in degrees Fahrenheit recorded within the prior 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's oral temperature in degrees Fahrenheit recorded within the prior 24 hours."} ;; "oral temperature ≥ 100.4 degrees Fahrenheit ... within the prior 24 hours"

;; ===================== Auxiliary Assertions (REQ 0) =====================

;; Fever definition (current): rectal ≥ 38.5°C or ≥ 101.2°F, tympanic ≥ 38.5°C or ≥ 101.2°F, axillary ≥ 37.5°C or ≥ 99.5°F, oral ≥ 38°C or ≥ 100.4°F
(assert
  (! (= patient_has_finding_of_fever_now
        (or (>= patient_rectal_temperature_value_recorded_now_withunit_degrees_celsius 38.5)
            (>= patient_rectal_temperature_value_recorded_now_withunit_degrees_fahrenheit 101.2)
            (>= patient_tympanic_temperature_value_recorded_now_withunit_degrees_celsius 38.5)
            (>= patient_tympanic_temperature_value_recorded_now_withunit_degrees_fahrenheit 101.2)
            (>= patient_axillary_temperature_value_recorded_now_withunit_degrees_celsius 37.5)
            (>= patient_axillary_temperature_value_recorded_now_withunit_degrees_fahrenheit 99.5)
            (>= patient_oral_temperature_value_recorded_now_withunit_degrees_celsius 38.0)
            (>= patient_oral_temperature_value_recorded_now_withunit_degrees_fahrenheit 100.4)))
     :named REQ0_AUXILIARY0)) ;; "fever (rectal temperature ≥ 38.5 degrees Celsius OR rectal temperature ≥ 101.2 degrees Fahrenheit OR tympanic temperature ≥ 38.5 degrees Celsius OR tympanic temperature ≥ 101.2 degrees Fahrenheit OR axillary temperature ≥ 37.5 degrees Celsius OR axillary temperature ≥ 99.5 degrees Fahrenheit OR oral temperature ≥ 38 degrees Celsius OR oral temperature ≥ 100.4 degrees Fahrenheit)"

;; Fever definition (history, within 24h): rectal ≥ 38.5°C or ≥ 101.2°F, tympanic ≥ 38.5°C or ≥ 101.2°F, axillary ≥ 37.5°C or ≥ 99.5°F, oral ≥ 38°C or ≥ 100.4°F
(assert
  (! (= patient_has_finding_of_fever_inthehistory@@temporalcontext_within_24_hours_prior
        (or (>= patient_rectal_temperature_value_recorded_inthehistory_withunit_degrees_celsius@@temporalcontext_within_24_hours_prior 38.5)
            (>= patient_rectal_temperature_value_recorded_inthehistory_withunit_degrees_fahrenheit@@temporalcontext_within_24_hours_prior 101.2)
            (>= patient_tympanic_temperature_value_recorded_inthehistory_withunit_degrees_celsius@@temporalcontext_within_24_hours_prior 38.5)
            (>= patient_tympanic_temperature_value_recorded_inthehistory_withunit_degrees_fahrenheit@@temporalcontext_within_24_hours_prior 101.2)
            (>= patient_axillary_temperature_value_recorded_inthehistory_withunit_degrees_celsius@@temporalcontext_within_24_hours_prior 37.5)
            (>= patient_axillary_temperature_value_recorded_inthehistory_withunit_degrees_fahrenheit@@temporalcontext_within_24_hours_prior 99.5)
            (>= patient_oral_temperature_value_recorded_inthehistory_withunit_degrees_celsius@@temporalcontext_within_24_hours_prior 38.0)
            (>= patient_oral_temperature_value_recorded_inthehistory_withunit_degrees_fahrenheit@@temporalcontext_within_24_hours_prior 100.4)))
     :named REQ0_AUXILIARY1)) ;; "history of fever (rectal temperature ≥ 38.5 degrees Celsius OR rectal temperature ≥ 101.2 degrees Fahrenheit OR tympanic temperature ≥ 38.5 degrees Celsius OR tympanic temperature ≥ 101.2 degrees Fahrenheit OR axillary temperature ≥ 37.5 degrees Celsius OR axillary temperature ≥ 99.5 degrees Fahrenheit OR oral temperature ≥ 38 degrees Celsius OR oral temperature ≥ 100.4 degrees Fahrenheit) within the prior 24 hours"

;; Qualifier variable implies stem variable for fever in history
(assert
  (! (=> patient_has_finding_of_fever_inthehistory@@temporalcontext_within_24_hours_prior
         patient_has_finding_of_fever_inthehistory)
     :named REQ0_AUXILIARY2)) ;; "history of fever ... within the prior 24 hours" implies "history of fever"

;; ===================== Constraint Assertions (REQ 0) =====================

;; Component 0: patient must be aged ≥ 18 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 18 years"

;; Component 1: patient must have uncomplicated malaria
(assert
  (! patient_has_finding_of_uncomplicated_malaria_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have uncomplicated malaria"

;; Component 2: patient must have symptomatic malaria as indicated by (blood smears positive for Plasmodium falciparum asexual parasitemia with parasite count ≥ 1,000 parasites/milliliter AND parasite count ≤ 100,000 parasites/milliliter)
(assert
  (! (and patient_has_finding_of_plasmodium_falciparum_asexual_parasitemia_now
          (>= patient_parasite_count_value_recorded_now_withunit_parasites_per_milliliter 1000.0)
          (<= patient_parasite_count_value_recorded_now_withunit_parasites_per_milliliter 100000.0))
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "blood smears positive for Plasmodium falciparum asexual parasitemia with parasite count ≥ 1,000 parasites/milliliter AND parasite count ≤ 100,000 parasites/milliliter"

;; Component 3: patient must have (fever (as defined) OR history of fever (as defined) within the prior 24 hours)
(assert
  (! (or patient_has_finding_of_fever_now
         patient_has_finding_of_fever_inthehistory@@temporalcontext_within_24_hours_prior)
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "fever ... OR history of fever ... within the prior 24 hours"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_glucose_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum glucose concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum glucose concentration in milligrams per deciliter."} ;; "serum glucose concentration ≥ 60 milligrams/deciliter"
(declare-const patient_glucose_value_recorded_now_withunit_milligrams_per_deciliter@@measured_by_fingerstick_or_peripheral_blood_collection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's serum glucose concentration measurement was obtained by either fingerstick or peripheral blood collection.","when_to_set_to_false":"Set to false if the measurement was obtained by another method.","when_to_set_to_null":"Set to null if the method of measurement is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's serum glucose concentration measurement was obtained by fingerstick or peripheral blood collection."} ;; "measured by fingerstick OR measured by peripheral blood collection"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and
        (>= patient_glucose_value_recorded_now_withunit_milligrams_per_deciliter 60.0) ;; "serum glucose concentration ≥ 60 milligrams/deciliter"
        patient_glucose_value_recorded_now_withunit_milligrams_per_deciliter@@measured_by_fingerstick_or_peripheral_blood_collection ;; "measured by fingerstick OR measured by peripheral blood collection"
     )
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_immunochromatographic_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone an immunochromatographic test.","when_to_set_to_false":"Set to false if the patient has not currently undergone an immunochromatographic test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone an immunochromatographic test.","meaning":"Boolean indicating whether the patient has currently undergone an immunochromatographic test."} ;; "Binax NOW immunochromatographic test"
(declare-const patient_has_undergone_immunochromatographic_test_now@@for_plasmodium_falciparum Bool) ;; {"when_to_set_to_true":"Set to true if the immunochromatographic test undergone by the patient was for Plasmodium falciparum.","when_to_set_to_false":"Set to false if the immunochromatographic test undergone by the patient was not for Plasmodium falciparum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunochromatographic test was for Plasmodium falciparum.","meaning":"Boolean indicating whether the immunochromatographic test was for Plasmodium falciparum."} ;; "for Plasmodium falciparum"
(declare-const patient_has_undergone_immunochromatographic_test_now@@outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the immunochromatographic test undergone by the patient had a positive result.","when_to_set_to_false":"Set to false if the immunochromatographic test undergone by the patient did not have a positive result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunochromatographic test result was positive.","meaning":"Boolean indicating whether the immunochromatographic test result was positive."} ;; "positive rapid diagnostic test"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_immunochromatographic_test_now@@for_plasmodium_falciparum
         patient_has_undergone_immunochromatographic_test_now)
     :named REQ2_AUXILIARY0)) ;; "immunochromatographic test ... for Plasmodium falciparum"

(assert
  (! (=> patient_has_undergone_immunochromatographic_test_now@@outcome_is_positive
         patient_has_undergone_immunochromatographic_test_now)
     :named REQ2_AUXILIARY1)) ;; "immunochromatographic test ... outcome is positive"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must have a positive rapid diagnostic test (Binax NOW immunochromatographic test) for Plasmodium falciparum
(assert
  (! (and patient_has_undergone_immunochromatographic_test_now@@for_plasmodium_falciparum
          patient_has_undergone_immunochromatographic_test_now@@outcome_is_positive)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "positive rapid diagnostic test (Binax NOW immunochromatographic test) for Plasmodium falciparum"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current recorded sex is female."} ;; "woman of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the potential to bear children.","when_to_set_to_false":"Set to false if the patient currently does not have the potential to bear children.","when_to_set_to_null":"Set to null if the patient's current childbearing potential is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has the potential to bear children."} ;; "woman of childbearing potential"
(declare-const patient_gonadotropin_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of urine gonadotropin concentration is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current urine gonadotropin concentration."} ;; "gonadotropin"
(declare-const patient_gonadotropin_value_recorded_now_withunit_unit@@temporalcontext_prior_to_entry_into_study Bool) ;; {"when_to_set_to_true":"Set to true if the urine gonadotropin concentration measurement was taken prior to entry into the study.","when_to_set_to_false":"Set to false if the measurement was not taken prior to entry into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken prior to entry into the study.","meaning":"Boolean indicating whether the urine gonadotropin concentration measurement was taken prior to entry into the study."} ;; "gonadotropin ... prior to entry into the study"
(declare-const patient_agrees_to_use_adequate_contraception_during_entire_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use adequate contraception during the entire study period.","when_to_set_to_false":"Set to false if the patient does not agree to use adequate contraception during the entire study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use adequate contraception during the entire study period.","meaning":"Boolean indicating whether the patient agrees to use adequate contraception during the entire study period."} ;; "agree to use adequate contraception during the entire study"
(declare-const patient_agrees_to_use_adequate_contraception_during_entire_study@@contraception_used_during_entire_study Bool) ;; {"when_to_set_to_true":"Set to true if the contraception is used for the entire duration of the study.","when_to_set_to_false":"Set to false if the contraception is not used for the entire duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether contraception is used for the entire duration of the study.","meaning":"Boolean indicating whether contraception is used for the entire duration of the study."} ;; "contraception used during entire study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for gonadotropin measurement implies measurement is prior to entry
(assert
  (! (=> patient_gonadotropin_value_recorded_now_withunit_unit@@temporalcontext_prior_to_entry_into_study
         (exists ((v Real)) (= v patient_gonadotropin_value_recorded_now_withunit_unit)))
     :named REQ3_AUXILIARY0)) ;; "gonadotropin concentration prior to entry into the study"

;; Qualifier variable for contraception use implies agreement to use contraception
(assert
  (! (=> patient_agrees_to_use_adequate_contraception_during_entire_study@@contraception_used_during_entire_study
         patient_agrees_to_use_adequate_contraception_during_entire_study)
     :named REQ3_AUXILIARY1)) ;; "contraception used during entire study"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: If the patient is a woman of childbearing potential, must have negative urine gonadotropin concentration prior to entry
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (and patient_gonadotropin_value_recorded_now_withunit_unit@@temporalcontext_prior_to_entry_into_study
              (<= patient_gonadotropin_value_recorded_now_withunit_unit 0.0)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is a woman of childbearing potential, the patient must have a negative urine gonadotropin concentration prior to entry into the study"

;; Component 1: If the patient is a woman of childbearing potential, must agree to use adequate contraception during the entire study
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_agrees_to_use_adequate_contraception_during_entire_study@@contraception_used_during_entire_study)
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a woman of childbearing potential, the patient must agree to use adequate contraception during the entire study"
