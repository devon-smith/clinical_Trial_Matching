;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung.","meaning":"Boolean indicating whether the patient currently has a disorder of the lung."} ;; "lung disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the lung is severe.","when_to_set_to_false":"Set to false if the patient's current disorder of the lung is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the lung is severe.","meaning":"Boolean indicating whether the patient's current disorder of the lung is severe."} ;; "severe lung disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@requires_oxygen_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the lung requires oxygen therapy.","when_to_set_to_false":"Set to false if the patient's current disorder of the lung does not require oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the lung requires oxygen therapy.","meaning":"Boolean indicating whether the patient's current disorder of the lung requires oxygen therapy."} ;; "requiring oxygen therapy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@is_severe
      patient_has_finding_of_disorder_of_lung_now)
:named REQ0_AUXILIARY0)) ;; "severe lung disease"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@requires_oxygen_therapy
      patient_has_finding_of_disorder_of_lung_now)
:named REQ0_AUXILIARY1)) ;; "lung disease requiring oxygen therapy"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have severe lung disease requiring oxygen therapy
(assert
(! (not (and patient_has_finding_of_disorder_of_lung_now@@is_severe
             patient_has_finding_of_disorder_of_lung_now@@requires_oxygen_therapy))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe lung disease requiring oxygen therapy."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a finding of pulmonary embolism."} ;; "pulmonary embolus"
(declare-const patient_has_finding_of_pulmonary_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of pulmonary infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of pulmonary infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of pulmonary infarction.","meaning":"Boolean indicating whether the patient currently has a finding of pulmonary infarction."} ;; "pulmonary infarction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_finding_of_pulmonary_embolism_now
            patient_has_finding_of_pulmonary_infarction_now))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has pulmonary embolus) OR (the patient has pulmonary infarction)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_cardiopulmonary_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any cardiopulmonary disease prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any cardiopulmonary disease prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any cardiopulmonary disease.","meaning":"Boolean indicating whether the patient has a history of any cardiopulmonary disease."} ;; "cardiopulmonary disease"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has a history of myocardial infarction."} ;; "prior myocardial infarction"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass grafting prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient has a history of coronary artery bypass grafting."} ;; "prior coronary artery bypass"

