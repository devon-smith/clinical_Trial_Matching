;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown or not documented.","meaning":"Indicates whether the patient's current recorded sex is female."} // "To be included, the patient must be a woman."
(declare-const patient_is_postmenopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently postmenopausal.","when_to_set_to_false":"Set to false if the patient is currently not postmenopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently postmenopausal.","meaning":"Boolean indicating whether the patient is currently postmenopausal."} // "To be included, the patient must be postmenopausal."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_sex_is_female_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a woman."
(assert
  (! patient_is_postmenopausal_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be postmenopausal."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_mild_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mild hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have mild hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mild hypertension.","meaning":"Boolean indicating whether the patient currently has mild hypertension."} // "To be included, the patient must have mild hypertension or have moderate hypertension."
(declare-const patient_has_finding_of_moderate_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have moderate hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate hypertension.","meaning":"Boolean indicating whether the patient currently has moderate hypertension."} // "To be included, the patient must have mild hypertension or have moderate hypertension."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_has_finding_of_mild_hypertension_now
         patient_has_finding_of_moderate_hypertension_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (mild hypertension) OR (moderate hypertension)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_statin_prophylaxis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving statin prophylaxis (statin therapy) now.","when_to_set_to_false":"Set to false if the patient is not currently receiving statin prophylaxis (statin therapy) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving statin prophylaxis (statin therapy) now.","meaning":"Boolean indicating whether the patient is currently receiving statin prophylaxis (statin therapy) now."} // "be receiving statin therapy"
(declare-const patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current low-density lipoprotein cholesterol concentration in millimoles per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current low-density lipoprotein cholesterol concentration in millimoles per liter."} // "low-density lipoprotein cholesterol concentration ≤ 4.1 millimoles per liter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_is_undergoing_statin_prophylaxis_now
         (<= patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_millimoles_per_liter 4.1))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must (be receiving statin therapy) OR (have low-density lipoprotein cholesterol concentration ≤ 4.1 millimoles per liter)"
