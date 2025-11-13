;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current blood pressure in mm Hg is available.","when_to_set_to_null":"Set to null if no current blood pressure measurement in mm Hg is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood pressure in mm Hg."} ;; "blood pressure"
(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current blood glucose level in mg/dL is available.","when_to_set_to_null":"Set to null if no current blood glucose measurement in mg/dL is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood glucose level in mg/dL."} ;; "blood glucose"

(declare-const patient_has_extreme_blood_pressure_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an extreme blood pressure level (as defined by the study protocol).","when_to_set_to_false":"Set to false if the patient does not currently have an extreme blood pressure level.","when_to_set_to_null":"Set to null if it is indeterminate whether the patient currently has an extreme blood pressure level.","meaning":"Indicates whether the patient currently has an extreme blood pressure level."} ;; "extreme blood pressure levels"
(declare-const patient_has_extreme_blood_glucose_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an extreme blood glucose level (as defined by the study protocol).","when_to_set_to_false":"Set to false if the patient does not currently have an extreme blood glucose level.","when_to_set_to_null":"Set to null if it is indeterminate whether the patient currently has an extreme blood glucose level.","meaning":"Indicates whether the patient currently has an extreme blood glucose level."} ;; "extreme blood glucose levels"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_extreme_blood_pressure_level_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has extreme blood pressure levels."

(assert
(! (not patient_has_extreme_blood_glucose_level_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has extreme blood glucose levels."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_walking_value_recorded_now_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the number of minutes the patient is able to perform walking now, if this information is available.","when_to_set_to_null":"Set to null if the patient's ability to walk (duration in minutes) now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in minutes the patient is able to walk now."} ;; "walk"
(declare-const patient_walking_value_recorded_now_withunit_minutes@@brisk Bool) ;; {"when_to_set_to_true":"Set to true if the walking activity measured is brisk.","when_to_set_to_false":"Set to false if the walking activity measured is not brisk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the walking activity is brisk.","meaning":"Boolean indicating whether the walking activity measured is brisk."} ;; "brisk walk"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and
            patient_walking_value_recorded_now_withunit_minutes@@brisk
            (< patient_walking_value_recorded_now_withunit_minutes 30)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to take a brisk walk of duration equal to 30 minutes."
