;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding (medical condition).","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding (medical condition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding (medical condition).","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding (medical condition)."}

(declare-const patient_has_finding_of_disease_condition_finding_now@@requires_immediate_investigation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition requires immediate investigation.","when_to_set_to_false":"Set to false if the patient's current medical condition does not require immediate investigation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition requires immediate investigation.","meaning":"Boolean indicating whether the patient's current medical condition requires immediate investigation."}

(declare-const patient_has_finding_of_disease_condition_finding_now@@requires_immediate_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition requires immediate treatment.","when_to_set_to_false":"Set to false if the patient's current medical condition does not require immediate treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition requires immediate treatment.","meaning":"Boolean indicating whether the patient's current medical condition requires immediate treatment."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@requires_immediate_investigation
      patient_has_finding_of_disease_condition_finding_now)
:named REQ0_AUXILIARY0)) ;; "the patient has any medical condition requiring immediate investigation"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@requires_immediate_treatment
      patient_has_finding_of_disease_condition_finding_now)
:named REQ0_AUXILIARY1)) ;; "the patient has any medical condition requiring immediate treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@requires_immediate_investigation)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any medical condition requiring immediate investigation."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@requires_immediate_treatment)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any medical condition requiring immediate treatment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_beck_depression_inventory_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Beck Depression Inventory score is recorded now.","when_to_set_to_null":"Set to null if no Beck Depression Inventory score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Beck Depression Inventory score recorded now."} ;; "Beck Depression Inventory score"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (> patient_beck_depression_inventory_score_value_recorded_now_withunit_score 16))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Beck Depression Inventory score greater than sixteen."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of insulin-dependent diabetes mellitus (type 1 diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of insulin-dependent diabetes mellitus (type 1 diabetes mellitus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has insulin-dependent diabetes mellitus (type 1 diabetes mellitus).","meaning":"Boolean indicating whether the patient currently has insulin-dependent diabetes mellitus (type 1 diabetes mellitus)."} ;; "insulin-dependent diabetes mellitus"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_type_1_diabetes_mellitus_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has insulin-dependent diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_alcohol_intake_finding_value_recorded_now_withunit_standard_alcoholic_drinks_per_week Real) ;; {"when_to_set_to_value":"Set to the measured or reported number of standard alcoholic drinks the patient consumes per week, if available, for the current time.","when_to_set_to_null":"Set to null if the patient's current weekly alcohol consumption is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current alcohol consumption in standard alcoholic drinks per week."} ;; "alcohol consumption"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "the patient is female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} ;; "the patient is male"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: ((male AND alcohol > 70) OR (female AND alcohol > 52))
(assert
(! (not (or (and patient_sex_is_male_now
                 (> patient_alcohol_intake_finding_value_recorded_now_withunit_standard_alcoholic_drinks_per_week 70))
            (and patient_sex_is_female_now
                 (> patient_alcohol_intake_finding_value_recorded_now_withunit_standard_alcoholic_drinks_per_week 52))))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is male) AND (the patient has alcohol consumption greater than seventy standard alcoholic drinks per week)) OR ((the patient is female) AND (the patient has alcohol consumption greater than fifty-two standard alcoholic drinks per week))."

;; --- verifier-bypassed (attempt 8/8) 2025-10-25T05:07:30.743550 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has pregnancy"
(declare-const patient_has_finding_of_finding_of_lactation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lactation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lactation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of lactation.","meaning":"Boolean indicating whether the patient currently has the clinical finding of lactation."} ;; "lactation"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient has lactation"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; "the patient has lactation" is true if the patient is currently lactating or has the clinical finding of lactation
(assert
(! (= patient_is_lactating_now patient_has_finding_of_finding_of_lactation_now)
    :named REQ4_AUXILIARY0)) ;; "the patient has lactation"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pregnancy."
(assert
(! (not patient_is_lactating_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lactation."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder (of any type).","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder (of any type).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "psychiatric disorder"
(declare-const patient_has_finding_of_mental_disorder_now@@classified_as_dsm_iv_axis_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disorder is classified as a DSM-IV Axis 1 psychiatric disorder.","when_to_set_to_false":"Set to false if the patient's current mental disorder is not classified as a DSM-IV Axis 1 psychiatric disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current mental disorder is classified as a DSM-IV Axis 1 psychiatric disorder.","meaning":"Boolean indicating whether the patient's current mental disorder is classified as a DSM-IV Axis 1 psychiatric disorder."} ;; "Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition Axis 1 psychiatric disorder"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@classified_as_dsm_iv_axis_1
      patient_has_finding_of_mental_disorder_now)
:named REQ5_AUXILIARY0)) ;; "DSM-IV Axis 1 psychiatric disorder is a subclass of mental disorder"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@classified_as_dsm_iv_axis_1)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition Axis 1 psychiatric disorder."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_psychoactive_substance_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any psychoactive substance in the past three months.","when_to_set_to_false":"Set to false if the patient has not been exposed to any psychoactive substance in the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any psychoactive substance in the past three months.","meaning":"Boolean indicating whether the patient has been exposed to any psychoactive substance in the past three months."} ;; "regular use of any therapeutic psychoactive drug during the last three months" / "regular use of any recreational psychoactive drug during the last three months"

(declare-const patient_is_exposed_to_psychoactive_substance_inthepast3months@@regular_use Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to psychoactive substance in the past three months is regular (i.e., occurs with a consistent pattern/frequency).","when_to_set_to_false":"Set to false if the exposure is not regular (i.e., sporadic or one-time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is regular.","meaning":"Boolean indicating whether the exposure to psychoactive substance in the past three months is regular."} ;; "regular use"

(declare-const patient_is_exposed_to_psychoactive_substance_inthepast3months@@therapeutic_context Bool) ;; {"when_to_set_to_true":"Set to true if the psychoactive substance exposure in the past three months is in a therapeutic (prescribed/medical) context.","when_to_set_to_false":"Set to false if the exposure is not in a therapeutic context (e.g., recreational or non-medical).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is therapeutic.","meaning":"Boolean indicating whether the exposure to psychoactive substance in the past three months is therapeutic."} ;; "therapeutic psychoactive drug"

(declare-const patient_is_exposed_to_psychoactive_substance_inthepast3months@@recreational_context Bool) ;; {"when_to_set_to_true":"Set to true if the psychoactive substance exposure in the past three months is in a recreational (non-medical) context.","when_to_set_to_false":"Set to false if the exposure is not in a recreational context (e.g., therapeutic or prescribed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is recreational.","meaning":"Boolean indicating whether the exposure to psychoactive substance in the past three months is recreational."} ;; "recreational psychoactive drug"

(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychoactive substance use disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psychoactive substance use disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psychoactive substance use disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychoactive substance use disorder."} ;; "substance use disorder"

(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_now@@excluding_tobacco_and_alcohol_use_disorders Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of psychoactive substance use disorder excludes tobacco use disorder and alcohol use disorder.","when_to_set_to_false":"Set to false if the diagnosis includes tobacco use disorder or alcohol use disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether tobacco or alcohol use disorders are excluded.","meaning":"Boolean indicating whether the diagnosis of psychoactive substance use disorder excludes tobacco and alcohol use disorders."} ;; "substance use disorder other than tobacco use disorder or alcohol use disorder"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_psychoactive_substance_inthepast3months@@regular_use
      patient_is_exposed_to_psychoactive_substance_inthepast3months)
    :named REQ6_AUXILIARY0)) ;; "regular use of any therapeutic/recreational psychoactive drug during the last three months"

(assert
(! (=> patient_is_exposed_to_psychoactive_substance_inthepast3months@@therapeutic_context
      patient_is_exposed_to_psychoactive_substance_inthepast3months)
    :named REQ6_AUXILIARY1)) ;; "therapeutic psychoactive drug"

(assert
(! (=> patient_is_exposed_to_psychoactive_substance_inthepast3months@@recreational_context
      patient_is_exposed_to_psychoactive_substance_inthepast3months)
    :named REQ6_AUXILIARY2)) ;; "recreational psychoactive drug"

(assert
(! (=> patient_has_diagnosis_of_psychoactive_substance_use_disorder_now@@excluding_tobacco_and_alcohol_use_disorders
      patient_has_diagnosis_of_psychoactive_substance_use_disorder_now)
    :named REQ6_AUXILIARY3)) ;; "substance use disorder other than tobacco use disorder or alcohol use disorder"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion 1: regular use of any therapeutic psychoactive drug during the last three months
(assert
(! (not (and patient_is_exposed_to_psychoactive_substance_inthepast3months@@regular_use
             patient_is_exposed_to_psychoactive_substance_inthepast3months@@therapeutic_context))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has regular use of any therapeutic psychoactive drug during the last three months."

;; Exclusion 2: regular use of any recreational psychoactive drug during the last three months
(assert
(! (not (and patient_is_exposed_to_psychoactive_substance_inthepast3months@@regular_use
             patient_is_exposed_to_psychoactive_substance_inthepast3months@@recreational_context))
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has regular use of any recreational psychoactive drug during the last three months."

;; Exclusion 3: any substance use disorder other than tobacco use disorder or alcohol use disorder
(assert
(! (not patient_has_diagnosis_of_psychoactive_substance_use_disorder_now@@excluding_tobacco_and_alcohol_use_disorders)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any substance use disorder other than tobacco use disorder or alcohol use disorder."
