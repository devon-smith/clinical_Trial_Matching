;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_in_intensive_care_unit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in the intensive care unit at the time of inclusion.","when_to_set_to_false":"Set to false if the patient is not currently in the intensive care unit at the time of inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in the intensive care unit at the time of inclusion.","meaning":"Boolean indicating whether the patient is currently in the intensive care unit at the time of inclusion."} ;; "the patient must be in the intensive care unit"
(declare-const patient_is_using_mechanical_ventilator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a mechanical ventilator at the time of inclusion.","when_to_set_to_false":"Set to false if the patient is not currently using a mechanical ventilator at the time of inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a mechanical ventilator at the time of inclusion.","meaning":"Boolean indicating whether the patient is currently using a mechanical ventilator at the time of inclusion."} ;; "the patient must be using a mechanical ventilator"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_in_intensive_care_unit_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be in the intensive care unit"

(assert
  (! patient_is_using_mechanical_ventilator_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must be using a mechanical ventilator"
