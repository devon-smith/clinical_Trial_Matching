;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a malignant neoplastic disease (malignancy) at any time in the past, regardless of location or treatment status.","when_to_set_to_false":"Set to false if the patient has never had a malignant neoplastic disease (malignancy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient has ever had a malignant neoplastic disease (malignancy) at any time in the past."} ;; "malignancy"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@located_in_head_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malignant neoplastic disease is specifically located in the head region.","when_to_set_to_false":"Set to false if the patient's history of malignant neoplastic disease is not located in the head region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy was located in the head region.","meaning":"Boolean indicating whether the patient's history of malignant neoplastic disease is located in the head region."} ;; "malignancy of the head region"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@previously_treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malignant neoplastic disease in the head region has previously been treated.","when_to_set_to_false":"Set to false if the patient's history of malignant neoplastic disease in the head region has not been previously treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy in the head region was previously treated.","meaning":"Boolean indicating whether the patient's history of malignant neoplastic disease in the head region has previously been treated."} ;; "previous treatment for malignancy of the head region"

(declare-const patient_has_finding_of_malignant_tumor_of_neck_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a malignant tumor of the neck region at any time in the past, regardless of treatment status.","when_to_set_to_false":"Set to false if the patient has never had a malignant tumor of the neck region at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a malignant tumor of the neck region.","meaning":"Boolean indicating whether the patient has ever had a malignant tumor of the neck region at any time in the past."} ;; "malignancy of the neck region"

(declare-const patient_has_finding_of_malignant_tumor_of_neck_inthehistory@@previously_treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malignant tumor of the neck region has previously been treated.","when_to_set_to_false":"Set to false if the patient's history of malignant tumor of the neck region has not been previously treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant tumor of the neck region was previously treated.","meaning":"Boolean indicating whether the patient's history of malignant tumor of the neck region has previously been treated."} ;; "previous treatment for malignancy of the neck region"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables for head region
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@located_in_head_region
     patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
:named REQ0_AUXILIARY0)) ;; "malignancy of the head region"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@previously_treated
     patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@located_in_head_region)
:named REQ0_AUXILIARY1)) ;; "previous treatment for malignancy of the head region"

;; Qualifier variables imply corresponding stem variables for neck region
(assert
(! (=> patient_has_finding_of_malignant_tumor_of_neck_inthehistory@@previously_treated
     patient_has_finding_of_malignant_tumor_of_neck_inthehistory)
:named REQ0_AUXILIARY2)) ;; "previous treatment for malignancy of the neck region"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: previous treatment for malignancy of the head region
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@previously_treated)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous treatment for malignancy of the head region."

;; Exclusion: previous treatment for malignancy of the neck region
(assert
(! (not patient_has_finding_of_malignant_tumor_of_neck_inthehistory@@previously_treated)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous treatment for malignancy of the neck region."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_significant_preexisting_facial_disfigurement_from_congenital_defect Bool) ;; {"when_to_set_to_true":"Set to true if the patient has significant preexisting facial disfigurement caused by congenital defect.","when_to_set_to_false":"Set to false if the patient does not have significant preexisting facial disfigurement caused by congenital defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has significant preexisting facial disfigurement caused by congenital defect.","meaning":"Boolean indicating whether the patient has significant preexisting facial disfigurement caused by congenital defect."} ;; "significant preexisting facial disfigurement from congenital defect"
(declare-const patient_has_significant_preexisting_facial_disfigurement_from_previous_trauma Bool) ;; {"when_to_set_to_true":"Set to true if the patient has significant preexisting facial disfigurement caused by previous trauma.","when_to_set_to_false":"Set to false if the patient does not have significant preexisting facial disfigurement caused by previous trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has significant preexisting facial disfigurement caused by previous trauma.","meaning":"Boolean indicating whether the patient has significant preexisting facial disfigurement caused by previous trauma."} ;; "significant preexisting facial disfigurement from previous trauma"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_significant_preexisting_facial_disfigurement_from_previous_trauma)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant preexisting facial disfigurement from previous trauma."

(assert
(! (not patient_has_significant_preexisting_facial_disfigurement_from_congenital_defect)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant preexisting facial disfigurement from congenital defect."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder."} ;; "mental illness"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@involves_formal_thought_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of mental disorder involves formal thought disorder.","when_to_set_to_false":"Set to false if the patient's diagnosis of mental disorder does not involve formal thought disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of mental disorder involves formal thought disorder.","meaning":"Boolean indicating whether the patient's diagnosis of mental disorder involves formal thought disorder."} ;; "involving formal thought disorder"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@documented_in_medical_record Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of mental disorder is documented in the medical record.","when_to_set_to_false":"Set to false if the patient's diagnosis of mental disorder is not documented in the medical record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of mental disorder is documented in the medical record.","meaning":"Boolean indicating whether the patient's diagnosis of mental disorder is documented in the medical record."} ;; "documented in the medical record"
(declare-const patient_has_diagnosis_of_schizophrenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of schizophrenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of schizophrenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of schizophrenia."} ;; "schizophrenia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: schizophrenia is an example of serious mental illness involving formal thought disorder
(assert
(! (=> patient_has_diagnosis_of_schizophrenia_now
     patient_has_diagnosis_of_mental_disorder_now@@involves_formal_thought_disorder)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (schizophrenia)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@involves_formal_thought_disorder
     patient_has_diagnosis_of_mental_disorder_now)
:named REQ2_AUXILIARY1)) ;; "involving formal thought disorder"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@documented_in_medical_record
     patient_has_diagnosis_of_mental_disorder_now)
:named REQ2_AUXILIARY2)) ;; "documented in the medical record"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have a diagnosis of serious mental illness involving formal thought disorder documented in the medical record
(assert
(! (not (and patient_has_diagnosis_of_mental_disorder_now@@involves_formal_thought_disorder
             patient_has_diagnosis_of_mental_disorder_now@@documented_in_medical_record))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of serious mental illness involving formal thought disorder with non-exhaustive examples (schizophrenia) documented in the medical record."
