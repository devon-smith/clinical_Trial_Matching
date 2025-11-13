;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} // "must have a diagnosis of dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@diagnosed_according_to_dsm_iv_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of dementia was made according to DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's current diagnosis of dementia was not made according to DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of dementia was made according to DSM-IV criteria.","meaning":"Boolean indicating whether the patient's current diagnosis of dementia was made according to DSM-IV criteria."} // "according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@diagnosed_according_to_dsm_iv_criteria
         patient_has_diagnosis_of_dementia_now)
     :named REQ0_AUXILIARY0)) ;; "diagnosis of dementia according to DSM-IV criteria" implies "diagnosis of dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_dementia_now@@diagnosed_according_to_dsm_iv_criteria
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have a diagnosis of dementia according to DSM-IV criteria"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_home_living_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in a home setting.","when_to_set_to_false":"Set to false if the patient is currently not living in a home setting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in a home setting.","meaning":"Boolean indicating whether the patient is currently living in a home setting."} // "home"
(declare-const patient_has_finding_of_apartment_building_living_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in an apartment building setting.","when_to_set_to_false":"Set to false if the patient is currently not living in an apartment building setting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in an apartment building setting.","meaning":"Boolean indicating whether the patient is currently living in an apartment building setting."} // "apartment"
(declare-const patient_has_finding_of_collective_housing_living_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in a collective housing setting.","when_to_set_to_false":"Set to false if the patient is currently not living in a collective housing setting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in a collective housing setting.","meaning":"Boolean indicating whether the patient is currently living in a collective housing setting."} // "collective housing"
(declare-const patient_has_finding_of_collective_housing_living_now@@nursing_care_available_less_than_40_hours_per_week Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in a collective housing setting and nursing care is available for less than forty hours per week.","when_to_set_to_false":"Set to false if the patient is currently living in a collective housing setting and nursing care is available for forty hours per week or more.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether nursing care is available for less than forty hours per week in the collective housing setting.","meaning":"Boolean indicating whether the patient is currently living in a collective housing setting, and nursing care is available for less than forty hours per week."} // "collective housing with nursing care available for less than forty hours per week"
(declare-const nursing_care_available_hours_per_week_in_collective_housing_value_recorded_now_withunit_hours_per_week Real) ;; {"when_to_set_to_value":"Set to the number of hours per week that nursing care is available in the collective housing setting, as recorded at present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours per week nursing care is available in the collective housing setting.","meaning":"Numeric value indicating the number of hours per week that nursing care is available in the collective housing setting, recorded at present, in units of hours per week."} // "nursing care available for less than forty hours per week"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: The qualifier variable is true iff the patient is living in collective housing AND nursing care is available for less than 40 hours per week
(assert
  (! (= patient_has_finding_of_collective_housing_living_now@@nursing_care_available_less_than_40_hours_per_week
        (and patient_has_finding_of_collective_housing_living_now
             (< nursing_care_available_hours_per_week_in_collective_housing_value_recorded_now_withunit_hours_per_week 40.0)))
     :named REQ1_AUXILIARY0)) ;; "collective housing with nursing care available for less than forty hours per week"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_collective_housing_living_now@@nursing_care_available_less_than_40_hours_per_week
         patient_has_finding_of_collective_housing_living_now)
     :named REQ1_AUXILIARY1)) ;; "collective housing with nursing care available for less than forty hours per week" implies "collective housing"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be living in a community setting (home OR apartment OR collective housing with nursing care available for less than forty hours per week).
