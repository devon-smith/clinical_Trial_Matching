;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_healthy_volunteer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a healthy volunteer.","when_to_set_to_false":"Set to false if the patient is currently not a healthy volunteer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a healthy volunteer.","meaning":"Boolean indicating whether the patient is currently a healthy volunteer."} // "the patient must be a volunteer with health (i.e., the patient must be a healthy volunteer)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_healthy_volunteer_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a volunteer with health (i.e., the patient must be a healthy volunteer)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_coffee_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has consumed coffee now (i.e., is currently exposed to coffee).","when_to_set_to_false":"Set to false if the patient has not consumed coffee now (i.e., is not currently exposed to coffee).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has consumed coffee now.","meaning":"Boolean indicating whether the patient is currently exposed to (has consumed) coffee."} // "the patient must not have consumed coffee"
(declare-const patient_is_exposed_to_substance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has consumed any substance now (i.e., is currently exposed to any substance).","when_to_set_to_false":"Set to false if the patient has not consumed any substance now (i.e., is not currently exposed to any substance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has consumed any substance now.","meaning":"Boolean indicating whether the patient is currently exposed to any substance."} // "any other substance"
(declare-const patient_is_exposed_to_substance_now@@possible_action_on_autonomic_nervous_system Bool) ;; {"when_to_set_to_true":"Set to true if the substance to which the patient is currently exposed has possible action on the autonomic nervous system.","when_to_set_to_false":"Set to false if the substance to which the patient is currently exposed does not have possible action on the autonomic nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the substance to which the patient is currently exposed has possible action on the autonomic nervous system.","meaning":"Boolean indicating whether the substance to which the patient is currently exposed has possible action on the autonomic nervous system."} // "any other substance with possible action on the autonomic nervous system"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_exposed_to_substance_now@@possible_action_on_autonomic_nervous_system
         patient_is_exposed_to_substance_now)
     :named REQ1_AUXILIARY0)) ;; "any other substance with possible action on the autonomic nervous system" implies "any other substance"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must not have consumed coffee OR must not have consumed any other substance with possible action on the autonomic nervous system.
(assert
  (! (or (not patient_is_exposed_to_coffee_now)
         (not patient_is_exposed_to_substance_now@@possible_action_on_autonomic_nervous_system))
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must not have consumed coffee or must not have consumed any other substance with possible action on the autonomic nervous system"
