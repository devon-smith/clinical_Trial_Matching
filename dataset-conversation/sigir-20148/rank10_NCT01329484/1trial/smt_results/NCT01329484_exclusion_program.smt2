;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_visual_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of visual impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of visual impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of visual impairment.","meaning":"Boolean indicating whether the patient currently has visual impairment now."} ;; "visual impairment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_visual_impairment_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has visual impairment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_auditory_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of auditory dysfunction (auditory impairment).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of auditory dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has auditory dysfunction.","meaning":"Boolean indicating whether the patient currently has auditory dysfunction."} ;; "auditory impairment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_auditory_dysfunction_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has auditory impairment."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder (psychiatric disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder (psychiatric disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder (psychiatric disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder (psychiatric disorder)."} ;; "psychiatric disorder"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_mental_disorder_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychiatric disorder."
