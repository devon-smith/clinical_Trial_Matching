;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_undergoing_laparoscopic_bypass_of_stomach_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing laparoscopic bypass of stomach.","when_to_set_to_false":"Set to false if the patient is not currently undergoing laparoscopic bypass of stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing laparoscopic bypass of stomach.","meaning":"Boolean indicating whether the patient is currently undergoing laparoscopic bypass of stomach."} // "To be included, the patient must be undergoing laparoscopic gastric bypass surgery."
(declare-const patient_has_diagnosis_of_obesity_now@@defined_by_inclusion_in_scandinavian_obesity_surgery_registry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of obesity is defined by their inclusion in the Scandinavian Obesity Surgery Registry.","when_to_set_to_false":"Set to false if the patient's diagnosis of obesity is not defined by inclusion in the Scandinavian Obesity Surgery Registry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of obesity is defined by inclusion in the Scandinavian Obesity Surgery Registry.","meaning":"Boolean indicating whether the patient's diagnosis of obesity is defined by inclusion in the Scandinavian Obesity Surgery Registry."} // "To be included, the patient must be included in the Scandinavian Obesity Surgery Registry."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_undergoing_laparoscopic_bypass_of_stomach_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be undergoing laparoscopic gastric bypass surgery."

(assert
  (! patient_has_diagnosis_of_obesity_now@@defined_by_inclusion_in_scandinavian_obesity_surgery_registry
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be included in the Scandinavian Obesity Surgery Registry."
