;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_english_speaking Bool) ;; {"when_to_set_to_true":"Set to true if the patient is an English-speaking patient.","when_to_set_to_false":"Set to false if the patient is not an English-speaking patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an English-speaking patient.","meaning":"Boolean indicating whether the patient is an English-speaking patient."} // "To be included, the patient must be an English-speaking patient."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_english_speaking
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an English-speaking patient."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_family_member_with_dementia_residing_in_long_term_care_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a family member who currently has dementia and resides in a long term care facility.","when_to_set_to_false":"Set to false if the patient does not have a family member who currently has dementia and resides in a long term care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a family member who currently has dementia and resides in a long term care facility.","meaning":"Boolean indicating whether the patient has a family member who currently has dementia and resides in a long term care facility."} // "have a family member with dementia who resides in a long term care facility"
(declare-const patient_has_friend_with_dementia_residing_in_long_term_care_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a friend who currently has dementia and resides in a long term care facility.","when_to_set_to_false":"Set to false if the patient does not have a friend who currently has dementia and resides in a long term care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a friend who currently has dementia and resides in a long term care facility.","meaning":"Boolean indicating whether the patient has a friend who currently has dementia and resides in a long term care facility."} // "have a friend with dementia who resides in a long term care facility"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_has_family_member_with_dementia_residing_in_long_term_care_facility_now
         patient_has_friend_with_dementia_residing_in_long_term_care_facility_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have a family member with dementia who resides in a long term care facility) OR (have a friend with dementia who resides in a long term care facility))."
