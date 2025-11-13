;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_inthehistory_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the onset of symptoms if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age at onset of symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time when symptoms first appeared."} // "age at onset of symptoms ≥ 45 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_inthehistory_in_years 45)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have age at onset of symptoms ≥ 45 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_consultation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a consultation at any time in the past, regardless of location.","when_to_set_to_false":"Set to false if the patient has never undergone a consultation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a consultation.","meaning":"Boolean indicating whether the patient has ever undergone a consultation at any time in the past."} // "consultation"
(declare-const patient_has_undergone_consultation_inthehistory@@at_university_hospital_of_fort_de_france Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a consultation and that consultation occurred at the University Hospital of Fort-de-France.","when_to_set_to_false":"Set to false if the patient has ever undergone a consultation but none occurred at the University Hospital of Fort-de-France.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any consultation occurred at the University Hospital of Fort-de-France.","meaning":"Boolean indicating whether the patient's consultation occurred at the University Hospital of Fort-de-France."} // "consultation at the University Hospital of Fort-de-France"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_consultation_inthehistory@@at_university_hospital_of_fort_de_france
         patient_has_undergone_consultation_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "consultation at the University Hospital of Fort-de-France" implies "consultation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_undergone_consultation_inthehistory@@at_university_hospital_of_fort_de_france
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been seen in consultation at the University Hospital of Fort-de-France."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} // "fever"
(declare-const patient_has_finding_of_joint_pain_affecting_the_ankles_now_with_sudden_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has joint pain affecting the ankles and the onset of this joint pain is sudden.","when_to_set_to_false":"Set to false if the patient currently does not have joint pain affecting the ankles with sudden onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has joint pain affecting the ankles with sudden onset.","meaning":"Boolean indicating whether the patient currently has joint pain affecting the ankles with sudden onset."} // "sudden onset of joint pain affecting the ankles"
(declare-const patient_has_finding_of_joint_pain_affecting_the_hands_now_with_sudden_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has joint pain affecting the hands and the onset of this joint pain is sudden.","when_to_set_to_false":"Set to false if the patient currently does not have joint pain affecting the hands with sudden onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has joint pain affecting the hands with sudden onset.","meaning":"Boolean indicating whether the patient currently has joint pain affecting the hands with sudden onset."} // "sudden onset of joint pain affecting the hands"
(declare-const patient_has_finding_of_joint_pain_affecting_the_knees_now_with_sudden_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has joint pain affecting the knees and the onset of this joint pain is sudden.","when_to_set_to_false":"Set to false if the patient currently does not have joint pain affecting the knees with sudden onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has joint pain affecting the knees with sudden onset.","meaning":"Boolean indicating whether the patient currently has joint pain affecting the knees with sudden onset."} // "sudden onset of joint pain affecting the knees"
(declare-const patient_has_finding_of_joint_pain_affecting_the_wrists_now_with_sudden_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has joint pain affecting the wrists and the onset of this joint pain is sudden.","when_to_set_to_false":"Set to false if the patient currently does not have joint pain affecting the wrists with sudden onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has joint pain affecting the wrists with sudden onset.","meaning":"Boolean indicating whether the patient currently has joint pain affecting the wrists with sudden onset."} // "sudden onset of joint pain affecting the wrists"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have fever.
(assert
  (! patient_has_finding_of_fever_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have fever."

;; Component 1: To be included, the patient must have sudden onset of joint pain affecting the wrists OR hands OR ankles OR knees.
(assert
  (! (or patient_has_finding_of_joint_pain_affecting_the_wrists_now_with_sudden_onset
         patient_has_finding_of_joint_pain_affecting_the_hands_now_with_sudden_onset
         patient_has_finding_of_joint_pain_affecting_the_ankles_now_with_sudden_onset
         patient_has_finding_of_joint_pain_affecting_the_knees_now_with_sudden_onset)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have sudden onset of joint pain affecting the wrists OR hands OR ankles OR knees."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const symptoms_duration_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has experienced symptoms suggestive of chikungunya virus infection.","when_to_set_to_null":"Set to null if the duration of symptoms suggestive of chikungunya virus infection is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in days of symptoms suggestive of chikungunya virus infection."} // "duration of symptoms suggestive of chikungunya virus infection ≤ 10 days"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (<= symptoms_duration_value_recorded_in_days 10)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "duration of symptoms suggestive of chikungunya virus infection ≤ 10 days"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_joint_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has joint pain.","when_to_set_to_false":"Set to false if the patient currently does not have joint pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has joint pain.","meaning":"Boolean indicating whether the patient currently has joint pain."} // "presence of joint pain on the day of inclusion"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_joint_pain_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have presence of joint pain on the day of inclusion."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_arthritis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with arthritis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with arthritis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with arthritis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of arthritis in their history."} // "NO history of inflammatory arthritis"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_diagnosis_of_arthritis_inthehistory)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have NO history of inflammatory arthritis."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any drug or medicament within the past 2 weeks prior to inclusion.","when_to_set_to_false":"Set to false if the patient was not exposed to any drug or medicament within the past 2 weeks prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any drug or medicament within the past 2 weeks prior to inclusion.","meaning":"Boolean indicating whether the patient was exposed to any drug or medicament within the past 2 weeks prior to inclusion."} // "absence of steroidal anti-inflammatory drug use or absence of non-steroidal anti-inflammatory drug use taken within two weeks prior to inclusion."
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any non-steroidal anti-inflammatory agent within the past 2 weeks prior to inclusion.","when_to_set_to_false":"Set to false if the patient was not exposed to any non-steroidal anti-inflammatory agent within the past 2 weeks prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any non-steroidal anti-inflammatory agent within the past 2 weeks prior to inclusion.","meaning":"Boolean indicating whether the patient was exposed to any non-steroidal anti-inflammatory agent within the past 2 weeks prior to inclusion."} // "absence of non-steroidal anti-inflammatory drug use taken within two weeks prior to inclusion."
(declare-const patient_is_exposed_to_steroidal_anti_inflammatory_agent_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any steroidal anti-inflammatory agent within the past 2 weeks prior to inclusion.","when_to_set_to_false":"Set to false if the patient was not exposed to any steroidal anti-inflammatory agent within the past 2 weeks prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any steroidal anti-inflammatory agent within the past 2 weeks prior to inclusion.","meaning":"Boolean indicating whether the patient was exposed to any steroidal anti-inflammatory agent within the past 2 weeks prior to inclusion."} // "absence of steroidal anti-inflammatory drug use taken within two weeks prior to inclusion."

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must have absence of steroidal anti-inflammatory drug use or absence of non-steroidal anti-inflammatory drug use taken within two weeks prior to inclusion.
(assert
  (! (or (not patient_is_exposed_to_steroidal_anti_inflammatory_agent_inthepast2weeks)
         (not patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast2weeks))
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "absence of steroidal anti-inflammatory drug use or absence of non-steroidal anti-inflammatory drug use taken within two weeks prior to inclusion."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_ability_to_participate_in_study_throughout_duration_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is judged to have the ability to participate in the study for the entire 12-month duration.","when_to_set_to_false":"Set to false if the patient is judged not to have the ability to participate in the study for the entire 12-month duration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to participate in the study for the entire 12-month duration.","meaning":"Boolean indicating whether the patient has the ability to participate in the study for the entire duration of 12 months."} // "the ability to participate in the study throughout its duration (12 months)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_ability_to_participate_in_study_throughout_duration_12_months
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to participate in the study throughout its duration (12 months)"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_affiliated_with_social_health_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently affiliated with a social health care program or system.","when_to_set_to_false":"Set to false if the patient is currently not affiliated with a social health care program or system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently affiliated with a social health care program or system.","meaning":"Boolean indicating whether the patient is currently affiliated with a social health care program or system."} // "affiliated with a social health care"
(declare-const patient_is_beneficiary_of_social_health_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a beneficiary of a social health care program or system.","when_to_set_to_false":"Set to false if the patient is currently not a beneficiary of a social health care program or system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a beneficiary of a social health care program or system.","meaning":"Boolean indicating whether the patient is currently a beneficiary of a social health care program or system."} // "beneficiary of a social health care"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (or patient_is_affiliated_with_social_health_care_now
         patient_is_beneficiary_of_social_health_care_now)
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (affiliated with a social health care OR beneficiary of a social health care)."

;; ===================== Declarations for the inclusion criterion (REQ 9) =====================
(declare-const patient_accepts_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has accepted to participate in the study.","when_to_set_to_false":"Set to false if the patient has not accepted to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has accepted to participate in the study.","meaning":"Boolean indicating whether the patient accepts to participate in the study."} // "the patient must accept to participate in the study"
(declare-const patient_accepts_monitoring_proposed Bool) ;; {"when_to_set_to_true":"Set to true if the patient has accepted the monitoring proposed as part of the study.","when_to_set_to_false":"Set to false if the patient has not accepted the monitoring proposed as part of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has accepted the monitoring proposed as part of the study.","meaning":"Boolean indicating whether the patient accepts the monitoring proposed as part of the study."} // "the patient must accept monitoring proposed"
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the informed consent for participation in the study.","when_to_set_to_false":"Set to false if the patient has not signed the informed consent for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the informed consent for participation in the study.","meaning":"Boolean indicating whether the patient has signed the informed consent for participation in the study."} // "the patient must have signed informed consent"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: The patient must accept to participate in the study.
(assert
  (! patient_accepts_participation_in_study
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must accept to participate in the study"

;; Component 1: The patient must accept monitoring proposed.
(assert
  (! patient_accepts_monitoring_proposed
     :named REQ9_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must accept monitoring proposed"

;; Component 2: The patient must have signed informed consent.
(assert
  (! patient_has_signed_informed_consent
     :named REQ9_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed informed consent"
