;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_symptoms_of_sore_throat_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sore throat symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have sore throat symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sore throat symptoms.","meaning":"Boolean indicating whether the patient currently has sore throat symptoms."} ;; "To be included, the patient must have the presence of sore throat."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_symptoms_of_sore_throat_symptom_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have the presence of sore throat."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_erythema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of erythema (redness).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of erythema (redness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has erythema (redness).","meaning":"Boolean indicating whether the patient currently has erythema (redness)."} ;; "To be included, the patient must have redness of the posterior pharyngeal wall."
(declare-const patient_has_finding_of_erythema_now@@located_in_posterior_pharyngeal_wall Bool) ;; {"when_to_set_to_true":"Set to true if the patient's erythema (redness) is specifically located in the posterior pharyngeal wall.","when_to_set_to_false":"Set to false if the patient's erythema (redness) is not located in the posterior pharyngeal wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the erythema (redness) is located in the posterior pharyngeal wall.","meaning":"Boolean indicating whether the patient's erythema (redness) is located in the posterior pharyngeal wall."} ;; "To be included, the patient must have redness of the posterior pharyngeal wall."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_erythema_now@@located_in_posterior_pharyngeal_wall
         patient_has_finding_of_erythema_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have redness of the posterior pharyngeal wall."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_erythema_now@@located_in_posterior_pharyngeal_wall
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have redness of the posterior pharyngeal wall."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_exudate_on_tonsils_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has exudate present on the tonsils.","when_to_set_to_false":"Set to false if the patient currently does not have exudate present on the tonsils.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exudate present on the tonsils.","meaning":"Boolean indicating whether the patient currently has exudate present on the tonsils."} ;; "To be included, the patient must have tonsillar exudate."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_exudate_on_tonsils_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have tonsillar exudate."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_swelling_of_tonsil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has swelling of the tonsil.","when_to_set_to_false":"Set to false if the patient currently does not have swelling of the tonsil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has swelling of the tonsil.","meaning":"Boolean indicating whether the patient currently has swelling of the tonsil."} ;; "To be included, the patient must have tonsillar swelling."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_swelling_of_tonsil_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have tonsillar swelling."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_anterior_cervical_lymphadenopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has anterior cervical lymphadenopathy.","when_to_set_to_false":"Set to false if the patient currently does not have anterior cervical lymphadenopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anterior cervical lymphadenopathy.","meaning":"Boolean indicating whether the patient currently has anterior cervical lymphadenopathy."} ;; "To be included, the patient must have tender anterior cervical adenopathy."
(declare-const patient_has_finding_of_anterior_cervical_lymphadenopathy_now@@tender Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anterior cervical lymphadenopathy is tender.","when_to_set_to_false":"Set to false if the patient's anterior cervical lymphadenopathy is not tender.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's anterior cervical lymphadenopathy is tender.","meaning":"Boolean indicating whether the patient's anterior cervical lymphadenopathy is tender."} ;; "To be included, the patient must have tender anterior cervical adenopathy."

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_anterior_cervical_lymphadenopathy_now@@tender
         patient_has_finding_of_anterior_cervical_lymphadenopathy_now)
     :named REQ4_AUXILIARY0)) ;; "To be included, the patient must have tender anterior cervical adenopathy."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_anterior_cervical_lymphadenopathy_now@@tender
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have tender anterior cervical adenopathy."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_body_temperature_value_recorded_inthepast24hours_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature is recorded within the past 24 hours in degrees Celsius.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body temperature within the past 24 hours in degrees Celsius."} ;; "body temperature > 38 degrees Celsius (100.4 degrees Fahrenheit) within past 24 hours"
(declare-const patient_body_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature is recorded at presentation in degrees Celsius.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body temperature at presentation in degrees Celsius."} ;; "body temperature > 38 degrees Celsius (100.4 degrees Fahrenheit) at presentation"
(declare-const patient_has_finding_of_fever_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient had fever within the past 24 hours.","when_to_set_to_false":"Set to false if the patient did not have fever within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had fever within the past 24 hours.","meaning":"Boolean indicating whether the patient had fever within the past 24 hours."} ;; "fever ... within past 24 hours"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever at the time of presentation.","when_to_set_to_false":"Set to false if the patient currently does not have fever at the time of presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever at the time of presentation.","meaning":"Boolean indicating whether the patient currently has fever at presentation."} ;; "fever ... at presentation"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: fever at presentation is body temperature > 38°C at presentation
(assert
  (! (= patient_has_finding_of_fever_now
        (> patient_body_temperature_value_recorded_now_withunit_degrees_celsius 38.0))
     :named REQ5_AUXILIARY0)) ;; "fever (body temperature > 38 degrees Celsius (100.4 degrees Fahrenheit) at presentation)"

;; Definition: fever within past 24 hours is body temperature > 38°C within past 24 hours
(assert
  (! (= patient_has_finding_of_fever_inthepast24hours
        (> patient_body_temperature_value_recorded_inthepast24hours_withunit_degrees_celsius 38.0))
     :named REQ5_AUXILIARY1)) ;; "fever (body temperature > 38 degrees Celsius (100.4 degrees Fahrenheit) within past 24 hours)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Inclusion: patient must have fever at presentation OR fever within past 24 hours
(assert
  (! (or patient_has_finding_of_fever_now
         patient_has_finding_of_fever_inthepast24hours)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (fever (body temperature > 38 degrees Celsius (100.4 degrees Fahrenheit) at presentation) OR fever (body temperature > 38 degrees Celsius (100.4 degrees Fahrenheit) within past 24 hours))."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_erythema_scarlatiniforme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a rash typical of scarlet fever (erythema scarlatiniforme).","when_to_set_to_false":"Set to false if the patient currently does not have a rash typical of scarlet fever (erythema scarlatiniforme).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a rash typical of scarlet fever (erythema scarlatiniforme).","meaning":"Boolean indicating whether the patient currently has a rash typical of scarlet fever (erythema scarlatiniforme)."} ;; "rash typical of scarlet fever"
(declare-const patient_has_finding_of_disorder_of_tympanic_membrane_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal tympanic membranes.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal tympanic membranes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal tympanic membranes.","meaning":"Boolean indicating whether the patient currently has abnormal tympanic membranes."} ;; "abnormal tympanic membranes"
(declare-const patient_has_finding_of_petechiae_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has petechiae.","when_to_set_to_false":"Set to false if the patient currently does not have petechiae.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has petechiae.","meaning":"Boolean indicating whether the patient currently has petechiae."} ;; "palatal petechiae"
(declare-const patient_has_finding_of_petechiae_now@@located_on_palate Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has petechiae and those petechiae are located on the palate.","when_to_set_to_false":"Set to false if the patient currently has petechiae but they are not located on the palate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's petechiae are located on the palate.","meaning":"Boolean indicating whether the patient's petechiae are located on the palate."} ;; "palatal petechiae"
(declare-const patient_has_finding_of_streptococcus_pyogenes_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has group A Streptococcus (Streptococcus pyogenes) infection.","when_to_set_to_false":"Set to false if the patient currently does not have group A Streptococcus (Streptococcus pyogenes) infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has group A Streptococcus (Streptococcus pyogenes) infection.","meaning":"Boolean indicating whether the patient currently has group A Streptococcus (Streptococcus pyogenes) infection."} ;; "group A Streptococcus infection"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for palatal petechiae implies stem petechiae variable
(assert
  (! (=> patient_has_finding_of_petechiae_now@@located_on_palate
         patient_has_finding_of_petechiae_now)
     :named REQ6_AUXILIARY0)) ;; "palatal petechiae" is a type of petechiae

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: patient may also have (rash typical of scarlet fever OR abnormal tympanic membranes OR palatal petechiae), in addition to the above symptoms for group A Streptococcus infection.
(assert
  (! (or patient_has_finding_of_erythema_scarlatiniforme_now
         patient_has_finding_of_disorder_of_tympanic_membrane_now
         patient_has_finding_of_petechiae_now@@located_on_palate)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may also have (rash typical of scarlet fever OR abnormal tympanic membranes OR palatal petechiae), in addition to the above symptoms for group A Streptococcus infection."
