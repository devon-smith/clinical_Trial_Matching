;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} ;; "the patient does NOT provide written informed consent"
(declare-const patient_is_able_to_provide_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is unable to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide written informed consent.","meaning":"Boolean indicating whether the patient is able to provide written informed consent."} ;; "the patient is unable to provide written informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_provided_written_informed_consent)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient does NOT provide written informed consent"

(assert
(! (not patient_is_able_to_provide_written_informed_consent)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is unable to provide written informed consent"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_blood_pressure_taking_assessment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone blood pressure measurement (blood_pressure_taking_assessment) in the past.","when_to_set_to_false":"Set to false if the patient has never undergone blood pressure measurement (blood_pressure_taking_assessment) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone blood pressure measurement in the past.","meaning":"Boolean indicating whether the patient has ever undergone blood pressure measurement (blood_pressure_taking_assessment) in the past."} ;; "blood pressure measurement"
(declare-const patient_has_undergone_blood_pressure_taking_assessment_inthehistory@@purpose_is_followup_visit_patient_refuses_to_attend Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement was the purpose of a follow-up visit that the patient refused to attend.","when_to_set_to_false":"Set to false if the blood pressure measurement was not the purpose of a follow-up visit that the patient refused to attend.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood pressure measurement was the purpose of a follow-up visit that the patient refused to attend.","meaning":"Boolean indicating whether the blood pressure measurement was the purpose of a follow-up visit that the patient refused to attend."} ;; "the patient refuses to attend follow-up visits for blood pressure measurement"
(declare-const patient_has_undergone_blood_pressure_taking_assessment_inthehistory@@purpose_is_followup_visit_patient_is_unlikely_to_attend Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement was the purpose of a follow-up visit that the patient is unlikely to attend.","when_to_set_to_false":"Set to false if the blood pressure measurement was not the purpose of a follow-up visit that the patient is unlikely to attend.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood pressure measurement was the purpose of a follow-up visit that the patient is unlikely to attend.","meaning":"Boolean indicating whether the blood pressure measurement was the purpose of a follow-up visit that the patient is unlikely to attend."} ;; "the patient is unlikely to attend follow-up visits for blood pressure measurement"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_blood_pressure_taking_assessment_inthehistory@@purpose_is_followup_visit_patient_refuses_to_attend
      patient_has_undergone_blood_pressure_taking_assessment_inthehistory)
:named REQ1_AUXILIARY0)) ;; "the patient refuses to attend follow-up visits for blood pressure measurement"

(assert
(! (=> patient_has_undergone_blood_pressure_taking_assessment_inthehistory@@purpose_is_followup_visit_patient_is_unlikely_to_attend
      patient_has_undergone_blood_pressure_taking_assessment_inthehistory)
:named REQ1_AUXILIARY1)) ;; "the patient is unlikely to attend follow-up visits for blood pressure measurement"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_blood_pressure_taking_assessment_inthehistory@@purpose_is_followup_visit_patient_refuses_to_attend)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient refuses to attend follow-up visits for blood pressure measurement"

(assert
(! (not patient_has_undergone_blood_pressure_taking_assessment_inthehistory@@purpose_is_followup_visit_patient_is_unlikely_to_attend)
:named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is unlikely to attend follow-up visits for blood pressure measurement"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_institutionalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently institutionalized.","when_to_set_to_false":"Set to false if the patient is currently not institutionalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently institutionalized.","meaning":"Boolean indicating whether the patient is currently institutionalized."} ;; "The patient is excluded if the patient is institutionalized."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_is_institutionalized_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is institutionalized."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than eighteen years of age"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than eighteen years of age."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_understands_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently understands English.","when_to_set_to_false":"Set to false if the patient currently does not understand English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently understands English.","meaning":"Boolean indicating whether the patient currently understands English."} ;; "The patient is excluded if the patient does NOT understand English."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_understands_english_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT understand English."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_enrolled_in_other_diabetes_mellitus_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in another diabetes mellitus trial.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in another diabetes mellitus trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in another diabetes mellitus trial.","meaning":"Boolean indicating whether the patient is currently enrolled in another diabetes mellitus trial."} ;; "the patient is enrolled in other diabetes mellitus trial"
(declare-const patient_is_enrolled_in_other_hypertension_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in another hypertension trial.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in another hypertension trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in another hypertension trial.","meaning":"Boolean indicating whether the patient is currently enrolled in another hypertension trial."} ;; "the patient is enrolled in other hypertension trial"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_enrolled_in_other_diabetes_mellitus_trial_now)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is enrolled in other diabetes mellitus trial."

(assert
(! (not patient_is_enrolled_in_other_hypertension_trial_now)
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is enrolled in other hypertension trial."
