;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body mass index (BMI) in kilograms per square meter is available.","when_to_set_to_null":"Set to null if no current BMI measurement in kilograms per square meter is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 30))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current body mass index < 30 kilograms per square meter."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current recorded sex is female."} ;; "the patient is a woman"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "the patient is a woman of childbearing potential"
(declare-const patient_is_taking_adequate_contraceptive_measures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking adequate contraceptive measures.","when_to_set_to_false":"Set to false if the patient is currently not taking adequate contraceptive measures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking adequate contraceptive measures.","meaning":"Boolean indicating whether the patient is currently taking adequate contraceptive measures."} ;; "adequate contraceptive measures"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is a woman who is pregnant
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

;; Exclusion: patient is a woman who is lactating
(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is lactating."

;; Exclusion: patient is a woman of childbearing potential who is not taking adequate contraceptive measures
(assert
(! (not (and patient_sex_is_female_now patient_has_childbearing_potential_now (not patient_is_taking_adequate_contraceptive_measures_now)))
:named REQ1_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a woman of childbearing potential who is not taking adequate contraceptive measures."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_suicidal_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently displaying suicidal behavior.","when_to_set_to_false":"Set to false if the patient is currently not displaying suicidal behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently displaying suicidal behavior.","meaning":"Boolean indicating whether the patient is currently displaying suicidal behavior."} ;; "suicidality"
(declare-const patient_has_finding_of_suicidal_behavior_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current suicidal behavior is clinically significant.","when_to_set_to_false":"Set to false if the patient's current suicidal behavior is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current suicidal behavior is clinically significant.","meaning":"Boolean indicating whether the patient's current suicidal behavior is clinically significant."} ;; "clinically significant suicidality"
(declare-const patient_has_finding_of_homicidal_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently displaying homicidal behavior.","when_to_set_to_false":"Set to false if the patient is currently not displaying homicidal behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently displaying homicidal behavior.","meaning":"Boolean indicating whether the patient is currently displaying homicidal behavior."} ;; "homicidality"
(declare-const patient_has_finding_of_homicidal_behavior_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current homicidal behavior is clinically significant.","when_to_set_to_false":"Set to false if the patient's current homicidal behavior is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current homicidal behavior is clinically significant.","meaning":"Boolean indicating whether the patient's current homicidal behavior is clinically significant."} ;; "clinically significant homicidality"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_suicidal_behavior_now@@clinically_significant
      patient_has_finding_of_suicidal_behavior_now)
   :named REQ2_AUXILIARY0)) ;; "clinically significant suicidality"

(assert
(! (=> patient_has_finding_of_homicidal_behavior_now@@clinically_significant
      patient_has_finding_of_homicidal_behavior_now)
   :named REQ2_AUXILIARY1)) ;; "clinically significant homicidality"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_suicidal_behavior_now@@clinically_significant)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is displaying clinically significant suicidality."

(assert
(! (not patient_has_finding_of_homicidal_behavior_now@@clinically_significant)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is displaying clinically significant homicidality."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_ham_d_hamilton_rating_scale_for_depression_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current HAM-D score is available.","when_to_set_to_null":"Set to null if no current HAM-D score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Hamilton Depression Rating Scale (HAM-D) score."} ;; "Hamilton Depression Rating Scale score"

(declare-const patient_has_finding_of_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a depressive disorder.","meaning":"Boolean indicating whether the patient currently has a depressive disorder."} ;; "depressive disorder"

(declare-const patient_has_finding_of_depressive_disorder_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current depressive disorder is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current depressive disorder is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current depressive disorder is clinically unstable.","meaning":"Boolean indicating whether the patient's current depressive disorder is clinically unstable."} ;; "clinically unstable depressive disorder"

(declare-const patient_has_finding_of_depressive_disorder_now@@current Bool) ;; {"when_to_set_to_true":"Set to true if the patient's depressive disorder is current (active, not in remission).","when_to_set_to_false":"Set to false if the patient's depressive disorder is not current (inactive, in remission).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's depressive disorder is current.","meaning":"Boolean indicating whether the patient's depressive disorder is current (active, not in remission)."} ;; "current depressive disorder"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive example implies umbrella term
(assert
(! (=> (> patient_ham_d_hamilton_rating_scale_for_depression_score_value_recorded_now_withunit_score 21)
       patient_has_finding_of_depressive_disorder_now@@clinically_unstable)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (Hamilton Depression Rating Scale score > 21)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_depressive_disorder_now@@clinically_unstable
       patient_has_finding_of_depressive_disorder_now)
:named REQ3_AUXILIARY1)) ;; "clinically unstable depressive disorder" implies "depressive disorder"

(assert
(! (=> patient_has_finding_of_depressive_disorder_now@@clinically_unstable
       patient_has_finding_of_depressive_disorder_now@@current)
:named REQ3_AUXILIARY2)) ;; "clinically unstable depressive disorder" implies "current depressive disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_depressive_disorder_now@@clinically_unstable)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is displaying a current clinically unstable depressive disorder with non-exhaustive examples (Hamilton Depression Rating Scale score > 21)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_substance_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of substance abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of substance abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of substance abuse.","meaning":"Boolean indicating whether the patient currently has a diagnosis of substance abuse."} ;; "the patient has a current diagnosis of substance abuse according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition."

(declare-const patient_has_diagnosis_of_substance_abuse_inthehistory@@temporalcontext_within6months_after_start_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of substance abuse in their history and the diagnosis occurred within 6 months after the start of study medication.","when_to_set_to_false":"Set to false if the patient has a diagnosis of substance abuse in their history but the diagnosis did not occur within 6 months after the start of study medication, or if the patient does not have a diagnosis of substance abuse in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of substance abuse in their history within 6 months after the start of study medication.","meaning":"Boolean indicating whether the patient has a diagnosis of substance abuse in their history, with the diagnosis occurring within 6 months after the start of study medication."} ;; "the patient has a recent diagnosis of substance abuse according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition (within 6 months of the start of study medication)."

(declare-const patient_has_diagnosis_of_psychoactive_substance_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of psychoactive substance dependence.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of psychoactive substance dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of psychoactive substance dependence.","meaning":"Boolean indicating whether the patient currently has a diagnosis of psychoactive substance dependence."} ;; "the patient has a current diagnosis of substance dependence according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition."

(declare-const patient_has_diagnosis_of_psychoactive_substance_dependence_inthehistory@@temporalcontext_within6months_after_start_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of psychoactive substance dependence occurred within 6 months after the start of study medication.","when_to_set_to_false":"Set to false if the diagnosis did not occur within 6 months after the start of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis occurred within 6 months after the start of study medication.","meaning":"Boolean indicating whether the diagnosis of psychoactive substance dependence occurred within 6 months after the start of study medication."} ;; "the patient has a recent diagnosis of substance dependence according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition (within 6 months of the start of study medication)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_substance_abuse_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of substance abuse according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition."

(assert
(! (not patient_has_diagnosis_of_substance_abuse_inthehistory@@temporalcontext_within6months_after_start_of_study_medication)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent diagnosis of substance abuse according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition (within 6 months of the start of study medication)."

(assert
(! (not patient_has_diagnosis_of_psychoactive_substance_dependence_now)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of substance dependence according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition."

(assert
(! (not patient_has_diagnosis_of_psychoactive_substance_dependence_inthehistory@@temporalcontext_within6months_after_start_of_study_medication)
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent diagnosis of substance dependence according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition (within 6 months of the start of study medication)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_bipolar_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bipolar disorder at any point in their lifetime.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bipolar disorder at any point in their lifetime.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bipolar disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of bipolar disorder in their lifetime."} ;; "the patient has a lifetime history of a bipolar disorder"
(declare-const patient_has_diagnosis_of_bipolar_disorder_inthehistory@@diagnosed_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lifetime diagnosis of bipolar disorder was made according to DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's lifetime diagnosis of bipolar disorder was not made according to DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to DSM-IV criteria.","meaning":"Boolean indicating whether the patient's lifetime diagnosis of bipolar disorder was made according to DSM-IV criteria."} ;; "according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"
(declare-const patient_has_diagnosis_of_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with dementia at any point in their lifetime.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with dementia at any point in their lifetime.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with dementia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of dementia in their lifetime."} ;; "the patient has a lifetime history of dementia"
(declare-const patient_has_diagnosis_of_dementia_inthehistory@@diagnosed_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lifetime diagnosis of dementia was made according to DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's lifetime diagnosis of dementia was not made according to DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made according to DSM-IV criteria.","meaning":"Boolean indicating whether the patient's lifetime diagnosis of dementia was made according to DSM-IV criteria."} ;; "according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for bipolar disorder implies the stem variable
(assert
(! (=> patient_has_diagnosis_of_bipolar_disorder_inthehistory@@diagnosed_according_to_dsm_iv
      patient_has_diagnosis_of_bipolar_disorder_inthehistory)
   :named REQ5_AUXILIARY0)) ;; "the patient has a lifetime history of a bipolar disorder according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"

;; Qualifier variable for dementia implies the stem variable
(assert
(! (=> patient_has_diagnosis_of_dementia_inthehistory@@diagnosed_according_to_dsm_iv
      patient_has_diagnosis_of_dementia_inthehistory)
   :named REQ5_AUXILIARY1)) ;; "the patient has a lifetime history of dementia according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_bipolar_disorder_inthehistory@@diagnosed_according_to_dsm_iv)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a lifetime history of a bipolar disorder according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"

(assert
(! (not patient_has_diagnosis_of_dementia_inthehistory@@diagnosed_according_to_dsm_iv)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a lifetime history of dementia according to the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_personality_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a personality disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a personality disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a personality disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of personality disorder in their history."} ;; "personality disorder"
(declare-const patient_has_diagnosis_of_personality_disorder_inthehistory@@might_interfere_with_assessment_or_compliance_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's personality disorder might interfere with assessment or compliance with study procedures.","when_to_set_to_false":"Set to false if the patient's personality disorder does not interfere with assessment or compliance with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the personality disorder might interfere with assessment or compliance with study procedures.","meaning":"Boolean indicating whether the patient's personality disorder might interfere with assessment or compliance with study procedures."} ;; "which might interfere with assessment or compliance with study procedures"

(declare-const patient_has_diagnosis_of_schizotypal_personality_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with schizotypal personality disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with schizotypal personality disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with schizotypal personality disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of schizotypal personality disorder in their history."} ;; "schizotypal personality disorder"
(declare-const patient_has_diagnosis_of_borderline_personality_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with borderline personality disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with borderline personality disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with borderline personality disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of borderline personality disorder in their history."} ;; "borderline personality disorder"
(declare-const patient_has_diagnosis_of_antisocial_personality_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with antisocial personality disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with antisocial personality disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with antisocial personality disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of antisocial personality disorder in their history."} ;; "antisocial personality disorder"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_schizotypal_personality_disorder_inthehistory
           patient_has_diagnosis_of_borderline_personality_disorder_inthehistory
           patient_has_diagnosis_of_antisocial_personality_disorder_inthehistory)
    patient_has_diagnosis_of_personality_disorder_inthehistory)
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (schizotypal personality disorder, borderline personality disorder, antisocial personality disorder)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_personality_disorder_inthehistory@@might_interfere_with_assessment_or_compliance_with_study_procedures
    patient_has_diagnosis_of_personality_disorder_inthehistory)
:named REQ6_AUXILIARY1)) ;; "which might interfere with assessment or compliance with study procedures"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_personality_disorder_inthehistory@@might_interfere_with_assessment_or_compliance_with_study_procedures)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of a personality disorder with non-exhaustive examples (schizotypal personality disorder, borderline personality disorder, antisocial personality disorder) which might interfere with assessment or compliance with study procedures."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the cardiovascular system."} ;; "cardiovascular disease"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the cardiovascular system is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the cardiovascular system is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is clinically unstable.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the cardiovascular system is clinically unstable."} ;; "clinically unstable cardiovascular disease"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the cardiovascular system could interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_false":"Set to false if the disorder could not interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder could interfere with diagnosis, assessment, or treatment of binge eating disorder.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the cardiovascular system could interfere with diagnosis, assessment, or treatment of binge eating disorder."} ;; "cardiovascular disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disease of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disease of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disease of the liver.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disease of the liver."} ;; "hepatic disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disease of the liver is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disease of the liver is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is clinically unstable.","meaning":"Boolean indicating whether the patient's current diagnosis of a disease of the liver is clinically unstable."} ;; "clinically unstable hepatic disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disease of the liver could interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_false":"Set to false if the disease could not interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease could interfere with diagnosis, assessment, or treatment of binge eating disorder.","meaning":"Boolean indicating whether the patient's current diagnosis of a disease of the liver could interfere with diagnosis, assessment, or treatment of binge eating disorder."} ;; "hepatic disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(declare-const patient_has_diagnosis_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of kidney disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of kidney disease."} ;; "renal disease"
(declare-const patient_has_diagnosis_of_kidney_disease_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of kidney disease is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current diagnosis of kidney disease is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is clinically unstable.","meaning":"Boolean indicating whether the patient's current diagnosis of kidney disease is clinically unstable."} ;; "clinically unstable renal disease"
(declare-const patient_has_diagnosis_of_kidney_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of kidney disease could interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_false":"Set to false if the disease could not interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease could interfere with diagnosis, assessment, or treatment of binge eating disorder.","meaning":"Boolean indicating whether the patient's current diagnosis of kidney disease could interfere with diagnosis, assessment, or treatment of binge eating disorder."} ;; "renal disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the gastrointestinal tract."} ;; "gastrointestinal disease"
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the gastrointestinal tract is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the gastrointestinal tract is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is clinically unstable.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the gastrointestinal tract is clinically unstable."} ;; "clinically unstable gastrointestinal disease"
(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the gastrointestinal tract could interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_false":"Set to false if the disorder could not interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder could interfere with diagnosis, assessment, or treatment of binge eating disorder.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the gastrointestinal tract could interfere with diagnosis, assessment, or treatment of binge eating disorder."} ;; "gastrointestinal disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(declare-const patient_has_diagnosis_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the lung."} ;; "pulmonary disease"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the lung is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the lung is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is clinically unstable.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the lung is clinically unstable."} ;; "clinically unstable pulmonary disease"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the lung could interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_false":"Set to false if the disorder could not interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder could interfere with diagnosis, assessment, or treatment of binge eating disorder.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the lung could interfere with diagnosis, assessment, or treatment of binge eating disorder."} ;; "pulmonary disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(declare-const patient_has_diagnosis_of_metabolic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of metabolic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of metabolic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of metabolic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of metabolic disease."} ;; "metabolic disease"
(declare-const patient_has_diagnosis_of_metabolic_disease_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of metabolic disease is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current diagnosis of metabolic disease is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the metabolic disease is clinically unstable.","meaning":"Boolean indicating whether the patient's current diagnosis of metabolic disease is clinically unstable."} ;; "clinically unstable metabolic disease"
(declare-const patient_has_diagnosis_of_metabolic_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of metabolic disease could interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_false":"Set to false if the disease could not interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease could interfere with diagnosis, assessment, or treatment of binge eating disorder.","meaning":"Boolean indicating whether the patient's current diagnosis of metabolic disease could interfere with diagnosis, assessment, or treatment of binge eating disorder."} ;; "metabolic disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(declare-const patient_has_diagnosis_of_disorder_of_endocrine_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of the endocrine system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of the endocrine system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of the endocrine system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of the endocrine system."} ;; "endocrine disease"
(declare-const patient_has_diagnosis_of_disorder_of_endocrine_system_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the endocrine system could interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_false":"Set to false if the disorder could not interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder could interfere with diagnosis, assessment, or treatment of binge eating disorder.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the endocrine system could interfere with diagnosis, assessment, or treatment of binge eating disorder."} ;; "endocrine disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(declare-const patient_has_diagnosis_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of systemic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of systemic disease."} ;; "systemic disease"
(declare-const patient_has_diagnosis_of_systemic_disease_now@@clinically_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of systemic disease is clinically unstable.","when_to_set_to_false":"Set to false if the patient's current diagnosis of systemic disease is not clinically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is clinically unstable.","meaning":"Boolean indicating whether the patient's current diagnosis of systemic disease is clinically unstable."} ;; "clinically unstable systemic disease"
(declare-const patient_has_diagnosis_of_systemic_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of systemic disease could interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_false":"Set to false if the disease could not interfere with diagnosis, assessment, or treatment of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease could interfere with diagnosis, assessment, or treatment of binge eating disorder.","meaning":"Boolean indicating whether the patient's current diagnosis of systemic disease could interfere with diagnosis, assessment, or treatment of binge eating disorder."} ;; "systemic disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(declare-const patient_has_finding_of_euthyroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the finding of being euthyroid.","when_to_set_to_false":"Set to false if the patient currently does not have the finding of being euthyroid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the finding of being euthyroid.","meaning":"Boolean indicating whether the patient currently has the finding of being euthyroid."} ;; "euthyroid"
(declare-const patient_has_finding_of_euthyroid_now@@biochemically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current finding of being euthyroid is biochemically confirmed.","when_to_set_to_false":"Set to false if the patient's current finding of being euthyroid is not biochemically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is biochemically confirmed.","meaning":"Boolean indicating whether the patient's current finding of being euthyroid is biochemically confirmed."} ;; "biochemically euthyroid"
(declare-const patient_has_finding_of_euthyroid_now@@present_prior_to_entering_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current finding of being euthyroid is present prior to entering the study.","when_to_set_to_false":"Set to false if the patient's current finding of being euthyroid is not present prior to entering the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is present prior to entering the study.","meaning":"Boolean indicating whether the patient's current finding of being euthyroid is present prior to entering the study."} ;; "euthyroid prior to entering the study"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term for clinically unstable medical disease
(assert
(! (=> (or patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@clinically_unstable
          patient_has_diagnosis_of_disease_of_liver_now@@clinically_unstable
          patient_has_diagnosis_of_kidney_disease_now@@clinically_unstable
          patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@clinically_unstable
          patient_has_diagnosis_of_disorder_of_lung_now@@clinically_unstable
          patient_has_diagnosis_of_metabolic_disease_now@@clinically_unstable
          patient_has_diagnosis_of_disorder_of_endocrine_system_now
          patient_has_diagnosis_of_systemic_disease_now@@clinically_unstable)
     (or patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@clinically_unstable
         patient_has_diagnosis_of_disease_of_liver_now@@clinically_unstable
         patient_has_diagnosis_of_kidney_disease_now@@clinically_unstable
         patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@clinically_unstable
         patient_has_diagnosis_of_disorder_of_lung_now@@clinically_unstable
         patient_has_diagnosis_of_metabolic_disease_now@@clinically_unstable
         patient_has_diagnosis_of_disorder_of_endocrine_system_now
         patient_has_diagnosis_of_systemic_disease_now@@clinically_unstable))
:named REQ7_AUXILIARY0)) ;; "clinically unstable medical disease with non-exhaustive examples (cardiovascular disease, hepatic disease, renal disease, gastrointestinal disease, pulmonary disease, metabolic disease, endocrine disease, other systemic disease)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@clinically_unstable
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_now)
:named REQ7_AUXILIARY1)) ;; "clinically unstable cardiovascular disease"

(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@clinically_unstable
      patient_has_diagnosis_of_disease_of_liver_now)
:named REQ7_AUXILIARY2)) ;; "clinically unstable hepatic disease"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_now@@clinically_unstable
      patient_has_diagnosis_of_kidney_disease_now)
:named REQ7_AUXILIARY3)) ;; "clinically unstable renal disease"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@clinically_unstable
      patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now)
:named REQ7_AUXILIARY4)) ;; "clinically unstable gastrointestinal disease"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_lung_now@@clinically_unstable
      patient_has_diagnosis_of_disorder_of_lung_now)
:named REQ7_AUXILIARY5)) ;; "clinically unstable pulmonary disease"

(assert
(! (=> patient_has_diagnosis_of_metabolic_disease_now@@clinically_unstable
      patient_has_diagnosis_of_metabolic_disease_now)
:named REQ7_AUXILIARY6)) ;; "clinically unstable metabolic disease"

(assert
(! (=> patient_has_diagnosis_of_systemic_disease_now@@clinically_unstable
      patient_has_diagnosis_of_systemic_disease_now)
:named REQ7_AUXILIARY7)) ;; "clinically unstable systemic disease"

;; Disease could interfere with diagnosis, assessment, or treatment of binge eating disorder: qualifier implies stem
(assert
(! (=> patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder
      patient_has_diagnosis_of_disorder_of_cardiovascular_system_now)
:named REQ7_AUXILIARY8)) ;; "cardiovascular disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder
      patient_has_diagnosis_of_disease_of_liver_now)
:named REQ7_AUXILIARY9)) ;; "hepatic disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder
      patient_has_diagnosis_of_kidney_disease_now)
:named REQ7_AUXILIARY10)) ;; "renal disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder
      patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now)
