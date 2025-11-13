;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_arterial_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's arterial blood pressure is recorded now (at presentation) in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's arterial blood pressure measured now (at presentation), in millimeters of mercury."} // "arterial pressure < 100 millimeters of mercury at presentation."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (< patient_arterial_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "arterial pressure < 100 millimeters of mercury at presentation."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_symptoms_of_unresponsive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of unresponsiveness.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of unresponsiveness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of unresponsiveness.","meaning":"Boolean indicating whether the patient currently has symptoms of unresponsiveness."} // "unresponsiveness"
(declare-const patient_has_symptoms_of_syncope_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of syncope.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of syncope.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of syncope.","meaning":"Boolean indicating whether the patient currently has symptoms of syncope."} // "syncope"
(declare-const patient_has_symptoms_of_impaired_mental_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of impaired mental status.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of impaired mental status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of impaired mental status.","meaning":"Boolean indicating whether the patient currently has symptoms of impaired mental status."} // "impaired mental status"
(declare-const patient_has_symptoms_of_respiratory_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of respiratory distress.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of respiratory distress.","meaning":"Boolean indicating whether the patient currently has symptoms of respiratory distress."} // "respiratory distress"
(declare-const patient_has_symptoms_of_malaise_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of malaise.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of malaise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of malaise.","meaning":"Boolean indicating whether the patient currently has symptoms of malaise."} // "malaise"
(declare-const patient_has_symptoms_of_malaise_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of malaise and the malaise is severe.","when_to_set_to_false":"Set to false if the patient currently has symptoms of malaise but the malaise is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malaise is severe.","meaning":"Boolean indicating whether the patient currently has symptoms of malaise and the malaise is severe."} // "severe malaise"
(declare-const patient_has_symptoms_of_fatigue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of fatigue.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of fatigue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of fatigue.","meaning":"Boolean indicating whether the patient currently has symptoms of fatigue."} // "fatigue"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for severe malaise implies malaise
(assert
  (! (=> patient_has_symptoms_of_malaise_now@@severe
         patient_has_symptoms_of_malaise_now)
     :named REQ1_AUXILIARY0)) ;; "severe malaise" is a subtype of "malaise"

;; ===================== Constraint Assertions (REQ 1) =====================
;; At least one of the exhaustive subcategories must be present
(assert
  (! (or patient_has_symptoms_of_unresponsive_now
         patient_has_symptoms_of_syncope_now
         patient_has_symptoms_of_impaired_mental_status_now
         patient_has_symptoms_of_respiratory_distress_now
         patient_has_symptoms_of_malaise_now@@severe
         patient_has_symptoms_of_fatigue_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have at least one of the following symptoms with exhaustive subcategories (unresponsiveness OR syncope OR impaired mental status OR respiratory distress OR severe malaise OR fatigue)."
