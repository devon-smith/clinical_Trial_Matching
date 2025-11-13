;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the respiratory system (respiratory illness).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the respiratory system (respiratory illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the respiratory system (respiratory illness).","meaning":"Boolean indicating whether the patient currently has a disorder of the respiratory system (respiratory illness)."}  ;; "respiratory illness"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now@@is_febrile Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current respiratory illness is febrile.","when_to_set_to_false":"Set to false if the patient's current respiratory illness is not febrile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current respiratory illness is febrile.","meaning":"Boolean indicating whether the patient's current respiratory illness is febrile."}  ;; "febrile"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now@@identified_by_positive_screen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current respiratory illness is identified by a positive screen.","when_to_set_to_false":"Set to false if the patient's current respiratory illness is not identified by a positive screen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current respiratory illness is identified by a positive screen.","meaning":"Boolean indicating whether the patient's current respiratory illness is identified by a positive screen."}  ;; "positive ... screen"
(declare-const patient_is_undergoing_hospital_admission_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hospital admission.","when_to_set_to_false":"Set to false if the patient is not currently undergoing hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hospital admission.","meaning":"Boolean indicating whether the patient is currently undergoing hospital admission."}  ;; "admission to hospital"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable: if the patient has a febrile respiratory illness, they have a respiratory illness
(assert
  (! (=> patient_has_finding_of_disorder_of_respiratory_system_now@@is_febrile
         patient_has_finding_of_disorder_of_respiratory_system_now)
     :named REQ0_AUXILIARY0)) ;; "febrile respiratory illness"

;; Qualifier variable implies stem variable: if the patient has a respiratory illness identified by positive screen, they have a respiratory illness
(assert
  (! (=> patient_has_finding_of_disorder_of_respiratory_system_now@@identified_by_positive_screen
         patient_has_finding_of_disorder_of_respiratory_system_now)
     :named REQ0_AUXILIARY1)) ;; "positive ... screen"

;; Both qualifiers together imply the stem variable: if the patient has a febrile respiratory illness identified by positive screen, they have a respiratory illness
(assert
  (! (=> (and patient_has_finding_of_disorder_of_respiratory_system_now@@is_febrile
              patient_has_finding_of_disorder_of_respiratory_system_now@@identified_by_positive_screen)
         patient_has_finding_of_disorder_of_respiratory_system_now)
     :named REQ0_AUXILIARY2)) ;; "positive febrile respiratory illness screen"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must have a positive febrile respiratory illness screen on admission to hospital
(assert
  (! (and patient_has_finding_of_disorder_of_respiratory_system_now@@is_febrile
          patient_has_finding_of_disorder_of_respiratory_system_now@@identified_by_positive_screen
          patient_is_undergoing_hospital_admission_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a positive febrile respiratory illness screen on admission to hospital"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pneumonia."}  ;; "diagnosis of pneumonia"
(declare-const patient_has_diagnosis_of_pneumonia_now@@diagnosed_by_admitting_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of pneumonia was made by the admitting physician.","when_to_set_to_false":"Set to false if the patient's current diagnosis of pneumonia was not made by the admitting physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the admitting physician made the diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient's current diagnosis of pneumonia was made by the admitting physician."}  ;; "diagnosed by admitting physician"
(declare-const patient_has_diagnosis_of_pneumonia_now@@definition_includes_acute_exacerbation_of_chronic_obstructive_lung_disease Bool) ;; {"when_to_set_to_true":"Set to true if, for the purposes of this study, the patient's current diagnosis of pneumonia includes acute exacerbation of chronic obstructive lung disease.","when_to_set_to_false":"Set to false if, for the purposes of this study, the patient's current diagnosis of pneumonia does not include acute exacerbation of chronic obstructive lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether acute exacerbation of chronic obstructive lung disease is included in the study definition of pneumonia.","meaning":"Boolean indicating whether the study definition of pneumonia includes acute exacerbation of chronic obstructive lung disease for the patient."}  ;; "definition includes acute exacerbation of chronic obstructive lung disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_pneumonia_now@@diagnosed_by_admitting_physician
         patient_has_diagnosis_of_pneumonia_now)
     :named REQ1_AUXILIARY0)) ;; "diagnosed by admitting physician"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_pneumonia_now@@definition_includes_acute_exacerbation_of_chronic_obstructive_lung_disease
         patient_has_diagnosis_of_pneumonia_now)
     :named REQ1_AUXILIARY1)) ;; "definition includes acute exacerbation of chronic obstructive lung disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have a diagnosis of pneumonia made by the admitting physician.
(assert
  (! patient_has_diagnosis_of_pneumonia_now@@diagnosed_by_admitting_physician
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis of pneumonia made by the admitting physician"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_admission_to_medical_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to a medical department (medical ward).","when_to_set_to_false":"Set to false if the patient is currently not admitted to a medical department (medical ward).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to a medical department (medical ward).","meaning":"Boolean indicating whether the patient is currently admitted to a medical department (medical ward)."}  ;; "admission to a medical ward"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_undergoing_admission_to_medical_department_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have admission to a medical ward."
