;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value": "Set to the patient's current age in years as recorded.", "when_to_set_to_null": "Set to null if the patient's age is unknown or not recorded.", "meaning": "Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_registered_with_participating_general_practice_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is registered with a general practice that is participating in the study at any time during the study period.","when_to_set_to_false":"Set to false if the patient is not registered with a general practice that is participating in the study at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is registered with a participating general practice during the study period.","meaning":"Boolean indicating whether the patient is registered with a general practice that is participating in the study during the study period."} // "the patient must be registered with a participating general practice during the study period"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_registered_with_participating_general_practice_during_study_period
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be registered with a participating general practice during the study period"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const medical_records_duration_prior_to_study_entry_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years of medical records available for the patient prior to study entry.","when_to_set_to_null":"Set to null if the duration of medical records prior to study entry is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of years of medical records available for the patient prior to study entry."} // "a minimum of one year of medical records prior to study entry"
(declare-const medical_records_duration_prior_to_study_entry_in_years@@meets_cprd_data_quality_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's medical records prior to study entry meet CPRD data quality criteria.","when_to_set_to_false":"Set to false if the patient's medical records prior to study entry do not meet CPRD data quality criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's medical records prior to study entry meet CPRD data quality criteria.","meaning":"Boolean indicating whether the patient's medical records prior to study entry meet CPRD data quality criteria."} // "meeting Clinical Practice Research Datalink data quality criteria"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and (>= medical_records_duration_prior_to_study_entry_in_years 1.0)
          medical_records_duration_prior_to_study_entry_in_years@@meets_cprd_data_quality_criteria)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a minimum of one year of medical records prior to study entry meeting Clinical Practice Research Datalink data quality criteria"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_followed_on_or_after_1997_01_01 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been followed on or after 1 January 1997.","when_to_set_to_false":"Set to false if the patient has not been followed on or after 1 January 1997.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been followed on or after 1 January 1997.","meaning":"Boolean indicating whether the patient has been followed on or after 1 January 1997."} // "the patient must be followed on or after 1 January 1997"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_followed_on_or_after_1997_01_01
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be followed on or after 1 January 1997."
