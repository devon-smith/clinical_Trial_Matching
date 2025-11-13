;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if there is documentation that the patient has signed informed consent.","when_to_set_to_false":"Set to false if there is documentation that the patient has not signed informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent.","meaning":"Boolean indicating whether the patient has signed informed consent."} // "To be included, the patient must have signed informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "To be included, the patient must have chronic obstructive pulmonary disease."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be aged ≥ 50 years AND ≤ 85 years."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have chronic obstructive pulmonary disease."

(assert
  (! (>= patient_age_value_recorded_now_in_years 50)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 50 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 85 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const duration_of_patient_history_of_chronic_obstructive_lung_disease_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has had a history of chronic obstructive lung disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many years the patient has had a history of chronic obstructive lung disease (COPD).","meaning":"Numeric variable indicating the duration, in years, that the patient has had a history of chronic obstructive lung disease (COPD)."} // "history of chronic obstructive pulmonary disease for ≥ 1 year"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of chronic obstructive lung disease (COPD) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of chronic obstructive lung disease (COPD) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of chronic obstructive lung disease (COPD).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of chronic obstructive lung disease (COPD) in their history."} // "history of chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory
          (>= duration_of_patient_history_of_chronic_obstructive_lung_disease_in_years 1.0))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a history of chronic obstructive pulmonary disease for ≥ 1 year."

;; ===================== Declarations for the criterion (REQ 3) =====================
;; "To be included, the patient must have chronic obstructive pulmonary disease."
;; Already declared: patient_has_diagnosis_of_chronic_obstructive_lung_disease_now

(declare-const patient_has_finding_of_patient_s_condition_stable_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been clinically stable at any time during the last 3 months.","when_to_set_to_false":"Set to false if the patient has not been clinically stable at any time during the last 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been clinically stable during the last 3 months.","meaning":"Boolean indicating whether the patient has been clinically stable during the last 3 months."} // "To be included, the patient must have been clinically stable in the last 3 months."

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "To be included, the patient must have chronic obstructive pulmonary disease."
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 1: "To be included, the patient must have been clinically stable in the last 3 months."
(assert
  (! patient_has_finding_of_patient_s_condition_stable_inthepast3months
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
;; Variable for FEV1 as percent of predicted
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's forced expiratory volume in one second (FEV1) as a percent of predicted is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current FEV1 as a percent of predicted."} // "forced expiratory volume at one second < 50% of predicted value"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must have chronic obstructive pulmonary disease
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic obstructive pulmonary disease."

;; Component 1: Must have FEV1 < 50% of predicted value
(assert
  (! (< patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted 50.0)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have forced expiratory volume at one second < 50% of predicted value."

;; ===================== Declarations for the criterion (REQ 5) =====================
;; "To be included, the patient must have chronic obstructive pulmonary disease."
;; Already declared in previous SMT program:
;; (declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "To be included, the patient must have chronic obstructive pulmonary disease."

(declare-const patient_residual_respiratory_volume_value_recorded_now_withunit_ml Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's residual respiratory volume in milliliters is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current residual respiratory volume in milliliters."} // "residual volume"
(declare-const patient_predicted_residual_respiratory_volume_value_now_withunit_ml Real) ;; {"when_to_set_to_value":"Set to the predicted value if a numeric prediction of the patient's residual respiratory volume in milliliters is available for the current time.","when_to_set_to_null":"Set to null if no such prediction is available or the value is indeterminate.","meaning":"Numeric value representing the patient's predicted residual respiratory volume in milliliters at the current time."} // "residual volume > 125% of predicted value"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: "To be included, the patient must have chronic obstructive pulmonary disease."
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; Component 1: "To be included, the patient must have residual volume > 125% of predicted value."
(assert
  (! (> patient_residual_respiratory_volume_value_recorded_now_withunit_ml
        (* 1.25 patient_predicted_residual_respiratory_volume_value_now_withunit_ml))
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's FEV1/FVC ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current FEV1/FVC ratio."} // "forced expiratory volume at one second (FEV1) to forced vital capacity (FVC) ratio"
(declare-const patient_low_level_of_normality_for_fev1_to_fvc_ratio_value_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured or calculated percentage value if the patient's low level of normality for FEV1/FVC ratio is available now.","when_to_set_to_null":"Set to null if no such measurement or calculation is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current low level of normality for FEV1/FVC ratio."} // "low levels of normality"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "if female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "if male"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; None required for this requirement, as all logic is direct.

;; ===================== Constraint Assertions (REQ 6) =====================
;; To be included, the patient must have (FEV1/FVC ratio < 88% of low levels of normality if male) OR (FEV1/FVC ratio < 89% of low levels of normality if female).
(assert
  (! (or
        (and patient_sex_is_male_now
             (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent
                (* 0.88 patient_low_level_of_normality_for_fev1_to_fvc_ratio_value_now_withunit_percent)))
        (and patient_sex_is_female_now
             (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent
                (* 0.89 patient_low_level_of_normality_for_fev1_to_fvc_ratio_value_now_withunit_percent))))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (forced expiratory volume at one second (FEV1) to forced vital capacity (FVC) ratio < 88% of low levels of normality if male) OR (forced expiratory volume at one second (FEV1) to forced vital capacity (FVC) ratio < 89% of low levels of normality if female)."

;; ===================== Declarations for the criterion (REQ 7) =====================
;; "To be included, the patient must have chronic obstructive pulmonary disease."
;; Already declared in previous SMT: patient_has_diagnosis_of_chronic_obstructive_lung_disease_now

(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a smoker, including both former and active smokers.","when_to_set_to_false":"Set to false if the patient is not currently classified as a smoker (never smoked or status unknown).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker (including both former and active smokers)."} // "smoker"
(declare-const patient_has_finding_of_smoker_now@@former_smoker_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a former smoker.","when_to_set_to_false":"Set to false if the patient is not currently classified as a former smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a former smoker.","meaning":"Boolean indicating whether the patient is currently a former smoker."} // "former smoker"
(declare-const patient_has_finding_of_smoker_now@@active_smoker_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an active smoker.","when_to_set_to_false":"Set to false if the patient is not currently classified as an active smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is an active smoker.","meaning":"Boolean indicating whether the patient is currently an active smoker."} // "active smoker"
(declare-const patient_smoking_pack_years_value_recorded_in_history_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's total smoking history in pack years, as recorded in the patient's history.","when_to_set_to_null":"Set to null if the patient's total smoking history in pack years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the total number of pack years of smoking recorded in the patient's history, measured in pack years."} // "smoking history of ≥ 20 pack years"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_smoker_now@@former_smoker_status
         patient_has_finding_of_smoker_now)
     :named REQ7_AUXILIARY0)) ;; "be a former smoker"

(assert
  (! (=> patient_has_finding_of_smoker_now@@active_smoker_status
         patient_has_finding_of_smoker_now)
     :named REQ7_AUXILIARY1)) ;; "be an active smoker"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: Must have chronic obstructive pulmonary disease
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic obstructive pulmonary disease."

;; Component 1: Must be a former smoker OR (active smoker AND ≥ 20 pack years)
(assert
  (! (or patient_has_finding_of_smoker_now@@former_smoker_status
         (and patient_has_finding_of_smoker_now@@active_smoker_status
              (>= patient_smoking_pack_years_value_recorded_in_history_withunit_pack_years 20)))
     :named REQ7_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be a former smoker) OR (be an active smoker AND have a smoking history of ≥ 20 pack years))."
