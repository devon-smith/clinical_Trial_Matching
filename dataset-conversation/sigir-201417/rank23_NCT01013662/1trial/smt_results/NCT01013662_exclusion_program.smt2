;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (cancer) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer) in their history."} ;; "the patient has a previous diagnosis of cancer"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a previous diagnosis of cancer."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_leptospirosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of leptospirosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of leptospirosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of leptospirosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of leptospirosis."} ;; "the patient has a diagnosis of leptospirosis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_leptospirosis_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a diagnosis of leptospirosis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_aids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS)."} ;; "the patient has a diagnosis of acquired immunodeficiency syndrome"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_aids_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a diagnosis of acquired immunodeficiency syndrome."
