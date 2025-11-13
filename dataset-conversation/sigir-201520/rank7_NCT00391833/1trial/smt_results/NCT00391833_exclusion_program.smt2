;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the nervous system."} ;; "neurologic disease"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now@@is_other_than_primary_disease_under_study Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosed disorder of the nervous system is not the primary disease under study.","when_to_set_to_false":"Set to false if the diagnosed disorder of the nervous system is the primary disease under study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosed disorder of the nervous system is the primary disease under study.","meaning":"Boolean indicating whether the diagnosed disorder of the nervous system is not the primary disease under study."} ;; "another neurologic disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_now@@is_other_than_primary_disease_under_study
      patient_has_diagnosis_of_disorder_of_nervous_system_now)
   :named REQ0_AUXILIARY0)) ;; "another neurologic disease" (the 'other than primary disease under study' qualifier)

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_nervous_system_now@@is_other_than_primary_disease_under_study)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another neurologic disease."
