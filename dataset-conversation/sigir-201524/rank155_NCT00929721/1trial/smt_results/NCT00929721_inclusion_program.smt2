;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "To be included, the patient must be 50 years of age or older."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 50)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be 50 years of age or older."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_resides_in_surveillance_area_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides within the surveillance area.","when_to_set_to_false":"Set to false if the patient currently does not reside within the surveillance area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides within the surveillance area.","meaning":"Boolean indicating whether the patient currently resides within the surveillance area."} ;; "To be included, the patient must reside in the surveillance area."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_resides_in_surveillance_area_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must reside in the surveillance area."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_presented_to_study_healthcare_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has presented to a study healthcare facility at the current time.","when_to_set_to_false":"Set to false if the patient has not presented to a study healthcare facility at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has presented to a study healthcare facility at the current time.","meaning":"Boolean indicating whether the patient has presented to a study healthcare facility at the current time."} ;; "To be included, the patient must present to a study healthcare facility."
(declare-const patient_has_suspicion_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently clinically suspected to have community-acquired pneumonia by the treating physician.","when_to_set_to_false":"Set to false if the patient is currently not clinically suspected to have community-acquired pneumonia by the treating physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently clinically suspected to have community-acquired pneumonia.","meaning":"Boolean indicating whether the patient is currently clinically suspected to have community-acquired pneumonia."} ;; "To be included, the treating physician must clinically suspect community-acquired pneumonia in the patient."

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must present to a study healthcare facility
(assert
  (! patient_has_presented_to_study_healthcare_facility_now
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must present to a study healthcare facility."

;; Component 1: Treating physician must clinically suspect community-acquired pneumonia
(assert
  (! patient_has_suspicion_of_community_acquired_pneumonia_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the treating physician must clinically suspect community-acquired pneumonia in the patient."