(declare-const patient_has_undergone_vascular_stent_placement_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone placement of a vascular stent prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never undergone placement of a vascular stent prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone placement of a vascular stent.","meaning":"Boolean indicating whether the patient has a history of vascular stent placement."} ;; "prior vascular stent"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_myocardial_infarction_inthehistory
           patient_has_undergone_coronary_artery_bypass_graft_inthehistory
           patient_has_undergone_vascular_stent_placement_inthehistory)
       patient_has_diagnosis_of_cardiopulmonary_disease_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((prior myocardial infarction) OR (prior coronary artery bypass) OR (prior vascular stent))."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_cardiopulmonary_disease_inthehistory)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiopulmonary disease with non-exhaustive examples ((prior myocardial infarction) OR (prior coronary artery bypass) OR (prior vascular stent))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina (preinfarction syndrome)."} ;; "unstable angina"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_preinfarction_syndrome_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of conduction disorder of the heart (cardiac dysrhythmias).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of conduction disorder of the heart (cardiac dysrhythmias).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has conduction disorder of the heart (cardiac dysrhythmias).","meaning":"Boolean indicating whether the patient currently has conduction disorder of the heart (cardiac dysrhythmias)."} ;; "cardiac dysrhythmias"
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's conduction disorder of the heart (cardiac dysrhythmias) is uncontrolled.","when_to_set_to_false":"Set to false if the patient's conduction disorder of the heart (cardiac dysrhythmias) is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's conduction disorder of the heart (cardiac dysrhythmias) is uncontrolled.","meaning":"Boolean indicating whether the patient's conduction disorder of the heart (cardiac dysrhythmias) is uncontrolled."} ;; "uncontrolled cardiac dysrhythmias"
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now@@causing_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient's conduction disorder of the heart (cardiac dysrhythmias) is causing symptoms.","when_to_set_to_false":"Set to false if the patient's conduction disorder of the heart (cardiac dysrhythmias) is not causing symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's conduction disorder of the heart (cardiac dysrhythmias) is causing symptoms.","meaning":"Boolean indicating whether the patient's conduction disorder of the heart (cardiac dysrhythmias) is causing symptoms."} ;; "causing symptoms"
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now@@causing_hemodynamic_compromise Bool) ;; {"when_to_set_to_true":"Set to true if the patient's conduction disorder of the heart (cardiac dysrhythmias) is causing hemodynamic compromise.","when_to_set_to_false":"Set to false if the patient's conduction disorder of the heart (cardiac dysrhythmias) is not causing hemodynamic compromise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's conduction disorder of the heart (cardiac dysrhythmias) is causing hemodynamic compromise.","meaning":"Boolean indicating whether the patient's conduction disorder of the heart (cardiac dysrhythmias) is causing hemodynamic compromise."} ;; "causing hemodynamic compromise"
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled_causing_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled conduction disorder of the heart (cardiac dysrhythmias) and the dysrhythmias are causing symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled conduction disorder of the heart (cardiac dysrhythmias) causing symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled conduction disorder of the heart (cardiac dysrhythmias) causing symptoms.","meaning":"Boolean indicating whether the patient currently has uncontrolled conduction disorder of the heart (cardiac dysrhythmias) causing symptoms."} ;; "uncontrolled cardiac dysrhythmias causing symptoms"
(declare-const patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled_causing_hemodynamic_compromise Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled conduction disorder of the heart (cardiac dysrhythmias) and the dysrhythmias are causing hemodynamic compromise.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled conduction disorder of the heart (cardiac dysrhythmias) causing hemodynamic compromise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled conduction disorder of the heart (cardiac dysrhythmias) causing hemodynamic compromise.","meaning":"Boolean indicating whether the patient currently has uncontrolled conduction disorder of the heart (cardiac dysrhythmias) causing hemodynamic compromise."} ;; "uncontrolled cardiac dysrhythmias causing hemodynamic compromise"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definitional: uncontrolled cardiac dysrhythmias causing symptoms
(assert
(! (= patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled_causing_symptoms
(and patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled
     patient_has_finding_of_conduction_disorder_of_the_heart_now@@causing_symptoms))
:named REQ4_AUXILIARY0)) ;; "uncontrolled cardiac dysrhythmias causing symptoms"

;; Definitional: uncontrolled cardiac dysrhythmias causing hemodynamic compromise
(assert
(! (= patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled_causing_hemodynamic_compromise
(and patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled
     patient_has_finding_of_conduction_disorder_of_the_heart_now@@causing_hemodynamic_compromise))
:named REQ4_AUXILIARY1)) ;; "uncontrolled cardiac dysrhythmias causing hemodynamic compromise"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled
      patient_has_finding_of_conduction_disorder_of_the_heart_now)
:named REQ4_AUXILIARY2)) ;; "uncontrolled cardiac dysrhythmias" implies "cardiac dysrhythmias"

(assert
(! (=> patient_has_finding_of_conduction_disorder_of_the_heart_now@@causing_symptoms
      patient_has_finding_of_conduction_disorder_of_the_heart_now)
:named REQ4_AUXILIARY3)) ;; "causing symptoms" implies "cardiac dysrhythmias"

(assert
(! (=> patient_has_finding_of_conduction_disorder_of_the_heart_now@@causing_hemodynamic_compromise
      patient_has_finding_of_conduction_disorder_of_the_heart_now)
:named REQ4_AUXILIARY4)) ;; "causing hemodynamic compromise" implies "cardiac dysrhythmias"

;; Qualifier conjunction implies both qualifiers
(assert
(! (=> patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled_causing_symptoms
      (and patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled
           patient_has_finding_of_conduction_disorder_of_the_heart_now@@causing_symptoms))
:named REQ4_AUXILIARY5)) ;; "uncontrolled cardiac dysrhythmias causing symptoms" implies both qualifiers

(assert
(! (=> patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled_causing_hemodynamic_compromise
      (and patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled
           patient_has_finding_of_conduction_disorder_of_the_heart_now@@causing_hemodynamic_compromise))
:named REQ4_AUXILIARY6)) ;; "uncontrolled cardiac dysrhythmias causing hemodynamic compromise" implies both qualifiers

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled_causing_symptoms)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled cardiac dysrhythmias causing symptoms."

