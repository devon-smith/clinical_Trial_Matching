;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_fractures_involving_multiple_body_regions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fractures involving multiple body regions (multiple fractures).","when_to_set_to_false":"Set to false if the patient currently does not have fractures involving multiple body regions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fractures involving multiple body regions.","meaning":"Boolean indicating whether the patient currently has fractures involving multiple body regions."} ;; "multiple fractures"
(declare-const patient_has_finding_of_fracture_of_pelvis_now@@located_in_proximal_pelvis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pelvic fracture is located in the proximal pelvis.","when_to_set_to_false":"Set to false if the patient's pelvic fracture is not located in the proximal pelvis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pelvic fracture is located in the proximal pelvis.","meaning":"Boolean indicating whether the patient's pelvic fracture is located in the proximal pelvis."} ;; "proximal pelvic fractures"
(declare-const patient_has_finding_of_pathological_fracture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pathological fracture.","when_to_set_to_false":"Set to false if the patient currently does not have a pathological fracture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pathological fracture.","meaning":"Boolean indicating whether the patient currently has a pathological fracture."} ;; "pathological fractures"
(declare-const patient_has_finding_of_fracture_of_femur_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fracture of the femur.","when_to_set_to_false":"Set to false if the patient currently does not have a fracture of the femur.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fracture of the femur.","meaning":"Boolean indicating whether the patient currently has a fracture of the femur."} ;; "femur fractures"
(declare-const patient_has_finding_of_fracture_of_bone_now@@located_in_middle_femur Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bone fracture is located in the middle femur.","when_to_set_to_false":"Set to false if the patient's bone fracture is not located in the middle femur.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bone fracture is located in the middle femur.","meaning":"Boolean indicating whether the patient's bone fracture is located in the middle femur."} ;; "fractures of the middle femur"
(declare-const patient_has_finding_of_fracture_of_distal_end_of_femur_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fracture of the distal end of the femur.","when_to_set_to_false":"Set to false if the patient currently does not have a fracture of the distal end of the femur.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fracture of the distal end of the femur.","meaning":"Boolean indicating whether the patient currently has a fracture of the distal end of the femur."} ;; "fractures of the distal femur"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term for femur fractures
(assert
(! (=> (or patient_has_finding_of_fracture_of_bone_now@@located_in_middle_femur
           patient_has_finding_of_fracture_of_distal_end_of_femur_now)
       patient_has_finding_of_fracture_of_femur_now)
   :named REQ0_AUXILIARY0)) ;; "femur fractures with non-exhaustive examples (fractures of the middle femur, fractures of the distal femur)."

;; Qualifier variable implies corresponding stem variable for middle femur
(assert
(! (=> patient_has_finding_of_fracture_of_bone_now@@located_in_middle_femur
       patient_has_finding_of_fracture_of_femur_now)
   :named REQ0_AUXILIARY1)) ;; "fractures of the middle femur" implies "femur fracture"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_fractures_involving_multiple_body_regions_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from multiple fractures."

(assert
(! (not patient_has_finding_of_fracture_of_pelvis_now@@located_in_proximal_pelvis)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from proximal pelvic fractures."

(assert
(! (not patient_has_finding_of_pathological_fracture_now)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from pathological fractures."

(assert
(! (not patient_has_finding_of_fracture_of_femur_now)
   :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from femur fractures with non-exhaustive examples (fractures of the middle femur, fractures of the distal femur)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disabling_neuropsychiatric_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disabling neuropsychiatric disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a disabling neuropsychiatric disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disabling neuropsychiatric disorder.","meaning":"Boolean indicating whether the patient currently has a disabling neuropsychiatric disorder."} ;; "disabling neuropsychiatric disorders"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia and the dementia is severe.","when_to_set_to_false":"Set to false if the patient currently has dementia but it is not severe, or if the severity is known to be less than severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia is severe.","meaning":"Boolean indicating whether the patient's current dementia is severe."} ;; "severe dementia"
(declare-const patient_has_finding_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has Alzheimer's disease."} ;; "Alzheimer's disease"
(declare-const patient_has_finding_of_schizophrenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of schizophrenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has schizophrenia.","meaning":"Boolean indicating whether the patient currently has schizophrenia."} ;; "schizophrenia"
(declare-const patient_has_finding_of_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has depression.","when_to_set_to_false":"Set to false if the patient currently does not have depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has depression.","meaning":"Boolean indicating whether the patient currently has depression."} ;; "depression"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_dementia_now@@severe
           patient_has_finding_of_alzheimer_s_disease_now
           patient_has_finding_of_schizophrenia_now
           patient_has_finding_of_depression_now)
       patient_has_finding_of_disabling_neuropsychiatric_disorder_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((severe dementia) OR (Alzheimer's disease) OR (schizophrenia) OR (depression))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dementia_now@@severe
       patient_has_finding_of_dementia_now)
   :named REQ1_AUXILIARY1)) ;; "severe dementia" implies "dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disabling_neuropsychiatric_disorder_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has disabling neuropsychiatric disorders with non-exhaustive examples ((severe dementia) OR (Alzheimer's disease) OR (schizophrenia) OR (depression))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_cerebral_trauma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of cerebral trauma (brain trauma) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of cerebral trauma (brain trauma) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of cerebral trauma (brain trauma).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebral trauma (brain trauma) at any time in their history."} ;; "brain trauma"
(declare-const patient_has_diagnosis_of_cerebral_trauma_inthehistory@@temporalcontext_within12months_prior_to_selection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of cerebral trauma (brain trauma) occurred within twelve months prior to selection.","when_to_set_to_false":"Set to false if the patient's diagnosis of cerebral trauma (brain trauma) did not occur within twelve months prior to selection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of cerebral trauma (brain trauma) occurred within twelve months prior to selection.","meaning":"Boolean indicating whether the diagnosis of cerebral trauma (brain trauma) occurred within twelve months prior to selection."} ;; "brain trauma within twelve months prior to selection"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of cerebrovascular accident (stroke) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of cerebrovascular accident (stroke) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebrovascular accident (stroke) at any time in their history."} ;; "stroke"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@with_residuals Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cerebrovascular accident (stroke) is accompanied by residual neurological deficits.","when_to_set_to_false":"Set to false if the patient's history of cerebrovascular accident (stroke) is not accompanied by residual neurological deficits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of cerebrovascular accident (stroke) is accompanied by residual neurological deficits.","meaning":"Boolean indicating whether the patient's history of cerebrovascular accident (stroke) is accompanied by residual neurological deficits."} ;; "history of stroke with residuals"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for brain trauma within 12 months prior to selection implies brain trauma in history
(assert
(! (=> patient_has_diagnosis_of_cerebral_trauma_inthehistory@@temporalcontext_within12months_prior_to_selection
      patient_has_diagnosis_of_cerebral_trauma_inthehistory)
    :named REQ2_AUXILIARY0)) ;; "brain trauma within twelve months prior to selection" implies "brain trauma in history"

;; Qualifier variable for history of stroke with residuals implies stroke in history
(assert
(! (=> patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@with_residuals
      patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
    :named REQ2_AUXILIARY1)) ;; "history of stroke with residuals" implies "stroke in history"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have had brain trauma within 12 months prior to selection
(assert
(! (not patient_has_diagnosis_of_cerebral_trauma_inthehistory@@temporalcontext_within12months_prior_to_selection)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had brain trauma within twelve months prior to selection."

;; Exclusion: patient must NOT have a history of stroke with residuals
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory@@with_residuals)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke with residuals."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suffering from delirium.","when_to_set_to_false":"Set to false if the patient is currently not suffering from delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suffering from delirium.","meaning":"Boolean indicating whether the patient is currently suffering from delirium."} ;; "delirium"
(declare-const patient_has_finding_of_delirium_now@@diagnosed_by_confusion_assessment_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current delirium diagnosis was made using the Confusion Assessment Method.","when_to_set_to_false":"Set to false if the patient's current delirium diagnosis was not made using the Confusion Assessment Method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Confusion Assessment Method was used to diagnose the patient's current delirium.","meaning":"Boolean indicating whether the patient's current delirium diagnosis was made using the Confusion Assessment Method."} ;; "Confusion Assessment Method diagnosis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_delirium_now@@diagnosed_by_confusion_assessment_method
       patient_has_finding_of_delirium_now)
   :named REQ3_AUXILIARY0)) ;; "Confusion Assessment Method diagnosis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_delirium_now@@diagnosed_by_confusion_assessment_method)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from delirium (Confusion Assessment Method diagnosis) at selection."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_can_undergo_assessment_using_confusion_assessment_method_now@@pre_operative_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete the Confusion Assessment Method assessment in the pre-operative period.","when_to_set_to_false":"Set to false if the patient is currently unable to complete the Confusion Assessment Method assessment in the pre-operative period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently complete the Confusion Assessment Method assessment in the pre-operative period.","meaning":"Boolean indicating whether the patient can currently complete the Confusion Assessment Method assessment in the pre-operative period."} ;; "cannot complete the pre-operative Confusion Assessment Method mental tests"

(declare-const patient_can_undergo_assessment_using_mini_mental_state_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete the Mini-Mental State Examination assessment.","when_to_set_to_false":"Set to false if the patient is currently unable to complete the Mini-Mental State Examination assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently complete the Mini-Mental State Examination assessment.","meaning":"Boolean indicating whether the patient can currently complete the Mini-Mental State Examination assessment."} ;; "cannot complete the pre-operative Mini-Mental State Examination mental tests"

(declare-const patient_can_undergo_assessment_using_mini_mental_state_examination_now@@pre_operative_context Bool) ;; {"when_to_set_to_true":"Set to true if the ability to complete the Mini-Mental State Examination assessment is specifically in the pre-operative period.","when_to_set_to_false":"Set to false if the ability to complete the assessment is not specifically in the pre-operative period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the context is pre-operative.","meaning":"Boolean indicating whether the ability to complete the Mini-Mental State Examination assessment is specifically in the pre-operative period."} ;; "pre-operative Mini-Mental State Examination mental tests"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable for Mini-Mental State Examination
(assert
(! (=> patient_can_undergo_assessment_using_mini_mental_state_examination_now@@pre_operative_context
     patient_can_undergo_assessment_using_mini_mental_state_examination_now)
:named REQ4_AUXILIARY0)) ;; "pre-operative Mini-Mental State Examination mental tests"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT be unable to complete either pre-operative assessment
(assert
(! (not (or (not patient_can_undergo_assessment_using_confusion_assessment_method_now@@pre_operative_context)
            (not patient_can_undergo_assessment_using_mini_mental_state_examination_now@@pre_operative_context)))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient cannot complete the pre-operative Confusion Assessment Method mental tests of this clinical trial) OR (the patient cannot complete the pre-operative Mini-Mental State Examination mental tests of this clinical trial)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Mini-Mental State Examination score is recorded at selection.","when_to_set_to_null":"Set to null if no such score is recorded at selection or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score measured at selection."} ;; "Mini-Mental State Examination score less than twenty-four at selection"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (< patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 24))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Mini-Mental State Examination score less than twenty-four at selection."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_malignant_hyperthermia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to be susceptible to malignant hyperthermia.","when_to_set_to_false":"Set to false if the patient is currently known not to be susceptible to malignant hyperthermia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently susceptible to malignant hyperthermia.","meaning":"Boolean indicating whether the patient currently has a finding of malignant hyperthermia."} ;; "the patient is known to be susceptible to malignant hyperthermia"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_malignant_hyperthermia_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is known to be susceptible to malignant hyperthermia."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_raised_intracranial_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of elevated intracranial pressure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of elevated intracranial pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of elevated intracranial pressure.","meaning":"Boolean indicating whether the patient currently has elevated intracranial pressure."} ;; "elevated intracranial pressure"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_raised_intracranial_pressure_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has elevated intracranial pressure."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_increased_oxygen_demand_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased oxygen demand (high oxygen requirement).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased oxygen demand.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased oxygen demand.","meaning":"Boolean indicating whether the patient currently has increased oxygen demand."} ;; "high oxygen demand"
(declare-const patient_has_risk_of_high_oxygen_demand_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a risk of high oxygen demand.","when_to_set_to_false":"Set to false if the patient currently does not have a risk of high oxygen demand.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a risk of high oxygen demand.","meaning":"Boolean indicating whether the patient currently has a risk of high oxygen demand."} ;; "risk of high oxygen demand"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_risk_of_high_oxygen_demand_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a risk of high oxygen demand."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_myocardial_infarction_recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction recently (within the timeframe defined as 'recent' in the study context).","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a recent myocardial infarction.","meaning":"Boolean indicating whether the patient has had a recent myocardial infarction."} ;; "recent myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myocardial infarction (ongoing at present).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myocardial infarction (ongoing at present).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ongoing myocardial infarction.","meaning":"Boolean indicating whether the patient currently has ongoing myocardial infarction."} ;; "ongoing myocardial infarction"
(declare-const patient_has_finding_of_myocardial_damage_recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had myocardial damage recently (within the timeframe defined as 'recent' in the study context).","when_to_set_to_false":"Set to false if the patient has not had myocardial damage recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had recent myocardial damage.","meaning":"Boolean indicating whether the patient has had recent myocardial damage."} ;; "recent myocardial damage"
(declare-const patient_has_finding_of_myocardial_damage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ongoing myocardial damage.","when_to_set_to_false":"Set to false if the patient currently does not have ongoing myocardial damage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ongoing myocardial damage.","meaning":"Boolean indicating whether the patient currently has ongoing myocardial damage."} ;; "ongoing myocardial damage"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_finding_of_myocardial_infarction_recent
            patient_has_finding_of_myocardial_infarction_now
            patient_has_finding_of_myocardial_damage_recent
            patient_has_finding_of_myocardial_damage_now))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has recent myocardial infarction) OR (the patient has ongoing myocardial infarction) OR (the patient has recent myocardial damage) OR (the patient has ongoing myocardial damage)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure now."} ;; "cardiac failure"
(declare-const patient_has_finding_of_heart_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is severe.","when_to_set_to_false":"Set to false if the patient's current heart failure is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is severe.","meaning":"Boolean indicating whether the patient's current heart failure is severe."} ;; "severe cardiac failure"
(declare-const patient_has_finding_of_left_ventricular_systolic_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left ventricular systolic dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have left ventricular systolic dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular systolic dysfunction.","meaning":"Boolean indicating whether the patient currently has left ventricular systolic dysfunction now."} ;; "impaired left ventricular systolic function"
(declare-const patient_has_finding_of_left_ventricular_systolic_dysfunction_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current left ventricular systolic dysfunction is severe.","when_to_set_to_false":"Set to false if the patient's current left ventricular systolic dysfunction is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current left ventricular systolic dysfunction is severe.","meaning":"Boolean indicating whether the patient's current left ventricular systolic dysfunction is severe."} ;; "severe impaired left ventricular systolic function"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_failure_now@@severe
      patient_has_finding_of_heart_failure_now)
   :named REQ10_AUXILIARY0)) ;; "severe cardiac failure"

(assert
(! (=> patient_has_finding_of_left_ventricular_systolic_dysfunction_now@@severe
      patient_has_finding_of_left_ventricular_systolic_dysfunction_now)
   :named REQ10_AUXILIARY1)) ;; "severe impaired left ventricular systolic function"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@severe)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe cardiac failure."

(assert
(! (not patient_has_finding_of_left_ventricular_systolic_dysfunction_now@@severe)
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe impaired left ventricular systolic function."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_lung_disease_now@@known@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lung disease that is both known and severe.","when_to_set_to_false":"Set to false if the patient currently does not have a lung disease that is both known and severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lung disease that is both known and severe.","meaning":"Boolean indicating whether the patient currently has a known severe lung disease."} ;; "known severe lung disease"
(declare-const patient_has_finding_of_lung_disease_now@@known@@severe@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lung disease is known.","when_to_set_to_false":"Set to false if the patient's lung disease is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lung disease is known.","meaning":"Boolean indicating whether the patient's lung disease is known."} ;; "known severe lung disease"
(declare-const patient_has_finding_of_lung_disease_now@@known@@severe@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lung disease is severe.","when_to_set_to_false":"Set to false if the patient's lung disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lung disease is severe.","meaning":"Boolean indicating whether the patient's lung disease is severe."} ;; "known severe lung disease"

(declare-const patient_has_finding_of_airway_disease_now@@known@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an airway disease that is both known and severe.","when_to_set_to_false":"Set to false if the patient currently does not have an airway disease that is both known and severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an airway disease that is both known and severe.","meaning":"Boolean indicating whether the patient currently has a known severe airway disease."} ;; "known severe airway disease"
(declare-const patient_has_finding_of_airway_disease_now@@known@@severe@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's airway disease is known.","when_to_set_to_false":"Set to false if the patient's airway disease is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's airway disease is known.","meaning":"Boolean indicating whether the patient's airway disease is known."} ;; "known severe airway disease"
(declare-const patient_has_finding_of_airway_disease_now@@known@@severe@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's airway disease is severe.","when_to_set_to_false":"Set to false if the patient's airway disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's airway disease is severe.","meaning":"Boolean indicating whether the patient's airway disease is severe."} ;; "known severe airway disease"

(declare-const patient_has_finding_of_respiratory_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of respiratory insufficiency.","meaning":"Boolean indicating whether the patient currently has respiratory insufficiency."} ;; "respiratory insufficiency"
(declare-const patient_has_finding_of_respiratory_insufficiency_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's respiratory insufficiency is chronic.","when_to_set_to_false":"Set to false if the patient's respiratory insufficiency is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory insufficiency is chronic.","meaning":"Boolean indicating whether the patient's respiratory insufficiency is chronic."} ;; "chronic respiratory insufficiency"
(declare-const patient_has_finding_of_respiratory_insufficiency_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's respiratory insufficiency is severe.","when_to_set_to_false":"Set to false if the patient's respiratory insufficiency is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory insufficiency is severe.","meaning":"Boolean indicating whether the patient's respiratory insufficiency is severe."} ;; "severe chronic respiratory insufficiency"

(declare-const patient_is_undergoing_home_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing home oxygen therapy at home.","when_to_set_to_false":"Set to false if the patient is currently not undergoing home oxygen therapy at home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing home oxygen therapy at home.","meaning":"Boolean indicating whether the patient is currently undergoing home oxygen therapy at home."} ;; "homecare oxygen therapy"
(declare-const patient_is_undergoing_home_oxygen_therapy_now@@sustained Bool) ;; {"when_to_set_to_true":"Set to true if the patient's home oxygen therapy is sustained.","when_to_set_to_false":"Set to false if the patient's home oxygen therapy is not sustained.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's home oxygen therapy is sustained.","meaning":"Boolean indicating whether the patient's home oxygen therapy is sustained."} ;; "sustained homecare oxygen therapy"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variables for lung disease
(assert
(! (=> patient_has_finding_of_lung_disease_now@@known@@severe
      (and patient_has_finding_of_lung_disease_now@@known@@severe@@known
           patient_has_finding_of_lung_disease_now@@known@@severe@@severe))
:named REQ11_AUXILIARY0)) ;; "known severe lung disease"

;; Qualifier variables imply corresponding stem variables for airway disease
(assert
(! (=> patient_has_finding_of_airway_disease_now@@known@@severe
      (and patient_has_finding_of_airway_disease_now@@known@@severe@@known
           patient_has_finding_of_airway_disease_now@@known@@severe@@severe))
:named REQ11_AUXILIARY1)) ;; "known severe airway disease"

;; Qualifier variables imply corresponding stem variables for respiratory insufficiency
(assert
(! (=> (and patient_has_finding_of_respiratory_insufficiency_now@@chronic
            patient_has_finding_of_respiratory_insufficiency_now@@severe)
      patient_has_finding_of_respiratory_insufficiency_now)
:named REQ11_AUXILIARY2)) ;; "severe chronic respiratory insufficiency"

;; Qualifier variables imply corresponding stem variables for home oxygen therapy
(assert
(! (=> patient_is_undergoing_home_oxygen_therapy_now@@sustained
      patient_is_undergoing_home_oxygen_therapy_now)
:named REQ11_AUXILIARY3)) ;; "sustained homecare oxygen therapy"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have any of the following:
(assert
(! (not patient_has_finding_of_lung_disease_now@@known@@severe)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known severe lung disease."

(assert
(! (not patient_has_finding_of_airway_disease_now@@known@@severe)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known severe airway disease."

(assert
(! (not (and patient_has_finding_of_respiratory_insufficiency_now@@chronic
             patient_has_finding_of_respiratory_insufficiency_now@@severe))
:named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe chronic respiratory insufficiency."

(assert
(! (not patient_is_undergoing_home_oxygen_therapy_now@@sustained)
:named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on sustained homecare oxygen therapy."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_contraindication_for_general_anaesthesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contra-indication for general anaesthesia.","when_to_set_to_false":"Set to false if the patient currently does not have a contra-indication for general anaesthesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contra-indication for general anaesthesia.","meaning":"Boolean indicating whether the patient currently has a contra-indication for general anaesthesia."} ;; "contra-indication ... for general anaesthesia"
(declare-const patient_has_finding_of_serious_physical_health_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious physical health problem (serious illness).","when_to_set_to_false":"Set to false if the patient currently does not have a serious physical health problem (serious illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious physical health problem (serious illness).","meaning":"Boolean indicating whether the patient currently has a serious physical health problem (serious illness)."} ;; "serious illness"
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease condition or medical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease condition or medical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease condition or medical finding.","meaning":"Boolean indicating whether the patient currently has any disease condition or medical finding."} ;; "medical conditions"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; The umbrella "contra-indication (serious illness OR medical conditions) for general anaesthesia" is defined as having either a serious illness or a medical condition that is a contra-indication for general anaesthesia (exhaustive subcategories).
(assert
(! (= patient_has_contraindication_for_general_anaesthesia_now
     (or patient_has_finding_of_serious_physical_health_problem_now
         patient_has_finding_of_disease_condition_finding_now))
:named REQ12_AUXILIARY0)) ;; "contra-indication (serious illness OR medical conditions) for general anaesthesia"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_contraindication_for_general_anaesthesia_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contra-indication (serious illness OR medical conditions) for general anaesthesia."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_allergy_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to any drug.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to any drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to any drug.","meaning":"Boolean indicating whether the patient currently has an allergy to any drug."} ;; "allergy to any drugs"
(declare-const patient_has_finding_of_allergy_to_drug_now@@to_any_drug_administered_during_this_clinical_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy is to a drug that is administered during this clinical trial.","when_to_set_to_false":"Set to false if the patient's allergy is not to a drug administered during this clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy is to a drug administered during this clinical trial.","meaning":"Boolean indicating whether the allergy is to a drug administered during this clinical trial."} ;; "allergy to any drugs administered during this clinical trial"
(declare-const patient_has_finding_of_allergic_reaction_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity (allergic reaction) to any drug.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity (allergic reaction) to any drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity (allergic reaction) to any drug.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity (allergic reaction) to any drug."} ;; "hypersensitivity to any drugs"
(declare-const patient_has_finding_of_allergic_reaction_to_drug_now@@to_any_drug_administered_during_this_clinical_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity is to a drug that is administered during this clinical trial.","when_to_set_to_false":"Set to false if the patient's hypersensitivity is not to a drug administered during this clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to a drug administered during this clinical trial.","meaning":"Boolean indicating whether the hypersensitivity is to a drug administered during this clinical trial."} ;; "hypersensitivity to any drugs administered during this clinical trial"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergy_to_drug_now@@to_any_drug_administered_during_this_clinical_trial
       patient_has_finding_of_allergy_to_drug_now)
   :named REQ13_AUXILIARY0)) ;; "allergy to any drugs administered during this clinical trial"

(assert
(! (=> patient_has_finding_of_allergic_reaction_to_drug_now@@to_any_drug_administered_during_this_clinical_trial
       patient_has_finding_of_allergic_reaction_to_drug_now)
   :named REQ13_AUXILIARY1)) ;; "hypersensitivity to any drugs administered during this clinical trial"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_allergy_to_drug_now@@to_any_drug_administered_during_this_clinical_trial)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to any drugs administered during this clinical trial."

(assert
(! (not patient_has_finding_of_allergic_reaction_to_drug_now@@to_any_drug_administered_during_this_clinical_trial)
   :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to any drugs administered during this clinical trial."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_previously_participated_in_this_clinical_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this clinical trial.","when_to_set_to_false":"Set to false if the patient has not previously participated in this clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this clinical trial.","meaning":"Boolean indicating whether the patient has previously participated in this clinical trial."} ;; "The patient is excluded if the patient has previously participated in this clinical trial."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_previously_participated_in_this_clinical_trial)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously participated in this clinical trial."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_participated_in_another_clinical_trial_within_4_weeks_prior_to_selection Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in another clinical trial within the 4 weeks prior to selection.","when_to_set_to_false":"Set to false if the patient has not participated in another clinical trial within the 4 weeks prior to selection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in another clinical trial within the 4 weeks prior to selection.","meaning":"Boolean indicating whether the patient has participated in another clinical trial within the 4 weeks prior to selection."} ;; "has participated in another clinical trial within four weeks prior to selection"

(declare-const patient_has_participated_in_another_clinical_trial_within_4_weeks_prior_to_selection@@prior_to_selection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in another clinical trial occurred prior to selection.","when_to_set_to_false":"Set to false if the patient's participation in another clinical trial did not occur prior to selection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in another clinical trial occurred prior to selection.","meaning":"Boolean indicating whether the patient's participation in another clinical trial occurred prior to selection."} ;; "prior to selection"

(declare-const weeks_since_last_participation_in_another_clinical_trial_prior_to_selection_value_recorded_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks since the patient's last participation in another clinical trial prior to selection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weeks have passed since the patient's last participation in another clinical trial prior to selection.","meaning":"Numeric value indicating the number of weeks since the patient's last participation in another clinical trial prior to selection."} ;; "within four weeks prior to selection"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Definition: participation within 4 weeks prior to selection
(assert
(! (= patient_has_participated_in_another_clinical_trial_within_4_weeks_prior_to_selection
(and (< weeks_since_last_participation_in_another_clinical_trial_prior_to_selection_value_recorded_in_weeks 4)
    patient_has_participated_in_another_clinical_trial_within_4_weeks_prior_to_selection@@prior_to_selection))
:named REQ15_AUXILIARY0)) ;; "has participated in another clinical trial within four weeks prior to selection"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_participated_in_another_clinical_trial_within_4_weeks_prior_to_selection@@prior_to_selection
     patient_has_participated_in_another_clinical_trial_within_4_weeks_prior_to_selection)
:named REQ15_AUXILIARY1)) ;; "prior to selection"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_participated_in_another_clinical_trial_within_4_weeks_prior_to_selection)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in another clinical trial within four weeks prior to selection."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has ever had a finding of alcohol abuse in their history."} ;; "the patient has a history of alcohol abuse"

(declare-const patient_has_finding_of_drug_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of drug abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse.","meaning":"Boolean indicating whether the patient has ever had a finding of drug abuse in their history."} ;; "the patient has a history of drug abuse"

(declare-const patient_has_finding_of_psychiatric_disorder_which_impairs_understanding_of_necessary_information_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder which impairs their understanding of the necessary information.","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric disorder which impairs their understanding of the necessary information.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric disorder which impairs their understanding of the necessary information.","meaning":"Boolean indicating whether the patient currently has a psychiatric disorder which impairs their understanding of the necessary information."} ;; "psychiatric disorders which would impair the understanding of the necessary information"

(declare-const patient_has_finding_of_psychiatric_disorder_which_renders_patient_legally_unable_to_give_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder which renders them legally unable to give written informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric disorder which renders them legally unable to give written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric disorder which renders them legally unable to give written informed consent.","meaning":"Boolean indicating whether the patient currently has a psychiatric disorder which renders them legally unable to give written informed consent."} ;; "psychiatric disorders which would render the patient legally unable to give written informed consent"

(declare-const patient_has_finding_of_psychiatric_disorder_which_renders_patient_medically_unable_to_give_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder which renders them medically unable to give written informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric disorder which renders them medically unable to give written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric disorder which renders them medically unable to give written informed consent.","meaning":"Boolean indicating whether the patient currently has a psychiatric disorder which renders them medically unable to give written informed consent."} ;; "psychiatric disorders which would render the patient medically unable to give written informed consent"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse."

(assert
(! (not patient_has_finding_of_drug_abuse_inthehistory)
:named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse."

(assert
(! (not (or patient_has_finding_of_psychiatric_disorder_which_impairs_understanding_of_necessary_information_now
            patient_has_finding_of_psychiatric_disorder_which_renders_patient_medically_unable_to_give_written_informed_consent_now
            patient_has_finding_of_psychiatric_disorder_which_renders_patient_legally_unable_to_give_written_informed_consent_now))
:named REQ16_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychiatric disorders which would impair the understanding of the necessary information OR render the patient medically OR legally unable to give written informed consent."
