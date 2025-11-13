;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_participating_client Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a participating client.","when_to_set_to_false":"Set to false if the patient is not a participating client.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a participating client.","meaning":"Boolean indicating whether the patient is a participating client."} ;; "the patient must be a participating client."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_participating_client
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be a participating client."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_reenrolling_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently re-enrolling in the study or program.","when_to_set_to_false":"Set to false if the patient is not currently re-enrolling in the study or program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently re-enrolling in the study or program.","meaning":"Boolean indicating whether the patient is currently re-enrolling in the study or program."} ;; "the patient must NOT be re-enrolling."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_reenrolling_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT be re-enrolling."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_resident_of_united_states_of_america Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a resident of the United States of America.","when_to_set_to_false":"Set to false if the patient is not a resident of the United States of America.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a resident of the United States of America.","meaning":"Boolean indicating whether the patient is a resident of the United States of America."} ;; "the patient must be a resident of the United States of America."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_resident_of_united_states_of_america
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be a resident of the United States of America."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tobacco smoking behavior.","when_to_set_to_false":"Set to false if the patient currently does not have a tobacco smoking behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tobacco smoking behavior.","meaning":"Boolean indicating whether the patient currently has a tobacco smoking behavior."} ;; "the patient must want to quit cigarette smoking within the next 30 days."
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now@@wants_to_quit_within_next_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tobacco smoking behavior and expresses a desire to quit within the next 30 days.","when_to_set_to_false":"Set to false if the patient currently has a tobacco smoking behavior but does not express a desire to quit within the next 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient wants to quit smoking within the next 30 days.","meaning":"Boolean indicating whether the patient currently has a tobacco smoking behavior and wants to quit within the next 30 days."} ;; "the patient must want to quit cigarette smoking within the next 30 days."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_tobacco_smoking_behavior_finding_now@@wants_to_quit_within_next_30_days
         patient_has_finding_of_tobacco_smoking_behavior_finding_now)
     :named REQ3_AUXILIARY0)) ;; "the patient must want to quit cigarette smoking within the next 30 days."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_tobacco_smoking_behavior_finding_now@@wants_to_quit_within_next_30_days
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must want to quit cigarette smoking within the next 30 days."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_tobacco_user_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses any form of tobacco.","when_to_set_to_false":"Set to false if the patient currently does not use any form of tobacco.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses any form of tobacco.","meaning":"Boolean indicating whether the patient currently uses tobacco (any form)."} ;; "other types of tobacco use are acceptable, but the patient must use cigarettes."
(declare-const patient_has_finding_of_tobacco_user_now@@must_include_cigarette_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current tobacco use includes cigarette use (regardless of whether other forms of tobacco are also used).","when_to_set_to_false":"Set to false if the patient's current tobacco use does not include cigarette use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current tobacco use includes cigarette use.","meaning":"Boolean indicating whether the patient's current tobacco use includes cigarette use."} ;; "the patient must use cigarettes (other types of tobacco use are acceptable, but the patient must use cigarettes)."

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_tobacco_user_now@@must_include_cigarette_use
         patient_has_finding_of_tobacco_user_now)
     :named REQ4_AUXILIARY0)) ;; "the patient must use cigarettes (other types of tobacco use are acceptable, but the patient must use cigarettes)."

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: patient must use cigarettes (other types of tobacco use are acceptable, but the patient must use cigarettes)
(assert
  (! patient_has_finding_of_tobacco_user_now@@must_include_cigarette_use
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must use cigarettes (other types of tobacco use are acceptable, but the patient must use cigarettes)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged 18 years or older"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged 18 years or older."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_speaks_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently speaks English.","when_to_set_to_false":"Set to false if the patient currently does not speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently speaks English.","meaning":"Boolean indicating whether the patient currently speaks English as a language."} ;; "the patient must speak English."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_speaks_english_now
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must speak English."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_provided_phone_number Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided a phone number.","when_to_set_to_false":"Set to false if the patient has not provided a phone number.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided a phone number.","meaning":"Boolean indicating whether the patient has provided a phone number."} ;; "the patient must provide a phone number."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_provided_phone_number
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide a phone number."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_provided_email_address Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided an email address.","when_to_set_to_false":"Set to false if the patient has not provided an email address.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided an email address.","meaning":"Boolean indicating whether the patient has provided an email address."} ;; "the patient must provide an email address."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_provided_email_address
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide an email address."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const cigarettes_value_recorded_per_day_withunit_cigarettes Real) ;; {"when_to_set_to_value":"Set to the number of cigarettes the patient uses per day, in units of cigarettes, if this information is available.","when_to_set_to_null":"Set to null if the number of cigarettes used per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of cigarettes the patient uses per day, in units of cigarettes."} ;; "the patient must use at least 10 cigarettes per day."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (>= cigarettes_value_recorded_per_day_withunit_cigarettes 10)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must use at least 10 cigarettes per day."

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."} ;; "the patient must have body mass index ≥ 18.5."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 18.5)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have body mass index ≥ 18.5."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_anorexia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of anorexia nervosa at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of anorexia nervosa documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of anorexia nervosa.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of anorexia nervosa in their medical history."} ;; "no history of anorexia nervosa"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of bulimia nervosa at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of bulimia nervosa documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of bulimia nervosa.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of bulimia nervosa in their medical history."} ;; "no history of bulimia nervosa"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 0: To be included, the patient must have no history of anorexia nervosa or history of bulimia nervosa.
(assert
  (! (and (not patient_has_diagnosis_of_anorexia_nervosa_inthehistory)
          (not patient_has_diagnosis_of_bulimia_nervosa_inthehistory))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no history of anorexia nervosa or history of bulimia nervosa."