:named REQ7_AUXILIARY11)) ;; "gastrointestinal disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_lung_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder
      patient_has_diagnosis_of_disorder_of_lung_now)
:named REQ7_AUXILIARY12)) ;; "pulmonary disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(assert
(! (=> patient_has_diagnosis_of_metabolic_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder
      patient_has_diagnosis_of_metabolic_disease_now)
:named REQ7_AUXILIARY13)) ;; "metabolic disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_endocrine_system_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder
      patient_has_diagnosis_of_disorder_of_endocrine_system_now)
:named REQ7_AUXILIARY14)) ;; "endocrine disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

(assert
(! (=> patient_has_diagnosis_of_systemic_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder
      patient_has_diagnosis_of_systemic_disease_now)
:named REQ7_AUXILIARY15)) ;; "systemic disease which could interfere with diagnosis, assessment, or treatment of binge eating disorder"

;; Euthyroid qualifiers imply stem
(assert
(! (=> patient_has_finding_of_euthyroid_now@@biochemically_confirmed
      patient_has_finding_of_euthyroid_now)
:named REQ7_AUXILIARY16)) ;; "biochemically euthyroid"

(assert
(! (=> patient_has_finding_of_euthyroid_now@@present_prior_to_entering_the_study
      patient_has_finding_of_euthyroid_now)
:named REQ7_AUXILIARY17)) ;; "euthyroid prior to entering the study"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have a clinically unstable medical disease (with non-exhaustive examples) which could interfere with diagnosis, assessment, or treatment of binge eating disorder
(assert
(! (not
     (or
       (and patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@clinically_unstable
            patient_has_diagnosis_of_disorder_of_cardiovascular_system_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder)
       (and patient_has_diagnosis_of_disease_of_liver_now@@clinically_unstable
            patient_has_diagnosis_of_disease_of_liver_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder)
       (and patient_has_diagnosis_of_kidney_disease_now@@clinically_unstable
            patient_has_diagnosis_of_kidney_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder)
       (and patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@clinically_unstable
            patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder)
       (and patient_has_diagnosis_of_disorder_of_lung_now@@clinically_unstable
            patient_has_diagnosis_of_disorder_of_lung_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder)
       (and patient_has_diagnosis_of_metabolic_disease_now@@clinically_unstable
            patient_has_diagnosis_of_metabolic_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder)
       (and patient_has_diagnosis_of_disorder_of_endocrine_system_now
            patient_has_diagnosis_of_disorder_of_endocrine_system_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder)
       (and patient_has_diagnosis_of_systemic_disease_now@@clinically_unstable
            patient_has_diagnosis_of_systemic_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_binge_eating_disorder)
     )
   )
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinically unstable medical disease with non-exhaustive examples ... which could interfere with diagnosis, assessment, or treatment of binge eating disorder."

;; Exclusion: patient must be biochemically euthyroid prior to entering the study
(assert
(! (not
     (not (and patient_has_finding_of_euthyroid_now@@biochemically_confirmed
               patient_has_finding_of_euthyroid_now@@present_prior_to_entering_the_study)))
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is not biochemically euthyroid prior to entering the study."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_history_of_seizure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of seizures of any type at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a history of seizures of any type at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of seizures of any type in their medical history.","meaning":"Boolean indicating whether the patient has ever had a history of seizures of any type in their medical history."} ;; "history of seizures"

(declare-const patient_has_finding_of_febrile_convulsion_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had febrile convulsions (febrile seizures) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had febrile convulsions (febrile seizures) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had febrile convulsions (febrile seizures).","meaning":"Boolean indicating whether the patient has ever had febrile convulsions (febrile seizures) in their medical history."} ;; "febrile seizures"

(declare-const patient_has_finding_of_febrile_convulsion_inthehistory@@occurred_in_childhood Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of febrile convulsions (febrile seizures) occurred during childhood.","when_to_set_to_false":"Set to false if the patient's history of febrile convulsions (febrile seizures) did not occur during childhood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's febrile convulsions (febrile seizures) occurred during childhood.","meaning":"Boolean indicating whether the patient's history of febrile convulsions (febrile seizures) occurred during childhood."} ;; "history of febrile seizures in childhood"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive example: history of febrile seizures in childhood implies history of seizures
(assert
(! (=> patient_has_finding_of_febrile_convulsion_inthehistory@@occurred_in_childhood
       patient_has_history_of_seizure)
   :named REQ8_AUXILIARY0)) ;; "history of febrile seizures in childhood" is a non-exhaustive example of "history of seizures"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_febrile_convulsion_inthehistory@@occurred_in_childhood
       patient_has_finding_of_febrile_convulsion_inthehistory)
   :named REQ8_AUXILIARY1)) ;; "history of febrile seizures in childhood" implies "history of febrile seizures"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_history_of_seizure)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of seizures with non-exhaustive examples (history of febrile seizures in childhood)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_kidney_stone_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with kidney stones (nephrolithiasis) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with kidney stones (nephrolithiasis) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with kidney stones (nephrolithiasis).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of kidney stones (nephrolithiasis) in their history."} ;; "nephrolithiasis"
(declare-const patient_has_diagnosis_of_kidney_stone_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of kidney stones (nephrolithiasis) was considered clinically significant.","when_to_set_to_false":"Set to false if the patient's history of kidney stones (nephrolithiasis) was not considered clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history of kidney stones (nephrolithiasis) was clinically significant.","meaning":"Boolean indicating whether the patient's history of kidney stones (nephrolithiasis) was clinically significant."} ;; "clinically significant nephrolithiasis"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_kidney_stone_inthehistory@@clinically_significant
       patient_has_diagnosis_of_kidney_stone_inthehistory)
   :named REQ9_AUXILIARY0)) ;; "clinically significant nephrolithiasis"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_kidney_stone_inthehistory@@clinically_significant)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of clinically significant nephrolithiasis."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "requires treatment with at least one drug"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@might_interact_adversely_with_or_obscure_action_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed might interact adversely with or obscure the action of the study medication.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed does not have this property.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient is currently exposed might interact adversely with or obscure the action of the study medication.","meaning":"Boolean indicating whether the drug or medicament to which the patient is currently exposed might interact adversely with or obscure the action of the study medication."} ;; "drug which might interact adversely with or obscure the action of the study medication"

