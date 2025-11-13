;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "the patient has dementia at the time of enrollment as determined by a physician"
(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of delirium.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of delirium.","meaning":"Boolean indicating whether the patient currently has delirium."} ;; "the patient has delirium at the time of enrollment as determined by a physician"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_dementia_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia at the time of enrollment as determined by a physician."

(assert
  (! (not patient_has_finding_of_delirium_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has delirium at the time of enrollment as determined by a physician."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity condition.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity condition.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity condition."} ;; "hypersensitivity"

(declare-const patient_has_finding_of_hypersensitivity_condition_now@@caused_by_any_ingredient_of_mirtazapine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity condition is caused by any ingredient of Mirtazapine.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity condition is not caused by any ingredient of Mirtazapine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypersensitivity condition is caused by any ingredient of Mirtazapine.","meaning":"Boolean indicating whether the patient's current hypersensitivity condition is caused by any ingredient of Mirtazapine."} ;; "hypersensitivity to any ingredient of Mirtazapine"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@caused_by_any_ingredient_of_mirtazapine
      patient_has_finding_of_hypersensitivity_condition_now)
:named REQ1_AUXILIARY0)) ;; "hypersensitivity to any ingredient of Mirtazapine""

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_now@@caused_by_any_ingredient_of_mirtazapine)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to any ingredient of Mirtazapine."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_inability_to_maintain_oral_intake_over_the_course_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to maintain oral intake for the duration of the study.","when_to_set_to_false":"Set to false if the patient is able to maintain oral intake for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to maintain oral intake for the duration of the study.","meaning":"Boolean indicating whether the patient has inability to maintain oral intake over the course of the study."} ;; "inability to maintain oral intake over the course of the study"

(declare-const patient_has_finding_of_mechanical_obstruction_of_alimentary_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mechanical obstruction of the alimentary tract.","when_to_set_to_false":"Set to false if the patient currently does not have mechanical obstruction of the alimentary tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mechanical obstruction of the alimentary tract.","meaning":"Boolean indicating whether the patient currently has mechanical obstruction of the alimentary tract."} ;; "mechanical obstruction of the alimentary tract"

(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} ;; "vomiting"

(declare-const patient_has_finding_of_vomiting_now@@intractable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vomiting is intractable (i.e., cannot be controlled or managed by standard interventions).","when_to_set_to_false":"Set to false if the patient's vomiting is not intractable (i.e., is controllable or manageable).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's vomiting is intractable.","meaning":"Boolean indicating whether the patient's vomiting is intractable."} ;; "vomiting that is intractable"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_mechanical_obstruction_of_alimentary_tract_now
          patient_has_finding_of_vomiting_now@@intractable)
     patient_has_finding_of_inability_to_maintain_oral_intake_over_the_course_of_study)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((mechanical obstruction of the alimentary tract) OR (vomiting that is intractable))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_vomiting_now@@intractable
       patient_has_finding_of_vomiting_now)
