;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_been_sampled_from_medicare_eligibility_lists_in_relevant_area Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been sampled from Medicare eligibility lists in the relevant area.","when_to_set_to_false":"Set to false if the patient has not been sampled from Medicare eligibility lists in the relevant area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been sampled from Medicare eligibility lists in the relevant area.","meaning":"Boolean indicating whether the patient has been sampled from Medicare eligibility lists in the relevant area."} // "To be included, the patient must have been sampled from Medicare eligibility lists in the relevant area."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_been_sampled_from_medicare_eligibility_lists_in_relevant_area
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been sampled from Medicare eligibility lists in the relevant area."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_lived_in_household_of_individual_sampled_from_health_care_financing_administration_sampling_frame_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever lived in the household of an individual sampled from the Health Care Financing Administration sampling frame.","when_to_set_to_false":"Set to false if the patient has never lived in the household of an individual sampled from the Health Care Financing Administration sampling frame.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever lived in the household of an individual sampled from the Health Care Financing Administration sampling frame.","meaning":"Boolean indicating whether the patient has ever lived in the household of an individual sampled from the Health Care Financing Administration sampling frame."} // "must have lived in the household of an individual sampled from Health Care Financing Administration sampling frame"
(declare-const patient_age_value_recorded_at_time_of_examination_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time of examination if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at the time of examination is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time of examination."} // "must have been aged ≥ 65 years at the time of examination"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must have lived in the household of an individual sampled from Health Care Financing Administration sampling frame
(assert
  (! patient_has_lived_in_household_of_individual_sampled_from_health_care_financing_administration_sampling_frame_ever
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have lived in the household of an individual sampled from Health Care Financing Administration sampling frame."

;; Component 1: Patient must have been aged ≥ 65 years at the time of examination
(assert
  (! (>= patient_age_value_recorded_at_time_of_examination_in_years 65)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been aged ≥ 65 years at the time of examination."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_noninstitutionalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently noninstitutionalized (not residing in any institution).","when_to_set_to_false":"Set to false if the patient is currently institutionalized (residing in an institution such as a hospital, nursing home, or other long-term care facility).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently noninstitutionalized.","meaning":"Boolean indicating whether the patient is currently noninstitutionalized."} // "To be included, the patient must have been noninstitutionalized."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_noninstitutionalized_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been noninstitutionalized."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_expected_to_remain_in_area_for_next_3_years Bool) ;; {"when_to_set_to_true":"Set to true if it is documented or reasonably determined that the patient is expected to remain in the area for the next three years.","when_to_set_to_false":"Set to false if it is documented or reasonably determined that the patient is not expected to remain in the area for the next three years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to remain in the area for the next three years.","meaning":"Boolean indicating whether the patient is expected to remain in the area for the next three years."} // "To be included, the patient must have been expected to remain in the area for the next three years."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_expected_to_remain_in_area_for_next_3_years
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been expected to remain in the area for the next three years."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_able_to_give_informed_consent_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient was able to give informed consent at baseline.","when_to_set_to_false":"Set to false if the patient was not able to give informed consent at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was able to give informed consent at baseline.","meaning":"Boolean indicating whether the patient was able to give informed consent at baseline."} // "To be included, the patient must have been able to give informed consent."
(declare-const proxy_respondent_required_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if a proxy respondent was required for the patient at baseline.","when_to_set_to_false":"Set to false if a proxy respondent was not required for the patient at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a proxy respondent was required for the patient at baseline.","meaning":"Boolean indicating whether a proxy respondent was required for the patient at baseline."} // "To be included, the patient must not have required a proxy respondent at baseline."

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Patient must have been able to give informed consent at baseline
(assert
  (! patient_is_able_to_give_informed_consent_at_baseline
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have been able to give informed consent."

;; Component 1: Patient must NOT have required a proxy respondent at baseline
(assert
  (! (not proxy_respondent_required_at_baseline)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must not have required a proxy respondent at baseline."
