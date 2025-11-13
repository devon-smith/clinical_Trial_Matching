;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_bone_inflammatory_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bone inflammatory disease (osteitis).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bone inflammatory disease (osteitis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bone inflammatory disease (osteitis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of bone inflammatory disease (osteitis)."} ;; "osteitis"
(declare-const patient_has_diagnosis_of_bone_inflammatory_disease_now@@post_infective_etiology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of bone inflammatory disease (osteitis) is post-infective in etiology (caused by infection occurring after a primary event).","when_to_set_to_false":"Set to false if the patient's current diagnosis of bone inflammatory disease (osteitis) is not post-infective in etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the etiology of the patient's current bone inflammatory disease (osteitis) is post-infective.","meaning":"Boolean indicating whether the patient's current diagnosis of bone inflammatory disease (osteitis) is post-infective in etiology."} ;; "post infective osteitis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_bone_inflammatory_disease_now@@post_infective_etiology
      patient_has_diagnosis_of_bone_inflammatory_disease_now)
:named REQ0_AUXILIARY0)) ;; "post infective osteitis" qualifier implies osteitis

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_bone_inflammatory_disease_now@@post_infective_etiology)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has post infective osteitis."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_neoplasm_of_bone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of bone neoplasm (bone tumour).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of bone neoplasm (bone tumour).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of bone neoplasm (bone tumour).","meaning":"Boolean indicating whether the patient currently has a bone neoplasm (bone tumour)."} ;; "bone tumour"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_neoplasm_of_bone_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a bone tumour."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any type of injury (traumatic or non-traumatic).","when_to_set_to_false":"Set to false if the patient currently does not have any type of injury (traumatic or non-traumatic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any type of injury (traumatic or non-traumatic).","meaning":"Boolean indicating whether the patient currently has any type of injury (traumatic or non-traumatic)."} ;; "injury"
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current injury is acute.","when_to_set_to_false":"Set to false if the patient's current injury is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current injury is acute.","meaning":"Boolean indicating whether the patient's current injury is acute."} ;; "acute injury"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now@@acute
      patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now)
:named REQ2_AUXILIARY0)) ;; "acute injury" implies "injury"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now@@acute)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute injury."
