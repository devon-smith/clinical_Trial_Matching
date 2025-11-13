;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute coronary syndrome."} // "acute coronary syndrome event"
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with ischemic heart disease.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently has a diagnosis of ischemic heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic heart disease."} // "ischemic heart disease event"
(declare-const patient_has_undergone_heart_revascularization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a heart revascularization procedure during the current admission.","when_to_set_to_false":"Set to false if the patient has not undergone a heart revascularization procedure during the current admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a heart revascularization procedure during the current admission.","meaning":"Boolean indicating whether the patient has undergone a heart revascularization procedure during the current admission."} // "revascularization procedure"
(declare-const patient_is_at_low_risk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as being at low risk.","when_to_set_to_false":"Set to false if the patient is currently not classified as being at low risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as being at low risk.","meaning":"Boolean indicating whether the patient is currently classified as being at low risk."} // "at low risk"
(declare-const patient_is_at_moderate_risk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as being at moderate risk.","when_to_set_to_false":"Set to false if the patient is currently not classified as being at moderate risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as being at moderate risk.","meaning":"Boolean indicating whether the patient is currently classified as being at moderate risk."} // "at moderate risk"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; None required for this requirement, as all relationships are direct.

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be admitted for an ischemic heart disease event (acute coronary syndrome event OR revascularization procedure)
(assert
  (! (or patient_has_diagnosis_of_acute_coronary_syndrome_now
         patient_has_undergone_heart_revascularization_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "admitted for an ischemic heart disease event (acute coronary syndrome event OR revascularization procedure)"

;; Component 1: Patient must be at (low risk OR moderate risk)
(assert
  (! (or patient_is_at_low_risk_now
         patient_is_at_moderate_risk_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at low risk OR at moderate risk"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_regular_internet_access_in_home_environment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has regular Internet access in the home environment.","when_to_set_to_false":"Set to false if the patient does not have regular Internet access in the home environment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has regular Internet access in the home environment.","meaning":"Boolean indicating whether the patient has regular Internet access in the home environment."} // "regular Internet access in the home environment"
(declare-const patient_has_regular_internet_access_in_work_environment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has regular Internet access in the work environment.","when_to_set_to_false":"Set to false if the patient does not have regular Internet access in the work environment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has regular Internet access in the work environment.","meaning":"Boolean indicating whether the patient has regular Internet access in the work environment."} // "regular Internet access in the work environment"
(declare-const patient_has_regular_internet_access_in_other_environment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has regular Internet access in another environment (not home or work).","when_to_set_to_false":"Set to false if the patient does not have regular Internet access in another environment (not home or work).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has regular Internet access in another environment (not home or work).","meaning":"Boolean indicating whether the patient has regular Internet access in another environment (not home or work)."} // "regular Internet access in another environment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have regular Internet access in the home environment OR in the work environment OR in another environment.
(assert
  (! (or patient_has_regular_internet_access_in_home_environment
         patient_has_regular_internet_access_in_work_environment
         patient_has_regular_internet_access_in_other_environment)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have regular Internet access (in the home environment OR in the work environment OR in another environment)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged > 18 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged > 18 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_permission_of_attending_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient has explicit permission from the attending physician.","when_to_set_to_false":"Set to false if the patient does not have permission from the attending physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has permission from the attending physician.","meaning":"Boolean indicating whether the patient has permission of the attending physician."} // "the patient must have permission of the attending physician"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_permission_of_attending_physician
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have permission of the attending physician"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_read_english_without_difficulty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read English without difficulty.","when_to_set_to_false":"Set to false if the patient is currently unable to read English without difficulty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read English without difficulty.","meaning":"Boolean indicating whether the patient is currently able to read English without difficulty."} // "must be able to read English without difficulty"
(declare-const patient_can_write_english_without_difficulty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to write English without difficulty.","when_to_set_to_false":"Set to false if the patient is currently unable to write English without difficulty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to write English without difficulty.","meaning":"Boolean indicating whether the patient is currently able to write English without difficulty."} // "must be able to write English without difficulty"
(declare-const patient_can_understand_english_without_difficulty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to understand English without difficulty.","when_to_set_to_false":"Set to false if the patient is currently unable to understand English without difficulty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand English without difficulty.","meaning":"Boolean indicating whether the patient is currently able to understand English without difficulty."} // "must be able to understand English without difficulty"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_can_read_english_without_difficulty_now
          patient_can_write_english_without_difficulty_now
          patient_can_understand_english_without_difficulty_now)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must be able to (read English AND write English AND understand English) without difficulty"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_physical_limitation_to_regular_activity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any physical limitation that restricts regular activity.","when_to_set_to_false":"Set to false if the patient currently has no physical limitation that restricts regular activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any physical limitation that restricts regular activity.","meaning":"Boolean indicating whether the patient currently has any physical limitation that restricts regular activity."} // "the patient must have no physical limitations to regular activity"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_physical_limitation_to_regular_activity_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have no physical limitations to regular activity"