(assert
(! (not patient_has_finding_of_conduction_disorder_of_the_heart_now@@uncontrolled_causing_hemodynamic_compromise)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled cardiac dysrhythmias causing hemodynamic compromise."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_health_reason_limiting_walking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any health reason that limits walking.","when_to_set_to_false":"Set to false if the patient currently does not have any health reason that limits walking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any health reason that limits walking.","meaning":"Boolean indicating whether the patient currently has any health reason that limits walking."} ;; "The patient is excluded if the patient has any health reason that limits walking."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_health_reason_limiting_walking_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any health reason that limits walking."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_health_reason_limiting_walking_now@@temporary_injury Bool) ;; {"when_to_set_to_true":"Set to true if the health reason limiting walking is specifically a temporary injury.","when_to_set_to_false":"Set to false if the health reason limiting walking is not a temporary injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the health reason limiting walking is a temporary injury.","meaning":"Boolean indicating whether the health reason limiting walking is specifically a temporary injury."} ;; "temporary injury that limits walking"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_health_reason_limiting_walking_now@@temporary_injury
      patient_has_health_reason_limiting_walking_now)
:named REQ6_AUXILIARY0)) ;; "temporary injury that limits walking""

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_health_reason_limiting_walking_now@@temporary_injury)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a temporary injury that limits walking."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_uses_wheelchair_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses a wheelchair.","when_to_set_to_false":"Set to false if the patient currently does not use a wheelchair.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses a wheelchair.","meaning":"Boolean indicating whether the patient currently uses a wheelchair."} ;; "the patient uses a wheelchair"
(declare-const patient_uses_assistive_device_for_walking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses another assistive device for walking.","when_to_set_to_false":"Set to false if the patient currently does not use another assistive device for walking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses another assistive device for walking.","meaning":"Boolean indicating whether the patient currently uses another assistive device for walking."} ;; "the patient uses another assistive device for walking"
(declare-const patient_has_finding_of_difficulty_walking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of difficulty walking.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of difficulty walking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of difficulty walking.","meaning":"Boolean indicating whether the patient currently has difficulty walking."} ;; "difficulty ambulating"
(declare-const patient_has_finding_of_difficulty_walking_now@@during_activities_of_daily_living Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current difficulty walking occurs during activities of daily living (ADLs).","when_to_set_to_false":"Set to false if the patient's current difficulty walking does not occur during activities of daily living (ADLs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current difficulty walking occurs during activities of daily living (ADLs).","meaning":"Boolean indicating whether the patient's current difficulty walking occurs during activities of daily living (ADLs)."} ;; "difficulty ambulating during activities of daily living"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_difficulty_walking_now@@during_activities_of_daily_living
      patient_has_finding_of_difficulty_walking_now)
   :named REQ7_AUXILIARY0)) ;; "difficulty ambulating during activities of daily living" implies "difficulty ambulating"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT use a wheelchair
