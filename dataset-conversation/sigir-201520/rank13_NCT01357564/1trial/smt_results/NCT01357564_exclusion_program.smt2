;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_english_speaking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is an English-speaking patient.","when_to_set_to_false":"Set to false if the patient currently is not an English-speaking patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is an English-speaking patient.","meaning":"Boolean indicating whether the patient currently is an English-speaking patient."} ;; "The patient is excluded if the patient is NOT an English-speaking patient."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_english_speaking_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is NOT an English-speaking patient."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_veteran_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a veteran patient.","when_to_set_to_false":"Set to false if the patient is not a veteran patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a veteran patient.","meaning":"Boolean indicating whether the patient is a veteran patient."} ;; "The patient is excluded if the patient is NOT a veteran patient."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_veteran_patient)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is NOT a veteran patient."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_caregiver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver.","when_to_set_to_false":"Set to false if the patient currently does not have a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caregiver.","meaning":"Boolean indicating whether the patient currently has a caregiver."} ;; "The patient is excluded if the patient does NOT have a caregiver."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_caregiver_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT have a caregiver."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} ;; "dementia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_dementia_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have a diagnosis of dementia."
