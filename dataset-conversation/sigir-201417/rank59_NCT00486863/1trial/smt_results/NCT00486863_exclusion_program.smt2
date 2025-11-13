;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the disease present is significant.","when_to_set_to_false":"Set to false if the disease present is not significant.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease present is significant.","meaning":"Boolean indicating whether the disease present is significant."} ;; "significant disease"
(declare-const patient_has_finding_of_disease_now@@as_defined_by_history Bool) ;; {"when_to_set_to_true":"Set to true if the disease present is as defined by history.","when_to_set_to_false":"Set to false if the disease present is not as defined by history.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease present is as defined by history.","meaning":"Boolean indicating whether the disease present is as defined by history."} ;; "as defined by history"
(declare-const patient_has_finding_of_disease_now@@as_defined_by_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the disease present is as defined by physical examination.","when_to_set_to_false":"Set to false if the disease present is not as defined by physical examination.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease present is as defined by physical examination.","meaning":"Boolean indicating whether the disease present is as defined by physical examination."} ;; "as defined by physical examination"
(declare-const patient_has_finding_of_disease_now@@as_defined_by_ultrasound_examination Bool) ;; {"when_to_set_to_true":"Set to true if the disease present is as defined by ultrasound examination.","when_to_set_to_false":"Set to false if the disease present is not as defined by ultrasound examination.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease present is as defined by ultrasound examination.","meaning":"Boolean indicating whether the disease present is as defined by ultrasound examination."} ;; "as defined by ultrasound examination"
(declare-const patient_has_finding_of_disease_now@@as_defined_by_laboratory_assessment Bool) ;; {"when_to_set_to_true":"Set to true if the disease present is as defined by laboratory assessment.","when_to_set_to_false":"Set to false if the disease present is not as defined by laboratory assessment.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease present is as defined by laboratory assessment.","meaning":"Boolean indicating whether the disease present is as defined by laboratory assessment."} ;; "as defined by laboratory assessment"

(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness.","when_to_set_to_false":"Set to false if the patient currently does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an illness.","meaning":"Boolean indicating whether the patient currently has an illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the illness present is significant.","when_to_set_to_false":"Set to false if the illness present is not significant.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the illness present is significant.","meaning":"Boolean indicating whether the illness present is significant."} ;; "significant illness"
(declare-const patient_has_finding_of_illness_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the illness present is acute.","when_to_set_to_false":"Set to false if the illness present is not acute.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the illness present is acute.","meaning":"Boolean indicating whether the illness present is acute."} ;; "acute illness"
(declare-const patient_has_finding_of_illness_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the illness present is chronic.","when_to_set_to_false":"Set to false if the illness present is not chronic.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the illness present is chronic.","meaning":"Boolean indicating whether the illness present is chronic."} ;; "chronic illness"
(declare-const patient_has_finding_of_illness_now@@as_defined_by_history Bool) ;; {"when_to_set_to_true":"Set to true if the illness present is as defined by history.","when_to_set_to_false":"Set to false if the illness present is not as defined by history.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the illness present is as defined by history.","meaning":"Boolean indicating whether the illness present is as defined by history."} ;; "as defined by history"
(declare-const patient_has_finding_of_illness_now@@as_defined_by_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the illness present is as defined by physical examination.","when_to_set_to_false":"Set to false if the illness present is not as defined by physical examination.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the illness present is as defined by physical examination.","meaning":"Boolean indicating whether the illness present is as defined by physical examination."} ;; "as defined by physical examination"
(declare-const patient_has_finding_of_illness_now@@as_defined_by_ultrasound_examination Bool) ;; {"when_to_set_to_true":"Set to true if the illness present is as defined by ultrasound examination.","when_to_set_to_false":"Set to false if the illness present is not as defined by ultrasound examination.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the illness present is as defined by ultrasound examination.","meaning":"Boolean indicating whether the illness present is as defined by ultrasound examination."} ;; "as defined by ultrasound examination"
(declare-const patient_has_finding_of_illness_now@@as_defined_by_laboratory_assessment Bool) ;; {"when_to_set_to_true":"Set to true if the illness present is as defined by laboratory assessment.","when_to_set_to_false":"Set to false if the illness present is not as defined by laboratory assessment.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the illness present is as defined by laboratory assessment.","meaning":"Boolean indicating whether the illness present is as defined by laboratory assessment."} ;; "as defined by laboratory assessment"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_now@@significant
      patient_has_finding_of_disease_now)
    :named REQ0_AUXILIARY0)) ;; "significant disease"

(assert
(! (=> patient_has_finding_of_disease_now@@as_defined_by_history
      patient_has_finding_of_disease_now)
    :named REQ0_AUXILIARY1)) ;; "disease as defined by history"

(assert
(! (=> patient_has_finding_of_disease_now@@as_defined_by_physical_examination
      patient_has_finding_of_disease_now)
    :named REQ0_AUXILIARY2)) ;; "disease as defined by physical examination"

(assert
(! (=> patient_has_finding_of_disease_now@@as_defined_by_ultrasound_examination
      patient_has_finding_of_disease_now)
    :named REQ0_AUXILIARY3)) ;; "disease as defined by ultrasound examination"

(assert
(! (=> patient_has_finding_of_disease_now@@as_defined_by_laboratory_assessment
      patient_has_finding_of_disease_now)
    :named REQ0_AUXILIARY4)) ;; "disease as defined by laboratory assessment"

(assert
(! (=> patient_has_finding_of_illness_now@@significant
      patient_has_finding_of_illness_now)
    :named REQ0_AUXILIARY5)) ;; "significant illness"

(assert
(! (=> patient_has_finding_of_illness_now@@acute
      patient_has_finding_of_illness_now)
    :named REQ0_AUXILIARY6)) ;; "acute illness"

(assert
(! (=> patient_has_finding_of_illness_now@@chronic
      patient_has_finding_of_illness_now)
    :named REQ0_AUXILIARY7)) ;; "chronic illness"

(assert
(! (=> patient_has_finding_of_illness_now@@as_defined_by_history
      patient_has_finding_of_illness_now)
    :named REQ0_AUXILIARY8)) ;; "illness as defined by history"

(assert
(! (=> patient_has_finding_of_illness_now@@as_defined_by_physical_examination
      patient_has_finding_of_illness_now)
    :named REQ0_AUXILIARY9)) ;; "illness as defined by physical examination"

(assert
(! (=> patient_has_finding_of_illness_now@@as_defined_by_ultrasound_examination
      patient_has_finding_of_illness_now)
    :named REQ0_AUXILIARY10)) ;; "illness as defined by ultrasound examination"

(assert
(! (=> patient_has_finding_of_illness_now@@as_defined_by_laboratory_assessment
      patient_has_finding_of_illness_now)
    :named REQ0_AUXILIARY11)) ;; "illness as defined by laboratory assessment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_finding_of_disease_now@@significant
             patient_has_finding_of_disease_now@@as_defined_by_history))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant disease as defined by history."

