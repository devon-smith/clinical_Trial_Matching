;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_severe_intellectual_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe intellectual disability (severe mental retardation).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe intellectual disability (severe mental retardation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe intellectual disability (severe mental retardation).","meaning":"Boolean indicating whether the patient currently has severe intellectual disability (severe mental retardation)."} ;; "severe mental retardation"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_severe_intellectual_disability_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe mental retardation."

(assert
  (! (not patient_has_finding_of_dementia_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_aphasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aphasia.","when_to_set_to_false":"Set to false if the patient currently does not have aphasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aphasia.","meaning":"Boolean indicating whether the patient currently has aphasia."} ;; "aphasia"
(declare-const patient_has_finding_of_barrier_to_communication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a barrier to communication of any type (e.g., aphasia, deafness, blindness, language barrier, etc.).","when_to_set_to_false":"Set to false if the patient currently does not have any barrier to communication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a barrier to communication.","meaning":"Boolean indicating whether the patient currently has a barrier to communication."} ;; "communication barriers"
(declare-const patient_has_finding_of_blindness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has blindness.","when_to_set_to_false":"Set to false if the patient currently does not have blindness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has blindness.","meaning":"Boolean indicating whether the patient currently has blindness."} ;; "blindness"
(declare-const patient_has_finding_of_deafness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has deafness.","when_to_set_to_false":"Set to false if the patient currently does not have deafness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has deafness.","meaning":"Boolean indicating whether the patient currently has deafness."} ;; "deafness"
(declare-const patient_is_unable_to_speak_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to speak English.","when_to_set_to_false":"Set to false if the patient is currently able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to speak English.","meaning":"Boolean indicating whether the patient is currently unable to speak English."} ;; "unable to speak English"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive example: aphasia implies barrier to communication
(assert
(! (=> patient_has_finding_of_aphasia_now
      patient_has_finding_of_barrier_to_communication_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (aphasia)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_barrier_to_communication_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has baseline communication barriers with non-exhaustive examples (aphasia)."

(assert
(! (not patient_has_finding_of_deafness_now)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has deafness."

(assert
(! (not patient_has_finding_of_blindness_now)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has blindness."

(assert
(! (not patient_is_unable_to_speak_english_now)
   :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to speak English."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_refuses_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has explicitly refused to provide consent.","when_to_set_to_false":"Set to false if the patient has not refused to provide consent (i.e., has provided consent or has not expressed refusal).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has refused to provide consent.","meaning":"Boolean indicating whether the patient has refused to provide consent."} ;; "The patient is excluded if the patient refuses consent."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_refuses_consent)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses consent."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_previous_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had previous enrollment in the relevant context.","when_to_set_to_false":"Set to false if the patient has not had previous enrollment in the relevant context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had previous enrollment in the relevant context.","meaning":"Boolean indicating whether the patient has had previous enrollment in the relevant context."} ;; "The patient is excluded if the patient has previous enrollment."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_previous_enrollment)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_coma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coma (is comatose) at the present time.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coma (is not comatose) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of coma (is comatose) at the present time."} ;; "comatose"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_coma_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is comatose."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const all_required_assessments_completed Bool) ;; {"when_to_set_to_true":"Set to true if all required assessments for the patient have been completed.","when_to_set_to_false":"Set to false if not all required assessments for the patient have been completed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether all required assessments for the patient have been completed.","meaning":"Boolean indicating whether all required assessments for the patient have been completed."} ;; "all required assessments for the patient have been completed"
(declare-const patient_is_discharged_from_hospital_before_assessments_completed Bool) ;; {"when_to_set_to_true":"Set to true if the patient is discharged from the hospital before all required assessments are completed.","when_to_set_to_false":"Set to false if the patient is not discharged from the hospital before all required assessments are completed (i.e., the patient remains in the hospital until all assessments are completed or is discharged after completion).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was discharged from the hospital before all required assessments are completed.","meaning":"Boolean indicating whether the patient is discharged from the hospital before all required assessments are completed."} ;; "patient is out of the hospital before the assessments are completed"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_discharged_from_hospital_before_assessments_completed)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is out of the hospital before the assessments are completed."
