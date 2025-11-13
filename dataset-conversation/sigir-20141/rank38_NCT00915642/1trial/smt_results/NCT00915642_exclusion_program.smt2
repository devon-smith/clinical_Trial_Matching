;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_serious_physical_health_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious physical health problem (serious medical condition).","when_to_set_to_false":"Set to false if the patient currently does not have a serious physical health problem (serious medical condition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious physical health problem (serious medical condition).","meaning":"Boolean indicating whether the patient currently has a serious physical health problem (serious medical condition)."} ;; "serious medical condition"

(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system."} ;; "neurological condition"

(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the nervous system and the disorder is serious.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the nervous system but it is not serious, or if the patient does not have a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the nervous system is serious.","meaning":"Boolean indicating whether the patient currently has a serious disorder of the nervous system."} ;; "serious neurological condition"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable for nervous system disorder
(assert
(! (=> patient_has_finding_of_disorder_of_nervous_system_now@@serious
       patient_has_finding_of_disorder_of_nervous_system_now)
   :named REQ0_AUXILIARY0)) ;; "serious neurological condition" implies "neurological condition"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a serious medical condition
(assert
(! (not patient_has_finding_of_serious_physical_health_problem_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious medical condition."

;; Exclusion: patient must NOT have a serious neurological condition
(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now@@serious)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious neurological condition."
