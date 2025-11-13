;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_oral_cavity_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant tumor of the oral cavity (mouth cancer) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant tumor of the oral cavity (mouth cancer) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant tumor of the oral cavity (mouth cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant tumor of the oral cavity (mouth cancer) in their history."} ;; "mouth cancer"

(declare-const patient_has_diagnosis_of_malignant_tumor_of_pharynx_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant tumor of the pharynx (throat cancer) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant tumor of the pharynx (throat cancer) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant tumor of the pharynx (throat cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant tumor of the pharynx (throat cancer) in their history."} ;; "throat cancer"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_tumor_of_oral_cavity_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of mouth cancer."

(assert
(! (not patient_has_diagnosis_of_malignant_tumor_of_pharynx_inthehistory)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of throat cancer."
