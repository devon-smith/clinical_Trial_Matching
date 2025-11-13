;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute abdomen.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute abdomen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute abdomen.","meaning":"Boolean indicating whether the patient currently has acute abdomen."}  ;; "To be included, the patient must have acute abdomen."
(declare-const patient_is_undergoing_operation_on_abdominal_region_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing abdominal surgery.","when_to_set_to_false":"Set to false if the patient is currently not undergoing abdominal surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing abdominal surgery.","meaning":"Boolean indicating whether the patient is currently undergoing abdominal surgery."}  ;; "To be included, the patient must be undergoing abdominal surgery under emergency."
(declare-const patient_is_undergoing_operation_on_abdominal_region_now@@performed_under_emergency Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current abdominal surgery is performed under emergency conditions.","when_to_set_to_false":"Set to false if the patient's current abdominal surgery is not performed under emergency conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abdominal surgery is performed under emergency conditions.","meaning":"Boolean indicating whether the patient's current abdominal surgery is performed under emergency conditions."}  ;; "To be included, the patient must be undergoing abdominal surgery under emergency."
(declare-const patient_is_present_in_intensive_care_unit_on_arrival Bool) ;; {"when_to_set_to_true":"Set to true if the patient is present in the intensive care unit at the time of arrival.","when_to_set_to_false":"Set to false if the patient is not present in the intensive care unit at the time of arrival.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is present in the intensive care unit at the time of arrival.","meaning":"Boolean indicating whether the patient is present in the intensive care unit at the time of arrival."}  ;; "To be included, the patient must present on arrival in intensive care unit with at least a sign of bad perfusion."
(declare-const patient_has_finding_of_bad_perfusion_on_arrival_to_intensive_care_unit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at least one sign of bad perfusion on arrival to the intensive care unit.","when_to_set_to_false":"Set to false if the patient does not have any sign of bad perfusion on arrival to the intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has at least one sign of bad perfusion on arrival to the intensive care unit.","meaning":"Boolean indicating whether the patient has at least one sign of bad perfusion on arrival to the intensive care unit."}  ;; "To be included, the patient must present on arrival in intensive care unit with at least a sign of bad perfusion."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for emergency abdominal surgery implies abdominal surgery
(assert
  (! (=> patient_is_undergoing_operation_on_abdominal_region_now@@performed_under_emergency
         patient_is_undergoing_operation_on_abdominal_region_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must be undergoing abdominal surgery under emergency."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Acute abdomen
(assert
  (! patient_has_finding_of_acute_abdomen_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute abdomen."

;; Component 1: Abdominal surgery under emergency
(assert
  (! patient_is_undergoing_operation_on_abdominal_region_now@@performed_under_emergency
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be undergoing abdominal surgery under emergency."

;; Component 2: Present in ICU on arrival with at least a sign of bad perfusion
(assert
  (! (and patient_is_present_in_intensive_care_unit_on_arrival
          patient_has_finding_of_bad_perfusion_on_arrival_to_intensive_care_unit)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must present on arrival in intensive care unit with at least a sign of bad perfusion."
