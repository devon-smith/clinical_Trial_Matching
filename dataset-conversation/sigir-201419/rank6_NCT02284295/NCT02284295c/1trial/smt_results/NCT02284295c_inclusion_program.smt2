;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_forced_expiratory_volume_1_fev1_forced_vital_capacity_fvc_ratio_after_bronchodilator_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's post-bronchodilator FEV1/FVC ratio is recorded now (in ratio units).","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's post-bronchodilator FEV1/FVC ratio measured now, in ratio units."}  ;; "post-bronchodilator forced expiratory volume in 1 second/forced vital capacity ratio"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (< patient_forced_expiratory_volume_1_fev1_forced_vital_capacity_fvc_ratio_after_bronchodilator_value_recorded_now_withunit_ratio 0.7)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (post-bronchodilator forced expiratory volume in 1 second/forced vital capacity ratio < 0.7)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD)."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@stable_phase Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of chronic obstructive pulmonary disease (COPD) is in a stable phase (not in exacerbation or acute worsening).","when_to_set_to_false":"Set to false if the patient's current diagnosis of COPD is not in a stable phase (i.e., is in exacerbation or acute worsening).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current COPD is in a stable phase.","meaning":"Boolean indicating whether the patient's current COPD is in a stable phase."} ;; "stable phase of chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for stable phase implies the patient has COPD diagnosis
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@stable_phase
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ1_AUXILIARY0)) ;; "the patient must be in a stable phase of chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@stable_phase
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be in a stable phase of chronic obstructive pulmonary disease"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a tobacco smoker.","when_to_set_to_false":"Set to false if the patient is currently not a tobacco smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a tobacco smoker.","meaning":"Boolean indicating whether the patient is currently a tobacco smoker."} ;; "current tobacco smoker"
(declare-const patient_has_history_of_occupational_exposure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of occupational exposure.","when_to_set_to_false":"Set to false if the patient does not have a documented history of occupational exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of occupational exposure.","meaning":"Boolean indicating whether the patient has a history of occupational exposure."} ;; "history of occupational exposure"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be a current tobacco smoker
(assert
  (! patient_has_finding_of_smoker_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a current tobacco smoker."

;; Component 1: Patient must NOT have a history of occupational exposure
(assert
  (! (not patient_has_history_of_occupational_exposure)
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must NOT have a history of occupational exposure."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_environmental_tobacco_smoke_exposure_value_recorded_inthehistory_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has been exposed to tobacco smoke if such a value is documented in the patient's history.","when_to_set_to_null":"Set to null if the duration of tobacco smoke exposure is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in months of the patient's history of environmental tobacco smoke exposure."} ;; "tobacco smoke exposure"
(declare-const patient_occupational_exposure_duration_value_recorded_inthehistory_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has had occupational exposure relevant to chronic obstructive pulmonary disease risk factors if such a value is documented in the patient's history.","when_to_set_to_null":"Set to null if the duration of occupational exposure is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in months of the patient's history of occupational exposure relevant to chronic obstructive pulmonary disease risk factors."} ;; "occupational exposure"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have (chronic obstructive pulmonary disease risk factor exposure (occupational exposure OR tobacco smoke exposure) duration ≥ 12 months).
(assert
  (! (or (>= patient_occupational_exposure_duration_value_recorded_inthehistory_withunit_months 12.0)
         (>= patient_environmental_tobacco_smoke_exposure_value_recorded_inthehistory_withunit_months 12.0))
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} ;; "the patient must be male"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_sex_is_male_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_caucasian Bool) ;; {"when_to_set_to_true":"Set to true if the patient is identified as Caucasian.","when_to_set_to_false":"Set to false if the patient is identified as not Caucasian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is Caucasian.","meaning":"Boolean indicating whether the patient is identified as Caucasian."} ;; "the patient must be Caucasian"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_caucasian
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be Caucasian."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 40 years AND aged ≤ 75 years"
(declare-const patient_aged_40_years_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if available.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown or not recorded.","meaning":"Numeric value representing the patient's current age in years."} ;; "aged ≥ 40 years"
(declare-const patient_aged_75_years_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if available.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown or not recorded.","meaning":"Numeric value representing the patient's current age in years."} ;; "aged ≤ 75 years"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; The age variables for 40 and 75 years are defined to be equal to the main age variable
(assert
  (! (= patient_aged_40_years_value_recorded_now_withunit_years patient_age_value_recorded_now_in_years)
     :named REQ6_AUXILIARY0)) ;; "aged ≥ 40 years" and "aged ≤ 75 years" use the same age value

(assert
  (! (= patient_aged_75_years_value_recorded_now_withunit_years patient_age_value_recorded_now_in_years)
     :named REQ6_AUXILIARY1)) ;; "aged ≥ 40 years" and "aged ≤ 75 years" use the same age value

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must be aged ≥ 40 years.
(assert
  (! (>= patient_aged_40_years_value_recorded_now_withunit_years 40)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 40 years"

;; Component 1: To be included, the patient must be aged ≤ 75 years.
(assert
  (! (<= patient_aged_75_years_value_recorded_now_withunit_years 75)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 75 years"
