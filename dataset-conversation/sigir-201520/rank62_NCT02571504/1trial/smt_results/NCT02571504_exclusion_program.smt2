;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} ;; "dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_dementia_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "life expectancy < 3 years"
(declare-const patient_longevity_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the estimated number of years if the patient's current life expectancy is documented or can be reasonably determined.","when_to_set_to_null":"Set to null if the patient's current life expectancy is unknown, not documented, or cannot be reasonably estimated.","meaning":"Numeric value representing the patient's current life expectancy in years."} ;; "life expectancy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_longevity_value_recorded_now_withunit_years 3))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has life expectancy < 3 years."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the nervous system."} ;; "neurological disorder"

(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now@@is_another_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the nervous system and that disorder is another (distinct from the index condition).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a disorder of the nervous system but it is not another (i.e., it is the index condition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is another (distinct from the index condition).","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the nervous system and that disorder is another (distinct from the index condition)."} ;; "another neurological disorder"

(declare-const patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of an infectious disease of the central nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of an infectious disease of the central nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of an infectious disease of the central nervous system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of an infectious disease of the central nervous system."} ;; "central nervous system infection"

(declare-const patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now@@is_active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of an infectious disease of the central nervous system and that infection is active.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of an infectious disease of the central nervous system but the infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is active.","meaning":"Boolean indicating whether the patient currently has a diagnosis of an infectious disease of the central nervous system and that infection is active."} ;; "active opportunistic central nervous system infection"

(declare-const patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now@@is_opportunistic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of an infectious disease of the central nervous system and that infection is opportunistic.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of an infectious disease of the central nervous system but the infection is not opportunistic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is opportunistic.","meaning":"Boolean indicating whether the patient currently has a diagnosis of an infectious disease of the central nervous system and that infection is opportunistic."} ;; "active opportunistic central nervous system infection"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: active opportunistic CNS infection implies another neurological disorder
(assert
(! (=> (and patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now
            patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now@@is_active
            patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now@@is_opportunistic)
        patient_has_diagnosis_of_disorder_of_nervous_system_now@@is_another_disorder)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (active opportunistic central nervous system infection)"

;; Qualifier variable implies corresponding stem variable (another disorder implies disorder)
(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_now@@is_another_disorder
       patient_has_diagnosis_of_disorder_of_nervous_system_now)
:named REQ2_AUXILIARY1)) ;; "another neurological disorder"

;; Qualifier variable implies corresponding stem variable (active CNS infection implies CNS infection)
(assert
(! (=> patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now@@is_active
       patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now)
:named REQ2_AUXILIARY2)) ;; "active opportunistic central nervous system infection"

;; Qualifier variable implies corresponding stem variable (opportunistic CNS infection implies CNS infection)
(assert
(! (=> patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now@@is_opportunistic
       patient_has_diagnosis_of_infectious_disease_of_central_nervous_system_now)
:named REQ2_AUXILIARY3)) ;; "active opportunistic central nervous system infection"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_nervous_system_now@@is_another_disorder)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another neurological disorder with non-exhaustive examples (active opportunistic central nervous system infection)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psychotic disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychotic disorder."} ;; "psychotic disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_psychotic_disorder_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychotic disorder."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_psychoactive_substance_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of psychoactive substance dependence.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of psychoactive substance dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychoactive substance dependence.","meaning":"Boolean indicating whether the patient currently has psychoactive substance dependence."} ;; "substance dependence"
(declare-const patient_has_finding_of_psychoactive_substance_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of psychoactive substance abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of psychoactive substance abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychoactive substance abuse.","meaning":"Boolean indicating whether the patient currently has psychoactive substance abuse."} ;; "substance abuse"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_psychoactive_substance_dependence_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current substance dependence."

(assert
  (! (not patient_has_finding_of_psychoactive_substance_abuse_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current substance abuse."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_viral_hepatitis_c_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of viral hepatitis C.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of viral hepatitis C.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of viral hepatitis C.","meaning":"Boolean indicating whether the patient currently has a diagnosis of viral hepatitis C."} ;; "hepatitis C"
(declare-const patient_requires_interferon_therapy_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires interferon therapy at any time during the study period.","when_to_set_to_false":"Set to false if the patient does not require interferon therapy at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires interferon therapy during the study period.","meaning":"Boolean indicating whether the patient requires interferon therapy at any time during the study period."} ;; "requires interferon therapy during the study period"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (and patient_has_diagnosis_of_viral_hepatitis_c_now
               patient_requires_interferon_therapy_during_study_period))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hepatitis C) AND (the patient requires interferon therapy during the study period)."