(assert
  (! (or patient_has_finding_of_home_living_now
         patient_has_finding_of_apartment_building_living_now
         patient_has_finding_of_collective_housing_living_now@@nursing_care_available_less_than_40_hours_per_week)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "living in a community setting (home OR apartment OR collective housing with nursing care available for less than forty hours per week)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has personally provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not personally provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has personally provided written informed consent.","meaning":"Boolean indicating whether the patient has personally provided written informed consent."} // "be able to provide written informed consent"
(declare-const written_informed_consent_provided_by_legal_guardian_or_proxy Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been provided by a legal guardian or a legal proxy on behalf of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been provided by a legal guardian or a legal proxy on behalf of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been provided by a legal guardian or a legal proxy on behalf of the patient.","meaning":"Boolean indicating whether written informed consent has been provided by a legal guardian or a legal proxy on behalf of the patient."} // "written informed consent provided by a legal guardian OR a legal proxy"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must (be able to provide written informed consent) OR (have written informed consent provided by a legal guardian OR a legal proxy).
(assert
  (! (or patient_has_provided_written_informed_consent
         written_informed_consent_provided_by_legal_guardian_or_proxy)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_caregiver Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a caregiver.","when_to_set_to_false":"Set to false if the patient does not have a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a caregiver.","meaning":"Boolean indicating whether the patient has a caregiver."} // "must have a caregiver"
(declare-const patient_has_caregiver@@caregiver_is_available Bool) ;; {"when_to_set_to_true":"Set to true if the patient's caregiver is available.","when_to_set_to_false":"Set to false if the patient's caregiver is not available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's caregiver is available.","meaning":"Boolean indicating whether the patient's caregiver is available."} // "caregiver who is available"
(declare-const patient_has_caregiver@@caregiver_is_willing_to_provide_consent_for_required_components_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's caregiver is willing to provide consent for required components of the study.","when_to_set_to_false":"Set to false if the patient's caregiver is not willing to provide consent for required components of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's caregiver is willing to provide consent for required components of the study.","meaning":"Boolean indicating whether the patient's caregiver is willing to provide consent for required components of the study."} // "caregiver who is willing to provide consent for required components of the study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_caregiver@@caregiver_is_available
         patient_has_caregiver)
     :named REQ3_AUXILIARY0)) ;; "caregiver who is available"

(assert
  (! (=> patient_has_caregiver@@caregiver_is_willing_to_provide_consent_for_required_components_of_study
         patient_has_caregiver)
     :named REQ3_AUXILIARY1)) ;; "caregiver who is willing to provide consent for required components of the study"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must have a caregiver who is available AND willing to provide consent
(assert
  (! (and patient_has_caregiver
          patient_has_caregiver@@caregiver_is_available
          patient_has_caregiver@@caregiver_is_willing_to_provide_consent_for_required_components_of_study)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a caregiver (who is available AND who is willing to provide consent for required components of the study)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_fluent_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently fluent in English.","when_to_set_to_false":"Set to false if the patient is currently not fluent in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently fluent in English.","meaning":"Boolean indicating whether the patient is currently fluent in English."} // "must be fluent in English"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_fluent_in_english_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must be fluent in English"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_participating_in_phase_four_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a Phase Four study.","when_to_set_to_false":"Set to false if the patient is not currently participating in a Phase Four study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a Phase Four study.","meaning":"Boolean indicating whether the patient is currently participating in a Phase Four study."} // "may be participating in a Phase Four study"
(declare-const patient_is_participating_in_post_marketing_follow_up_study_of_approved_product_for_treatment_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a post-marketing follow-up study of an approved product for treatment of dementia.","when_to_set_to_false":"Set to false if the patient is not currently participating in a post-marketing follow-up study of an approved product for treatment of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a post-marketing follow-up study of an approved product for treatment of dementia.","meaning":"Boolean indicating whether the patient is currently participating in a post-marketing follow-up study of an approved product for treatment of dementia."} // "may be participating in another post-marketing follow-up study of an approved product for treatment of dementia"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient may be participating in a Phase Four study OR may be participating in another post-marketing follow-up study of an approved product for treatment of dementia.
(assert
  (! (or patient_is_participating_in_phase_four_study_now
         patient_is_participating_in_post_marketing_follow_up_study_of_approved_product_for_treatment_of_dementia_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS))
