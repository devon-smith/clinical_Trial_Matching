;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia is severe.","when_to_set_to_false":"Set to false if the patient currently has pneumonia but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia is severe.","meaning":"Boolean indicating whether the patient's current pneumonia is severe."} ;; "severe pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@recognized_by_lower_chest_wall_retraction Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia is recognized by lower chest wall retraction.","when_to_set_to_false":"Set to false if the patient currently has pneumonia but it is not recognized by lower chest wall retraction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia is recognized by lower chest wall retraction.","meaning":"Boolean indicating whether the patient's current pneumonia is recognized by lower chest wall retraction."} ;; "recognized by lower chest wall retraction"
(declare-const patient_has_finding_of_lower_chest_wall_indrawing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lower chest wall indrawing.","when_to_set_to_false":"Set to false if the patient currently does not have lower chest wall indrawing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lower chest wall indrawing.","meaning":"Boolean indicating whether the patient currently has lower chest wall indrawing."} ;; "lower chest wall indrawing"
(declare-const patient_has_finding_of_lower_chest_wall_indrawing_now@@after_treatment_with_nebulized_salbutamol Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lower chest wall indrawing occurs after treatment with nebulized salbutamol.","when_to_set_to_false":"Set to false if the patient's current lower chest wall indrawing does not occur after treatment with nebulized salbutamol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current lower chest wall indrawing occurs after treatment with nebulized salbutamol.","meaning":"Boolean indicating whether the patient's current lower chest wall indrawing occurs after treatment with nebulized salbutamol."} ;; "lower chest wall indrawing after treatment with nebulized salbutamol"
(declare-const patient_has_finding_of_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of wheezing.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of wheezing.","meaning":"Boolean indicating whether the patient currently has wheezing."} ;; "wheezing"
(declare-const patient_is_exposed_to_albuterol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to albuterol (salbutamol).","when_to_set_to_false":"Set to false if the patient is currently not exposed to albuterol (salbutamol).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to albuterol (salbutamol).","meaning":"Boolean indicating whether the patient is currently exposed to albuterol (salbutamol)."} ;; "salbutamol"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pneumonia_now@@severe
      patient_has_finding_of_pneumonia_now)
    :named REQ0_AUXILIARY0)) ;; "severe pneumonia"

(assert
(! (=> patient_has_finding_of_pneumonia_now@@recognized_by_lower_chest_wall_retraction
      patient_has_finding_of_pneumonia_now)
    :named REQ0_AUXILIARY1)) ;; "pneumonia recognized by lower chest wall retraction"

(assert
(! (=> patient_has_finding_of_lower_chest_wall_indrawing_now@@after_treatment_with_nebulized_salbutamol
      patient_has_finding_of_lower_chest_wall_indrawing_now)
    :named REQ0_AUXILIARY2)) ;; "lower chest wall indrawing after treatment with nebulized salbutamol"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 1: WHO signs of severe pneumonia recognized by lower chest wall retraction
(assert
(! (not patient_has_finding_of_pneumonia_now@@recognized_by_lower_chest_wall_retraction)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has World Health Organization signs of severe pneumonia recognized by lower chest wall retraction."

;; Component 2: Wheezing AND lower chest wall indrawing after treatment with nebulized salbutamol
(assert
(! (not (and patient_has_finding_of_wheezing_now
             patient_has_finding_of_lower_chest_wall_indrawing_now@@after_treatment_with_nebulized_salbutamol))
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient presents with wheezing) AND (the patient has lower chest wall indrawing after treatment with nebulized salbutamol)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cyanosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cyanosis.","when_to_set_to_false":"Set to false if the patient currently does not have cyanosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cyanosis.","meaning":"Boolean indicating whether the patient currently has cyanosis."} ;; "cyanosis"
(declare-const patient_has_finding_of_unable_to_drink_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to drink.","when_to_set_to_false":"Set to false if the patient is currently able to drink.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to drink.","meaning":"Boolean indicating whether the patient is currently unable to drink."} ;; "inability to drink"
(declare-const patient_has_finding_of_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing seizures (convulsions).","when_to_set_to_false":"Set to false if the patient is currently not experiencing seizures (convulsions).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing seizures (convulsions).","meaning":"Boolean indicating whether the patient is currently experiencing seizures (convulsions)."} ;; "convulsions"
(declare-const patient_has_finding_of_drowsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently abnormally sleepy (drowsy).","when_to_set_to_false":"Set to false if the patient is currently not abnormally sleepy (drowsy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently abnormally sleepy (drowsy).","meaning":"Boolean indicating whether the patient is currently abnormally sleepy (drowsy)."} ;; "abnormally sleepy"
(declare-const patient_has_finding_of_not_easily_wakened_from_sleep_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently difficult to wake (not easily wakened from sleep).","when_to_set_to_false":"Set to false if the patient is currently easy to wake (not difficult to wake).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently difficult to wake.","meaning":"Boolean indicating whether the patient is currently difficult to wake (not easily wakened from sleep)."} ;; "difficult to wake"
(declare-const patient_has_diagnosis_of_pneumonia_now@@very_severe_per_world_health_organization_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia diagnosis meets World Health Organization criteria for very severe disease.","when_to_set_to_false":"Set to false if the patient's current pneumonia diagnosis does not meet World Health Organization criteria for very severe disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia diagnosis meets World Health Organization criteria for very severe disease.","meaning":"Boolean indicating whether the patient's current pneumonia diagnosis meets World Health Organization criteria for very severe disease."} ;; "World Health Organization signs of very severe disease/pneumonia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: WHO very severe pneumonia = at least one of the listed findings
(assert
(! (= patient_has_diagnosis_of_pneumonia_now@@very_severe_per_world_health_organization_criteria
     (or patient_has_finding_of_cyanosis_now
         patient_has_finding_of_unable_to_drink_now
         patient_has_finding_of_seizure_now
         patient_has_finding_of_drowsy_now
         patient_has_finding_of_not_easily_wakened_from_sleep_now))
:named REQ1_AUXILIARY0)) ;; "defined as at least one of the following: (cyanosis OR inability to drink OR convulsions OR abnormally sleepy OR difficult to wake)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_cyanosis_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cyanosis."

(assert
(! (not patient_has_finding_of_unable_to_drink_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to drink."

(assert
(! (not patient_has_finding_of_seizure_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has convulsions."

(assert
(! (not patient_has_finding_of_drowsy_now)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is abnormally sleepy."

(assert
(! (not patient_has_finding_of_not_easily_wakened_from_sleep_now)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is difficult to wake."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_cyanosis_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cyanosis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
;; patient_has_finding_of_unable_to_drink_now is already declared above
;; (declare-const patient_has_finding_of_unable_to_drink_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to drink.","when_to_set_to_false":"Set to false if the patient is currently able to drink.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to drink.","meaning":"Boolean indicating whether the patient is currently unable to drink."} ;; "inability to drink"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_unable_to_drink_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to drink."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_seizure_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has convulsions."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
;; No new variable declarations needed; all required variables are already declared:
;; patient_has_finding_of_drowsy_now
;; patient_has_finding_of_not_easily_wakened_from_sleep_now

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: The patient is excluded if the patient is abnormally sleepy.
(assert
(! (not patient_has_finding_of_drowsy_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is abnormally sleepy."

;; Exclusion: The patient is excluded if the patient is difficult to wake.
(assert
(! (not patient_has_finding_of_not_easily_wakened_from_sleep_now)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is difficult to wake."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_child_weight_less_than_third_centile_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has weight-for-age less than the third percentile.","when_to_set_to_false":"Set to false if the patient currently does not have weight-for-age less than the third percentile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has weight-for-age less than the third percentile.","meaning":"Boolean indicating whether the patient currently has weight-for-age less than the third percentile."} ;; "weight for age less than the third percentile"
(declare-const patient_has_finding_of_child_weight_less_than_third_centile_now@@recognized_by_national_center_for_health_statistics_growth_chart Bool) ;; {"when_to_set_to_true":"Set to true if the finding of weight-for-age less than the third percentile is recognized by the National Center for Health Statistics growth chart.","when_to_set_to_false":"Set to false if the finding is not recognized by the National Center for Health Statistics growth chart.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is recognized by the National Center for Health Statistics growth chart.","meaning":"Boolean indicating whether the finding is recognized by the National Center for Health Statistics growth chart."} ;; "weight for age less than the third percentile by the National Center for Health Statistics growth chart"
(declare-const patient_has_finding_of_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has edema.","when_to_set_to_false":"Set to false if the patient currently does not have edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has edema.","meaning":"Boolean indicating whether the patient currently has edema."} ;; "oedema"
(declare-const patient_has_finding_of_severe_malnutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe malnutrition.","when_to_set_to_false":"Set to false if the patient currently does not have severe malnutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe malnutrition.","meaning":"Boolean indicating whether the patient currently has severe malnutrition."} ;; "severe malnutrition"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_child_weight_less_than_third_centile_now@@recognized_by_national_center_for_health_statistics_growth_chart
      patient_has_finding_of_child_weight_less_than_third_centile_now)
   :named REQ6_AUXILIARY0)) ;; "weight for age less than the third percentile by the National Center for Health Statistics growth chart"

;; Severe malnutrition recognized by weight for age less than the third percentile by NCHS growth chart
(assert
(! (=> patient_has_finding_of_child_weight_less_than_third_centile_now@@recognized_by_national_center_for_health_statistics_growth_chart
      patient_has_finding_of_severe_malnutrition_now)
   :named REQ6_AUXILIARY1)) ;; "severe malnutrition recognized by weight for age less than the third percentile by the National Center for Health Statistics growth chart"

;; Severe malnutrition recognized by oedema
(assert
(! (=> patient_has_finding_of_edema_now
      patient_has_finding_of_severe_malnutrition_now)
   :named REQ6_AUXILIARY2)) ;; "severe malnutrition recognized by oedema"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have severe malnutrition recognized by weight for age less than the third percentile by NCHS growth chart
(assert
(! (not patient_has_finding_of_child_weight_less_than_third_centile_now@@recognized_by_national_center_for_health_statistics_growth_chart)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe malnutrition recognized by weight for age less than the third percentile by the National Center for Health Statistics growth chart."

;; Exclusion: patient must NOT have severe malnutrition recognized by oedema
(assert
(! (not patient_has_finding_of_edema_now)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe malnutrition recognized by oedema."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with asthma at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with asthma at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or indeterminate whether the patient has ever been diagnosed with asthma.","meaning":"Boolean indicating whether the patient has ever been diagnosed with asthma in their history."} ;; "has been diagnosed to have asthma"
(declare-const patient_wheezing_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the total number of wheezing episodes documented in the patient's history.","when_to_set_to_null":"Set to null if the number of wheezing episodes in the patient's history is unknown, not documented, or indeterminate.","meaning":"Numeric count of wheezing episodes the patient has had in their history."} ;; "previous history of three or more episodes of wheeze"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (>= patient_wheezing_value_recorded_inthehistory_withunit_count 3))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous history of three or more episodes of wheeze."

(assert
(! (not patient_has_diagnosis_of_asthma_inthehistory)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been diagnosed to have asthma."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_cyanotic_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cyanotic congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cyanotic congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cyanotic congenital heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cyanotic congenital heart disease."} ;; "congenital heart disease with cyanosis"
(declare-const patient_has_diagnosis_of_cyanotic_congenital_heart_disease_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of cyanotic congenital heart disease is known (i.e., documented or established).","when_to_set_to_false":"Set to false if the diagnosis of cyanotic congenital heart disease is not known (i.e., not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the diagnosis of cyanotic congenital heart disease is known."} ;; "known congenital heart disease with cyanosis"
(declare-const patient_has_diagnosis_of_cyanotic_congenital_heart_disease_now@@clinically_recognizable Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of cyanotic congenital heart disease is clinically recognizable (i.e., can be identified by clinical assessment).","when_to_set_to_false":"Set to false if the diagnosis of cyanotic congenital heart disease is not clinically recognizable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is clinically recognizable.","meaning":"Boolean indicating whether the diagnosis of cyanotic congenital heart disease is clinically recognizable."} ;; "clinically recognizable congenital heart disease with cyanosis"
(declare-const patient_has_diagnosis_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_diagnosis_of_cardiomegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cardiomegaly.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cardiomegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cardiomegaly.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cardiomegaly."} ;; "cardiomegaly"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable for cyanotic congenital heart disease
(assert
(! (=> patient_has_diagnosis_of_cyanotic_congenital_heart_disease_now@@known
      patient_has_diagnosis_of_cyanotic_congenital_heart_disease_now)
   :named REQ8_AUXILIARY0)) ;; "known congenital heart disease with cyanosis"

(assert
(! (=> patient_has_diagnosis_of_cyanotic_congenital_heart_disease_now@@clinically_recognizable
      patient_has_diagnosis_of_cyanotic_congenital_heart_disease_now)
   :named REQ8_AUXILIARY1)) ;; "clinically recognizable congenital heart disease with cyanosis"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_cyanotic_congenital_heart_disease_now@@known)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known congenital heart disease with cyanosis."

(assert
(! (not patient_has_diagnosis_of_cyanotic_congenital_heart_disease_now@@clinically_recognizable)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically recognizable congenital heart disease with cyanosis."

(assert
(! (not patient_has_diagnosis_of_congestive_heart_failure_now)
   :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure."

(assert
(! (not patient_has_diagnosis_of_cardiomegaly_now)
   :named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiomegaly."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_disorder_of_body_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder of any organ system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder of any organ system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder of any organ system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder of any organ system."} ;; "organ system disorders"
(declare-const patient_has_diagnosis_of_disorder_of_body_system_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder of body system is known (documented or established).","when_to_set_to_false":"Set to false if the diagnosis is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the diagnosis of disorder of body system is known."} ;; "known"
(declare-const patient_has_diagnosis_of_disorder_of_body_system_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder of body system is acute (of sudden onset or short duration).","when_to_set_to_false":"Set to false if the diagnosis is not acute (chronic or not of sudden onset).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is acute.","meaning":"Boolean indicating whether the diagnosis of disorder of body system is acute."} ;; "acute"
(declare-const patient_has_diagnosis_of_disorder_of_body_system_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder of body system is chronic (persistent or long-standing).","when_to_set_to_false":"Set to false if the diagnosis is not chronic (acute or not persistent).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is chronic.","meaning":"Boolean indicating whether the diagnosis of disorder of body system is chronic."} ;; "chronic"
(declare-const patient_has_diagnosis_of_disorder_of_body_system_now@@clinically_recognizable Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder of body system is clinically recognizable (can be identified by clinical assessment).","when_to_set_to_false":"Set to false if the diagnosis is not clinically recognizable (cannot be identified by clinical assessment).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is clinically recognizable.","meaning":"Boolean indicating whether the diagnosis of disorder of body system is clinically recognizable."} ;; "clinically recognizable"
(declare-const patient_has_finding_of_jaundice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of jaundice.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of jaundice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of jaundice.","meaning":"Boolean indicating whether the patient currently has the clinical finding of jaundice."} ;; "jaundice"
(declare-const patient_has_finding_of_nephrotic_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nephrotic syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nephrotic syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of nephrotic syndrome.","meaning":"Boolean indicating whether the patient currently has the clinical finding of nephrotic syndrome."} ;; "nephrotic syndrome"
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of anemia.","meaning":"Boolean indicating whether the patient currently has the clinical finding of anemia."} ;; "anaemia"
(declare-const patient_has_finding_of_anemia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the clinical finding of anemia is severe.","when_to_set_to_false":"Set to false if the clinical finding of anemia is not severe.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the clinical finding of anemia is severe.","meaning":"Boolean indicating whether the clinical finding of anemia is severe."} ;; "severe anaemia"
(declare-const patient_has_finding_of_anemia_now@@manifested_as_extreme_pallor Bool) ;; {"when_to_set_to_true":"Set to true if the clinical finding of anemia is manifested as extreme pallor.","when_to_set_to_false":"Set to false if the clinical finding of anemia is not manifested as extreme pallor.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the clinical finding of anemia is manifested as extreme pallor.","meaning":"Boolean indicating whether the clinical finding of anemia is manifested as extreme pallor."} ;; "manifested as extreme pallor"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term for each disorder type and qualifier
(assert
(! (=> (or patient_has_finding_of_jaundice_now
          patient_has_finding_of_nephrotic_syndrome_now
          (and patient_has_finding_of_anemia_now@@severe
               patient_has_finding_of_anemia_now@@manifested_as_extreme_pallor))
     (and patient_has_diagnosis_of_disorder_of_body_system_now@@known
          patient_has_diagnosis_of_disorder_of_body_system_now@@acute))
:named REQ9_AUXILIARY0)) ;; "known acute organ system disorders with non-exhaustive examples (jaundice, nephrotic syndrome, severe anaemia manifested as extreme pallor)"

(assert
(! (=> (or patient_has_finding_of_jaundice_now
          patient_has_finding_of_nephrotic_syndrome_now
          (and patient_has_finding_of_anemia_now@@severe
               patient_has_finding_of_anemia_now@@manifested_as_extreme_pallor))
     (and patient_has_diagnosis_of_disorder_of_body_system_now@@known
          patient_has_diagnosis_of_disorder_of_body_system_now@@chronic))
:named REQ9_AUXILIARY1)) ;; "known chronic organ system disorders with non-exhaustive examples (jaundice, nephrotic syndrome, severe anaemia manifested as extreme pallor)"

(assert
(! (=> (or patient_has_finding_of_jaundice_now
          patient_has_finding_of_nephrotic_syndrome_now
          (and patient_has_finding_of_anemia_now@@severe
               patient_has_finding_of_anemia_now@@manifested_as_extreme_pallor))
     (and patient_has_diagnosis_of_disorder_of_body_system_now@@clinically_recognizable
          patient_has_diagnosis_of_disorder_of_body_system_now@@acute))
:named REQ9_AUXILIARY2)) ;; "clinically recognizable acute organ system disorders with non-exhaustive examples (jaundice, nephrotic syndrome, severe anaemia manifested as extreme pallor)"

(assert
(! (=> (or patient_has_finding_of_jaundice_now
          patient_has_finding_of_nephrotic_syndrome_now
          (and patient_has_finding_of_anemia_now@@severe
               patient_has_finding_of_anemia_now@@manifested_as_extreme_pallor))
     (and patient_has_diagnosis_of_disorder_of_body_system_now@@clinically_recognizable
          patient_has_diagnosis_of_disorder_of_body_system_now@@chronic))
:named REQ9_AUXILIARY3)) ;; "clinically recognizable chronic organ system disorders with non-exhaustive examples (jaundice, nephrotic syndrome, severe anaemia manifested as extreme pallor)"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_body_system_now@@known
       patient_has_diagnosis_of_disorder_of_body_system_now)
:named REQ9_AUXILIARY4)) ;; "known"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_body_system_now@@clinically_recognizable
       patient_has_diagnosis_of_disorder_of_body_system_now)
:named REQ9_AUXILIARY5)) ;; "clinically recognizable"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_body_system_now@@acute
       patient_has_diagnosis_of_disorder_of_body_system_now)
:named REQ9_AUXILIARY6)) ;; "acute"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_body_system_now@@chronic
       patient_has_diagnosis_of_disorder_of_body_system_now)
:named REQ9_AUXILIARY7)) ;; "chronic"

;; Qualifier variables for anemia finding
(assert
(! (=> patient_has_finding_of_anemia_now@@severe
       patient_has_finding_of_anemia_now)
:named REQ9_AUXILIARY8)) ;; "severe anaemia"

(assert
(! (=> patient_has_finding_of_anemia_now@@manifested_as_extreme_pallor
       patient_has_finding_of_anemia_now)
:named REQ9_AUXILIARY9)) ;; "manifested as extreme pallor"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have any of the four disorder types (each is an OR clause, so each must be negated)
(assert
(! (not (and patient_has_diagnosis_of_disorder_of_body_system_now@@known
             patient_has_diagnosis_of_disorder_of_body_system_now@@acute))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known acute organ system disorders..."

(assert
(! (not (and patient_has_diagnosis_of_disorder_of_body_system_now@@known
             patient_has_diagnosis_of_disorder_of_body_system_now@@chronic))
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known chronic organ system disorders..."

(assert
(! (not (and patient_has_diagnosis_of_disorder_of_body_system_now@@clinically_recognizable
             patient_has_diagnosis_of_disorder_of_body_system_now@@acute))
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically recognizable acute organ system disorders..."

(assert
(! (not (and patient_has_diagnosis_of_disorder_of_body_system_now@@clinically_recognizable
             patient_has_diagnosis_of_disorder_of_body_system_now@@chronic))
:named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically recognizable chronic organ system disorders..."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disorder due to infection."} ;; "infectious conditions"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@requires_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infectious disorder requires antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's current infectious disorder does not require antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current infectious disorder requires antibiotic therapy.","meaning":"Boolean indicating whether the patient's current infectious disorder requires antibiotic therapy."} ;; "requiring antibiotic therapy"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@present_at_day_of_contact Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infectious disorder is present at the day of contact.","when_to_set_to_false":"Set to false if the patient's current infectious disorder is not present at the day of contact.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current infectious disorder is present at the day of contact.","meaning":"Boolean indicating whether the patient's current infectious disorder is present at the day of contact."} ;; "at the day of contact"
(declare-const patient_has_diagnosis_of_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of meningitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of meningitis."} ;; "meningitis"
(declare-const patient_has_diagnosis_of_meningitis_now@@requires_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of meningitis requires antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's diagnosis of meningitis does not require antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of meningitis requires antibiotic therapy.","meaning":"Boolean indicating whether the patient's diagnosis of meningitis requires antibiotic therapy."} ;; "meningitis requiring antibiotic therapy"
(declare-const patient_has_diagnosis_of_meningitis_now@@present_at_day_of_contact Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of meningitis is present at the day of contact.","when_to_set_to_false":"Set to false if the patient's diagnosis of meningitis is not present at the day of contact.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of meningitis is present at the day of contact.","meaning":"Boolean indicating whether the patient's diagnosis of meningitis is present at the day of contact."} ;; "meningitis at the day of contact"
(declare-const patient_has_diagnosis_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of tuberculosis."} ;; "tuberculosis"
(declare-const patient_has_diagnosis_of_tuberculosis_now@@requires_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of tuberculosis requires antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's diagnosis of tuberculosis does not require antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of tuberculosis requires antibiotic therapy.","meaning":"Boolean indicating whether the patient's diagnosis of tuberculosis requires antibiotic therapy."} ;; "tuberculosis requiring antibiotic therapy"
(declare-const patient_has_diagnosis_of_tuberculosis_now@@present_at_day_of_contact Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of tuberculosis is present at the day of contact.","when_to_set_to_false":"Set to false if the patient's diagnosis of tuberculosis is not present at the day of contact.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of tuberculosis is present at the day of contact.","meaning":"Boolean indicating whether the patient's diagnosis of tuberculosis is present at the day of contact."} ;; "tuberculosis at the day of contact"
(declare-const patient_has_diagnosis_of_dysentery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dysentery.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dysentery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dysentery.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dysentery."} ;; "dysentery"
(declare-const patient_has_diagnosis_of_dysentery_now@@requires_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of dysentery requires antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's diagnosis of dysentery does not require antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of dysentery requires antibiotic therapy.","meaning":"Boolean indicating whether the patient's diagnosis of dysentery requires antibiotic therapy."} ;; "dysentery requiring antibiotic therapy"
(declare-const patient_has_diagnosis_of_dysentery_now@@present_at_day_of_contact Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of dysentery is present at the day of contact.","when_to_set_to_false":"Set to false if the patient's diagnosis of dysentery is not present at the day of contact.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of dysentery is present at the day of contact.","meaning":"Boolean indicating whether the patient's diagnosis of dysentery is present at the day of contact."} ;; "dysentery at the day of contact"
(declare-const patient_has_diagnosis_of_osteomyelitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of osteomyelitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of osteomyelitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of osteomyelitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of osteomyelitis."} ;; "osteomyelitis"
(declare-const patient_has_diagnosis_of_osteomyelitis_now@@requires_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of osteomyelitis requires antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's diagnosis of osteomyelitis does not require antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of osteomyelitis requires antibiotic therapy.","meaning":"Boolean indicating whether the patient's diagnosis of osteomyelitis requires antibiotic therapy."} ;; "osteomyelitis requiring antibiotic therapy"
(declare-const patient_has_diagnosis_of_osteomyelitis_now@@present_at_day_of_contact Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of osteomyelitis is present at the day of contact.","when_to_set_to_false":"Set to false if the patient's diagnosis of osteomyelitis is not present at the day of contact.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of osteomyelitis is present at the day of contact.","meaning":"Boolean indicating whether the patient's diagnosis of osteomyelitis is present at the day of contact."} ;; "osteomyelitis at the day of contact"
(declare-const patient_has_diagnosis_of_septic_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of septic arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of septic arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of septic arthritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of septic arthritis."} ;; "septic arthritis"
(declare-const patient_has_diagnosis_of_septic_arthritis_now@@requires_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of septic arthritis requires antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's diagnosis of septic arthritis does not require antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of septic arthritis requires antibiotic therapy.","meaning":"Boolean indicating whether the patient's diagnosis of septic arthritis requires antibiotic therapy."} ;; "septic arthritis requiring antibiotic therapy"
(declare-const patient_has_diagnosis_of_septic_arthritis_now@@present_at_day_of_contact Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of septic arthritis is present at the day of contact.","when_to_set_to_false":"Set to false if the patient's diagnosis of septic arthritis is not present at the day of contact.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of septic arthritis is present at the day of contact.","meaning":"Boolean indicating whether the patient's diagnosis of septic arthritis is present at the day of contact."} ;; "septic arthritis at the day of contact"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or
        (and patient_has_diagnosis_of_meningitis_now
             patient_has_diagnosis_of_meningitis_now@@requires_antibiotic_therapy
             patient_has_diagnosis_of_meningitis_now@@present_at_day_of_contact)
        (and patient_has_diagnosis_of_tuberculosis_now
             patient_has_diagnosis_of_tuberculosis_now@@requires_antibiotic_therapy
             patient_has_diagnosis_of_tuberculosis_now@@present_at_day_of_contact)
        (and patient_has_diagnosis_of_dysentery_now
             patient_has_diagnosis_of_dysentery_now@@requires_antibiotic_therapy
             patient_has_diagnosis_of_dysentery_now@@present_at_day_of_contact)
        (and patient_has_diagnosis_of_osteomyelitis_now
             patient_has_diagnosis_of_osteomyelitis_now@@requires_antibiotic_therapy
             patient_has_diagnosis_of_osteomyelitis_now@@present_at_day_of_contact)
        (and patient_has_diagnosis_of_septic_arthritis_now
             patient_has_diagnosis_of_septic_arthritis_now@@requires_antibiotic_therapy
             patient_has_diagnosis_of_septic_arthritis_now@@present_at_day_of_contact)
    )
    (and patient_has_diagnosis_of_disorder_due_to_infection_now
         patient_has_diagnosis_of_disorder_due_to_infection_now@@requires_antibiotic_therapy
         patient_has_diagnosis_of_disorder_due_to_infection_now@@present_at_day_of_contact))
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples ((meningitis) OR (tuberculosis) OR (dysentery) OR (osteomyelitis) OR (septic arthritis))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@requires_antibiotic_therapy
      patient_has_diagnosis_of_disorder_due_to_infection_now)
:named REQ10_AUXILIARY1)) ;; "requiring antibiotic therapy"

(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@present_at_day_of_contact
      patient_has_diagnosis_of_disorder_due_to_infection_now)
:named REQ10_AUXILIARY2)) ;; "at the day of contact"

(assert
(! (=> patient_has_diagnosis_of_meningitis_now@@requires_antibiotic_therapy
      patient_has_diagnosis_of_meningitis_now)
:named REQ10_AUXILIARY3)) ;; "meningitis requiring antibiotic therapy"

(assert
(! (=> patient_has_diagnosis_of_meningitis_now@@present_at_day_of_contact
      patient_has_diagnosis_of_meningitis_now)
:named REQ10_AUXILIARY4)) ;; "meningitis at the day of contact"

(assert
(! (=> patient_has_diagnosis_of_tuberculosis_now@@requires_antibiotic_therapy
      patient_has_diagnosis_of_tuberculosis_now)
:named REQ10_AUXILIARY5)) ;; "tuberculosis requiring antibiotic therapy"

(assert
(! (=> patient_has_diagnosis_of_tuberculosis_now@@present_at_day_of_contact
      patient_has_diagnosis_of_tuberculosis_now)
:named REQ10_AUXILIARY6)) ;; "tuberculosis at the day of contact"

(assert
(! (=> patient_has_diagnosis_of_dysentery_now@@requires_antibiotic_therapy
      patient_has_diagnosis_of_dysentery_now)
:named REQ10_AUXILIARY7)) ;; "dysentery requiring antibiotic therapy"

(assert
(! (=> patient_has_diagnosis_of_dysentery_now@@present_at_day_of_contact
      patient_has_diagnosis_of_dysentery_now)
:named REQ10_AUXILIARY8)) ;; "dysentery at the day of contact"

(assert
(! (=> patient_has_diagnosis_of_osteomyelitis_now@@requires_antibiotic_therapy
      patient_has_diagnosis_of_osteomyelitis_now)
:named REQ10_AUXILIARY9)) ;; "osteomyelitis requiring antibiotic therapy"

(assert
(! (=> patient_has_diagnosis_of_osteomyelitis_now@@present_at_day_of_contact
      patient_has_diagnosis_of_osteomyelitis_now)
:named REQ10_AUXILIARY10)) ;; "osteomyelitis at the day of contact"

(assert
(! (=> patient_has_diagnosis_of_septic_arthritis_now@@requires_antibiotic_therapy
      patient_has_diagnosis_of_septic_arthritis_now)
:named REQ10_AUXILIARY11)) ;; "septic arthritis requiring antibiotic therapy"

(assert
(! (=> patient_has_diagnosis_of_septic_arthritis_now@@present_at_day_of_contact
      patient_has_diagnosis_of_septic_arthritis_now)
:named REQ10_AUXILIARY12)) ;; "septic arthritis at the day of contact"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and patient_has_diagnosis_of_disorder_due_to_infection_now
             patient_has_diagnosis_of_disorder_due_to_infection_now@@requires_antibiotic_therapy
             patient_has_diagnosis_of_disorder_due_to_infection_now@@present_at_day_of_contact))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other infectious conditions requiring antibiotic therapy at the day of contact with non-exhaustive examples ((meningitis) OR (tuberculosis) OR (dysentery) OR (osteomyelitis) OR (septic arthritis))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const antimicrobial_drug_duration_value_recorded_prior_to_presentation_in_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has taken a World Health Organization-recommended antimicrobial drug prior to presentation.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the total duration in hours for which the patient has taken a World Health Organization-recommended antimicrobial drug prior to presentation."} ;; "for a duration ≥ 48 hours prior to presentation"

(declare-const patient_has_taken_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a drug or medicament at any time prior to presentation.","when_to_set_to_false":"Set to false if the patient has not taken a drug or medicament at any time prior to presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a drug or medicament prior to presentation.","meaning":"Boolean indicating whether the patient has taken a drug or medicament at any time in the history (prior to presentation)."} ;; "has taken a drug or medicament at any time prior to presentation"

(declare-const patient_has_taken_drug_or_medicament_inthehistory@@duration_greater_than_or_equal_48_hours_prior_to_presentation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken the drug or medicament for a duration of at least 48 hours prior to presentation.","when_to_set_to_false":"Set to false if the patient has taken the drug or medicament for less than 48 hours prior to presentation.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the drug or medicament was taken for a duration of at least 48 hours prior to presentation."} ;; "for a duration ≥ 48 hours prior to presentation"

(declare-const patient_has_taken_drug_or_medicament_inthehistory@@taken_in_appropriate_doses Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken the drug or medicament in the appropriate doses as recommended by the World Health Organization.","when_to_set_to_false":"Set to false if the patient has not taken the drug or medicament in the appropriate doses.","when_to_set_to_null":"Set to null if the dosing information is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the drug or medicament was taken in the appropriate doses as recommended by the World Health Organization."} ;; "in the appropriate doses as recommended by the World Health Organization"

(declare-const patient_has_taken_who_recommended_antimicrobial_drug_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a World Health Organization-recommended antimicrobial drug at any time prior to presentation.","when_to_set_to_false":"Set to false if the patient has not taken a World Health Organization-recommended antimicrobial drug at any time prior to presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a World Health Organization-recommended antimicrobial drug prior to presentation.","meaning":"Boolean indicating whether the patient has taken a World Health Organization-recommended antimicrobial drug at any time in the history (prior to presentation)."} ;; "World Health Organization-recommended antimicrobial drug"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_taken_drug_or_medicament_inthehistory@@duration_greater_than_or_equal_48_hours_prior_to_presentation
      patient_has_taken_drug_or_medicament_inthehistory)
:named REQ11_AUXILIARY0)) ;; "duration ≥ 48 hours prior to presentation"

(assert
(! (=> patient_has_taken_drug_or_medicament_inthehistory@@taken_in_appropriate_doses
      patient_has_taken_drug_or_medicament_inthehistory)
:named REQ11_AUXILIARY1)) ;; "appropriate doses as recommended by the World Health Organization"

;; Definition: taken WHO-recommended antimicrobial drug in history is a subclass of taken drug/medicament in history
(assert
(! (=> patient_has_taken_who_recommended_antimicrobial_drug_in_the_history
      patient_has_taken_drug_or_medicament_inthehistory)
:named REQ11_AUXILIARY2)) ;; "WHO-recommended antimicrobial drug is a drug or medicament"

;; Definition: taken WHO-recommended antimicrobial drug in history with appropriate doses and duration ≥ 48 hours prior to presentation
(assert
(! (= patient_has_taken_who_recommended_antimicrobial_drug_in_the_history
      (and patient_has_taken_drug_or_medicament_inthehistory@@taken_in_appropriate_doses
           patient_has_taken_drug_or_medicament_inthehistory@@duration_greater_than_or_equal_48_hours_prior_to_presentation))
:named REQ11_AUXILIARY3)) ;; "has taken the appropriate doses of WHO-recommended antimicrobial drug for a duration ≥ 48 hours prior to presentation"

;; Definition: duration qualifier is equivalent to numeric duration
(assert
(! (= patient_has_taken_drug_or_medicament_inthehistory@@duration_greater_than_or_equal_48_hours_prior_to_presentation
      (>= antimicrobial_drug_duration_value_recorded_prior_to_presentation_in_hours 48))
:named REQ11_AUXILIARY4)) ;; "duration ≥ 48 hours prior to presentation"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_taken_who_recommended_antimicrobial_drug_in_the_history)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken the appropriate doses of World Health Organization-recommended antimicrobial drug for a duration ≥ 48 hours prior to presentation."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_inpatient_stay_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an inpatient stay (hospitalization) within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not had an inpatient stay (hospitalization) within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an inpatient stay (hospitalization) within the past 2 weeks.","meaning":"Boolean indicating whether the patient has had an inpatient stay (hospitalization) within the past 2 weeks."} ;; "hospitalization within the past 2 weeks"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_inpatient_stay_inthepast2weeks)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hospitalization within the past 2 weeks."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_diagnosis_of_measles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of measles.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of measles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of measles.","meaning":"Boolean indicating whether the patient currently has a diagnosis of measles."} ;; "the patient has measles"
(declare-const patient_has_diagnosis_of_measles_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of measles within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of measles within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of measles within the past 1 month.","meaning":"Boolean indicating whether the patient has had a diagnosis of measles within the past 1 month."} ;; "the patient has a history of measles within the last 1 month"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_has_finding_of_rash_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has rash.","when_to_set_to_false":"Set to false if the patient currently does not have rash.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rash.","meaning":"Boolean indicating whether the patient currently has rash."} ;; "rash"
(declare-const patient_has_finding_of_conjunctivitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has conjunctivitis.","when_to_set_to_false":"Set to false if the patient currently does not have conjunctivitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has conjunctivitis.","meaning":"Boolean indicating whether the patient currently has conjunctivitis."} ;; "conjunctivitis"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Definition: measles = fever AND rash AND conjunctivitis
(assert
(! (= patient_has_diagnosis_of_measles_now
(and patient_has_finding_of_fever_now
     patient_has_finding_of_rash_now
     patient_has_finding_of_conjunctivitis_now))
:named REQ13_AUXILIARY0)) ;; "measles defined as (fever AND rash AND conjunctivitis)"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient must NOT have measles now
(assert
(! (not patient_has_diagnosis_of_measles_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has measles, with measles defined as (fever AND rash AND conjunctivitis)."

;; Exclusion: patient must NOT have a diagnosis of measles within the past 1 month
(assert
(! (not patient_has_diagnosis_of_measles_inthepast1months)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of measles within the last 1 month, with measles defined as (fever AND rash AND conjunctivitis)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_prior_enrolment_in_current_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously enrolled in the current trial (i.e., any enrolment prior to the current trial period).","when_to_set_to_false":"Set to false if the patient has never previously enrolled in the current trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously enrolled in the current trial.","meaning":"Boolean indicating whether the patient has prior enrolment in the current trial."} ;; "prior enrolment in the current trial"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_prior_enrolment_in_current_trial)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior enrolment in the current trial."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_allergy_to_penicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to penicillin.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to penicillin.","meaning":"Boolean indicating whether the patient currently has a known allergy to penicillin."} ;; "penicillin allergy"
(declare-const patient_has_finding_of_anaphylactic_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known history of anaphylactic symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have a known history of anaphylactic symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known history of anaphylactic symptoms.","meaning":"Boolean indicating whether the patient currently has a known history of anaphylactic symptoms."} ;; "anaphylactic symptoms"
(declare-const patient_has_finding_of_urticaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known history of urticaria.","when_to_set_to_false":"Set to false if the patient currently does not have a known history of urticaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known history of urticaria.","meaning":"Boolean indicating whether the patient currently has a known history of urticaria."} ;; "urticaria"
;; patient_has_finding_of_rash_now is already declared in the SMT program

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_rash_now
           patient_has_finding_of_urticaria_now
           patient_has_finding_of_anaphylactic_symptoms_now)
       patient_has_finding_of_allergy_to_penicillin_now)
   :named REQ15_AUXILIARY0)) ;; "with non-exhaustive examples ((history of rash) OR (urticaria) OR (anaphylactic symptoms))."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_allergy_to_penicillin_now)
   :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known penicillin allergy with non-exhaustive examples (history of rash, urticaria, anaphylactic symptoms)."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_lives_outside_municipal_limits_of_city_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lives outside the municipal limits of the city.","when_to_set_to_false":"Set to false if the patient currently lives within the municipal limits of the city.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lives outside the municipal limits of the city.","meaning":"Boolean indicating whether the patient currently lives outside the municipal limits of the city."} ;; "lives outside the municipal limits of the city"
(declare-const patient_cannot_be_followed_up_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently cannot be followed up.","when_to_set_to_false":"Set to false if the patient currently can be followed up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently cannot be followed up.","meaning":"Boolean indicating whether the patient currently cannot be followed up."} ;; "cannot be followed up"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (and patient_lives_outside_municipal_limits_of_city_now
             patient_cannot_be_followed_up_now))
:named REQ16_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "A patient is excluded if the patient lives outside the municipal limits of the city and cannot be followed up."
