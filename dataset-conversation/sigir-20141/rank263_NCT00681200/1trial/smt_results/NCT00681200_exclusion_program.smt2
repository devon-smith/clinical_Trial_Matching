;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a current systolic blood pressure measurement in mmHg is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value for the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a current diastolic blood pressure measurement in mmHg is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value for the patient's current diastolic blood pressure in mmHg."} ;; "diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion if systolic < 140 OR diastolic < 90
(assert
(! (not (or (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 140)
            (< patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90)))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has systolic blood pressure < 140 millimeters of mercury OR diastolic blood pressure < 90 millimeters of mercury))."

;; Exclusion if systolic > 160 OR diastolic > 100
(assert
(! (not (or (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160)
            (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100)))
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has systolic blood pressure > 160 millimeters of mercury OR diastolic blood pressure > 100 millimeters of mercury))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the cardiovascular system at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the cardiovascular system at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a disorder of the cardiovascular system in their history."} ;; "clinical cardiovascular disease"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction (heart attack) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction (heart attack) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction (heart attack).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myocardial infarction (heart attack) in their history."} ;; "heart attack"
(declare-const patient_has_diagnosis_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with angina pectoris at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with angina pectoris at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with angina pectoris.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of angina pectoris in their history."} ;; "angina"
(declare-const patient_has_diagnosis_of_intermittent_claudication_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with intermittent claudication at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with intermittent claudication at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with intermittent claudication.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of intermittent claudication in their history."} ;; "intermittent claudication"
(declare-const patient_has_diagnosis_of_congestive_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with congestive heart failure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with congestive heart failure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with congestive heart failure.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of congestive heart failure in their history."} ;; "congestive heart failure"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebrovascular accident (stroke) in their history."} ;; "stroke"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_myocardial_infarction_inthehistory
           patient_has_diagnosis_of_angina_pectoris_inthehistory
           patient_has_diagnosis_of_intermittent_claudication_inthehistory
           patient_has_diagnosis_of_congestive_heart_failure_inthehistory
           patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
        patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((history of heart attack) OR (history of angina) OR (history of intermittent claudication) OR (history of congestive heart failure) OR (history of stroke))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of clinical cardiovascular disease with non-exhaustive examples..."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "kidney failure"
(declare-const patient_has_finding_of_renal_failure_syndrome_now@@long_term Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal failure syndrome and the syndrome is long-term (chronic).","when_to_set_to_false":"Set to false if the patient currently has renal failure syndrome but it is not long-term (i.e., acute or subacute).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal failure syndrome is long-term.","meaning":"Boolean indicating whether the patient's current renal failure syndrome is long-term (chronic)."} ;; "long-term kidney failure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_failure_syndrome_now@@long_term
       patient_has_finding_of_renal_failure_syndrome_now)
   :named REQ2_AUXILIARY0)) ;; "long-term kidney failure" implies "kidney failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_renal_failure_syndrome_now@@long_term)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has long-term kidney failure."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_life_threatening_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any life-threatening illness (other than advanced malignant neoplastic disease).","when_to_set_to_false":"Set to false if the patient currently does not have any life-threatening illness (other than advanced malignant neoplastic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any life-threatening illness (other than advanced malignant neoplastic disease).","meaning":"Boolean indicating whether the patient currently has any life-threatening illness (excluding advanced malignant neoplastic disease)."} ;; "any other life-threatening illness"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (cancer)."} ;; "advanced cancer"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@advanced Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer) and the disease is advanced (life-threatening).","when_to_set_to_false":"Set to false if the patient currently has malignant neoplastic disease (cancer) but the disease is not advanced (not life-threatening).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease (cancer) is advanced.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease (cancer) is advanced (life-threatening)."} ;; "advanced cancer"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive example: advanced cancer is an example of life-threatening illness
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@advanced
       patient_has_finding_of_life_threatening_illness_now)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (advanced cancer)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@advanced
       patient_has_finding_of_malignant_neoplastic_disease_now)
   :named REQ3_AUXILIARY1)) ;; "advanced cancer" implies "cancer"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_life_threatening_illness_now
            patient_has_finding_of_malignant_neoplastic_disease_now@@advanced))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other life-threatening illness with non-exhaustive examples (advanced cancer)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any mental disorder.","when_to_set_to_false":"Set to false if the patient does not have a documented history of any mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any mental disorder.","meaning":"Boolean indicating whether the patient has a history of any mental disorder."} ;; "psychiatric disorder"
(declare-const patient_has_finding_of_mental_disorder_inthehistory@@major_psychiatric_disorder_only Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of mental disorder qualifies as a major psychiatric disorder.","when_to_set_to_false":"Set to false if the patient's history of mental disorder does not qualify as a major psychiatric disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of mental disorder qualifies as a major psychiatric disorder.","meaning":"Boolean indicating whether the patient's history of mental disorder qualifies as a major psychiatric disorder."} ;; "major psychiatric disorder"
(declare-const patient_has_finding_of_psychotic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of psychotic disorder (psychosis).","when_to_set_to_false":"Set to false if the patient does not have a documented history of psychotic disorder (psychosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of psychotic disorder (psychosis).","meaning":"Boolean indicating whether the patient has a history of psychotic disorder (psychosis)."} ;; "psychosis"
(declare-const patient_has_finding_of_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of dementia.","when_to_set_to_false":"Set to false if the patient does not have a documented history of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of dementia.","meaning":"Boolean indicating whether the patient has a history of dementia."} ;; "dementia"
(declare-const patient_has_finding_of_psychoactive_substance_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of psychoactive substance abuse disorder.","when_to_set_to_false":"Set to false if the patient does not have a documented history of psychoactive substance abuse disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of psychoactive substance abuse disorder.","meaning":"Boolean indicating whether the patient has a history of psychoactive substance abuse disorder."} ;; "substance abuse disorder"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_psychotic_disorder_inthehistory
          patient_has_finding_of_dementia_inthehistory
          patient_has_finding_of_psychoactive_substance_abuse_inthehistory)
    patient_has_finding_of_mental_disorder_inthehistory@@major_psychiatric_disorder_only)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples ((history of psychosis) OR (history of dementia) OR (history of substance abuse disorder))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_inthehistory@@major_psychiatric_disorder_only
    patient_has_finding_of_mental_disorder_inthehistory)
:named REQ4_AUXILIARY1)) ;; "major psychiatric disorder"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_inthehistory@@major_psychiatric_disorder_only)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of major psychiatric disorder with non-exhaustive examples ((history of psychosis) OR (history of dementia) OR (history of substance abuse disorder))."
