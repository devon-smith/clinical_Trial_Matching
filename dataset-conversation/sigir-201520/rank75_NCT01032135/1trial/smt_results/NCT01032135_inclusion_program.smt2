;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_cocaine_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cocaine dependence at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cocaine dependence at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cocaine dependence.","meaning":"Boolean indicating whether the patient has ever been diagnosed with cocaine dependence."} // "meet Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria for lifetime cocaine dependence"
(declare-const patient_has_diagnosis_of_alcohol_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with alcohol dependence at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with alcohol dependence at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with alcohol dependence.","meaning":"Boolean indicating whether the patient has ever been diagnosed with alcohol dependence."} // "meet Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria for lifetime alcohol dependence"
(declare-const patient_has_cocaine_use_in_prior_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used cocaine at least once in the prior 6 months.","when_to_set_to_false":"Set to false if the patient has not used cocaine at all in the prior 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used cocaine in the prior 6 months.","meaning":"Boolean indicating whether the patient has used cocaine at least once in the prior 6 months."} // "have cocaine use in the prior 6 months"
(declare-const patient_has_alcohol_use_in_prior_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used alcohol at least once in the prior 6 months.","when_to_set_to_false":"Set to false if the patient has not used alcohol at all in the prior 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used alcohol in the prior 6 months.","meaning":"Boolean indicating whether the patient has used alcohol at least once in the prior 6 months."} // "have alcohol use in the prior 6 months"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((meet DSM-IV criteria for lifetime cocaine dependence) OR ((meet DSM-IV criteria for lifetime alcohol dependence) AND ((have cocaine use in the prior 6 months) OR (have alcohol use in the prior 6 months))))
(assert
  (! (or
        patient_has_diagnosis_of_cocaine_dependence_inthehistory
        (and patient_has_diagnosis_of_alcohol_dependence_inthehistory
             (or patient_has_cocaine_use_in_prior_6_months
                 patient_has_alcohol_use_in_prior_6_months)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((meet Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria for lifetime cocaine dependence) OR ((meet Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria for lifetime alcohol dependence) AND ((have cocaine use in the prior 6 months) OR (have alcohol use in the prior 6 months))))"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age > 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_judged_clinically_appropriate_for_intensive_outpatient_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently judged clinically appropriate for intensive outpatient therapy.","when_to_set_to_false":"Set to false if the patient is currently judged not clinically appropriate for intensive outpatient therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently judged clinically appropriate for intensive outpatient therapy.","meaning":"Boolean indicating whether the patient is currently judged clinically appropriate for intensive outpatient therapy."} // "be judged clinically appropriate for intensive outpatient therapy"
(declare-const patient_has_diagnosis_of_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psychotic disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychotic disorder."} // "no current psychotic disorder"
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} // "no evidence of severe dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia and the dementia is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of dementia and the dementia is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dementia is severe.","meaning":"Boolean indicating whether the patient's current dementia diagnosis is severe."} // "no evidence of severe dementia"
(declare-const patient_has_acute_medical_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute medical problem.","when_to_set_to_false":"Set to false if the patient currently does not have an acute medical problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute medical problem.","meaning":"Boolean indicating whether the patient currently has an acute medical problem."} // "no acute medical problem requiring inpatient treatment"
(declare-const patient_has_acute_medical_problem_now@@requires_inpatient_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute medical problem requires inpatient treatment.","when_to_set_to_false":"Set to false if the patient's current acute medical problem does not require inpatient treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute medical problem requires inpatient treatment.","meaning":"Boolean indicating whether the patient's current acute medical problem requires inpatient treatment."} // "no acute medical problem requiring inpatient treatment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@is_severe
         patient_has_diagnosis_of_dementia_now)
     :named REQ2_AUXILIARY0)) ;; "no evidence of severe dementia"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_acute_medical_problem_now@@requires_inpatient_treatment
         patient_has_acute_medical_problem_now)
     :named REQ2_AUXILIARY1)) ;; "no acute medical problem requiring inpatient treatment"

;; Non-exhaustive examples: if none of the listed exclusionary conditions are present, then patient may be judged clinically appropriate for intensive outpatient therapy
(assert
  (! (=> (and (not patient_has_diagnosis_of_psychotic_disorder_now)
              (not patient_has_diagnosis_of_dementia_now@@is_severe)
              (not patient_has_acute_medical_problem_now@@requires_inpatient_treatment))
         patient_is_judged_clinically_appropriate_for_intensive_outpatient_therapy_now)
     :named REQ2_AUXILIARY2)) ;; "for example, no current psychotic disorder or no evidence of severe dementia, and no acute medical problem requiring inpatient treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_judged_clinically_appropriate_for_intensive_outpatient_therapy_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be judged clinically appropriate for intensive outpatient therapy"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_diamorphine_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to diamorphine (heroin) at any time during the past year.","when_to_set_to_false":"Set to false if the patient has not been exposed to diamorphine (heroin) at any time during the past year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to diamorphine (heroin) during the past year.","meaning":"Boolean indicating whether the patient has been exposed to diamorphine (heroin) during the past year."} // "regular intravenous heroin use during the past year"
(declare-const patient_is_exposed_to_diamorphine_inthepast1years@@intravenous_route Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to diamorphine (heroin) during the past year was via intravenous route.","when_to_set_to_false":"Set to false if the patient's exposure to diamorphine (heroin) during the past year was not via intravenous route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was via intravenous route.","meaning":"Boolean indicating whether the patient's exposure to diamorphine (heroin) during the past year was via intravenous route."} // "regular intravenous heroin use during the past year"
(declare-const patient_is_exposed_to_diamorphine_inthepast1years@@regular_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to diamorphine (heroin) during the past year was regular (habitual or repeated) use.","when_to_set_to_false":"Set to false if the patient's exposure to diamorphine (heroin) during the past year was not regular use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was regular use.","meaning":"Boolean indicating whether the patient's exposure to diamorphine (heroin) during the past year was regular use."} // "regular intravenous heroin use during the past year"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_is_exposed_to_diamorphine_inthepast1years@@intravenous_route
         patient_is_exposed_to_diamorphine_inthepast1years)
     :named REQ3_AUXILIARY0)) ;; "regular intravenous heroin use during the past year"

(assert
  (! (=> patient_is_exposed_to_diamorphine_inthepast1years@@regular_use
         patient_is_exposed_to_diamorphine_inthepast1years)
     :named REQ3_AUXILIARY1)) ;; "regular intravenous heroin use during the past year"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must NOT have regular intravenous heroin use during the past year
(assert
  (! (not (and patient_is_exposed_to_diamorphine_inthepast1years
               patient_is_exposed_to_diamorphine_inthepast1years@@intravenous_route
               patient_is_exposed_to_diamorphine_inthepast1years@@regular_use))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (regular intravenous heroin use during the past year)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_access_to_telephone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has access to a telephone.","when_to_set_to_false":"Set to false if the patient currently does not have access to a telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has access to a telephone.","meaning":"Boolean indicating whether the patient currently has access to a telephone."} // "have access to a telephone"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_access_to_telephone_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have access to a telephone"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_willing_to_be_randomized Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to be randomized as part of the study.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to be randomized as part of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to be randomized.","meaning":"Boolean indicating whether the patient is willing to be randomized as part of the study."} // "be willing to be randomized"
(declare-const patient_is_willing_to_participate_in_research Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to participate in research.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to participate in research.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to participate in research.","meaning":"Boolean indicating whether the patient is willing to participate in research."} // "be willing to participate in research"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_willing_to_be_randomized
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to be randomized"

(assert
  (! patient_is_willing_to_participate_in_research
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to participate in research"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_dopamine_receptor_agonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any dopamine receptor agonist substance.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any dopamine receptor agonist substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any dopamine receptor agonist substance.","meaning":"Boolean indicating whether the patient is currently exposed to any dopamine receptor agonist substance."} // "other forms of dopamine agonist treatment"
(declare-const patient_is_participating_in_methadone_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in methadone treatment.","when_to_set_to_false":"Set to false if the patient is currently not participating in methadone treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in methadone treatment.","meaning":"Boolean indicating whether the patient is currently participating in methadone treatment."} // "currently participate in methadone treatment"
(declare-const patient_is_participating_in_other_dopamine_agonist_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in other forms of dopamine agonist treatment, excluding intensive outpatient therapy.","when_to_set_to_false":"Set to false if the patient is currently not participating in other forms of dopamine agonist treatment, excluding intensive outpatient therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in other forms of dopamine agonist treatment, excluding intensive outpatient therapy.","meaning":"Boolean indicating whether the patient is currently participating in other forms of dopamine agonist treatment, excluding intensive outpatient therapy."} // "currently participate in other forms of dopamine agonist treatment (other than intensive outpatient therapy)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; To be included, the patient must (NOT currently participate in methadone treatment) OR (NOT currently participate in other forms of dopamine agonist treatment (other than intensive outpatient therapy)).
(assert
  (! (or (not patient_is_participating_in_methadone_treatment_now)
         (not patient_is_participating_in_other_dopamine_agonist_treatment_now))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_metropolitan_area_resident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a resident of a metropolitan area.","when_to_set_to_false":"Set to false if the patient is currently not a resident of a metropolitan area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a resident of a metropolitan area.","meaning":"Boolean indicating whether the patient is currently a resident of a metropolitan area."} // "be a metropolitan area resident"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_is_metropolitan_area_resident_now
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (be a metropolitan area resident)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_can_provide_contact_count_value_recorded_now_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the number of contacts the patient can provide now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many contacts the patient can provide now.","meaning":"Numeric value indicating the number of contacts the patient can provide now."} // "the number of contacts the patient can provide at the current time"
(declare-const patient_can_provide_contact_count_value_recorded_now_withunit_integer@@each_contact_has_name_and_verified_telephone_number_and_address Bool) ;; {"when_to_set_to_true":"Set to true if each contact provided by the patient has a name, a verified telephone number, and an address.","when_to_set_to_false":"Set to false if any contact provided by the patient does not have all three: name, verified telephone number, and address.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether each contact has a name, verified telephone number, and address.","meaning":"Boolean indicating whether each contact provided by the patient has a name, a verified telephone number, and an address."} // "the name AND verified telephone number AND address"
(declare-const patient_can_provide_contact_count_value_recorded_now_withunit_integer@@contact_can_provide_locator_information_on_patient_during_follow_up Bool) ;; {"when_to_set_to_true":"Set to true if each contact provided by the patient is able to provide locator information on the patient during follow-up.","when_to_set_to_false":"Set to false if any contact provided by the patient is not able to provide locator information on the patient during follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether each contact can provide locator information on the patient during follow-up.","meaning":"Boolean indicating whether each contact provided by the patient can provide locator information on the patient during follow-up."} // "contacts who can provide locator information on the patient during follow-up"

;; ===================== Constraint Assertions (REQ 8) =====================
;; The patient must be able to provide the name AND verified telephone number AND address of at least two contacts who can provide locator information on the patient during follow-up.
(assert
  (! (and (>= patient_can_provide_contact_count_value_recorded_now_withunit_integer 2)
          patient_can_provide_contact_count_value_recorded_now_withunit_integer@@each_contact_has_name_and_verified_telephone_number_and_address
          patient_can_provide_contact_count_value_recorded_now_withunit_integer@@contact_can_provide_locator_information_on_patient_during_follow_up)
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; --- verifier-bypassed (attempt 8/8) 2025-10-26T02:30:44.201069 policy=eventual
;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_psychoactive_substance_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with psychoactive substance dependence (other than cocaine) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with psychoactive substance dependence (other than cocaine) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with psychoactive substance dependence (other than cocaine).","meaning":"Boolean indicating whether the patient has ever been diagnosed with psychoactive substance dependence (other than cocaine) at any time in their history."} // "dependence on other substances"

;; ===================== Constraint Assertions (REQ 9) =====================
;; To be included, the patient may have dependence on other substances, provided that the patient has cocaine dependence and meets other inclusion criteria.
(assert
  (! (=> patient_has_diagnosis_of_psychoactive_substance_dependence_inthehistory
         patient_has_diagnosis_of_cocaine_dependence_inthehistory)
     :named REQ9_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "provided that (the patient has cocaine dependence)"