:named REQ2_AUXILIARY1)) ;; "vomiting that is intractable" implies "vomiting"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_inability_to_maintain_oral_intake_over_the_course_of_study)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has inability to maintain oral intake over the course of the study with non-exhaustive examples ((mechanical obstruction of the alimentary tract) OR (vomiting that is intractable)))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_ongoing_use_of_tube_feeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ongoing use of tube feeding.","when_to_set_to_false":"Set to false if the patient currently does not have ongoing use of tube feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ongoing use of tube feeding.","meaning":"Boolean indicating whether the patient currently has ongoing use of tube feeding."} ;; "the patient has ongoing use of tube feeding"
(declare-const patient_has_ongoing_use_of_parenteral_nutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ongoing use of parenteral nutrition.","when_to_set_to_false":"Set to false if the patient currently does not have ongoing use of parenteral nutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ongoing use of parenteral nutrition.","meaning":"Boolean indicating whether the patient currently has ongoing use of parenteral nutrition."} ;; "the patient has ongoing use of parenteral nutrition"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_ongoing_use_of_tube_feeding_now
            patient_has_ongoing_use_of_parenteral_nutrition_now))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has ongoing use of tube feeding) OR (the patient has ongoing use of parenteral nutrition)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any corticosteroid or corticosteroid-derivative containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking any corticosteroid or corticosteroid-derivative containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any corticosteroid or corticosteroid-derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking any corticosteroid or corticosteroid-derivative containing product."} ;; "current use of corticosteroids"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any corticosteroid or corticosteroid-derivative containing product in the 1 week prior to study enrollment.","when_to_set_to_false":"Set to false if the patient has not taken any corticosteroid or corticosteroid-derivative containing product in the 1 week prior to study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any corticosteroid or corticosteroid-derivative containing product in the 1 week prior to study enrollment.","meaning":"Boolean indicating whether the patient has taken any corticosteroid or corticosteroid-derivative containing product in the 1 week prior to study enrollment."} ;; "use of corticosteroids in the preceding 1 week prior to study enrollment"