(assert
(! (not patient_uses_wheelchair_now)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses a wheelchair."

;; Exclusion: patient must NOT use another assistive device for walking
(assert
(! (not patient_uses_assistive_device_for_walking_now)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses another assistive device for walking."

;; Exclusion: patient must NOT have difficulty ambulating during activities of daily living
(assert
(! (not patient_has_finding_of_difficulty_walking_now@@during_activities_of_daily_living)
   :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has difficulty ambulating during activities of daily living."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_illiteracy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently illiterate.","when_to_set_to_false":"Set to false if the patient is currently not illiterate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently illiterate.","meaning":"Boolean indicating whether the patient is currently illiterate."} ;; "illiterate"
(declare-const patient_has_finding_of_illiteracy_now@@predetermined_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's illiteracy status is predetermined (established prior to assessment).","when_to_set_to_false":"Set to false if the patient's illiteracy status is not predetermined (e.g., newly discovered or uncertain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's illiteracy status is predetermined.","meaning":"Boolean indicating whether the patient's illiteracy status is predetermined."} ;; "predetermined to be illiterate"
(declare-const patient_has_finding_of_incompetence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently incompetent.","when_to_set_to_false":"Set to false if the patient is currently not incompetent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently incompetent.","meaning":"Boolean indicating whether the patient is currently incompetent."} ;; "incompetent"
(declare-const patient_has_finding_of_incompetence_now@@predetermined_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's incompetence status is predetermined (established prior to assessment).","when_to_set_to_false":"Set to false if the patient's incompetence status is not predetermined (e.g., newly discovered or uncertain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's incompetence status is predetermined.","meaning":"Boolean indicating whether the patient's incompetence status is predetermined."} ;; "predetermined to be incompetent"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_illiteracy_now@@predetermined_status
      patient_has_finding_of_illiteracy_now)
   :named REQ8_AUXILIARY0)) ;; "predetermined to be illiterate"

(assert
(! (=> patient_has_finding_of_incompetence_now@@predetermined_status
      patient_has_finding_of_incompetence_now)
   :named REQ8_AUXILIARY1)) ;; "predetermined to be incompetent"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_finding_of_illiteracy_now@@predetermined_status
            patient_has_finding_of_incompetence_now@@predetermined_status))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is predetermined to be illiterate) OR (the patient is predetermined to be incompetent)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be pregnant at the present time.","when_to_set_to_false":"Set to false if the patient is confirmed not to be pregnant at the present time.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is currently pregnant"
(declare-const patient_is_pregnant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been pregnant at any time since bariatric surgery.","when_to_set_to_false":"Set to false if the patient has not been pregnant at any time since bariatric surgery.","when_to_set_to_null":"Set to null if the patient's pregnancy history since bariatric surgery is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient has been pregnant at any time in the history since bariatric surgery."} ;; "the patient has been pregnant at any time since bariatric surgery"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_is_pregnant_now
            patient_is_pregnant_inthehistory))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is currently pregnant) OR (the patient has been pregnant at any time since bariatric surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_tobacco_user_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses tobacco (is a tobacco user).","when_to_set_to_false":"Set to false if the patient currently does not use tobacco (is not a tobacco user).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses tobacco.","meaning":"Boolean indicating whether the patient currently uses tobacco (is a tobacco user)."} ;; "uses tobacco"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_tobacco_user_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses tobacco."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_electronic_defibrillator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an electronic defibrillator implanted or present.","when_to_set_to_false":"Set to false if the patient currently does not have an electronic defibrillator implanted or present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an electronic defibrillator.","meaning":"Boolean indicating whether the patient currently has an electronic defibrillator implanted or present."} ;; "the patient has electronic defibrillators"
(declare-const patient_has_embedded_electronic_medical_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other embedded electronic medical device implanted or present.","when_to_set_to_false":"Set to false if the patient currently does not have any other embedded electronic medical device implanted or present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other embedded electronic medical device.","meaning":"Boolean indicating whether the patient currently has any other embedded electronic medical device implanted or present."} ;; "the patient has other embedded electronic medical devices"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_electronic_defibrillator_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has electronic defibrillators."

(assert
(! (not patient_has_embedded_electronic_medical_device_now)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other embedded electronic medical devices."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_fever_with_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute systemic infection accompanied by fever.","when_to_set_to_false":"Set to false if the patient currently does not have an acute systemic infection accompanied by fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute systemic infection accompanied by fever.","meaning":"Boolean indicating whether the patient currently has an acute systemic infection accompanied by fever."} ;; "acute systemic infection accompanied by fever"
(declare-const patient_has_finding_of_generalized_aches_and_pains_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has generalized aches and pains (body aches).","when_to_set_to_false":"Set to false if the patient currently does not have generalized aches and pains (body aches).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has generalized aches and pains (body aches).","meaning":"Boolean indicating whether the patient currently has generalized aches and pains (body aches)."} ;; "body aches"
(declare-const patient_has_finding_of_lymphadenopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lymphadenopathy (swollen lymph glands).","when_to_set_to_false":"Set to false if the patient currently does not have lymphadenopathy (swollen lymph glands).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lymphadenopathy (swollen lymph glands).","meaning":"Boolean indicating whether the patient currently has lymphadenopathy (swollen lymph glands)."} ;; "swollen lymph glands"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_fever_with_infection_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute systemic infection accompanied by fever."

(assert
(! (not patient_has_finding_of_generalized_aches_and_pains_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute systemic infection accompanied by body aches."

(assert
(! (not patient_has_finding_of_lymphadenopathy_now)
:named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute systemic infection accompanied by swollen lymph glands."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a bariatric operative procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bariatric operative procedure.","meaning":"Boolean indicating whether the patient has ever undergone a bariatric operative procedure in their history."} ;; "bariatric surgery"
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory@@is_revisional Bool) ;; {"when_to_set_to_true":"Set to true if the bariatric operative procedure undergone by the patient was revisional.","when_to_set_to_false":"Set to false if the bariatric operative procedure undergone by the patient was not revisional.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bariatric operative procedure was revisional.","meaning":"Boolean indicating whether the bariatric operative procedure undergone by the patient was revisional."} ;; "revisional bariatric surgery"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_bariatric_operative_procedure_inthehistory@@is_revisional
     patient_has_undergone_bariatric_operative_procedure_inthehistory)
:named REQ13_AUXILIARY0)) ;; "revisional bariatric surgery" implies "bariatric surgery"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_undergone_bariatric_operative_procedure_inthehistory@@is_revisional)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone revisional bariatric surgery."
