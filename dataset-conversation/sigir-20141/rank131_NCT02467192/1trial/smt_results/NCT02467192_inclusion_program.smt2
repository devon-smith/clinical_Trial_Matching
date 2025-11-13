;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age > 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 65 years)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's body temperature in degrees Celsius is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body temperature in degrees Celsius."} ;; "temperature > 38 degrees Celsius OR temperature < 35 degrees Celsius"
(declare-const patient_c_reactive_protein_value_recorded_now_withunit_milligrams_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's C-reactive protein concentration in milligrams per liter is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current C-reactive protein concentration in milligrams per liter."} ;; "C-reactive protein concentration > 10 milligrams per liter"
(declare-const patient_leucocyte_count_value_recorded_now_withunit_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's leucocyte count per milliliter is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current leucocyte (white blood cell) count per milliliter."} ;; "leucocyte count > 10,000 per milliliter"
(declare-const patient_polynuclear_neutrophil_percentage_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's polynuclear neutrophil percentage in percent is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current polynuclear neutrophil percentage in percent."} ;; "polynuclear neutrophil percentage > 85 percent"
(declare-const patient_has_finding_of_left_shifted_white_blood_cells_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of left-shifted white blood cells.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of left-shifted white blood cells.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of left-shifted white blood cells.","meaning":"Boolean indicating whether the patient currently has a left shift in white blood cells (left-shifted white blood cells)."} ;; "left deviation of leucocyte count"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition of infectious sign per requirement text
(define-fun patient_has_at_least_one_infectious_sign_now () Bool
  (or
    (> patient_temperature_value_recorded_now_withunit_degrees_celsius 38.0) ;; "temperature > 38 degrees Celsius"
    (< patient_temperature_value_recorded_now_withunit_degrees_celsius 35.0) ;; "temperature < 35 degrees Celsius"
    (> patient_c_reactive_protein_value_recorded_now_withunit_milligrams_per_liter 10.0) ;; "C-reactive protein concentration > 10 milligrams per liter"
    (and
      (> patient_leucocyte_count_value_recorded_now_withunit_per_milliliter 10000.0) ;; "leucocyte count > 10,000 per milliliter"
      (or
        (> patient_polynuclear_neutrophil_percentage_value_recorded_now_withunit_percent 85.0) ;; "polynuclear neutrophil percentage > 85 percent"
        patient_has_finding_of_left_shifted_white_blood_cells_now ;; "left deviation of leucocyte count"
      )
    )
  )
) ;; "at least one infectious sign (temperature > 38 degrees Celsius OR temperature < 35 degrees Celsius OR C-reactive protein concentration > 10 milligrams per liter OR (leucocyte count > 10,000 per milliliter AND (polynuclear neutrophil percentage > 85 percent OR left deviation of leucocyte count)))"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_at_least_one_infectious_sign_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea.","meaning":"Boolean indicating whether the patient currently has dyspnea."} ;; "dyspnea"
(declare-const patient_has_finding_of_dyspnea_now@@recently_appeared Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dyspnea has recently appeared.","when_to_set_to_false":"Set to false if the patient's current dyspnea has not recently appeared.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dyspnea has recently appeared.","meaning":"Boolean indicating whether the patient's current dyspnea has recently appeared."} ;; "recently appeared dyspnea"
(declare-const patient_has_finding_of_purulent_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has purulent sputum.","when_to_set_to_false":"Set to false if the patient currently does not have purulent sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has purulent sputum.","meaning":"Boolean indicating whether the patient currently has purulent sputum."} ;; "purulent sputum"
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory crackles.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory crackles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory crackles.","meaning":"Boolean indicating whether the patient currently has respiratory crackles."} ;; "crackles"
(declare-const patient_has_finding_of_respiratory_crackles_now@@localized Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory crackles and those crackles are localized.","when_to_set_to_false":"Set to false if the patient currently has respiratory crackles but they are not localized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory crackles are localized.","meaning":"Boolean indicating whether the patient's current respiratory crackles are localized."} ;; "localized crackles"
(declare-const patient_oxygen_saturation_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current oxygen saturation in percent, if available.","when_to_set_to_null":"Set to null if the patient's current oxygen saturation in percent is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current oxygen saturation in percent."} ;; "oxygen saturation < 90 percent"
(declare-const patient_respiratory_frequency_value_recorded_now_withunit_per_minute Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current respiratory frequency in breaths per minute, if available.","when_to_set_to_null":"Set to null if the patient's current respiratory frequency in breaths per minute is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current respiratory frequency in breaths per minute."} ;; "respiratory frequency > 20 per minute"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for recently appeared dyspnea implies dyspnea
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@recently_appeared
         patient_has_finding_of_dyspnea_now)
     :named REQ2_AUXILIARY0)) ;; "recently appeared dyspnea" implies "dyspnea"

;; Qualifier variable for localized crackles implies crackles
(assert
  (! (=> patient_has_finding_of_respiratory_crackles_now@@localized
         patient_has_finding_of_respiratory_crackles_now)
     :named REQ2_AUXILIARY1)) ;; "localized crackles" implies "crackles"

;; ===================== Constraint Assertions (REQ 2) =====================
;; At least one respiratory sign: cough OR purulent sputum OR chest pain OR localized crackles OR recently appeared dyspnea OR oxygen saturation < 90% OR respiratory frequency > 20/min
(assert
  (! (or patient_has_finding_of_cough_now
         patient_has_finding_of_purulent_sputum_now
         patient_has_finding_of_chest_pain_now
         patient_has_finding_of_respiratory_crackles_now@@localized
         patient_has_finding_of_dyspnea_now@@recently_appeared
         (< patient_oxygen_saturation_value_recorded_now_withunit_percent 90.0)
         (> patient_respiratory_frequency_value_recorded_now_withunit_per_minute 20.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least one respiratory sign (cough OR purulent sputum OR chest pain OR localized crackles OR recently appeared dyspnea OR oxygen saturation < 90 percent OR respiratory frequency > 20 per minute)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_been_prescribed_antimicrobial_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently prescribed antimicrobial therapy.","when_to_set_to_false":"Set to false if the patient is currently not prescribed antimicrobial therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently prescribed antimicrobial therapy.","meaning":"Boolean indicating whether the patient is currently prescribed antimicrobial therapy."} ;; "the patient must be prescribed antimicrobial therapy"
(declare-const patient_has_been_prescribed_antimicrobial_therapy_now@@for_suspicion_of_lower_respiratory_tract_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current antimicrobial therapy is prescribed for suspicion of lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient's current antimicrobial therapy is not prescribed for suspicion of lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current antimicrobial therapy is prescribed for suspicion of lower respiratory tract infection.","meaning":"Boolean indicating whether the patient's current antimicrobial therapy is prescribed for suspicion of lower respiratory tract infection."} ;; "for suspicion of low respiratory tract infection"
(declare-const patient_has_suspicion_of_lower_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have a lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have a lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have a lower respiratory tract infection.","meaning":"Boolean indicating whether the patient is currently suspected to have a lower respiratory tract infection."} ;; "suspicion of low respiratory tract infection"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_been_prescribed_antimicrobial_therapy_now@@for_suspicion_of_lower_respiratory_tract_infection
         patient_has_been_prescribed_antimicrobial_therapy_now)
     :named REQ3_AUXILIARY0)) ;; "the patient must be prescribed antimicrobial therapy for suspicion of low respiratory tract infection"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must be prescribed antimicrobial therapy for suspicion of low respiratory tract infection
(assert
  (! patient_has_been_prescribed_antimicrobial_therapy_now@@for_suspicion_of_lower_respiratory_tract_infection
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be prescribed antimicrobial therapy for suspicion of low respiratory tract infection"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_given_consent_himself_or_through_support_person Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given consent, either himself or through his support person.","when_to_set_to_false":"Set to false if the patient has not given consent, neither himself nor through his support person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given consent himself or through his support person.","meaning":"Boolean indicating whether the patient has given consent, either himself or through his support person."} ;; "the patient must give consent (himself OR through his support person)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_given_consent_himself_or_through_support_person
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must give consent (himself OR through his support person)"
