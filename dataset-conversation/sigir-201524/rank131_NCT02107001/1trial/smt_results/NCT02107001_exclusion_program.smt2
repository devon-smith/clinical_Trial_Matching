;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic condition"
(declare-const patient_has_finding_of_chronic_disease_now@@causes_thoracic_pain Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic disease is causally responsible for thoracic pain.","when_to_set_to_false":"Set to false if the patient's chronic disease does not cause thoracic pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic disease causes thoracic pain.","meaning":"Boolean indicating whether the patient's chronic disease causes thoracic pain."} ;; "chronic condition causing thoracic pain"
(declare-const patient_has_finding_of_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain.","when_to_set_to_false":"Set to false if the patient currently does not have pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain.","meaning":"Boolean indicating whether the patient currently has pain."} ;; "pain"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_chronic_disease_now@@causes_thoracic_pain
      patient_has_finding_of_chronic_disease_now)
:named REQ0_AUXILIARY0)) ;; "chronic condition causing thoracic pain"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_now@@causes_thoracic_pain)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is affected by a chronic condition causing thoracic pain."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"
(declare-const patient_has_finding_of_acute_disease_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute disease of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have an acute disease of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute disease of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has an acute disease of the cardiovascular system."} ;; "acute cardiovascular disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_finding_of_acute_coronary_syndrome_now
      patient_has_finding_of_acute_disease_of_cardiovascular_system_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (acute coronary syndrome)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_acute_disease_of_cardiovascular_system_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is affected by an acute cardiovascular disease with non-exhaustive examples (acute coronary syndrome)."
