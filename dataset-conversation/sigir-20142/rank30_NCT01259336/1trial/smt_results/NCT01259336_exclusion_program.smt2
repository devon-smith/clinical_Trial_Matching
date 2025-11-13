;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_invasive_aspergillosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of invasive aspergillosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of invasive aspergillosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of invasive aspergillosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of invasive aspergillosis."} ;; "invasive aspergillosis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_invasive_aspergillosis_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has invasive aspergillosis."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_allergic_bronchopulmonary_aspergillosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of allergic bronchopulmonary aspergillosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of allergic bronchopulmonary aspergillosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of allergic bronchopulmonary aspergillosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of allergic bronchopulmonary aspergillosis."} ;; "allergic bronchopulmonary aspergillosis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_diagnosis_of_allergic_bronchopulmonary_aspergillosis_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergic bronchopulmonary aspergillosis."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active tuberculosis.","meaning":"Boolean indicating whether the patient currently has active tuberculosis."} ;; "active tuberculosis"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (malignancy)."} ;; "malignancy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_active_tuberculosis_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active tuberculosis."

(assert
  (! (not patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
