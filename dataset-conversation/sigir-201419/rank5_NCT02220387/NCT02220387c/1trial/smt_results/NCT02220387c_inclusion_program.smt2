;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_forced_expiratory_volume_1_fev1_forced_vital_capacity_fvc_ratio_after_bronchodilator_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's post-bronchodilator FEV1/FVC ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-bronchodilator FEV1/FVC ratio measured now."}  ;; "post-bronchodilator forced expiratory volume in 1 second ratio"
(declare-const patient_forced_vital_capacity_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's post-bronchodilator FVC ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-bronchodilator forced vital capacity (FVC) ratio measured now."}  ;; "forced vital capacity"
(declare-const patient_forced_vital_capacity_value_recorded_now_withunit_ratio@@post_bronchodilator Bool) ;; {"when_to_set_to_true":"Set to true if the FVC ratio measurement was taken post-bronchodilator.","when_to_set_to_false":"Set to false if the FVC ratio measurement was not taken post-bronchodilator.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken post-bronchodilator.","meaning":"Boolean indicating whether the FVC ratio measurement was taken post-bronchodilator."} ;; "forced vital capacity" (post-bronchodilator qualifier)

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: post-bronchodilator FEV1/FVC ratio < 0.7
(assert
  (! (< patient_forced_expiratory_volume_1_fev1_forced_vital_capacity_fvc_ratio_after_bronchodilator_value_recorded_now_withunit_ratio 0.7)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have post-bronchodilator forced expiratory volume in 1 second ratio < 0.7."

;; Component 1: post-bronchodilator forced vital capacity ratio < 0.7
(assert
  (! (and patient_forced_vital_capacity_value_recorded_now_withunit_ratio@@post_bronchodilator
          (< patient_forced_vital_capacity_value_recorded_now_withunit_ratio 0.7))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have post-bronchodilator forced vital capacity ratio < 0.7."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now@@stable_phase Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease and the disease is in a stable phase.","when_to_set_to_false":"Set to false if the patient currently has chronic obstructive pulmonary disease but the disease is not in a stable phase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic obstructive pulmonary disease is in a stable phase.","meaning":"Boolean indicating whether the patient's chronic obstructive pulmonary disease is in a stable phase."} ;; "stable phase of chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable (stable phase) implies the stem variable (COPD)
(assert
  (! (=> patient_has_finding_of_chronic_obstructive_lung_disease_now@@stable_phase
         patient_has_finding_of_chronic_obstructive_lung_disease_now)
     :named REQ1_AUXILIARY0)) ;; "the patient must be in a stable phase of chronic obstructive pulmonary disease."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_chronic_obstructive_lung_disease_now@@stable_phase
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be in a stable phase of chronic obstructive pulmonary disease."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as a smoker.","when_to_set_to_false":"Set to false if the patient is currently documented as not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} ;; "current tobacco smoker"
(declare-const patient_has_finding_of_smoker_now@@smoking_is_of_tobacco Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker and the substance smoked is tobacco.","when_to_set_to_false":"Set to false if the patient is currently a smoker but the substance smoked is not tobacco.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the substance smoked is tobacco.","meaning":"Boolean indicating whether the patient's current smoking is of tobacco."} ;; "current tobacco smoker"
(declare-const patient_has_history_of_occupational_exposure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of occupational exposure.","when_to_set_to_false":"Set to false if the patient does not have a documented history of occupational exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of occupational exposure.","meaning":"Boolean indicating whether the patient has a history of occupational exposure."} ;; "history of occupational exposure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for tobacco smoking implies the patient is a current smoker
(assert
  (! (=> patient_has_finding_of_smoker_now@@smoking_is_of_tobacco
         patient_has_finding_of_smoker_now)
     :named REQ2_AUXILIARY0)) ;; "current tobacco smoker"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Patient must be a current tobacco smoker
(assert
  (! patient_has_finding_of_smoker_now@@smoking_is_of_tobacco
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "current tobacco smoker"

;; Component 1: Patient must NOT have history of occupational exposure
(assert
  (! (not patient_has_history_of_occupational_exposure)
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "NOT have history of occupational exposure"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_risk_factor_value_recorded_inthehistory_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months if the patient's history documents the duration of exposure to a risk factor related to chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if the duration of exposure to such a risk factor is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the duration in months of the patient's exposure to a risk factor for chronic obstructive pulmonary disease, as recorded in the patient's history."} ;; "risk factor exposure duration"
(declare-const patient_risk_factor_value_recorded_inthehistory_withunit_months@@related_to_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the risk factor exposure duration recorded in the patient's history is specifically related to chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the risk factor exposure duration is not related to chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or indeterminate whether the risk factor is related to chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the risk factor exposure duration is specifically related to chronic obstructive pulmonary disease."} ;; "risk factor exposure duration related to chronic obstructive pulmonary disease"
(declare-const patient_risk_factor_value_recorded_inthehistory_withunit_months@@related_to_tobacco_smoke Bool) ;; {"when_to_set_to_true":"Set to true if the risk factor exposure duration recorded in the patient's history is specifically related to tobacco smoke.","when_to_set_to_false":"Set to false if the risk factor exposure duration is not related to tobacco smoke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or indeterminate whether the risk factor is related to tobacco smoke.","meaning":"Boolean indicating whether the risk factor exposure duration is specifically related to tobacco smoke."} ;; "risk factor exposure duration related to tobacco smoke"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply the existence of a risk factor exposure duration value
(assert
  (! (=> patient_risk_factor_value_recorded_inthehistory_withunit_months@@related_to_chronic_obstructive_pulmonary_disease
         (exists ((d Real)) (= d patient_risk_factor_value_recorded_inthehistory_withunit_months)))
     :named REQ3_AUXILIARY0)) ;; "risk factor exposure duration related to chronic obstructive pulmonary disease" implies a value is recorded

(assert
  (! (=> patient_risk_factor_value_recorded_inthehistory_withunit_months@@related_to_tobacco_smoke
         (exists ((d Real)) (= d patient_risk_factor_value_recorded_inthehistory_withunit_months)))
     :named REQ3_AUXILIARY1)) ;; "risk factor exposure duration related to tobacco smoke" implies a value is recorded

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must have (chronic obstructive pulmonary disease risk factor exposure duration ≥ 12 months) OR (tobacco smoke risk factor exposure duration ≥ 12 months).
(assert
  (! (or
        (and patient_risk_factor_value_recorded_inthehistory_withunit_months@@related_to_chronic_obstructive_pulmonary_disease
             (>= patient_risk_factor_value_recorded_inthehistory_withunit_months 12.0))
        (and patient_risk_factor_value_recorded_inthehistory_withunit_months@@related_to_tobacco_smoke
             (>= patient_risk_factor_value_recorded_inthehistory_withunit_months 12.0)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (chronic obstructive pulmonary disease risk factor exposure duration ≥ 12 months) OR (tobacco smoke risk factor exposure duration ≥ 12 months)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "the patient must be male"

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
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged (≥ 40 years AND ≤ 75 years)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must be aged ≥ 40 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 40.0)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 40 years."

;; Component 1: To be included, the patient must be aged ≤ 75 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75.0)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 75 years."
