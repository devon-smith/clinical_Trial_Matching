;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_upper_gastrointestinal_operation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an upper gastrointestinal tract surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an upper gastrointestinal tract surgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an upper gastrointestinal tract surgery.","meaning":"Boolean indicating whether the patient has ever undergone an upper gastrointestinal tract surgery in their history."} ;; "has had previous upper gastrointestinal tract surgery."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_upper_gastrointestinal_operation_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous upper gastrointestinal tract surgery."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a comorbid condition.","when_to_set_to_false":"Set to false if the patient currently does not have a comorbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a comorbid condition.","meaning":"Boolean indicating whether the patient currently has a comorbid condition."} ;; "comorbid condition"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@underlying Bool) ;; {"when_to_set_to_true":"Set to true if the patient's comorbid condition is underlying.","when_to_set_to_false":"Set to false if the patient's comorbid condition is not underlying.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid condition is underlying.","meaning":"Boolean indicating whether the patient's comorbid condition is underlying."} ;; "underlying comorbid condition"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@underlying
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ1_AUXILIARY0)) ;; "underlying comorbid condition" implies "comorbid condition"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@underlying)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an underlying comorbid condition."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_opioid_receptor_agonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any opioid receptor agonist containing product (narcotic medication) now.","when_to_set_to_false":"Set to false if the patient is not currently taking any opioid receptor agonist containing product (narcotic medication) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any opioid receptor agonist containing product (narcotic medication) now.","meaning":"Boolean indicating whether the patient is currently taking any opioid receptor agonist containing product (narcotic medication) now."} ;; "narcotic medication"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_taking_opioid_receptor_agonist_containing_product_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is taking narcotic medication."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_psychotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a psychotropic agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a psychotropic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a psychotropic agent.","meaning":"Boolean indicating whether the patient is currently exposed to a psychotropic agent."} ;; "psychotropic medication"
(declare-const patient_is_taking_benzodiazepine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a benzodiazepine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a benzodiazepine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a benzodiazepine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a benzodiazepine-containing product."} ;; "benzodiazepine medication"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_exposed_to_psychotropic_agent_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is taking psychotropic medication."

(assert
(! (not patient_is_taking_benzodiazepine_containing_product_now)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is taking benzodiazepine medication."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_mental_health_impairment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented mental health impairment (psychological abnormality) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented mental health impairment (psychological abnormality) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a mental health impairment (psychological abnormality).","meaning":"Boolean indicating whether the patient has ever had a mental health impairment (psychological abnormality) in their medical history."} ;; "psychological abnormality"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_mental_health_impairment_inthehistory)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of psychological abnormality."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding relating to alcohol drinking behavior at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented finding relating to alcohol drinking behavior at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding relating to alcohol drinking behavior.","meaning":"Boolean indicating whether the patient has ever had a finding relating to alcohol drinking behavior at any time in the past."} ;; "alcohol use"
(declare-const patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_inthehistory@@temporalcontext_within6monthspriortonow Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alcohol use occurred within the previous six months prior to now.","when_to_set_to_false":"Set to false if the patient's history of alcohol use did not occur within the previous six months prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of alcohol use occurred within the previous six months prior to now.","meaning":"Boolean indicating whether the patient's history of alcohol use occurred within the previous six months prior to now."} ;; "history of alcohol use within the previous six months"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_inthehistory@@temporalcontext_within6monthspriortonow
      patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_inthehistory)
:named REQ5_AUXILIARY0)) ;; "history of alcohol use within the previous six months" implies "history of alcohol use"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_inthehistory@@temporalcontext_within6monthspriortonow)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol use within the previous six months."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_diagnosis_of_diabetes_mellitus_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_neuropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neuropathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neuropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of neuropathy.","meaning":"Boolean indicating whether the patient currently has neuropathy."} ;; "neuropathy"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_neuropathy_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neuropathy."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of seizures.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of seizures.","meaning":"Boolean indicating whether the patient currently has seizures."} ;; "seizures"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_finding_of_seizure_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has seizures."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_sleep_apnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sleep apnea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sleep apnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sleep apnea.","meaning":"Boolean indicating whether the patient currently has sleep apnea."} ;; "sleep apnea"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_sleep_apnea_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sleep apnea."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now@@interferes_with_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the comorbid condition present in the patient currently interferes with sleep.","when_to_set_to_false":"Set to false if the comorbid condition present in the patient currently does not interfere with sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid condition interferes with sleep.","meaning":"Boolean indicating whether the comorbid condition currently present in the patient interferes with sleep."} ;; "comorbid condition that interferes with sleep"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@interferes_with_sleep
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ10_AUXILIARY0)) ;; "comorbid condition that interferes with sleep" implies "comorbid condition"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@interferes_with_sleep)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ≥ 1 comorbid condition that interferes with sleep."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is a woman"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as having childbearing potential at the current time.","when_to_set_to_false":"Set to false if the patient is documented as not having childbearing potential at the current time.","when_to_set_to_null":"Set to null if the patient's childbearing potential at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is of childbearing years"
(declare-const patient_is_on_birth_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently using any form of birth control.","when_to_set_to_false":"Set to false if the patient is documented as not currently using any form of birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any form of birth control.","meaning":"Boolean value indicating whether the patient is currently on birth control."} ;; "the patient is NOT on birth control"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient is a woman who is pregnant
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

;; Exclusion: patient is a woman who is of childbearing years AND is NOT on birth control
(assert
(! (not (and patient_sex_is_female_now patient_has_childbearing_potential_now (not patient_is_on_birth_control_now)))
:named REQ11_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is a woman who is of childbearing years) AND (the patient is NOT on birth control)."
