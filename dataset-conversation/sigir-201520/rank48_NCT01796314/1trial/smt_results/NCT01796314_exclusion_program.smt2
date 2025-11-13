;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer’s disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer’s disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer’s disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer’s disease."} ;; "Alzheimer disease"
(declare-const patient_has_diagnosis_of_non_alzheimer_type_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a type of dementia other than Alzheimer disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a type of dementia other than Alzheimer disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a type of dementia other than Alzheimer disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a type of dementia other than Alzheimer disease."} ;; "a type of dementia other than Alzheimer disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_non_alzheimer_type_dementia_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a type of dementia other than Alzheimer disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_lives_in_a_nursing_home_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in a nursing home.","when_to_set_to_false":"Set to false if the patient is currently not living in a nursing home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in a nursing home.","meaning":"Boolean indicating whether the patient is currently living in a nursing home."} ;; "the patient is living in a nursing home"
(declare-const patient_has_finding_of_lives_in_a_long_term_care_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in a long-term care facility.","when_to_set_to_false":"Set to false if the patient is currently not living in a long-term care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in a long-term care facility.","meaning":"Boolean indicating whether the patient is currently living in a long-term care facility."} ;; "the patient is living in a long-term care facility"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_lives_in_a_nursing_home_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is living in a nursing home."

(assert
(! (not patient_has_finding_of_lives_in_a_long_term_care_facility_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is living in a long-term care facility."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_caregiver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver.","when_to_set_to_false":"Set to false if the patient currently does not have a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caregiver.","meaning":"Boolean indicating whether the patient currently has a caregiver."} ;; "The patient is excluded if the patient does not have a caregiver."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_caregiver_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does not have a caregiver."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_informed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently informed about the study, procedure, or relevant information.","when_to_set_to_false":"Set to false if the patient is currently not informed about the study, procedure, or relevant information.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently informed.","meaning":"Boolean indicating whether the patient is currently informed about the study, procedure, or relevant information."} ;; "the patient is not informed"
(declare-const patient_has_given_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently given consent for participation, procedure, or relevant activity.","when_to_set_to_false":"Set to false if the patient has not currently given consent for participation, procedure, or relevant activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently given consent.","meaning":"Boolean indicating whether the patient has currently given consent for participation, procedure, or relevant activity."} ;; "the patient has not given consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_informed_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is not informed."

(assert
(! (not patient_has_given_consent_now)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has not given consent."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_has_a_carer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver.","when_to_set_to_false":"Set to false if the patient currently does not have a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caregiver.","meaning":"Boolean indicating whether the patient currently has a caregiver."} ;; "caregiver"
(declare-const patient_has_finding_of_has_a_carer_now@@caregiver_not_informed Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver and the caregiver is not informed.","when_to_set_to_false":"Set to false if the patient currently has a caregiver and the caregiver is informed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver is informed.","meaning":"Boolean indicating whether the patient's caregiver is not informed."} ;; "the patient has a caregiver who is not informed"
(declare-const patient_has_finding_of_has_a_carer_now@@caregiver_has_not_given_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver and the caregiver has not given consent.","when_to_set_to_false":"Set to false if the patient currently has a caregiver and the caregiver has given consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver has given consent.","meaning":"Boolean indicating whether the patient's caregiver has not given consent."} ;; "the caregiver has not given consent"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply the patient has a caregiver
(assert
(! (=> patient_has_finding_of_has_a_carer_now@@caregiver_not_informed
       patient_has_finding_of_has_a_carer_now)
    :named REQ4_AUXILIARY0)) ;; "the patient has a caregiver who is not informed"

(assert
(! (=> patient_has_finding_of_has_a_carer_now@@caregiver_has_not_given_consent
       patient_has_finding_of_has_a_carer_now)
    :named REQ4_AUXILIARY1)) ;; "the caregiver has not given consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_finding_of_has_a_carer_now@@caregiver_not_informed
            patient_has_finding_of_has_a_carer_now@@caregiver_has_not_given_consent))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a caregiver who is not informed) OR (the caregiver has not given consent)."
