;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_precapillary_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of precapillary pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of precapillary pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has precapillary pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has precapillary pulmonary hypertension."} // "have precapillary pulmonary hypertension"
(declare-const patient_has_finding_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease."} // "have interstitial lung disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_finding_of_precapillary_pulmonary_hypertension_now
         patient_has_finding_of_interstitial_lung_disease_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have precapillary pulmonary hypertension OR have interstitial lung disease)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_nyha_class_now Int) ;; {"when_to_set_to_value":"Set to the integer value corresponding to the patient's current NYHA class (e.g., 1, 2, 3, or 4) if it is documented or can be determined.","when_to_set_to_null":"Set to null if the patient's current NYHA class is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current New York Heart Association (NYHA) class."} // "be New York Heart Association class 2 OR be New York Heart Association class 3"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or (= patient_has_nyha_class_now 2)
         (= patient_has_nyha_class_now 3))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (be New York Heart Association class 2 OR be New York Heart Association class 3)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_altitude_value_recorded_in_meters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the altitude in meters where the patient resides, if known and documented.","when_to_set_to_null":"Set to null if the altitude at which the patient resides is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the altitude in meters at which the patient resides."} // "altitude < 800 meters"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (< patient_altitude_value_recorded_in_meters 800.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must reside at low altitude (altitude < 800 meters)."