(assert
(! (not (and patient_has_finding_of_disease_now@@significant
             patient_has_finding_of_disease_now@@as_defined_by_physical_examination))
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant disease as defined by physical examination."

(assert
(! (not (and patient_has_finding_of_disease_now@@significant
             patient_has_finding_of_disease_now@@as_defined_by_ultrasound_examination))
    :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant disease as defined by ultrasound examination."

(assert
(! (not (and patient_has_finding_of_disease_now@@significant
             patient_has_finding_of_disease_now@@as_defined_by_laboratory_assessment))
    :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant disease as defined by laboratory assessment."

(assert
(! (not (and patient_has_finding_of_illness_now@@significant
             patient_has_finding_of_illness_now@@acute
             patient_has_finding_of_illness_now@@as_defined_by_history))
    :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that is acute as defined by history."

(assert
(! (not (and patient_has_finding_of_illness_now@@significant
             patient_has_finding_of_illness_now@@acute
             patient_has_finding_of_illness_now@@as_defined_by_physical_examination))
    :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that is acute as defined by physical examination."

(assert
(! (not (and patient_has_finding_of_illness_now@@significant
             patient_has_finding_of_illness_now@@acute
             patient_has_finding_of_illness_now@@as_defined_by_ultrasound_examination))
    :named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that is acute as defined by ultrasound examination."

(assert
(! (not (and patient_has_finding_of_illness_now@@significant
             patient_has_finding_of_illness_now@@acute
             patient_has_finding_of_illness_now@@as_defined_by_laboratory_assessment))
    :named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that is acute as defined by laboratory assessment."

(assert
(! (not (and patient_has_finding_of_illness_now@@significant
             patient_has_finding_of_illness_now@@chronic
             patient_has_finding_of_illness_now@@as_defined_by_history))
    :named REQ0_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that is chronic as defined by history."

(assert
(! (not (and patient_has_finding_of_illness_now@@significant
             patient_has_finding_of_illness_now@@chronic
             patient_has_finding_of_illness_now@@as_defined_by_physical_examination))
    :named REQ0_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that is chronic as defined by physical examination."

(assert
(! (not (and patient_has_finding_of_illness_now@@significant
             patient_has_finding_of_illness_now@@chronic
             patient_has_finding_of_illness_now@@as_defined_by_ultrasound_examination))
    :named REQ0_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that is chronic as defined by ultrasound examination."

(assert
(! (not (and patient_has_finding_of_illness_now@@significant
             patient_has_finding_of_illness_now@@chronic
             patient_has_finding_of_illness_now@@as_defined_by_laboratory_assessment))
    :named REQ0_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that is chronic as defined by laboratory assessment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of seizures.","when_to_set_to_false":"Set to false if the patient does not have a documented history of seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of seizures.","meaning":"Boolean indicating whether the patient has a history of seizures."} ;; "the patient has a history of seizures"
(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient does not have a documented history of any disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any disorder of the nervous system.","meaning":"Boolean indicating whether the patient has a history of disorder of nervous system."} ;; "the patient has a history of other neurologic disorder"
(declare-const patient_has_finding_of_chronic_medical_problem_now@@as_defined_by_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic medical problem as determined by history.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic medical problem as determined by history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic medical problem as determined by history.","meaning":"Boolean indicating whether the patient currently has a chronic medical problem as determined by history."} ;; "the patient has a chronic medical problem determined by history"
(declare-const patient_has_finding_of_chronic_medical_problem_now@@as_defined_by_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic medical problem as determined by physical examination.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic medical problem as determined by physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic medical problem as determined by physical examination.","meaning":"Boolean indicating whether the patient currently has a chronic medical problem as determined by physical examination."} ;; "the patient has a chronic medical problem determined by physical examination"
(declare-const patient_has_finding_of_active_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have active hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active hepatitis.","meaning":"Boolean indicating whether the patient currently has active hepatitis."} ;; "active hepatitis"
(declare-const patient_has_finding_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active tuberculosis.","meaning":"Boolean indicating whether the patient currently has active tuberculosis."} ;; "active tuberculosis"
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "active heart disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term for chronic medical problem by history
(assert
(! (=> (or patient_has_finding_of_active_hepatitis_now
          patient_has_finding_of_active_tuberculosis_now
          patient_has_finding_of_heart_disease_now)
    patient_has_finding_of_chronic_medical_problem_now@@as_defined_by_history)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (active hepatitis, active tuberculosis, active heart disease)" for history

;; Non-exhaustive examples imply umbrella term for chronic medical problem by physical examination
(assert
(! (=> (or patient_has_finding_of_active_hepatitis_now
          patient_has_finding_of_active_tuberculosis_now
          patient_has_finding_of_heart_disease_now)
    patient_has_finding_of_chronic_medical_problem_now@@as_defined_by_physical_examination)
:named REQ1_AUXILIARY1)) ;; "with non-exhaustive examples (active hepatitis, active tuberculosis, active heart disease)" for physical examination

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_seizure_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of seizures."

(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_inthehistory)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of other neurologic disorder."

(assert
(! (not patient_has_finding_of_chronic_medical_problem_now@@as_defined_by_history)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic medical problem determined by history with non-exhaustive examples (active hepatitis, active tuberculosis, active heart disease)."

(assert
(! (not patient_has_finding_of_chronic_medical_problem_now@@as_defined_by_physical_examination)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic medical problem determined by physical examination with non-exhaustive examples (active hepatitis, active tuberculosis, active heart disease)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const blood_urea_nitrogen_concentration_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the patient's current blood urea nitrogen concentration value in mg/dL if available.","when_to_set_to_null":"Set to null if the patient's current blood urea nitrogen concentration value in mg/dL is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current blood urea nitrogen concentration in mg/dL."} ;; "blood urea nitrogen concentration"

(declare-const patient_is_exposed_to_creatinine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to creatinine, as evidenced by laboratory measurement or clinical context.","when_to_set_to_false":"Set to false if the patient is not currently exposed to creatinine, as evidenced by laboratory measurement or clinical context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to creatinine.","meaning":"Boolean indicating whether the patient is currently exposed to creatinine."} ;; "creatinine concentration"

(declare-const patient_is_exposed_to_bilirubin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to bilirubin, as evidenced by laboratory measurement or clinical context.","when_to_set_to_false":"Set to false if the patient is not currently exposed to bilirubin, as evidenced by laboratory measurement or clinical context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to bilirubin.","meaning":"Boolean indicating whether the patient is currently exposed to bilirubin."} ;; "bilirubin concentration"

(declare-const patient_has_undergone_white_blood_cell_count_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a white blood cell count procedure now and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone a white blood cell count procedure now and the outcome is not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a white blood cell count procedure now with an abnormal outcome.","meaning":"Boolean indicating whether the patient has undergone a white blood cell count procedure now and the outcome is abnormal."} ;; "white blood cell count"

(declare-const patient_has_finding_of_platelet_count_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of abnormal platelet count.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of abnormal platelet count.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of abnormal platelet count.","meaning":"Boolean indicating whether the patient currently has a finding of abnormal platelet count."} ;; "platelet count"

(declare-const patient_has_grade3_or_higher_laboratory_abnormality_of_blood_urea_nitrogen_concentration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a grade 3 or higher laboratory abnormality of blood urea nitrogen concentration.","when_to_set_to_false":"Set to false if the patient currently does not have a grade 3 or higher laboratory abnormality of blood urea nitrogen concentration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a grade 3 or higher laboratory abnormality of blood urea nitrogen concentration.","meaning":"Boolean indicating whether the patient currently has a grade 3 or higher laboratory abnormality of blood urea nitrogen concentration."} ;; "grade 3 or higher laboratory abnormality of blood urea nitrogen concentration"

(declare-const patient_has_grade3_or_higher_laboratory_abnormality_of_creatinine_concentration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a grade 3 or higher laboratory abnormality of creatinine concentration.","when_to_set_to_false":"Set to false if the patient currently does not have a grade 3 or higher laboratory abnormality of creatinine concentration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a grade 3 or higher laboratory abnormality of creatinine concentration.","meaning":"Boolean indicating whether the patient currently has a grade 3 or higher laboratory abnormality of creatinine concentration."} ;; "grade 3 or higher laboratory abnormality of creatinine concentration"

(declare-const patient_has_grade3_or_higher_laboratory_abnormality_of_bilirubin_concentration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a grade 3 or higher laboratory abnormality of bilirubin concentration.","when_to_set_to_false":"Set to false if the patient currently does not have a grade 3 or higher laboratory abnormality of bilirubin concentration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a grade 3 or higher laboratory abnormality of bilirubin concentration.","meaning":"Boolean indicating whether the patient currently has a grade 3 or higher laboratory abnormality of bilirubin concentration."} ;; "grade 3 or higher laboratory abnormality of bilirubin concentration"

(declare-const patient_has_grade3_or_higher_laboratory_abnormality_of_white_blood_cell_count_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a grade 3 or higher laboratory abnormality of white blood cell count.","when_to_set_to_false":"Set to false if the patient currently does not have a grade 3 or higher laboratory abnormality of white blood cell count.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a grade 3 or higher laboratory abnormality of white blood cell count.","meaning":"Boolean indicating whether the patient currently has a grade 3 or higher laboratory abnormality of white blood cell count."} ;; "grade 3 or higher laboratory abnormality of white blood cell count"

(declare-const patient_has_grade3_or_higher_laboratory_abnormality_of_platelet_count_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a grade 3 or higher laboratory abnormality of platelet count.","when_to_set_to_false":"Set to false if the patient currently does not have a grade 3 or higher laboratory abnormality of platelet count.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a grade 3 or higher laboratory abnormality of platelet count.","meaning":"Boolean indicating whether the patient currently has a grade 3 or higher laboratory abnormality of platelet count."} ;; "grade 3 or higher laboratory abnormality of platelet count"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_grade3_or_higher_laboratory_abnormality_of_blood_urea_nitrogen_concentration_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a grade 3 or higher laboratory abnormality of blood urea nitrogen concentration."

(assert
(! (not patient_has_grade3_or_higher_laboratory_abnormality_of_creatinine_concentration_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a grade 3 or higher laboratory abnormality of creatinine concentration."

(assert
(! (not patient_has_grade3_or_higher_laboratory_abnormality_of_bilirubin_concentration_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a grade 3 or higher laboratory abnormality of bilirubin concentration."

(assert
(! (not patient_has_grade3_or_higher_laboratory_abnormality_of_white_blood_cell_count_now)
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a grade 3 or higher laboratory abnormality of white blood cell count."

(assert
(! (not patient_has_grade3_or_higher_laboratory_abnormality_of_platelet_count_now)
:named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a grade 3 or higher laboratory abnormality of platelet count."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const alanine_aminotransferase_abnormality_grade_value_now Real) ;; {"when_to_set_to_value":"Set to the grade value of abnormality for the patient's current alanine aminotransferase concentration if available.","when_to_set_to_null":"Set to null if the grade is unknown, not documented, or cannot be determined.","meaning":"Numeric grade of abnormality for the patient's current alanine aminotransferase concentration."} ;; "grade 2 or higher abnormality of alanine aminotransferase concentration"
(declare-const alanine_aminotransferase_concentration_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current alanine aminotransferase concentration in U/L if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current alanine aminotransferase concentration in U/L."} ;; "alanine aminotransferase concentration"
(declare-const aspartate_aminotransferase_abnormality_grade_value_now Real) ;; {"when_to_set_to_value":"Set to the grade value of abnormality for the patient's current aspartate aminotransferase concentration if available.","when_to_set_to_null":"Set to null if the grade is unknown, not documented, or cannot be determined.","meaning":"Numeric grade of abnormality for the patient's current aspartate aminotransferase concentration."} ;; "grade 2 or higher abnormality of aspartate aminotransferase concentration"
(declare-const aspartate_aminotransferase_concentration_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current aspartate aminotransferase concentration in U/L if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current aspartate aminotransferase concentration in U/L."} ;; "aspartate aminotransferase concentration"
(declare-const patient_has_finding_of_aspartate_transaminase_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of aspartate transaminase level abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of aspartate transaminase level abnormality.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has a finding of aspartate transaminase level abnormality.","meaning":"Boolean indicating whether the patient currently has a finding of aspartate transaminase level abnormality."} ;; "aspartate aminotransferase concentration"
(declare-const patient_has_undergone_alanine_aminotransferase_measurement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone alanine aminotransferase measurement now.","when_to_set_to_false":"Set to false if the patient has not undergone alanine aminotransferase measurement now.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has undergone alanine aminotransferase measurement now.","meaning":"Boolean indicating whether the patient has undergone alanine aminotransferase measurement now."} ;; "alanine aminotransferase concentration"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (>= alanine_aminotransferase_abnormality_grade_value_now 2))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a grade 2 or higher abnormality of alanine aminotransferase concentration."

(assert
(! (not (>= aspartate_aminotransferase_abnormality_grade_value_now 2))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a grade 2 or higher abnormality of aspartate aminotransferase concentration."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anemia.","meaning":"Boolean indicating whether the patient currently has anemia."} ;; "anemia"
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_g_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of hemoglobin concentration in g/dl recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin concentration in g/dl."} ;; "hemoglobin concentration"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: severe anemia = hemoglobin concentration < 7.0 g/dl
(assert
(! (= patient_has_finding_of_anemia_now
     (< patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_g_per_dl 7.0))
   :named REQ4_AUXILIARY0)) ;; "severe anemia defined as hemoglobin concentration < 7.0 g/dl"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_anemia_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe anemia defined as hemoglobin concentration < 7.0 g/dl."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_leiomyoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a leiomyoma (myoma).","when_to_set_to_false":"Set to false if the patient currently does not have a leiomyoma (myoma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a leiomyoma (myoma).","meaning":"Boolean indicating whether the patient currently has a leiomyoma (myoma)."} ;; "myoma"
(declare-const patient_has_finding_of_leiomyoma_now@@detected_on_ultrasound_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's leiomyoma is detected on ultrasound examination.","when_to_set_to_false":"Set to false if the patient's leiomyoma is not detected on ultrasound examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the leiomyoma is detected on ultrasound examination.","meaning":"Boolean indicating whether the patient's leiomyoma is detected on ultrasound examination."} ;; "myoma on ultrasound examination"
(declare-const patient_has_finding_of_leiomyoma_now@@is_sub_mucosal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's leiomyoma is sub-mucosal.","when_to_set_to_false":"Set to false if the patient's leiomyoma is not sub-mucosal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the leiomyoma is sub-mucosal.","meaning":"Boolean indicating whether the patient's leiomyoma is sub-mucosal."} ;; "myoma is sub-mucosal"
(declare-const patient_leiomyoma_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the measured size in centimeters if a numeric measurement of the largest leiomyoma (myoma) present in the patient is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the size in centimeters of the largest leiomyoma (myoma) present in the patient, recorded now."} ;; "size of the largest myoma in cm"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_leiomyoma_now@@detected_on_ultrasound_examination
      patient_has_finding_of_leiomyoma_now)
:named REQ5_AUXILIARY0)) ;; "myoma detected on ultrasound examination implies myoma present"

(assert
(! (=> patient_has_finding_of_leiomyoma_now@@is_sub_mucosal
      patient_has_finding_of_leiomyoma_now)
:named REQ5_AUXILIARY1)) ;; "sub-mucosal myoma implies myoma present"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion 1: The patient has a myoma on ultrasound examination that is sub-mucosal
(assert
(! (not (and patient_has_finding_of_leiomyoma_now@@detected_on_ultrasound_examination
             patient_has_finding_of_leiomyoma_now@@is_sub_mucosal))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a myoma on ultrasound examination that is sub-mucosal."

;; Exclusion 2: The patient has a myoma in any location that is greater than 5 cm in size
(assert
(! (not (and patient_has_finding_of_leiomyoma_now
             (> patient_leiomyoma_value_recorded_now_withunit_cm 5)))
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a myoma in any location that is greater than 5 cm in size."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of congenital anomaly of the reproductive tract.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of congenital anomaly of the reproductive tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of congenital anomaly of the reproductive tract.","meaning":"Boolean indicating whether the patient currently has a congenital anomaly of the reproductive tract."} ;; "congenital anomaly of the reproductive tract"

(declare-const patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now@@expected_to_cause_decreased_fetal_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current congenital anomaly of the reproductive tract is expected to cause decreased fetal weight.","when_to_set_to_false":"Set to false if the patient's current congenital anomaly of the reproductive tract is not expected to cause decreased fetal weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current congenital anomaly of the reproductive tract is expected to cause decreased fetal weight.","meaning":"Boolean indicating whether the patient's current congenital anomaly of the reproductive tract is expected to cause decreased fetal weight."} ;; "expected to cause decreased fetal weight"

(declare-const patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now@@expected_to_greatly_increase_risk_of_prematurity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current congenital anomaly of the reproductive tract is expected to greatly increase the risk of prematurity.","when_to_set_to_false":"Set to false if the patient's current congenital anomaly of the reproductive tract is not expected to greatly increase the risk of prematurity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current congenital anomaly of the reproductive tract is expected to greatly increase the risk of prematurity.","meaning":"Boolean indicating whether the patient's current congenital anomaly of the reproductive tract is expected to greatly increase the risk of prematurity."} ;; "expected to greatly increase the risk of prematurity"

(declare-const patient_has_finding_of_congenital_duplication_of_uterus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of congenital duplication of the uterus (duplicate uterus).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of congenital duplication of the uterus (duplicate uterus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of congenital duplication of the uterus (duplicate uterus).","meaning":"Boolean indicating whether the patient currently has a congenital duplication of the uterus (duplicate uterus)."} ;; "duplicate uterus"

(declare-const patient_has_finding_of_uterine_septum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of uterine septum.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of uterine septum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of uterine septum.","meaning":"Boolean indicating whether the patient currently has a uterine septum."} ;; "uterine septum"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply the umbrella subclass
(assert
(! (=> (or patient_has_finding_of_congenital_duplication_of_uterus_now
           patient_has_finding_of_uterine_septum_now)
     patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now@@expected_to_greatly_increase_risk_of_prematurity)
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (duplicate uterus, uterine septum)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now@@expected_to_cause_decreased_fetal_weight
     patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now)
:named REQ6_AUXILIARY1)) ;; "expected to cause decreased fetal weight"

(assert
(! (=> patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now@@expected_to_greatly_increase_risk_of_prematurity
     patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now)
:named REQ6_AUXILIARY2)) ;; "expected to greatly increase the risk of prematurity"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now@@expected_to_cause_decreased_fetal_weight)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital anomaly of the reproductive tract that would be expected to cause decreased fetal weight."

(assert
(! (not patient_has_finding_of_congenital_anomaly_of_reproductive_tract_now@@expected_to_greatly_increase_risk_of_prematurity)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital anomaly of the reproductive tract that would be expected to greatly increase the risk of prematurity with non-exhaustive examples (duplicate uterus, uterine septum)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_illness_now@@significant@@alters_activities_of_daily_living_significantly Bool) ;; {"when_to_set_to_true":"Set to true if the patient's significant illness significantly alters the ability to perform activities of daily living.","when_to_set_to_false":"Set to false if the patient's significant illness does not significantly alter the ability to perform activities of daily living.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's significant illness significantly alters the ability to perform activities of daily living.","meaning":"Boolean indicating whether the patient's significant illness significantly alters the ability to perform activities of daily living."} ;; "the patient has a significant illness that significantly alters the ability to perform activities of daily living"

(declare-const patient_has_finding_of_illness_now@@significant@@causes_symptoms_at_least_two_days_per_week Bool) ;; {"when_to_set_to_true":"Set to true if the patient's significant illness causes symptoms at least two days per week.","when_to_set_to_false":"Set to false if the patient's significant illness does not cause symptoms at least two days per week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's significant illness causes symptoms at least two days per week.","meaning":"Boolean indicating whether the patient's significant illness causes symptoms at least two days per week."} ;; "the patient has a significant illness that causes symptoms at least two days per week"

(declare-const patient_has_finding_of_illness_now@@significant@@necessitates_regular_use_of_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's significant illness necessitates regular use of medication.","when_to_set_to_false":"Set to false if the patient's significant illness does not necessitate regular use of medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's significant illness necessitates regular use of medication.","meaning":"Boolean indicating whether the patient's significant illness necessitates regular use of medication."} ;; "the patient has a significant illness that necessitates regular use of medication"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_illness_now@@significant@@alters_activities_of_daily_living_significantly)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that significantly alters the ability to perform activities of daily living."

(assert
(! (not patient_has_finding_of_illness_now@@significant@@causes_symptoms_at_least_two_days_per_week)
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that causes symptoms at least two days per week."

(assert
(! (not patient_has_finding_of_illness_now@@significant@@necessitates_regular_use_of_medication)
    :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant illness that necessitates regular use of medication."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_disorder_characterized_by_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder characterized by fever (febrile illness).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder characterized by fever (febrile illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder characterized by fever (febrile illness).","meaning":"Boolean indicating whether the patient currently has a disorder characterized by fever (febrile illness)."} ;; "febrile illness"
(declare-const patient_is_currently_on_medication_for_acute_medical_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving medication for an acute medical condition (e.g., urinary tract infection, pneumonia, febrile illness).","when_to_set_to_false":"Set to false if the patient is not currently receiving medication for an acute medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving medication for an acute medical condition.","meaning":"Boolean indicating whether the patient is currently receiving medication for an acute medical condition (such as urinary tract infection, pneumonia, or febrile illness)."} ;; "the patient is currently on medication for the illness"
(declare-const illness_self_resolved_before_gestation_week_value_recorded Real) ;; {"when_to_set_to_value":"Set to the gestational week (in weeks) at which the patient's acute illness self-resolved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's acute illness self-resolved.","meaning":"Numeric value indicating the gestational week at which the patient's acute illness self-resolved."} ;; "the illness self-resolves before 16 weeks gestation"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples imply umbrella term (acute medical condition)
(assert
(! (=> (or patient_has_finding_of_urinary_tract_infectious_disease_now
           patient_has_finding_of_pneumonia_now
           patient_has_finding_of_disorder_characterized_by_fever_now)
       patient_has_finding_of_illness_now@@acute)
    :named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (urinary tract infection, pneumonia, febrile illness)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@acute
       patient_has_finding_of_illness_now)
    :named REQ8_AUXILIARY1)) ;; "acute medical condition"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient has an acute medical condition AND ((not successfully treated) OR (not self-resolved before 16 weeks gestation))
(assert
(! (not (and patient_has_finding_of_illness_now@@acute
             (or patient_is_currently_on_medication_for_acute_medical_condition
                 (not (< illness_self_resolved_before_gestation_week_value_recorded 16)))))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an acute medical condition with non-exhaustive examples (urinary tract infection, pneumonia, febrile illness)) AND ((the illness is NOT successfully treated (the patient is currently on medication for the illness)) OR (the illness does NOT self-resolve before 16 weeks gestation))."