(declare-const patient_is_exposed_to_stimulant_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to at least one stimulant drug.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any stimulant drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any stimulant drug.","meaning":"Boolean indicating whether the patient is currently exposed to at least one stimulant drug."} ;; "stimulant drug"

(declare-const patient_is_exposed_to_sympathomimetic_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to at least one sympathomimetic drug.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any sympathomimetic drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any sympathomimetic drug.","meaning":"Boolean indicating whether the patient is currently exposed to at least one sympathomimetic drug."} ;; "sympathomimetic drug"

(declare-const patient_is_exposed_to_antidepressant_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to at least one antidepressant drug.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any antidepressant drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any antidepressant drug.","meaning":"Boolean indicating whether the patient is currently exposed to at least one antidepressant drug."} ;; "antidepressant drug"

(declare-const patient_is_exposed_to_carbonic_anhydrase_inhibitor_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to at least one carbonic anhydrase inhibitor drug.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any carbonic anhydrase inhibitor drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any carbonic anhydrase inhibitor drug.","meaning":"Boolean indicating whether the patient is currently exposed to at least one carbonic anhydrase inhibitor drug."} ;; "carbonic anhydrase inhibitor drug"

(declare-const patient_is_exposed_to_anti_obesity_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to at least one anti-obesity drug.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any anti-obesity drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any anti-obesity drug.","meaning":"Boolean indicating whether the patient is currently exposed to at least one anti-obesity drug."} ;; "anti-obesity drug"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_stimulant_drug_now
           patient_is_exposed_to_sympathomimetic_drug_now
           patient_is_exposed_to_antidepressant_drug_now
           patient_is_exposed_to_carbonic_anhydrase_inhibitor_drug_now
           patient_is_exposed_to_anti_obesity_drug_now)
    patient_is_exposed_to_drug_or_medicament_now@@might_interact_adversely_with_or_obscure_action_of_study_medication)
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples ((stimulant drug) OR (sympathomimetic drug) OR (antidepressant drug) OR (carbonic anhydrase inhibitor drug) OR (anti-obesity drug))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@might_interact_adversely_with_or_obscure_action_of_study_medication
       patient_is_exposed_to_drug_or_medicament_now)
:named REQ10_AUXILIARY1)) ;; "requires treatment with at least one drug which might interact adversely with or obscure the action of the study medication"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@might_interact_adversely_with_or_obscure_action_of_study_medication)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with at least one drug which might interact adversely with or obscure the action of the study medication with non-exhaustive examples ((stimulant drug) OR (sympathomimetic drug) OR (antidepressant drug) OR (carbonic anhydrase inhibitor drug) OR (anti-obesity drug))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_psychotropic_agent_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any psychotropic agent within the one week prior to randomization.","when_to_set_to_false":"Set to false if the patient has not been exposed to any psychotropic agent within the one week prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any psychotropic agent within the one week prior to randomization.","meaning":"Boolean indicating whether the patient has been exposed to any psychotropic agent within the one week prior to randomization."} ;; "psychoactive medication within one week prior to randomization"

