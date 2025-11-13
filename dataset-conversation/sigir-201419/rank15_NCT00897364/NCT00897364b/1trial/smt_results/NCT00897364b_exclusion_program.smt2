;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of blood coagulation disorder (bleeding diathesis).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of blood coagulation disorder (bleeding diathesis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of blood coagulation disorder (bleeding diathesis).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (bleeding diathesis)."} ;; "bleeding diathesis"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@clinically_apparent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current blood coagulation disorder (bleeding diathesis) is clinically apparent.","when_to_set_to_false":"Set to false if the patient's current blood coagulation disorder (bleeding diathesis) is not clinically apparent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current blood coagulation disorder (bleeding diathesis) is clinically apparent.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder (bleeding diathesis) is clinically apparent."} ;; "clinically apparent bleeding diathesis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@clinically_apparent
       patient_has_finding_of_blood_coagulation_disorder_now)
   :named REQ0_AUXILIARY0)) ;; "clinically apparent bleeding diathesis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now@@clinically_apparent)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinically apparent bleeding diathesis."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a finding of atrial fibrillation."} ;; "atrial fibrillation"
(declare-const patient_has_finding_of_atrial_fibrillation_now@@well_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's atrial fibrillation is well-controlled.","when_to_set_to_false":"Set to false if the patient's atrial fibrillation is not well-controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's atrial fibrillation is well-controlled.","meaning":"Boolean indicating whether the patient's atrial fibrillation is well-controlled."} ;; "well-controlled atrial fibrillation"
(declare-const patient_has_finding_of_multifocal_pvcs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of multifocal premature ventricular contractions.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of multifocal premature ventricular contractions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of multifocal premature ventricular contractions.","meaning":"Boolean indicating whether the patient currently has a finding of multifocal premature ventricular contractions."} ;; "multifocal premature ventricular contractions"
(declare-const patient_has_finding_of_multifocal_pvcs_now@@potentially_life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's multifocal premature ventricular contractions are considered potentially life-threatening.","when_to_set_to_false":"Set to false if the patient's multifocal premature ventricular contractions are not considered potentially life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's multifocal premature ventricular contractions are potentially life-threatening.","meaning":"Boolean indicating whether the patient's multifocal premature ventricular contractions are potentially life-threatening."} ;; "multifocal premature ventricular contractions that are potentially life-threatening"
(declare-const patient_has_finding_of_supraventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of supraventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of supraventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of supraventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has a finding of supraventricular tachycardia."} ;; "supraventricular tachycardia"
(declare-const patient_has_finding_of_supraventricular_tachycardia_now@@with_rapid_ventricular_response Bool) ;; {"when_to_set_to_true":"Set to true if the patient's supraventricular tachycardia is associated with a rapid ventricular response.","when_to_set_to_false":"Set to false if the patient's supraventricular tachycardia is not associated with a rapid ventricular response.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's supraventricular tachycardia is associated with a rapid ventricular response.","meaning":"Boolean indicating whether the patient's supraventricular tachycardia is associated with a rapid ventricular response."} ;; "supraventricular tachycardias with a rapid ventricular response"
(declare-const patient_has_finding_of_supraventricular_tachycardia_now@@potentially_life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's supraventricular tachycardia is considered potentially life-threatening.","when_to_set_to_false":"Set to false if the patient's supraventricular tachycardia is not considered potentially life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's supraventricular tachycardia is potentially life-threatening.","meaning":"Boolean indicating whether the patient's supraventricular tachycardia is potentially life-threatening."} ;; "supraventricular tachycardia that is potentially life-threatening"
(declare-const patient_has_finding_of_ventricular_premature_complex_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of premature ventricular contractions.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of premature ventricular contractions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of premature ventricular contractions.","meaning":"Boolean indicating whether the patient currently has a finding of premature ventricular contractions."} ;; "premature ventricular contractions"
(declare-const patient_has_finding_of_ventricular_premature_complex_now@@rare_less_than_two_per_minute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's premature ventricular contractions are rare (less than two per minute).","when_to_set_to_false":"Set to false if the patient's premature ventricular contractions are not rare (two or more per minute).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's premature ventricular contractions are rare (less than two per minute).","meaning":"Boolean indicating whether the patient's premature ventricular contractions are rare (less than two per minute)."} ;; "rare (less than two per minute) premature ventricular contractions"
(declare-const patient_has_finding_of_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has a finding of ventricular tachycardia."} ;; "ventricular tachycardia"
(declare-const patient_has_finding_of_ventricular_tachycardia_now@@potentially_life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ventricular tachycardia is considered potentially life-threatening.","when_to_set_to_false":"Set to false if the patient's ventricular tachycardia is not considered potentially life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ventricular tachycardia is potentially life-threatening.","meaning":"Boolean indicating whether the patient's ventricular tachycardia is potentially life-threatening."} ;; "ventricular tachycardia that is potentially life-threatening"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term (potentially life-threatening dysrhythmia)
(assert
(! (=> patient_has_finding_of_ventricular_tachycardia_now@@potentially_life_threatening
patient_has_finding_of_ventricular_tachycardia_now)
:named REQ1_AUXILIARY0)) ;; "ventricular tachycardia that is potentially life-threatening"

(assert
(! (=> patient_has_finding_of_multifocal_pvcs_now@@potentially_life_threatening
patient_has_finding_of_multifocal_pvcs_now)
:named REQ1_AUXILIARY1)) ;; "multifocal premature ventricular contractions that are potentially life-threatening"

(assert
(! (=> patient_has_finding_of_supraventricular_tachycardia_now@@potentially_life_threatening
patient_has_finding_of_supraventricular_tachycardia_now)
:named REQ1_AUXILIARY2)) ;; "supraventricular tachycardia that is potentially life-threatening"

(assert
(! (=> patient_has_finding_of_supraventricular_tachycardia_now@@with_rapid_ventricular_response
patient_has_finding_of_supraventricular_tachycardia_now)
:named REQ1_AUXILIARY3)) ;; "supraventricular tachycardias with a rapid ventricular response"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have a cardiac dysrhythmia that is potentially life-threatening,
;; except if the dysrhythmia is well-controlled atrial fibrillation OR rare (less than two per minute) premature ventricular contractions.
(assert
(! (not
    (and
      (or
        patient_has_finding_of_ventricular_tachycardia_now@@potentially_life_threatening
        patient_has_finding_of_multifocal_pvcs_now@@potentially_life_threatening
        patient_has_finding_of_supraventricular_tachycardia_now@@potentially_life_threatening
        patient_has_finding_of_supraventricular_tachycardia_now@@with_rapid_ventricular_response
      )
      (not
        (or
          patient_has_finding_of_atrial_fibrillation_now@@well_controlled
          patient_has_finding_of_ventricular_premature_complex_now@@rare_less_than_two_per_minute
        )
      )
    )
  )
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cardiac dysrhythmia that is potentially life-threatening (such as ventricular tachycardia, multifocal premature ventricular contractions, or supraventricular tachycardias with a rapid ventricular response), EXCEPT if the dysrhythmia is well-controlled atrial fibrillation OR rare (less than two per minute) premature ventricular contractions."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hypoxemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoxemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoxemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoxemia.","meaning":"Boolean indicating whether the patient currently has hypoxemia."} ;; "hypoxemia"
(declare-const patient_has_finding_of_hypoxemia_now@@during_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoxemia and the hypoxemia occurs during bronchoscopy.","when_to_set_to_false":"Set to false if the patient currently has hypoxemia but it does not occur during bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether hypoxemia occurs during bronchoscopy.","meaning":"Boolean indicating whether the patient's current hypoxemia occurs during bronchoscopy."} ;; "hypoxemia during bronchoscopy"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current hemoglobin oxygen saturation (in percent) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin oxygen saturation in percent."} ;; "oxygen saturation less than ninety percent"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_with_supplemental_oxygen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hemoglobin oxygen saturation value is measured while the patient is receiving supplemental oxygen.","when_to_set_to_false":"Set to false if the measurement is not performed with supplemental oxygen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was performed with supplemental oxygen.","meaning":"Boolean indicating whether the patient's hemoglobin oxygen saturation measurement was performed with supplemental oxygen."} ;; "oxygen saturation less than ninety percent with supplemental oxygen"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: hypoxemia during bronchoscopy = oxygen saturation < 90% with supplemental oxygen during bronchoscopy
(assert
(! (= patient_has_finding_of_hypoxemia_now@@during_bronchoscopy
(and (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 90)
     patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_with_supplemental_oxygen))
:named REQ2_AUXILIARY0)) ;; "hypoxemia (oxygen saturation less than ninety percent with supplemental oxygen) during bronchoscopy"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_hypoxemia_now@@during_bronchoscopy
       patient_has_finding_of_hypoxemia_now)
:named REQ2_AUXILIARY1)) ;; "hypoxemia during bronchoscopy" implies "hypoxemia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_hypoxemia_now@@during_bronchoscopy)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypoxemia (oxygen saturation less than ninety percent with supplemental oxygen) during bronchoscopy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now@@poorly_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure and the heart failure is poorly controlled.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of congestive heart failure but the heart failure is not poorly controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the congestive heart failure is poorly controlled.","meaning":"Boolean indicating whether the patient's current congestive heart failure is poorly controlled."} ;; "poorly controlled congestive heart failure"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary artery disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary artery disease."} ;; "coronary artery disease"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now@@clinically_active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary artery disease and the disease is clinically active.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of coronary artery disease but the disease is not clinically active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery disease is clinically active.","meaning":"Boolean indicating whether the patient's current coronary artery disease is clinically active."} ;; "clinically active coronary artery disease"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of chest pain.","meaning":"Boolean indicating whether the patient currently has a finding of chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of myocardial infarction in their history.","when_to_set_to_false":"Set to false if the patient has never had a finding of myocardial infarction in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of myocardial infarction in their history.","meaning":"Boolean indicating whether the patient has ever had a finding of myocardial infarction in their history."} ;; "myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a finding of myocardial infarction within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had a finding of myocardial infarction within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a finding of myocardial infarction within the past six weeks.","meaning":"Boolean indicating whether the patient has had a finding of myocardial infarction within the past six weeks."} ;; "myocardial infarction within six weeks"
(declare-const patient_has_serious_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any serious medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have any serious medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any serious medical condition.","meaning":"Boolean indicating whether the patient currently has any serious medical condition."} ;; "any other serious medical condition"
(declare-const patient_has_serious_medical_condition_now@@precludes_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current serious medical condition would preclude the patient from undergoing a bronchoscopy.","when_to_set_to_false":"Set to false if the patient's current serious medical condition would not preclude the patient from undergoing a bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current serious medical condition would preclude the patient from undergoing a bronchoscopy.","meaning":"Boolean indicating whether the patient's current serious medical condition would preclude the patient from undergoing a bronchoscopy."} ;; "serious medical condition which would preclude the patient from undergoing a bronchoscopy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within6weeks
          patient_has_finding_of_chest_pain_now
          patient_has_diagnosis_of_congestive_heart_failure_now@@poorly_controlled)
patient_has_diagnosis_of_coronary_arteriosclerosis_now@@clinically_active)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((myocardial infarction within six weeks) OR (chest pain) OR (poorly controlled congestive heart failure))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_now@@clinically_active
patient_has_diagnosis_of_coronary_arteriosclerosis_now)
:named REQ3_AUXILIARY1)) ;; "clinically active coronary artery disease"

(assert
(! (=> patient_has_diagnosis_of_congestive_heart_failure_now@@poorly_controlled
patient_has_diagnosis_of_congestive_heart_failure_now)
:named REQ3_AUXILIARY2)) ;; "poorly controlled congestive heart failure"

(assert
(! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within6weeks
patient_has_finding_of_myocardial_infarction_inthehistory)
:named REQ3_AUXILIARY3)) ;; "myocardial infarction within six weeks"

(assert
(! (=> patient_has_serious_medical_condition_now@@precludes_bronchoscopy
patient_has_serious_medical_condition_now)
:named REQ3_AUXILIARY4)) ;; "serious medical condition which would preclude the patient from undergoing a bronchoscopy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_coronary_arteriosclerosis_now@@clinically_active)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of clinically active coronary artery disease with non-exhaustive examples ((myocardial infarction within six weeks) OR (chest pain) OR (poorly controlled congestive heart failure))."

(assert
(! (not patient_has_serious_medical_condition_now@@precludes_bronchoscopy)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other serious medical condition which would preclude the patient from undergoing a bronchoscopy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_acute_bronchitis_inthepast8weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of acute bronchitis within the past eight weeks.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of acute bronchitis within the past eight weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of acute bronchitis within the past eight weeks.","meaning":"Boolean indicating whether the patient has had a diagnosis of acute bronchitis within the past eight weeks."} ;; "acute bronchitis within eight weeks"
(declare-const patient_has_diagnosis_of_pneumonia_inthepast8weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of pneumonia within the past eight weeks.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of pneumonia within the past eight weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of pneumonia within the past eight weeks.","meaning":"Boolean indicating whether the patient has had a diagnosis of pneumonia within the past eight weeks."} ;; "pneumonia within eight weeks"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_acute_bronchitis_inthepast8weeks)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had acute bronchitis within eight weeks."

(assert
(! (not patient_has_diagnosis_of_pneumonia_inthepast8weeks)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had pneumonia within eight weeks."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} ;; "unable to give informed consent"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_able_to_give_informed_consent_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to give informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} ;; "the patient is a current smoker"
(declare-const patient_has_finding_of_smoker_now@@no_airflow_obstruction Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker and has no airflow obstruction.","when_to_set_to_false":"Set to false if the patient is currently a smoker and has airflow obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has airflow obstruction in the context of current smoking status.","meaning":"Boolean indicating whether the patient is currently a smoker and has no airflow obstruction."} ;; "the patient is a current smoker with no airflow obstruction"
(declare-const patient_has_finding_of_cough_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of cough.","when_to_set_to_false":"Set to false if the patient does not have a history of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cough.","meaning":"Boolean indicating whether the patient has a history of cough."} ;; "the patient has a history of cough"
(declare-const patient_has_finding_of_cough_inthehistory@@frequency_more_than_two_times_per_week Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of cough and the cough occurred more than two times per week.","when_to_set_to_false":"Set to false if the patient has a history of cough but the cough occurred two times per week or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cough occurred more than two times per week in the patient's history.","meaning":"Boolean indicating whether the patient has a history of cough occurring more than two times per week."} ;; "the patient has a history of cough occurring more than two times per week"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for "no airflow obstruction" implies current smoker
(assert
(! (=> patient_has_finding_of_smoker_now@@no_airflow_obstruction
      patient_has_finding_of_smoker_now)
   :named REQ6_AUXILIARY0)) ;; "the patient is a current smoker with no airflow obstruction"

;; Qualifier variable for "cough occurring more than two times per week" implies history of cough
(assert
(! (=> patient_has_finding_of_cough_inthehistory@@frequency_more_than_two_times_per_week
      patient_has_finding_of_cough_inthehistory)
   :named REQ6_AUXILIARY1)) ;; "the patient has a history of cough occurring more than two times per week"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: If BOTH (current smoker with no airflow obstruction) AND (history of cough >2x/week), patient is excluded
(assert
(! (not (and patient_has_finding_of_smoker_now@@no_airflow_obstruction
             patient_has_finding_of_cough_inthehistory@@frequency_more_than_two_times_per_week))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a current smoker with no airflow obstruction) AND (the patient has a history of cough occurring more than two times per week)."
