;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of hypertensive disorder (hypertension)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a clinical diagnosis of hypertension."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of type 2 diabetes mellitus."} ;; "type 2 diabetes mellitus"
(declare-const patient_has_diagnosis_of_impaired_glucose_tolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of impaired glucose tolerance.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of impaired glucose tolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of impaired glucose tolerance.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of impaired glucose tolerance."} ;; "impaired glucose tolerance"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must have (a clinical diagnosis of type 2 diabetes mellitus OR a clinical diagnosis of impaired glucose tolerance).
(assert
  (! (or patient_has_diagnosis_of_type_2_diabetes_mellitus_now
         patient_has_diagnosis_of_impaired_glucose_tolerance_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))
