;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_alcohol_consumption_screening_now_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone alcohol consumption screening now and the result is negative.","when_to_set_to_false":"Set to false if the patient has undergone alcohol consumption screening now and the result is not negative (i.e., positive or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone alcohol consumption screening now with a negative result.","meaning":"Boolean indicating whether the patient has undergone alcohol consumption screening now and the outcome is negative."} ;; "the patient does NOT have an alcohol screen negative result"

(declare-const patient_alcohol_consumption_value_recorded_now_in_grams_per_day Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current alcohol consumption in grams per day if documented.","when_to_set_to_null":"Set to null if the patient's current alcohol consumption in grams per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current alcohol consumption in grams per day."} ;; "the patient's current alcohol consumption value recorded now, in grams per day"

(declare-const patient_alcohol_consumption_value_recorded_now_in_grams_per_day@@within_sensible_drinking_limits_for_women_niaaa_definition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current alcohol consumption in grams per day is within the sensible drinking limits for women as defined by NIAAA.","when_to_set_to_false":"Set to false if the patient's current alcohol consumption in grams per day is not within the sensible drinking limits for women as defined by NIAAA.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current alcohol consumption in grams per day is within the sensible drinking limits for women as defined by NIAAA.","meaning":"Boolean indicating whether the patient's current alcohol consumption in grams per day is within the sensible drinking limits for women as defined by NIAAA."} ;; "the patient does NOT drink within the sensible drinking limits for women as defined by the National Institute on Alcohol Abuse and Alcoholism"

(declare-const patient_is_exposed_to_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alcohol (i.e., drinks alcohol now).","when_to_set_to_false":"Set to false if the patient is not currently exposed to alcohol (i.e., does not drink alcohol now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to alcohol.","meaning":"Boolean indicating whether the patient is currently exposed to alcohol."} ;; "alcohol"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_alcohol_consumption_value_recorded_now_in_grams_per_day@@within_sensible_drinking_limits_for_women_niaaa_definition
     patient_is_exposed_to_alcohol_now)
:named REQ0_AUXILIARY0)) ;; "Qualifier variable for sensible drinking limits for women implies patient is exposed to alcohol now"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must have a negative alcohol screen result
(assert
(! (not patient_has_undergone_alcohol_consumption_screening_now_outcome_is_negative)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient does NOT have an alcohol screen negative result"

;; Exclusion: patient must drink within sensible drinking limits for women as defined by NIAAA
(assert
(! (not patient_alcohol_consumption_value_recorded_now_in_grams_per_day@@within_sensible_drinking_limits_for_women_niaaa_definition)
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient does NOT drink within the sensible drinking limits for women as defined by the National Institute on Alcohol Abuse and Alcoholism"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_agrees_to_randomization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently agrees to randomization.","when_to_set_to_false":"Set to false if the patient currently does not agree to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently agrees to randomization.","meaning":"Boolean indicating whether the patient currently agrees to randomization."} ;; "patient currently agrees to randomization"
(declare-const patient_agrees_to_study_terms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently agrees to the study terms.","when_to_set_to_false":"Set to false if the patient currently does not agree to the study terms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently agrees to the study terms.","meaning":"Boolean indicating whether the patient currently agrees to the study terms."} ;; "patient currently agrees to study terms"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and (not patient_agrees_to_randomization_now)
             (not patient_agrees_to_study_terms_now)))
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "A patient is excluded if the patient does not agree to randomization and does not agree to study terms."
