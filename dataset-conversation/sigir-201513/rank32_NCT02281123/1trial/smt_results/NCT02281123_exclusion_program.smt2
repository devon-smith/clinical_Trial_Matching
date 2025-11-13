;; --- verifier-bypassed (attempt 8/8) 2025-10-24T10:30:46.876914 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_inthehistory_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time when symptoms first appeared, if this information is known and documented.","when_to_set_to_null":"Set to null if the patient's age at onset of symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time of onset of symptoms."} ;; "age at onset of symptoms < 45 years"
(declare-const patient_time_of_symptom_onset_value_recorded_inthehistory_withunit_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time symptoms first appeared, if this information is available in the patient's history.","when_to_set_to_null":"Set to null if the patient's age at symptom onset is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's age in years at the onset of symptoms, recorded in the patient's history."} ;; "onset of symptoms"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (< patient_age_value_recorded_inthehistory_in_years 45))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has age at onset of symptoms < 45 years."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chikungunya_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms suggestive of chikungunya.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms suggestive of chikungunya.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms suggestive of chikungunya.","meaning":"Boolean indicating whether the patient currently has symptoms suggestive of chikungunya."} ;; "symptoms suggestive of chikungunya"
(declare-const patient_time_symptom_lasts_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days if the duration of symptoms suggestive of chikungunya is recorded for the patient as of now.","when_to_set_to_null":"Set to null if the duration of symptoms is not recorded, unknown, or indeterminate as of now.","meaning":"Numeric value representing the number of days the patient's symptoms have lasted as of now."} ;; "duration of symptoms suggestive of chikungunya > 10 days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_has_finding_of_chikungunya_fever_now
               (> patient_time_symptom_lasts_value_recorded_now_withunit_days 10)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has duration of symptoms suggestive of chikungunya > 10 days."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_joint_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has joint pain (on the day of inclusion).","when_to_set_to_false":"Set to false if the patient currently does not have joint pain (on the day of inclusion).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has joint pain (on the day of inclusion).","meaning":"Boolean indicating whether the patient currently has joint pain."} ;; "joint pain on the day of inclusion"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_joint_pain_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT have joint pain on the day of inclusion."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_arthritis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with arthritis (specifically inflammatory arthritis) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with arthritis (specifically inflammatory arthritis) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with arthritis (specifically inflammatory arthritis).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of arthritis (specifically inflammatory arthritis) in their medical history."} ;; "the patient has a history of inflammatory arthritis"

(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever used or been exposed to nonsteroidal anti-inflammatory agents (NSAIDs) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never used or been exposed to nonsteroidal anti-inflammatory agents (NSAIDs) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used or been exposed to nonsteroidal anti-inflammatory agents (NSAIDs).","meaning":"Boolean indicating whether the patient has ever used or been exposed to nonsteroidal anti-inflammatory agents (NSAIDs) in their medical history."} ;; "the patient has a history of use of nonsteroidal anti-inflammatory drugs"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_arthritis_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of inflammatory arthritis."

(assert
(! (not patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of use of nonsteroidal anti-inflammatory drugs."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@temporalcontext_within_2_weeks_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to nonsteroidal anti-inflammatory agents occurred within the two weeks before the inclusion event.","when_to_set_to_false":"Set to false if the patient's exposure to nonsteroidal anti-inflammatory agents did not occur within the two weeks before the inclusion event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to nonsteroidal anti-inflammatory agents occurred within the two weeks before the inclusion event.","meaning":"Boolean indicating whether the patient's exposure to nonsteroidal anti-inflammatory agents occurred within the two weeks before the inclusion event."} ;; "taking nonsteroidal anti-inflammatory drugs in the two weeks preceding the inclusion"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthehistory@@temporalcontext_within_2_weeks_before_inclusion)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking nonsteroidal anti-inflammatory drugs in the two weeks preceding the inclusion."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_able_to_participate_in_study_throughout_duration_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to participate in the study for the entire duration of 12 months.","when_to_set_to_false":"Set to false if the patient is unable to participate in the study for the entire duration of 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to participate in the study for the entire duration of 12 months.","meaning":"Boolean indicating whether the patient is able to participate in the study for the entire duration of 12 months."} ;; "unable to participate in the study throughout its duration (12 months)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_able_to_participate_in_study_throughout_duration_12_months)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to participate in the study throughout its duration (12 months)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_affiliated_with_social_health_care Bool) ;; {"when_to_set_to_true":"Set to true if the patient is affiliated with a social health care.","when_to_set_to_false":"Set to false if the patient is not affiliated with a social health care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is affiliated with a social health care.","meaning":"Boolean indicating whether the patient is affiliated with a social health care."} ;; "the patient is NOT affiliated with a social health care"
(declare-const patient_is_beneficiary_of_social_health_care Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a beneficiary of a social health care.","when_to_set_to_false":"Set to false if the patient is not a beneficiary of a social health care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a beneficiary of a social health care.","meaning":"Boolean indicating whether the patient is a beneficiary of a social health care."} ;; "the patient is NOT a beneficiary of a social health care"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or (not patient_is_affiliated_with_social_health_care)
            (not patient_is_beneficiary_of_social_health_care)))
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is NOT affiliated with a social health care) OR (the patient is NOT a beneficiary of a social health care)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_refuses_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient explicitly refuses to participate in the study.","when_to_set_to_false":"Set to false if the patient does not refuse to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses to participate in the study.","meaning":"Boolean indicating whether the patient refuses to participate in the study."} ;; "the patient refuses to participate in the study"
(declare-const patient_refuses_to_sign_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient explicitly refuses to sign a consent.","when_to_set_to_false":"Set to false if the patient does not refuse to sign a consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses to sign a consent.","meaning":"Boolean indicating whether the patient refuses to sign a consent."} ;; "the patient refuses to sign a consent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_refuses_to_participate_in_study)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to participate in the study."

(assert
(! (not patient_refuses_to_sign_consent)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to sign a consent."