(declare-const patient_is_exposed_to_dronabinol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to dronabinol.","when_to_set_to_false":"Set to false if the patient is not currently exposed to dronabinol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to dronabinol.","meaning":"Boolean indicating whether the patient is currently exposed to dronabinol."} ;; "current use of dronabinol"
(declare-const patient_is_exposed_to_dronabinol_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to dronabinol in the 1 week prior to study enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to dronabinol in the 1 week prior to study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to dronabinol in the 1 week prior to study enrollment.","meaning":"Boolean indicating whether the patient has been exposed to dronabinol in the 1 week prior to study enrollment."} ;; "use of dronabinol in the preceding 1 week prior to study enrollment"
(declare-const patient_is_exposed_to_testosterone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to testosterone.","when_to_set_to_false":"Set to false if the patient is not currently exposed to testosterone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to testosterone.","meaning":"Boolean indicating whether the patient is currently exposed to testosterone."} ;; "current use of testosterone"
(declare-const patient_is_exposed_to_testosterone_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to testosterone in the 1 week prior to study enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to testosterone in the 1 week prior to study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to testosterone in the 1 week prior to study enrollment.","meaning":"Boolean indicating whether the patient has been exposed to testosterone in the 1 week prior to study enrollment."} ;; "use of testosterone in the preceding 1 week prior to study enrollment"
(declare-const patient_is_exposed_to_progesterone_derivatives_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any progesterone derivatives (including but not limited to megestrol acetate).","when_to_set_to_false":"Set to false if the patient is not currently exposed to any progesterone derivatives (including but not limited to megestrol acetate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any progesterone derivatives (including but not limited to megestrol acetate).","meaning":"Boolean indicating whether the patient is currently exposed to any progesterone derivatives (including but not limited to megestrol acetate)."} ;; "current use of progesterone derivatives with non-exhaustive examples (megestrol acetate)"
(declare-const patient_is_exposed_to_megestrol_acetate_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to megestrol acetate in the 1 week prior to study enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to megestrol acetate in the 1 week prior to study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to megestrol acetate in the 1 week prior to study enrollment.","meaning":"Boolean indicating whether the patient has been exposed to megestrol acetate in the 1 week prior to study enrollment."} ;; "use of progesterone derivatives with non-exhaustive examples (megestrol acetate) in the preceding 1 week prior to study enrollment"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: megestrol acetate is a type of progesterone derivative
(assert
(! (=> patient_is_exposed_to_megestrol_acetate_inthepast1weeks
      patient_is_exposed_to_progesterone_derivatives_now)
    :named REQ4_AUXILIARY0)) ;; "progesterone derivatives with non-exhaustive examples (megestrol acetate)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: current use of corticosteroids AND NOT scheduled doses during time of chemotherapy
(declare-const patient_has_scheduled_dose_of_corticosteroid_and_corticosteroid_derivative_containing_product_now@@during_time_of_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has scheduled doses of corticosteroid or corticosteroid-derivative containing product during the time of chemotherapy.","when_to_set_to_false":"Set to false if the patient does not currently have scheduled doses of corticosteroid or corticosteroid-derivative containing product during the time of chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has scheduled doses of corticosteroid or corticosteroid-derivative containing product during the time of chemotherapy.","meaning":"Boolean indicating whether the patient currently has scheduled doses of corticosteroid or corticosteroid-derivative containing product during the time of chemotherapy."} ;; "scheduled doses during time of chemotherapy"

(assert
(! (not (and patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now
             (not patient_has_scheduled_dose_of_corticosteroid_and_corticosteroid_derivative_containing_product_now@@during_time_of_chemotherapy)))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "current use of corticosteroids AND NOT (scheduled doses during time of chemotherapy)"

(assert
(! (not patient_is_exposed_to_dronabinol_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "current use of dronabinol"

(assert
(! (not patient_is_exposed_to_testosterone_now)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "current use of testosterone"

(assert
(! (not patient_is_exposed_to_progesterone_derivatives_now)
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "current use of progesterone derivatives with non-exhaustive examples (megestrol acetate)"

(assert
(! (not patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast1weeks)
    :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "use of corticosteroids in the preceding 1 week prior to study enrollment"

(assert
(! (not patient_is_exposed_to_dronabinol_inthepast1weeks)
    :named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "use of dronabinol in the preceding 1 week prior to study enrollment"

(assert
(! (not patient_is_exposed_to_testosterone_inthepast1weeks)
    :named REQ4_COMPONENT6_OTHER_REQUIREMENTS)) ;; "use of testosterone in the preceding 1 week prior to study enrollment"

(assert
(! (not patient_is_exposed_to_megestrol_acetate_inthepast1weeks)
    :named REQ4_COMPONENT7_OTHER_REQUIREMENTS)) ;; "use of progesterone derivatives with non-exhaustive examples (megestrol acetate) in the preceding 1 week prior to study enrollment"

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_unwilling_to_use_contraceptives_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to use contraceptives.","when_to_set_to_false":"Set to false if the patient is currently willing to use contraceptives.","when_to_set_to_null":"Set to null if the patient's current willingness to use contraceptives is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently unwilling to use contraceptives."} ;; "the patient is unwilling to use contraceptives"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

(assert
(! (not patient_is_unwilling_to_use_contraceptives_now)
:named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to use contraceptives."

;; --- verifier-bypassed (attempt 8/8) 2025-10-25T04:11:10.725780 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_inthepast0days_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured baseline score if a numeric value for the Hospital Anxiety and Depression scale is recorded at baseline.","when_to_set_to_null":"Set to null if no such baseline score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's baseline score on the Hospital Anxiety and Depression scale."} ;; "score greater than 11 at baseline on the Hospital Anxiety and Depression scale"
(declare-const patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured score if a numeric value for a subscale of the Hospital Anxiety and Depression scale is recorded now.","when_to_set_to_null":"Set to null if no such score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current score in a subscale of the Hospital Anxiety and Depression scale."} ;; "score greater than or equal to 11 in each subscale of the Hospital Anxiety and Depression scale"
(declare-const patient_has_finding_of_anxiety_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of anxiety.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of anxiety.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of anxiety.","meaning":"Boolean indicating whether the patient currently has a clinical finding of anxiety."} ;; "indicating clinical anxiety"
(declare-const patient_has_finding_of_moderate_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of moderate depression.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of moderate depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of moderate depression.","meaning":"Boolean indicating whether the patient currently has a clinical finding of moderate depression."} ;; "indicating moderate depression"
(declare-const patient_has_finding_of_severe_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of severe depression.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of severe depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of severe depression.","meaning":"Boolean indicating whether the patient currently has a clinical finding of severe depression."} ;; "indicating severe depression"
(declare-const patient_has_undergone_assessment_using_hospital_anxiety_and_depression_scale_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an assessment using the Hospital Anxiety and Depression scale at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an assessment using the Hospital Anxiety and Depression scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an assessment using the Hospital Anxiety and Depression scale.","meaning":"Boolean indicating whether the patient has ever undergone an assessment using the Hospital Anxiety and Depression scale."} ;; "has a score ... on the Hospital Anxiety and Depression scale"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; If patient has a score >= 11 in each subscale now AND clinical depression, then patient has clinical depression by HADS
(assert
(! (=> (and (>= patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_now_withunit_score 11)
            patient_has_finding_of_moderate_depression_now)
        patient_has_finding_of_moderate_depression_now)
:named REQ6_AUXILIARY0)) ;; "score greater than or equal to 11 in each subscale ... indicating clinical depression"

;; If patient has a score >= 11 in each subscale now AND clinical anxiety, then patient has clinical anxiety by HADS
(assert
(! (=> (and (>= patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_now_withunit_score 11)
            patient_has_finding_of_anxiety_now)
        patient_has_finding_of_anxiety_now)
:named REQ6_AUXILIARY1)) ;; "score greater than or equal to 11 in each subscale ... indicating clinical anxiety"

;; If patient has a score > 11 at baseline AND moderate depression, then patient has moderate depression by HADS
(assert
(! (=> (and (> patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_inthepast0days_withunit_score 11)
            patient_has_finding_of_moderate_depression_now)
        patient_has_finding_of_moderate_depression_now)
:named REQ6_AUXILIARY2)) ;; "score greater than 11 at baseline ... indicating moderate depression"

;; If patient has a score > 11 at baseline AND severe depression, then patient has severe depression by HADS
(assert
(! (=> (and (> patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_inthepast0days_withunit_score 11)
            patient_has_finding_of_severe_depression_now)
        patient_has_finding_of_severe_depression_now)
:named REQ6_AUXILIARY3)) ;; "score greater than 11 at baseline ... indicating severe depression"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT satisfy any of the four exclusion conditions
(assert
(! (not (and (>= patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_now_withunit_score 11)
             patient_has_finding_of_moderate_depression_now))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "score greater than or equal to 11 in each subscale ... indicating clinical depression"

(assert
(! (not (and (>= patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_now_withunit_score 11)
             patient_has_finding_of_anxiety_now))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "score greater than or equal to 11 in each subscale ... indicating clinical anxiety"

(assert
(! (not (and (> patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_inthepast0days_withunit_score 11)
             patient_has_finding_of_moderate_depression_now))
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "score greater than 11 at baseline ... indicating moderate depression"

(assert
(! (not (and (> patient_assessment_using_hospital_anxiety_and_depression_scale_value_recorded_inthepast0days_withunit_score 11)
             patient_has_finding_of_severe_depression_now))
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "score greater than 11 at baseline ... indicating severe depression"

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_benzodiazepine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (using) benzodiazepines.","when_to_set_to_false":"Set to false if the patient is currently not exposed to (not using) benzodiazepines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to benzodiazepines.","meaning":"Boolean indicating whether the patient is currently exposed to benzodiazepines."} ;; "benzodiazepines"
(declare-const patient_is_exposed_to_benzodiazepine_now@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to benzodiazepines is chronic (i.e., ongoing or long-term use).","when_to_set_to_false":"Set to false if the patient's current exposure to benzodiazepines is not chronic (i.e., is acute, short-term, or one-time use).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to benzodiazepines is chronic.","meaning":"Boolean indicating whether the patient's current exposure to benzodiazepines is chronic."} ;; "chronic use of benzodiazepines"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_benzodiazepine_now@@chronic_use
       patient_is_exposed_to_benzodiazepine_now)
   :named REQ7_AUXILIARY0)) ;; "chronic use of benzodiazepines""

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_benzodiazepine_now@@chronic_use)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic use of benzodiazepines."
