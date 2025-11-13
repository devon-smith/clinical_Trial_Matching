;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_intends_to_travel_to_tropical_areas Bool) ;; {"when_to_set_to_true":"Set to true if the patient intends to travel to tropical areas.","when_to_set_to_false":"Set to false if the patient does not intend to travel to tropical areas.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient intends to travel to tropical areas.","meaning":"Boolean indicating whether the patient intends to travel to tropical areas."} // "To be included, the patient must intend to travel to tropical areas."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_intends_to_travel_to_tropical_areas
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must intend to travel to tropical areas."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_general_health_good_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in good general health status.","when_to_set_to_false":"Set to false if the patient is currently not in good general health status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in good general health status.","meaning":"Boolean indicating whether the patient is currently in good general health status."} // "To be included, the patient must be in good general health status."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_general_health_good_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be in good general health status."
