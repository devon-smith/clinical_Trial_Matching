;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have a medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical condition.","meaning":"Boolean indicating whether the patient currently has a medical condition."} ;; "medical condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@compromises_survival Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition compromises survival.","when_to_set_to_false":"Set to false if the patient's current medical condition does not compromise survival.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition compromises survival.","meaning":"Boolean indicating whether the patient's current medical condition compromises survival."} ;; "medical condition that compromises survival"

(declare-const patient_has_finding_of_disease_condition_finding_now@@limits_physical_activity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition limits physical activity.","when_to_set_to_false":"Set to false if the patient's current medical condition does not limit physical activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition limits physical activity.","meaning":"Boolean indicating whether the patient's current medical condition limits physical activity."} ;; "medical condition that limits physical activity"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@compromises_survival
      patient_has_finding_of_disease_condition_finding_now)
:named REQ0_AUXILIARY0)) ;; "medical condition that compromises survival"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@limits_physical_activity
      patient_has_finding_of_disease_condition_finding_now)
:named REQ0_AUXILIARY1)) ;; "medical condition that limits physical activity"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@compromises_survival)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical condition that compromises survival."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@limits_physical_activity)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical condition that limits physical activity."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_geriatric_depression_scale_short_form_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Geriatric Depression Scale-15 score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Geriatric Depression Scale-15 score recorded now."} ;; "Geriatric Depression Scale-15 score"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (>= patient_geriatric_depression_scale_short_form_score_value_recorded_now_withunit_score 6))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Geriatric Depression Scale-15 score greater than or equal to 6."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_alcohol_intake_finding_value_recorded_now_withunit_units_per_day Real) ;; {"when_to_set_to_value":"Set to the measured or reported value of the patient's current daily alcohol intake in units per day.","when_to_set_to_null":"Set to null if the patient's current daily alcohol intake is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current daily alcohol intake in units per day."} ;; "alcohol intake greater than 4 units per day"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_alcohol_intake_finding_value_recorded_now_withunit_units_per_day 4))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alcohol intake greater than 4 units per day."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the most recent measured value of the patient's Mini-Mental State Examination (MMSE) score recorded now, in units of 'score'.","when_to_set_to_null":"Set to null if no MMSE score is available for the patient recorded now or if the value is indeterminate.","meaning":"Numeric value representing the patient's most recent Mini-Mental State Examination (MMSE) score recorded now, in units of 'score'."} ;; "Mini-Mental State Examination score"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (< patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 24))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Mini-Mental State Examination score less than 24."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_cdr_clinical_dementia_rating_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Clinical Dementia Rating score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Clinical Dementia Rating score recorded now."} ;; "Clinical Dementia Rating score"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (>= patient_cdr_clinical_dementia_rating_score_value_recorded_now_withunit_score 1))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Clinical Dementia Rating score greater than or equal to 1."