(declare-const patient_is_exposed_to_psychotropic_agent_inthepast1weeks@@excludes_zaleplon_as_needed_for_restlessness_or_insomnia Bool) ;; {"when_to_set_to_true":"Set to true if, when determining exposure to psychotropic agents within the one week prior to randomization, any exposure to zaleplon as needed for restlessness or insomnia is excluded from consideration.","when_to_set_to_false":"Set to false if exposure to zaleplon as needed for restlessness or insomnia is not excluded from the psychotropic agent exposure determination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether exposure to zaleplon as needed for restlessness or insomnia is excluded.","meaning":"Boolean indicating whether exposure to zaleplon as needed for restlessness or insomnia is excluded from the psychotropic agent exposure variable."} ;; "other than zaleplon as needed for restlessness or insomnia"

(declare-const patient_is_exposed_to_psychotropic_agent_inthepast1weeks@@excludes_zolpidem_as_needed_for_restlessness_or_insomnia Bool) ;; {"when_to_set_to_true":"Set to true if, when determining exposure to psychotropic agents within the one week prior to randomization, any exposure to zolpidem as needed for restlessness or insomnia is excluded from consideration.","when_to_set_to_false":"Set to false if exposure to zolpidem as needed for restlessness or insomnia is not excluded from the psychotropic agent exposure determination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether exposure to zolpidem as needed for restlessness or insomnia is excluded.","meaning":"Boolean indicating whether exposure to zolpidem as needed for restlessness or insomnia is excluded from the psychotropic agent exposure variable."} ;; "other than zolpidem as needed for restlessness or insomnia"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_psychotropic_agent_inthepast1weeks@@excludes_zaleplon_as_needed_for_restlessness_or_insomnia
      patient_is_exposed_to_psychotropic_agent_inthepast1weeks)
