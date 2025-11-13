;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged 60 years or older"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: The patient must be aged 60 years or older.
(assert
  (! (>= patient_age_value_recorded_now_in_years 60)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged 60 years or older."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_systolic_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of systolic hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of systolic hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of systolic hypertension.","meaning":"Boolean indicating whether the patient currently has systolic hypertension."} ;; "systolic hypertension"
(declare-const patient_has_finding_of_systolic_hypertension_now@@isolated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systolic hypertension and the hypertension is isolated (not accompanied by diastolic hypertension).","when_to_set_to_false":"Set to false if the patient currently has systolic hypertension but it is not isolated (i.e., accompanied by diastolic hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's systolic hypertension is isolated.","meaning":"Boolean indicating whether the patient's systolic hypertension is isolated (not accompanied by diastolic hypertension)."} ;; "isolated systolic hypertension"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_systolic_hypertension_now@@isolated
         patient_has_finding_of_systolic_hypertension_now)
     :named REQ1_AUXILIARY0)) ;; "isolated systolic hypertension" means the patient has systolic hypertension

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_systolic_hypertension_now@@isolated
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have isolated systolic hypertension."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured diastolic blood pressure value in mm Hg if a measurement is recorded for the patient at the current time.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement is available for the patient at the current time or the value is indeterminate.","meaning":"Numeric value representing the patient's diastolic blood pressure in mm Hg measured now."} ;; "diastolic blood pressure < 90 mm Hg"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (diastolic blood pressure < 90 mm Hg).
(assert
  (! (< patient_diastolic_blood_pressure_value_recorded_now_withunit_mm_hg 90.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))
