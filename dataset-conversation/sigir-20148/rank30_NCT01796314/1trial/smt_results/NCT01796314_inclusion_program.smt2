;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."}  ;; "must be suffering from mild Alzheimer's disease or must be suffering from moderately severe Alzheimer's disease"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_mild Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease and the severity is mild.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of Alzheimer's disease but the severity is not mild.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the patient's Alzheimer's disease is mild.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease and the severity is mild."}  ;; "must be suffering from mild Alzheimer's disease"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_moderately_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease and the severity is moderately severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of Alzheimer's disease but the severity is not moderately severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the patient's Alzheimer's disease is moderately severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease and the severity is moderately severe."}  ;; "must be suffering from moderately severe Alzheimer's disease"
(declare-const patient_assessment_using_mini_mental_state_examination_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured MMSE score if a numeric measurement of the Mini-Mental State Examination (MMSE) score recorded now is available.","when_to_set_to_null":"Set to null if no such MMSE score measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Mini-Mental State Examination (MMSE) score."}  ;; "Mini-Mental State Examination (MMSE) score between 11 and 26"
(declare-const patient_has_undergone_assessment_using_mini_mental_state_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a Mini-Mental State Examination (MMSE) at the current time.","when_to_set_to_false":"Set to false if the patient has not undergone a Mini-Mental State Examination (MMSE) at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a Mini-Mental State Examination (MMSE) at the current time.","meaning":"Boolean indicating whether the patient has undergone a Mini-Mental State Examination (MMSE) at the current time."}  ;; "Mini-Mental State Examination (MMSE) score between 11 and 26"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_mild
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY0)) ;; "must be suffering from mild Alzheimer's disease"

(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_moderately_severe
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY1)) ;; "must be suffering from moderately severe Alzheimer's disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Inclusion: mild AD OR (moderately severe AD AND MMSE 11-26)
(assert
  (! (or patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_mild
         (and patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_moderately_severe
              patient_has_undergone_assessment_using_mini_mental_state_examination_now
              (>= patient_assessment_using_mini_mental_state_examination_value_recorded_now_withunit_score 11)
              (<= patient_assessment_using_mini_mental_state_examination_value_recorded_now_withunit_score 26)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must be suffering from mild Alzheimer's disease or must be suffering from moderately severe Alzheimer's disease, with a Mini-Mental State Examination (MMSE) score between 11 and 26"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_lives_in_a_community_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in a community dwelling (i.e., not institutionalized, residing in a non-institutional community setting).","when_to_set_to_false":"Set to false if the patient is currently not living in a community dwelling (e.g., institutionalized, hospitalized, or in a care facility).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in a community dwelling.","meaning":"Boolean indicating whether the patient is currently living in a community dwelling."} ;; "To be included, the patient must be living in a community dwelling."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_lives_in_a_community_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be living in a community dwelling."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_informal_caregiver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an informal caregiver.","when_to_set_to_false":"Set to false if the patient currently does not have an informal caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an informal caregiver.","meaning":"Boolean indicating whether the patient currently has an informal caregiver."} ;; "the patient must have an informal caregiver"
(declare-const informal_caregiver_lives_with_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's informal caregiver currently lives with the patient.","when_to_set_to_false":"Set to false if the patient's informal caregiver does not currently live with the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's informal caregiver currently lives with the patient.","meaning":"Boolean indicating whether the patient's informal caregiver currently lives with the patient."} ;; "lives with the patient"
(declare-const informal_caregiver_care_frequency_per_week_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of times per week the informal caregiver provides care to the patient, recorded as a count per week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the informal caregiver provides care to the patient.","meaning":"Numeric value indicating the number of times per week the informal caregiver provides care to the patient, recorded as a count per week."} ;; "provides care at least 3 times per week"
(declare-const informal_caregiver_care_duration_per_week_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours per week the informal caregiver provides care to the patient, recorded in hours per week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours per week the informal caregiver provides care to the patient.","meaning":"Numeric value indicating the total number of hours per week the informal caregiver provides care to the patient, recorded in hours per week."} ;; "provides care for ≥ 8 hours per week"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have an informal caregiver who ((lives with the patient) OR (provides care at least 3 times per week) OR (provides care for ≥ 8 hours per week)).
(assert
  (! (and patient_has_informal_caregiver_now
          (or informal_caregiver_lives_with_patient_now
              (>= informal_caregiver_care_frequency_per_week_value_recorded_now_withunit_count 3)
              (>= informal_caregiver_care_duration_per_week_value_recorded_now_withunit_hours 8)))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an informal caregiver who ((lives with the patient) OR (provides care at least 3 times per week) OR (provides care for ≥ 8 hours per week))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_been_informed Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been informed about the relevant information regarding the study, procedure, or intervention.","when_to_set_to_false":"Set to false if the patient has not been informed about the relevant information regarding the study, procedure, or intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been informed.","meaning":"Boolean indicating whether the patient has been informed about the relevant information regarding the study, procedure, or intervention."} ;; "the patient must be informed"
(declare-const patient_has_given_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given consent to participate in the study, procedure, or intervention.","when_to_set_to_false":"Set to false if the patient has not given consent to participate in the study, procedure, or intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given consent.","meaning":"Boolean indicating whether the patient has given consent to participate in the study, procedure, or intervention."} ;; "the patient must have given consent"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must be informed.
(assert
  (! patient_has_been_informed
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be informed"

;; Component 1: The patient must have given consent.
(assert
  (! patient_has_given_consent
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have given consent"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const caregiver_is_informed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's caregiver is currently informed about the relevant aspects of the patient's care or study.","when_to_set_to_false":"Set to false if the patient's caregiver is currently not informed about the relevant aspects of the patient's care or study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's caregiver is currently informed.","meaning":"Boolean indicating whether the patient's caregiver is currently informed."} ;; "the patient must have a caregiver who is informed"
(declare-const caregiver_has_given_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's caregiver has currently given consent for the patient's participation or care.","when_to_set_to_false":"Set to false if the patient's caregiver has currently not given consent for the patient's participation or care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's caregiver has currently given consent.","meaning":"Boolean indicating whether the patient's caregiver has currently given consent."} ;; "the patient must have a caregiver who has given consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! caregiver_is_informed_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have a caregiver who is informed"

(assert
  (! caregiver_has_given_consent_now
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have a caregiver who has given consent"