:named REQ11_AUXILIARY0)) ;; "other than zaleplon as needed for restlessness or insomnia"

(assert
(! (=> patient_is_exposed_to_psychotropic_agent_inthepast1weeks@@excludes_zolpidem_as_needed_for_restlessness_or_insomnia
      patient_is_exposed_to_psychotropic_agent_inthepast1weeks)
:named REQ11_AUXILIARY1)) ;; "other than zolpidem as needed for restlessness or insomnia"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have received at least one psychoactive medication (other than zaleplon/zolpidem as needed for restlessness or insomnia) within one week prior to randomization
(assert
(! (not (or patient_is_exposed_to_psychotropic_agent_inthepast1weeks@@excludes_zaleplon_as_needed_for_restlessness_or_insomnia
            patient_is_exposed_to_psychotropic_agent_inthepast1weeks@@excludes_zolpidem_as_needed_for_restlessness_or_insomnia))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received at least one psychoactive medication (other than zaleplon as needed for restlessness or insomnia OR other than zolpidem as needed for restlessness or insomnia) within one week prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_begun_formal_psychotherapy_for_binge_eating_disorder_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months.","when_to_set_to_false":"Set to false if the patient has not begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months.","meaning":"Boolean indicating whether the patient has begun formal psychotherapy for binge eating disorder within the past three months."} ;; "The patient has begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months."
(declare-const patient_has_begun_formal_psychotherapy_for_weight_loss_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months.","when_to_set_to_false":"Set to false if the patient has not begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months.","meaning":"Boolean indicating whether the patient has begun formal psychotherapy for weight loss within the past three months."} ;; "The patient has begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months."
(declare-const patient_is_receiving_formal_psychotherapy_for_binge_eating_disorder_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months.","when_to_set_to_false":"Set to false if the patient is not receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months.","meaning":"Boolean indicating whether the patient is receiving formal psychotherapy for binge eating disorder within the past three months."} ;; "The patient is receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months."
(declare-const patient_is_receiving_formal_psychotherapy_for_weight_loss_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months.","when_to_set_to_false":"Set to false if the patient is not receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months.","meaning":"Boolean indicating whether the patient is receiving formal psychotherapy for weight loss within the past three months."} ;; "The patient is receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_begun_formal_psychotherapy_for_binge_eating_disorder_inthepast3months)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months."

(assert
(! (not patient_has_begun_formal_psychotherapy_for_weight_loss_inthepast3months)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has begun formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months."

(assert
(! (not patient_is_receiving_formal_psychotherapy_for_binge_eating_disorder_inthepast3months)
:named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for binge eating disorder within the past three months."

(assert
(! (not patient_is_receiving_formal_psychotherapy_for_weight_loss_inthepast3months)
:named REQ12_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving formal psychotherapy (cognitive behavioral therapy OR interpersonal therapy OR dietary behavioral therapy) for weight loss within the past three months."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_been_enrolled_in_this_study_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously been enrolled in this study at any time in their history.","when_to_set_to_false":"Set to false if the patient has never previously been enrolled in this study at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever previously been enrolled in this study.","meaning":"Boolean indicating whether the patient has ever previously been enrolled in this study."} ;; "the patient has previously been enrolled in this study"

(declare-const patient_has_taken_zonisamide_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously taken a zonisamide-containing product at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never previously taken a zonisamide-containing product at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever previously taken a zonisamide-containing product.","meaning":"Boolean indicating whether the patient has ever previously taken a zonisamide-containing product."} ;; "the patient has previously been treated with zonisamide"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_been_enrolled_in_this_study_in_the_history)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously been enrolled in this study."

(assert
(! (not patient_has_taken_zonisamide_containing_product_inthehistory)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously been treated with zonisamide."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past thirty days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past thirty days."} ;; "the patient has received at least one experimental drug within thirty days"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@experimental Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament exposure within the past thirty days is specifically to an experimental drug.","when_to_set_to_false":"Set to false if the drug or medicament exposure within the past thirty days is not to an experimental drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament exposure within the past thirty days is to an experimental drug.","meaning":"Boolean indicating whether the drug or medicament exposure within the past thirty days is specifically to an experimental drug."} ;; "the patient has received at least one experimental drug within thirty days"
(declare-const patient_has_used_device_inthepast_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any device within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not used any device within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any device within the past thirty days.","meaning":"Boolean indicating whether the patient has used any device within the past thirty days."} ;; "the patient has used at least one experimental device within thirty days"
(declare-const patient_has_used_device_inthepast_30_days@@experimental Bool) ;; {"when_to_set_to_true":"Set to true if the device used within the past thirty days is specifically an experimental device.","when_to_set_to_false":"Set to false if the device used within the past thirty days is not an experimental device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the device used within the past thirty days is an experimental device.","meaning":"Boolean indicating whether the device used within the past thirty days is specifically an experimental device."} ;; "the patient has used at least one experimental device within thirty days"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable for drug
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@experimental
       patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ14_AUXILIARY0)) ;; "experimental drug within thirty days"

;; Qualifier variable implies corresponding stem variable for device
(assert
(! (=> patient_has_used_device_inthepast_30_days@@experimental
       patient_has_used_device_inthepast_30_days)
    :named REQ14_AUXILIARY1)) ;; "experimental device within thirty days"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_inthepast30days@@experimental
            patient_has_used_device_inthepast_30_days@@experimental))
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received at least one experimental drug within thirty days) OR (the patient has used at least one experimental device within thirty days)."
