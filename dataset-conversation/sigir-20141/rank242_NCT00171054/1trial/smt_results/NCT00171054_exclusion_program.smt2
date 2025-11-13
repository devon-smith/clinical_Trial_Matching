;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of hypertensive disorder (hypertension), regardless of severity.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of hypertensive disorder (hypertension), regardless of severity."} ;; "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of hypertensive disorder (hypertension) and the severity is classified as severe.","when_to_set_to_false":"Set to false if the patient currently has hypertensive disorder but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of hypertensive disorder is severe.","meaning":"Boolean indicating whether the patient's current hypertensive disorder is severe."} ;; "severe hypertension"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@severe
       patient_has_finding_of_hypertensive_disorder_now)
   :named REQ0_AUXILIARY0)) ;; "severe hypertension" implies "hypertensive disorder"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_hypertensive_disorder_now@@severe)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_taking_antilipemic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any anti-hyperlipidemic (antilipemic) medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any anti-hyperlipidemic (antilipemic) medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking anti-hyperlipidemic medication.","meaning":"Boolean indicating whether the patient is currently taking anti-hyperlipidemic (antilipemic) medication."} ;; "anti-hyperlipidemic medication"
(declare-const patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current LDL-C level in millimoles per liter is available.","when_to_set_to_null":"Set to null if no current LDL-C measurement in millimoles per liter is available or the value is indeterminate.","meaning":"Numeric value for the patient's current low-density lipoprotein cholesterol measurement in millimoles per liter."} ;; "low-density lipoprotein cholesterol level"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and
         (> patient_low_density_lipoprotein_cholesterol_measurement_value_recorded_now_withunit_millimoles_per_liter 4.1) ;; "low-density lipoprotein cholesterol level > 4.1 millimoles per liter"
         (not patient_is_taking_antilipemic_agent_now) ;; "the patient is NOT taking anti-hyperlipidemic medication"
      ))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has low-density lipoprotein cholesterol level > 4.1 millimoles per liter) AND (the patient is NOT taking anti-hyperlipidemic medication)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_undergoing_hormone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing or taking hormone therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing or taking hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing or taking hormone therapy.","meaning":"Boolean indicating whether the patient is currently undergoing or taking hormone therapy."} ;; "hormonal therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_undergoing_hormone_therapy_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking hormonal therapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever been diagnosed with cerebrovascular accident (stroke) in their history."} ;; "stroke"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction in their history."} ;; "myocardial infarction"

(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart failure at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart failure at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart failure.","meaning":"Boolean indicating whether the patient has ever been diagnosed with heart failure in their history."} ;; "heart failure"

(declare-const patient_has_finding_of_chest_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of chest pain at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of chest pain at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a documented finding of chest pain.","meaning":"Boolean indicating whether the patient has ever had a documented finding of chest pain in their history."} ;; "chest pain"

(declare-const patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with conduction disorder of the heart (abnormal heart rhythm) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with conduction disorder of the heart (abnormal heart rhythm) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with conduction disorder of the heart (abnormal heart rhythm).","meaning":"Boolean indicating whether the patient has ever been diagnosed with conduction disorder of the heart (abnormal heart rhythm) in their history."} ;; "abnormal heart rhythm"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke."

(assert
  (! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction."

(assert
  (! (not patient_has_diagnosis_of_heart_failure_inthehistory)
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of heart failure."

(assert
  (! (not patient_has_finding_of_chest_pain_inthehistory)
     :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chest pain."

(assert
  (! (not patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory)
     :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of abnormal heart rhythm."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "kidney disease"
(declare-const patient_has_finding_of_disorder_of_pancreas_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pancreas disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pancreas disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pancreas disease.","meaning":"Boolean indicating whether the patient currently has pancreas disease."} ;; "pancreas disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver disease."

(assert
(! (not patient_has_finding_of_kidney_disease_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has kidney disease."

(assert
(! (not patient_has_finding_of_disorder_of_pancreas_now)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pancreas disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_raynaud_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Raynaud's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Raynaud's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Raynaud's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Raynaud's disease."} ;; "Raynaud's disease"
(declare-const patient_has_diagnosis_of_peripheral_vascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peripheral vascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of peripheral vascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of peripheral vascular disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of peripheral vascular disease."} ;; "peripheral vascular disease"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_diagnosis_of_raynaud_s_disease_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Raynaud's disease."

(assert
  (! (not patient_has_diagnosis_of_peripheral_vascular_disease_now)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has peripheral vascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_allergy_to_medication_for_high_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to any medication used to treat high blood pressure.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to any medication used to treat high blood pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to any medication used to treat high blood pressure.","meaning":"Boolean indicating whether the patient currently has an allergy to any medication used to treat high blood pressure."} ;; "The patient is excluded if the patient has an allergy to medications used to treat high blood pressure."
(declare-const patient_has_allergy_to_medication_for_high_blood_pressure_now@@medication_is_for_treatment_of_high_blood_pressure Bool) ;; {"when_to_set_to_true":"Set to true if the medication to which the patient is allergic is used for the treatment of high blood pressure.","when_to_set_to_false":"Set to false if the medication to which the patient is allergic is not used for the treatment of high blood pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication to which the patient is allergic is used for the treatment of high blood pressure.","meaning":"Boolean indicating whether the medication to which the patient is allergic is used for the treatment of high blood pressure."} ;; "The patient is excluded if the patient has an allergy to medications used to treat high blood pressure."

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_allergy_to_medication_for_high_blood_pressure_now@@medication_is_for_treatment_of_high_blood_pressure
      patient_has_allergy_to_medication_for_high_blood_pressure_now)
   :named REQ7_AUXILIARY0)) ;; "medications used to treat high blood pressure""

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_allergy_to_medication_for_high_blood_pressure_now@@medication_is_for_treatment_of_high_blood_pressure)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to medications used to treat high blood pressure."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_meets_protocol_defined_inclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets any of the protocol-defined inclusion criteria.","when_to_set_to_false":"Set to false if the patient does not meet any of the protocol-defined inclusion criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets any of the protocol-defined inclusion criteria.","meaning":"Boolean indicating whether the patient meets any of the protocol-defined inclusion criteria."} ;; "A patient is excluded if the patient meets other protocol-defined inclusion criteria."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_meets_protocol_defined_inclusion_criteria)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "A patient is excluded if the patient meets other protocol-defined inclusion criteria."
