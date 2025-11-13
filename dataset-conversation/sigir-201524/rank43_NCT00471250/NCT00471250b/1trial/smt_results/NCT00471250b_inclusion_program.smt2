;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "18 to 75 years of age inclusive"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be at least 18 years of age
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be at least 18 years of age."

;; Component 1: patient must be no more than 75 years of age
(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be no more than 75 years of age."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have a respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has a respiratory tract infection."} ;; "known respiratory infection"
(declare-const patient_has_suspicion_of_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have a respiratory tract infection.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have a respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have a respiratory tract infection.","meaning":"Boolean indicating whether the patient is currently suspected to have a respiratory tract infection."} ;; "suspected respiratory infection"
(declare-const patients_susceptibility_to_infections_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive status for susceptibility to infections.","when_to_set_to_false":"Set to false if the patient currently does not have a positive status for susceptibility to infections.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive status for susceptibility to infections.","meaning":"Boolean indicating whether the patient currently has a positive status for susceptibility to infections."} ;; "known infection susceptibility"
(declare-const patients_susceptibility_to_infections_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal status for susceptibility to infections (i.e., suspected susceptibility).","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal status for susceptibility to infections.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal status for susceptibility to infections.","meaning":"Boolean indicating whether the patient currently has an abnormal status for susceptibility to infections (i.e., suspected susceptibility)."} ;; "suspected infection susceptibility"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have known respiratory infection or suspected respiratory infection or known infection susceptibility or suspected infection susceptibility.
(assert
  (! (or patient_has_finding_of_respiratory_tract_infection_now
         patient_has_suspicion_of_respiratory_tract_infection_now
         patients_susceptibility_to_infections_is_positive_now
         patients_susceptibility_to_infections_is_abnormal_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have known respiratory infection or suspected respiratory infection or known infection susceptibility or suspected infection susceptibility."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_enrollment_is_independent_of_gender_race_ethnicity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's enrollment is not restricted or influenced by gender, race, or ethnicity.","when_to_set_to_false":"Set to false if the patient's enrollment is restricted or influenced by gender, race, or ethnicity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's enrollment is independent of gender, race, or ethnicity.","meaning":"Boolean indicating whether the patient's enrollment is independent of gender, race, or ethnicity."} ;; "the patient may be enrolled without regard to gender, race, or ethnicity."

;; ===================== Constraint Assertions (REQ 2) =====================
;; The requirement states that enrollment is independent of gender, race, or ethnicity (i.e., always satisfiable)
(assert
  (! patient_enrollment_is_independent_of_gender_race_ethnicity
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient may be enrolled without regard to gender, race, or ethnicity."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_enrolled_in_concurrent_national_institutes_of_health_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in a National Institutes of Health protocol that is concurrent with the study.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in a National Institutes of Health protocol that is concurrent with the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in a concurrent National Institutes of Health protocol.","meaning":"Boolean indicating whether the patient is currently enrolled in a National Institutes of Health protocol that is concurrent with the study."} ;; "the patient must be enrolled in a concurrent National Institutes of Health protocol"
(declare-const patient_is_under_care_of_primary_physician_outside_national_institutes_of_health_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently under the care of a primary physician who is outside of the National Institutes of Health.","when_to_set_to_false":"Set to false if the patient is not currently under the care of a primary physician outside of the National Institutes of Health.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently under the care of a primary physician outside of the National Institutes of Health.","meaning":"Boolean indicating whether the patient is currently under the care of a primary physician who is outside of the National Institutes of Health."} ;; "the patient must be under the care of a primary physician outside of the National Institutes of Health"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_enrolled_in_concurrent_national_institutes_of_health_protocol_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be enrolled in a concurrent National Institutes of Health protocol"

(assert
  (! patient_is_under_care_of_primary_physician_outside_national_institutes_of_health_now
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be under the care of a primary physician outside of the National Institutes of Health"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_able_to_complete_informed_consent_process_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete the informed consent process.","when_to_set_to_false":"Set to false if the patient is currently unable to complete the informed consent process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to complete the informed consent process.","meaning":"Boolean indicating whether the patient is currently able to complete the informed consent process."} ;; "the patient must be able to complete the informed consent process."
(declare-const patient_is_willing_to_complete_informed_consent_process_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to complete the informed consent process.","when_to_set_to_false":"Set to false if the patient is currently unwilling to complete the informed consent process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to complete the informed consent process.","meaning":"Boolean indicating whether the patient is currently willing to complete the informed consent process."} ;; "the patient must be willing to complete the informed consent process."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_able_to_complete_informed_consent_process_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to complete the informed consent process."

(assert
  (! patient_is_willing_to_complete_informed_consent_process_now
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to complete the informed consent process."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_able_to_arrange_for_another_person_to_drive_home_after_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to arrange for another person to drive the patient home after the procedure.","when_to_set_to_false":"Set to false if the patient is not able to arrange for another person to drive the patient home after the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to arrange for another person to drive the patient home after the procedure.","meaning":"Boolean indicating whether the patient is able to arrange for another person to drive the patient home after the procedure."} ;; "the patient must be able to arrange to have another person drive the patient home after the procedure."
(declare-const patient_is_willing_to_arrange_for_another_person_to_drive_home_after_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to arrange for another person to drive the patient home after the procedure.","when_to_set_to_false":"Set to false if the patient is not willing to arrange for another person to drive the patient home after the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to arrange for another person to drive the patient home after the procedure.","meaning":"Boolean indicating whether the patient is willing to arrange for another person to drive the patient home after the procedure."} ;; "the patient must be willing to arrange to have another person drive the patient home after the procedure."
(declare-const patient_is_undergoing_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing the procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing the procedure.","meaning":"Boolean indicating whether the patient is currently undergoing the procedure."} ;; "the procedure"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_able_to_arrange_for_another_person_to_drive_home_after_procedure
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to arrange to have another person drive the patient home after the procedure."

(assert
  (! patient_is_willing_to_arrange_for_another_person_to_drive_home_after_procedure
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to arrange to have another person drive the patient home after the procedure."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_can_undergo_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able and willing to undergo the procedure in the future.","when_to_set_to_false":"Set to false if the patient is unable or unwilling to undergo the procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able and willing to undergo the procedure in the future.","meaning":"Boolean indicating whether the patient is able and willing to undergo the procedure in the future."} ;; "the procedure"
(declare-const patient_fasting_duration_after_procedure_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient is able and willing to abstain from eating or drinking after the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient is able and willing to abstain from eating or drinking after the procedure.","meaning":"Numeric value indicating the number of hours the patient is able and willing to abstain from eating or drinking after the procedure."} ;; "2 hours after the procedure"
(declare-const patient_fasting_duration_prior_to_procedure_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient is able and willing to abstain from eating or drinking prior to the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours the patient is able and willing to abstain from eating or drinking prior to the procedure.","meaning":"Numeric value indicating the number of hours the patient is able and willing to abstain from eating or drinking prior to the procedure."} ;; "6 hours prior to the procedure"
(declare-const patient_is_able_and_willing_to_fast_for_6_hours_prior_and_2_hours_after_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient is both able and willing to abstain from eating or drinking anything for 6 hours prior to and 2 hours after the procedure.","when_to_set_to_false":"Set to false if the patient is unable or unwilling to abstain from eating or drinking anything for 6 hours prior to and 2 hours after the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able and willing to abstain from eating or drinking anything for 6 hours prior to and 2 hours after the procedure.","meaning":"Boolean indicating whether the patient is both able and willing to abstain from eating or drinking anything for 6 hours prior to and 2 hours after the procedure."} ;; "able and willing not to eat or drink anything for 6 hours prior and 2 hours after the procedure"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: patient is able and willing to fast for 6 hours prior and 2 hours after the procedure if and only if both fasting durations are met
(assert
  (! (= patient_is_able_and_willing_to_fast_for_6_hours_prior_and_2_hours_after_procedure
        (and (>= patient_fasting_duration_prior_to_procedure_in_hours 6.0)
             (>= patient_fasting_duration_after_procedure_in_hours 2.0)))
     :named REQ6_AUXILIARY0)) ;; "able and willing not to eat or drink anything for 6 hours prior and 2 hours after the procedure"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Patient must be able not to eat or drink anything for 6 hours prior and 2 hours after the procedure
(assert
  (! patient_is_able_and_willing_to_fast_for_6_hours_prior_and_2_hours_after_procedure
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "able not to eat or drink anything for 6 hours prior and 2 hours after the procedure"

;; Component 1: Patient must be willing not to eat or drink anything for 6 hours prior and 2 hours after the procedure
(assert
  (! patient_is_able_and_willing_to_fast_for_6_hours_prior_and_2_hours_after_procedure
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "willing not to eat or drink anything for 6 hours prior and 2 hours after the procedure"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_can_undergo_collection_of_blood_specimen_for_laboratory_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able and willing to undergo collection of a blood specimen for laboratory purposes.","when_to_set_to_false":"Set to false if the patient is currently unable or unwilling to undergo collection of a blood specimen for laboratory purposes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able and willing to undergo collection of a blood specimen for laboratory purposes.","meaning":"Boolean indicating whether the patient is currently able and willing to undergo collection of a blood specimen for laboratory purposes."} ;; "the patient must be willing to donate blood sample for storage to be used for future research."
(declare-const patient_is_willing_to_donate_respiratory_tract_sample_for_storage_for_future_research Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to donate a respiratory tract sample for storage to be used for future research.","when_to_set_to_false":"Set to false if the patient is not willing to donate a respiratory tract sample for storage to be used for future research.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to donate a respiratory tract sample for storage to be used for future research.","meaning":"Boolean indicating whether the patient is willing to donate a respiratory tract sample specifically for storage to be used for future research."} ;; "the patient must be willing to donate respiratory tract sample for storage to be used for future research."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_can_undergo_collection_of_blood_specimen_for_laboratory_now
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to donate blood sample for storage to be used for future research."

(assert
  (! patient_is_willing_to_donate_respiratory_tract_sample_for_storage_for_future_research
     :named REQ7_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to donate respiratory tract sample for storage to be used for future research."
