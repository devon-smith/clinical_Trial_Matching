;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_symptoms_of_sore_throat_symptom_now Bool) ;; "sore throat" {"when_to_set_to_true":"Set to true if the patient currently has a sore throat symptom.","when_to_set_to_false":"Set to false if the patient currently does not have a sore throat symptom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sore throat symptom.","meaning":"Boolean indicating whether the patient currently has a sore throat symptom."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_symptoms_of_sore_throat_symptom_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a sore throat."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; "fever with temperature > 38 degrees Celsius" {"when_to_set_to_value":"Set to the numeric value representing the patient's current body temperature in degrees Celsius.","when_to_set_to_null":"Set to null if the patient's current body temperature is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current body temperature in degrees Celsius."}
(declare-const patient_centor_criteria_score_value_recorded_now_withunit_count Int) ;; "Centor criteria" {"when_to_set_to_value":"Set to the integer value representing the number of Centor criteria currently present in the patient.","when_to_set_to_null":"Set to null if the number of Centor criteria present in the patient is unknown, not documented, or cannot be determined.","meaning":"Numeric count of Centor criteria currently present in the patient."}
(declare-const patient_has_finding_of_cervical_lymphadenopathy_now Bool) ;; "enlarged cervical lymph nodes" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of enlarged cervical lymph nodes.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of enlarged cervical lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has enlarged cervical lymph nodes.","meaning":"Boolean indicating whether the patient currently has enlarged cervical lymph nodes."}
(declare-const patient_has_finding_of_cough_now Bool) ;; "cough" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."}
(declare-const patient_has_finding_of_exudate_on_tonsils_now Bool) ;; "tonsillar exudate" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of exudate on the tonsils.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of exudate on the tonsils.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exudate on the tonsils.","meaning":"Boolean indicating whether the patient currently has exudate on the tonsils."}
(declare-const patient_has_finding_of_fever_inthehistory Bool) ;; "history of fever" {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of fever in the past.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of fever in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had fever in the past.","meaning":"Boolean indicating whether the patient has ever had fever in the past."}
(declare-const patient_has_finding_of_fever_now Bool) ;; "fever" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: fever with temperature > 38 degrees Celsius
(assert
  (! (= patient_has_finding_of_fever_now
        (> patient_body_temperature_value_recorded_now_withunit_celsius 38.0))
     :named REQ1_AUXILIARY0)) ;; "fever with temperature > 38 degrees Celsius"

;; Definition: lack of cough is the negation of cough
(define-fun patient_has_finding_of_lack_of_cough_now () Bool
  (not patient_has_finding_of_cough_now)) ;; "lack of cough"

;; Centor criteria: at least two of the following
;; 1. fever with temperature > 38 degrees Celsius
;; 2. history of fever
;; 3. enlarged cervical lymph nodes
;; 4. tonsillar exudate
;; 5. lack of cough

(define-fun centor_criteria_count () Int
  (+ (ite patient_has_finding_of_fever_now 1 0)
     (ite patient_has_finding_of_fever_inthehistory 1 0)
     (ite patient_has_finding_of_cervical_lymphadenopathy_now 1 0)
     (ite patient_has_finding_of_exudate_on_tonsils_now 1 0)
     (ite patient_has_finding_of_lack_of_cough_now 1 0))) ;; "at least two Centor criteria (fever with temperature > 38 degrees Celsius OR history of fever OR enlarged cervical lymph nodes OR tonsillar exudate OR lack of cough)"

;; Centor criteria score variable definition
(assert
  (! (= patient_centor_criteria_score_value_recorded_now_withunit_count centor_criteria_count)
     :named REQ1_AUXILIARY1)) ;; "Centor criteria score value equals the number of Centor criteria present"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_centor_criteria_score_value_recorded_now_withunit_count 2)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least two Centor criteria"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "aged ≥ 3 years AND ≤ 14 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be aged ≥ 3 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 3)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 3 years."

;; Component 1: To be included, the patient must be aged ≤ 14 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 14)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 14 years."
