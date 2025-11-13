;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_suicidal_thoughts_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suicidal thoughts.","when_to_set_to_false":"Set to false if the patient currently does not have suicidal thoughts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suicidal thoughts.","meaning":"Boolean indicating whether the patient currently has suicidal thoughts."} ;; "suicidal ideation"
(declare-const patient_has_finding_of_suicidal_thoughts_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current suicidal thoughts are clinically significant.","when_to_set_to_false":"Set to false if the patient's current suicidal thoughts are not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current suicidal thoughts are clinically significant.","meaning":"Boolean indicating whether the patient's current suicidal thoughts are clinically significant."} ;; "clinically significant suicidal ideation"
(declare-const patient_has_finding_of_homicidal_thoughts_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has homicidal thoughts.","when_to_set_to_false":"Set to false if the patient currently does not have homicidal thoughts.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has homicidal thoughts.","meaning":"Boolean indicating whether the patient currently has homicidal thoughts."} ;; "homicidal ideation"
(declare-const patient_has_finding_of_homicidal_thoughts_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current homicidal thoughts are clinically significant.","when_to_set_to_false":"Set to false if the patient's current homicidal thoughts are not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current homicidal thoughts are clinically significant.","meaning":"Boolean indicating whether the patient's current homicidal thoughts are clinically significant."} ;; "clinically significant homicidal ideation"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_suicidal_thoughts_now@@clinically_significant
      patient_has_finding_of_suicidal_thoughts_now)
   :named REQ0_AUXILIARY0)) ;; "clinically significant suicidal ideation"

(assert
(! (=> patient_has_finding_of_homicidal_thoughts_now@@clinically_significant
      patient_has_finding_of_homicidal_thoughts_now)
   :named REQ0_AUXILIARY1)) ;; "clinically significant homicidal ideation"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_finding_of_suicidal_thoughts_now@@clinically_significant
            patient_has_finding_of_homicidal_thoughts_now@@clinically_significant))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has clinically significant suicidal ideation) OR (the patient has clinically significant homicidal ideation)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_dsm_iv_lifetime_diagnosis_of_substance_dependence_disorder_within_past_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a DSM-IV lifetime diagnosis of a substance dependence disorder and the diagnosis occurred within the past 6 months.","when_to_set_to_false":"Set to false if the patient does not have a DSM-IV lifetime diagnosis of a substance dependence disorder within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a DSM-IV lifetime diagnosis of a substance dependence disorder within the past 6 months.","meaning":"Boolean indicating whether the patient has a DSM-IV lifetime diagnosis of a substance dependence disorder within the past 6 months."} ;; "DSM-IV lifetime diagnosis of a substance dependence disorder within the past 6 months"

(declare-const patient_has_diagnosis_of_substance_abuse_disorder_within_past_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been diagnosed with a substance abuse disorder within the past month.","when_to_set_to_false":"Set to false if the patient has not been diagnosed with a substance abuse disorder within the past month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with a substance abuse disorder within the past month.","meaning":"Boolean indicating whether the patient has been diagnosed with a substance abuse disorder within the past month."} ;; "diagnosed with a substance abuse disorder within the past month"

(declare-const patient_has_diagnosis_of_substance_abuse_disorder_within_past_1_month@@not_nicotine_abuse_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the substance abuse disorder diagnosed within the past month is NOT a nicotine abuse disorder.","when_to_set_to_false":"Set to false if the substance abuse disorder diagnosed within the past month is a nicotine abuse disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the substance abuse disorder diagnosed within the past month is a nicotine abuse disorder.","meaning":"Boolean indicating whether the substance abuse disorder diagnosed within the past month is NOT a nicotine abuse disorder."} ;; "substance abuse disorder is NOT nicotine abuse disorder"

(declare-const patient_has_diagnosis_of_substance_abuse_disorder_within_past_1_month@@not_nicotine_dependence_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the substance abuse disorder diagnosed within the past month is NOT a nicotine dependence disorder.","when_to_set_to_false":"Set to false if the substance abuse disorder diagnosed within the past month is a nicotine dependence disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the substance abuse disorder diagnosed within the past month is a nicotine dependence disorder.","meaning":"Boolean indicating whether the substance abuse disorder diagnosed within the past month is NOT a nicotine dependence disorder."} ;; "substance abuse disorder is NOT nicotine dependence disorder"

(declare-const patient_has_undergone_history_taking_mental_health_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone psychiatric history taking at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone psychiatric history taking at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone psychiatric history taking at any time in the past.","meaning":"Boolean indicating whether the patient has undergone psychiatric history taking at any time in the past."} ;; "psychiatric history"

(declare-const patient_has_undergone_structured_clinical_interview_for_dsm_disorders_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a Structured Clinical Interview for DSM disorders in the history.","when_to_set_to_false":"Set to false if the patient has not undergone a Structured Clinical Interview for DSM disorders in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a Structured Clinical Interview for DSM disorders in the history.","meaning":"Boolean indicating whether the patient has undergone a Structured Clinical Interview for DSM disorders in the history."} ;; "Structured Clinical Interview for DSM disorders in the history"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion if DSM-IV lifetime diagnosis of substance dependence disorder within past 6 months, as determined by psychiatric history OR Structured Clinical Interview for DSM
(assert
(! (not (and patient_has_dsm_iv_lifetime_diagnosis_of_substance_dependence_disorder_within_past_6_months
             (or patient_has_undergone_history_taking_mental_health_inthehistory
                 patient_has_undergone_structured_clinical_interview_for_dsm_disorders_in_the_history)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition lifetime diagnosis of a substance dependence disorder within the past 6 months, as determined by psychiatric history OR Structured Clinical Interview for Diagnostic and Statistical Manual of Mental Disorders interview."

;; Exclusion if diagnosed with substance abuse disorder within past month AND NOT nicotine abuse disorder AND NOT nicotine dependence disorder, as determined by psychiatric history OR Structured Clinical Interview for DSM
(assert
(! (not (and patient_has_diagnosis_of_substance_abuse_disorder_within_past_1_month
             patient_has_diagnosis_of_substance_abuse_disorder_within_past_1_month@@not_nicotine_abuse_disorder
             patient_has_diagnosis_of_substance_abuse_disorder_within_past_1_month@@not_nicotine_dependence_disorder
             (or patient_has_undergone_history_taking_mental_health_inthehistory
                 patient_has_undergone_structured_clinical_interview_for_dsm_disorders_in_the_history)))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been diagnosed with a substance abuse disorder within the past month AND the substance abuse disorder is NOT nicotine abuse disorder AND the substance abuse disorder is NOT nicotine dependence disorder, as determined by psychiatric history OR Structured Clinical Interview for Diagnostic and Statistical Manual of Mental Disorders interview."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_clinically_significant_medical_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically significant medical disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically significant medical disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant medical disease.","meaning":"Boolean indicating whether the patient currently has a clinically significant medical disease."} ;; "clinically significant medical disease"
(declare-const patient_has_clinically_significant_medical_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_bipolar_disorder_or_treatment_of_obesity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically significant medical disease could interfere with diagnosis, assessment, or treatment of bipolar disorder or treatment of obesity.","when_to_set_to_false":"Set to false if the patient's clinically significant medical disease could not interfere with diagnosis, assessment, or treatment of bipolar disorder or treatment of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically significant medical disease could interfere with diagnosis, assessment, or treatment of bipolar disorder or treatment of obesity.","meaning":"Boolean indicating whether the patient's clinically significant medical disease could interfere with diagnosis, assessment, or treatment of bipolar disorder or treatment of obesity."} ;; "disease could interfere with diagnosis, assessment, or treatment of bipolar disorder OR treatment of obesity"
(declare-const patient_has_unstable_medical_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an unstable medical disease.","when_to_set_to_false":"Set to false if the patient currently does not have an unstable medical disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an unstable medical disease.","meaning":"Boolean indicating whether the patient currently has an unstable medical disease."} ;; "unstable medical disease"
(declare-const patient_has_unstable_medical_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_bipolar_disorder_or_treatment_of_obesity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's unstable medical disease could interfere with diagnosis, assessment, or treatment of bipolar disorder or treatment of obesity.","when_to_set_to_false":"Set to false if the patient's unstable medical disease could not interfere with diagnosis, assessment, or treatment of bipolar disorder or treatment of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's unstable medical disease could interfere with diagnosis, assessment, or treatment of bipolar disorder or treatment of obesity.","meaning":"Boolean indicating whether the patient's unstable medical disease could interfere with diagnosis, assessment, or treatment of bipolar disorder or treatment of obesity."} ;; "disease could interfere with diagnosis, assessment, or treatment of bipolar disorder OR treatment of obesity"
(declare-const patient_has_diagnosis_of_pancreatitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of pancreatitis in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of pancreatitis in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of pancreatitis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of pancreatitis in their history."} ;; "history of pancreatitis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_clinically_significant_medical_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_bipolar_disorder_or_treatment_of_obesity
      patient_has_clinically_significant_medical_disease_now)
    :named REQ2_AUXILIARY0)) ;; "clinically significant medical disease could interfere with diagnosis, assessment, or treatment of bipolar disorder OR treatment of obesity"

(assert
(! (=> patient_has_unstable_medical_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_bipolar_disorder_or_treatment_of_obesity
      patient_has_unstable_medical_disease_now)
    :named REQ2_AUXILIARY1)) ;; "unstable medical disease could interfere with diagnosis, assessment, or treatment of bipolar disorder OR treatment of obesity"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: ((clinically significant medical disease OR unstable medical disease) AND disease could interfere with diagnosis, assessment, or treatment of bipolar disorder OR treatment of obesity)
(assert
(! (not
      (or
        (or patient_has_clinically_significant_medical_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_bipolar_disorder_or_treatment_of_obesity
            patient_has_unstable_medical_disease_now@@could_interfere_with_diagnosis_assessment_or_treatment_of_bipolar_disorder_or_treatment_of_obesity)
        patient_has_diagnosis_of_pancreatitis_inthehistory))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (((the patient has a clinically significant medical disease) OR (the patient has an unstable medical disease)) AND (the disease could interfere with diagnosis, assessment, or treatment of bipolar disorder OR treatment of obesity)) OR (the patient has a history of pancreatitis)."

;; Exclusion: history of pancreatitis
(assert
(! (not patient_has_diagnosis_of_pancreatitis_inthehistory)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pancreatitis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const complete_blood_count_with_differential_value_recorded_now_withunit_si Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent complete blood count with differential result, recorded now, in SI units.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent complete blood count with differential result, recorded now, in SI units."} ;; "complete blood count with differential"
(declare-const upper_limit_of_normal_for_complete_blood_count_with_differential_now_withunit_si Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for the complete blood count with differential test, recorded now, in SI units.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for the complete blood count with differential test, recorded now, in SI units."} ;; "upper limit of normal for complete blood count with differential"

(declare-const electrolyte_test_value_recorded_now_withunit_si Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent electrolyte test result, recorded now, in SI units.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent electrolyte test result, recorded now, in SI units."} ;; "electrolyte test"
(declare-const upper_limit_of_normal_for_electrolyte_test_now_withunit_si Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for the electrolyte test, recorded now, in SI units.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for the electrolyte test, recorded now, in SI units."} ;; "upper limit of normal for electrolyte test"

(declare-const blood_urea_nitrogen_test_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent blood urea nitrogen test result, recorded now, in mmol/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent blood urea nitrogen test result, recorded now, in mmol/L."} ;; "blood urea nitrogen test"
(declare-const upper_limit_of_normal_for_blood_urea_nitrogen_test_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for the blood urea nitrogen test, recorded now, in mmol/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for the blood urea nitrogen test, recorded now, in mmol/L."} ;; "upper limit of normal for blood urea nitrogen test"

(declare-const creatinine_test_value_recorded_now_withunit_micromol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent creatinine test result, recorded now, in micromol/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent creatinine test result, recorded now, in micromol/L."} ;; "creatinine test"
(declare-const upper_limit_of_normal_for_creatinine_test_now_withunit_micromol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for the creatinine test, recorded now, in micromol/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for the creatinine test, recorded now, in micromol/L."} ;; "upper limit of normal for creatinine test"

(declare-const hepatic_transaminase_test_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent hepatic transaminase test result, recorded now, in U/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent hepatic transaminase test result, recorded now, in U/L."} ;; "hepatic transaminase test"
(declare-const upper_limit_of_normal_for_hepatic_transaminase_test_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for the hepatic transaminase test, recorded now, in U/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for the hepatic transaminase test, recorded now, in U/L."} ;; "upper limit of normal for hepatic transaminase test"

(declare-const lipid_profile_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent lipid profile result, recorded now, in mmol/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent lipid profile result, recorded now, in mmol/L."} ;; "lipid profile"
(declare-const upper_limit_of_normal_for_lipid_profile_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for the lipid profile test, recorded now, in mmol/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for the lipid profile test, recorded now, in mmol/L."} ;; "upper limit of normal for lipid profile"

(declare-const fasting_glucose_test_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent fasting glucose test result, recorded now, in mmol/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent fasting glucose test result, recorded now, in mmol/L."} ;; "fasting glucose test"
(declare-const upper_limit_of_normal_for_fasting_glucose_test_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for the fasting glucose test, recorded now, in mmol/L.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for the fasting glucose test, recorded now, in mmol/L."} ;; "upper limit of normal for fasting glucose test"

(declare-const urinalysis_test_value_recorded_now_withunit_si Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent urinalysis test result, recorded now, in SI units.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent urinalysis test result, recorded now, in SI units."} ;; "urinalysis"
(declare-const upper_limit_of_normal_for_urinalysis_test_now_withunit_si Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for the urinalysis test, recorded now, in SI units.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for the urinalysis test, recorded now, in SI units."} ;; "upper limit of normal for urinalysis"

(declare-const thyroid_index_test_value_recorded_now_withunit_si Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent thyroid index test result, recorded now, in SI units.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent thyroid index test result, recorded now, in SI units."} ;; "thyroid index test"
(declare-const upper_limit_of_normal_for_thyroid_index_test_now_withunit_si Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for the thyroid index test, recorded now, in SI units.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the upper limit of normal for the thyroid index test, recorded now, in SI units."} ;; "upper limit of normal for thyroid index test"

(declare-const patient_has_clinically_significant_laboratory_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a laboratory abnormality that is clinically significant, defined as a laboratory value greater than 3 times the upper limit of normal on at least one of the following tests: complete blood count with differential, electrolyte test, blood urea nitrogen test, creatinine test, hepatic transaminase test, lipid profile, fasting glucose test, urinalysis, or thyroid index test.","when_to_set_to_false":"Set to false if the patient currently does not have any clinically significant laboratory abnormality as defined above.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant laboratory abnormality as defined above.","meaning":"Boolean indicating whether the patient currently has a clinically significant laboratory abnormality (laboratory value > 3 times the upper limit of normal on at least one specified test)."} ;; "clinically significant laboratory abnormality"

(declare-const patient_has_finding_of_electrocardiogram_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically abnormal electrocardiogram (ECG/EKG) result.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically abnormal electrocardiogram (ECG/EKG) result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically abnormal electrocardiogram (ECG/EKG) result.","meaning":"Boolean indicating whether the patient currently has an abnormal electrocardiogram (ECG/EKG) result."} ;; "clinically abnormal electrocardiogram"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition of clinically significant laboratory abnormality (laboratory value > 3x ULN on at least one test)
(assert
(! (= patient_has_clinically_significant_laboratory_abnormality_now
(or
  (> complete_blood_count_with_differential_value_recorded_now_withunit_si
     (* 3 upper_limit_of_normal_for_complete_blood_count_with_differential_now_withunit_si))
  (> electrolyte_test_value_recorded_now_withunit_si
     (* 3 upper_limit_of_normal_for_electrolyte_test_now_withunit_si))
  (> blood_urea_nitrogen_test_value_recorded_now_withunit_mmol_per_l
     (* 3 upper_limit_of_normal_for_blood_urea_nitrogen_test_now_withunit_mmol_per_l))
  (> creatinine_test_value_recorded_now_withunit_micromol_per_l
     (* 3 upper_limit_of_normal_for_creatinine_test_now_withunit_micromol_per_l))
  (> hepatic_transaminase_test_value_recorded_now_withunit_u_per_l
     (* 3 upper_limit_of_normal_for_hepatic_transaminase_test_now_withunit_u_per_l))
  (> lipid_profile_value_recorded_now_withunit_mmol_per_l
     (* 3 upper_limit_of_normal_for_lipid_profile_now_withunit_mmol_per_l))
  (> fasting_glucose_test_value_recorded_now_withunit_mmol_per_l
     (* 3 upper_limit_of_normal_for_fasting_glucose_test_now_withunit_mmol_per_l))
  (> urinalysis_test_value_recorded_now_withunit_si
     (* 3 upper_limit_of_normal_for_urinalysis_test_now_withunit_si))
  (> thyroid_index_test_value_recorded_now_withunit_si
     (* 3 upper_limit_of_normal_for_thyroid_index_test_now_withunit_si))
))
:named REQ3_AUXILIARY0)) ;; "clinically significant laboratory abnormalities (laboratory value > 3 times the upper limit of normal) on at least one of the following tests: ..."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_clinically_significant_laboratory_abnormality_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant laboratory abnormalities (laboratory value > 3 times the upper limit of normal) on at least one of the following tests: ..."

(assert
(! (not patient_has_finding_of_electrocardiogram_abnormal_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinically abnormal electrocardiogram."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is currently female."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as currently not pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as currently not lactating.","when_to_set_to_null":"Set to null if the patient's lactation status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_sex_is_female_now
             (or patient_is_pregnant_now
                 patient_is_lactating_now)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female AND (the patient is pregnant OR the patient is lactating)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_sexual_activity_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sexual activity status is known and not in question.","when_to_set_to_false":"Set to false if the patient's current sexual activity status is explicitly known to be absent or not applicable.","when_to_set_to_null":"Set to null if the patient's current sexual activity status is unknown or in question.","meaning":"Boolean indicating the current status of the patient's sexual activity, including whether it is known, unknown, or in question."} ;; "the sexual activity of the patient is unknown OR the sexual activity of the patient is in question"
(declare-const patient_sexual_activity_status_now@@is_unknown Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sexual activity status is currently unknown.","when_to_set_to_false":"Set to false if the patient's sexual activity status is currently known.","when_to_set_to_null":"Set to null if it cannot be determined whether the patient's sexual activity status is unknown.","meaning":"Boolean indicating whether the patient's sexual activity status is currently unknown."} ;; "the sexual activity of the patient is unknown"
(declare-const patient_sexual_activity_status_now@@is_in_question Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sexual activity status is currently in question (uncertain or disputed).","when_to_set_to_false":"Set to false if the patient's sexual activity status is not in question.","when_to_set_to_null":"Set to null if it cannot be determined whether the patient's sexual activity status is in question.","meaning":"Boolean indicating whether the patient's sexual activity status is currently in question (uncertain or disputed)."} ;; "the sexual activity of the patient is in question"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply the main variable is not known and not in question
(assert
(! (=> (or patient_sexual_activity_status_now@@is_unknown
           patient_sexual_activity_status_now@@is_in_question)
     (not patient_sexual_activity_status_now))
:named REQ5_AUXILIARY0)) ;; "the sexual activity of the patient is unknown OR the sexual activity of the patient is in question"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: If the patient is female AND (sexual activity unknown OR in question), exclude
(assert
(! (not (and patient_sex_is_female_now
             (or patient_sexual_activity_status_now@@is_unknown
                 patient_sexual_activity_status_now@@is_in_question)))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is female) AND ((the sexual activity of the patient is unknown) OR (the sexual activity of the patient is in question)))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "current diabetes"

(declare-const patient_has_finding_of_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient does not have any history of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of diabetes mellitus.","meaning":"Boolean indicating whether the patient has any history of diabetes mellitus."} ;; "any history of diabetes"

(declare-const patient_has_finding_of_diabetes_mellitus_inthehistory@@treated_with_pharmacological_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient's past diabetes mellitus was treated with pharmacological intervention.","when_to_set_to_false":"Set to false if the patient's past diabetes mellitus was not treated with pharmacological intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's past diabetes mellitus was treated with pharmacological intervention.","meaning":"Boolean indicating whether the patient's past diabetes mellitus was treated with pharmacological intervention."} ;; "past diabetes has been treated with pharmacological intervention"

(declare-const patient_has_diagnosis_of_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with diabetes mellitus.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with diabetes mellitus.","meaning":"Boolean indicating whether the patient has ever been diagnosed with diabetes mellitus."} ;; "diagnosis of diabetes"

(declare-const patient_is_taking_exenatide_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking exenatide-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking exenatide-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking exenatide-containing product.","meaning":"Boolean indicating whether the patient is currently taking exenatide-containing product."} ;; "currently receiving exenatide"

(declare-const patient_is_taking_insulin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking insulin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking insulin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking insulin-containing product.","meaning":"Boolean indicating whether the patient is currently taking insulin-containing product."} ;; "currently receiving insulin"

(declare-const patient_is_taking_oral_anti_hyperglycemic_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any oral anti-hyperglycemic medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any oral anti-hyperglycemic medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any oral anti-hyperglycemic medication.","meaning":"Boolean indicating whether the patient is currently taking an oral anti-hyperglycemic medication."} ;; "currently receiving an oral anti-hyperglycemic medication"

(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a nonfasting blood glucose level in mg/dL is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's most recent nonfasting blood glucose level in mg/dL."} ;; "nonfasting blood glucose level"

(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@nonfasting Bool) ;; {"when_to_set_to_true":"Set to true if the blood glucose measurement was taken in a nonfasting state.","when_to_set_to_false":"Set to false if the blood glucose measurement was not taken in a nonfasting state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken in a nonfasting state.","meaning":"Boolean indicating whether the blood glucose measurement was taken in a nonfasting state."} ;; "nonfasting blood glucose measurement"

(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@fasting Bool) ;; {"when_to_set_to_true":"Set to true if the blood glucose measurement was taken in a fasting state.","when_to_set_to_false":"Set to false if the blood glucose measurement was not taken in a fasting state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken in a fasting state.","meaning":"Boolean indicating whether the blood glucose measurement was taken in a fasting state."} ;; "fasting blood glucose measurement"

(declare-const patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_on_two_separate_tests Bool) ;; {"when_to_set_to_true":"Set to true if the fasting blood glucose measurement was obtained on two separate tests.","when_to_set_to_false":"Set to false if the fasting blood glucose measurement was not obtained on two separate tests.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was obtained on two separate tests.","meaning":"Boolean indicating whether the fasting blood glucose measurement was obtained on two separate tests."} ;; "fasting blood glucose level measured on two separate tests"

(declare-const patient_has_finding_of_prediabetes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has prediabetes.","when_to_set_to_false":"Set to false if the patient currently does not have prediabetes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has prediabetes.","meaning":"Boolean indicating whether the patient currently has prediabetes."} ;; "pre-diabetes"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for past diabetes treated with pharmacological intervention implies history of diabetes
(assert
(! (=> patient_has_finding_of_diabetes_mellitus_inthehistory@@treated_with_pharmacological_intervention
      patient_has_finding_of_diabetes_mellitus_inthehistory)
    :named REQ6_AUXILIARY0)) ;; "the past diabetes has been treated with pharmacological intervention"

;; Qualifier variable for nonfasting blood glucose measurement implies a blood glucose value is present
(assert
(! (=> patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@nonfasting
      true)
    :named REQ6_AUXILIARY1)) ;; "nonfasting blood glucose measurement"

;; Qualifier variable for fasting blood glucose measurement implies a blood glucose value is present
(assert
(! (=> patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@fasting
      true)
    :named REQ6_AUXILIARY2)) ;; "fasting blood glucose measurement"

;; Qualifier variable for fasting blood glucose measured on two separate tests implies fasting measurement
(assert
(! (=> patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_on_two_separate_tests
      patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@fasting)
    :named REQ6_AUXILIARY3)) ;; "fasting blood glucose level measured on two separate tests"

;; Patients with pre-diabetes will NOT be excluded
(assert
(! (not patient_has_finding_of_prediabetes_now)
    :named REQ6_AUXILIARY4)) ;; "Patients with pre-diabetes will NOT be excluded."

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: any history of current diabetes
(assert
(! (not patient_has_finding_of_diabetes_mellitus_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "any history of current diabetes"

;; Exclusion: any history of past diabetes AND past diabetes treated with pharmacological intervention
(assert
(! (not (and patient_has_finding_of_diabetes_mellitus_inthehistory
             patient_has_finding_of_diabetes_mellitus_inthehistory@@treated_with_pharmacological_intervention))
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "any history of past diabetes AND the past diabetes has been treated with pharmacological intervention"

;; Exclusion: diagnosis of diabetes
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_inthehistory)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "diagnosis of diabetes"

;; Exclusion: currently receiving exenatide
(assert
(! (not patient_is_taking_exenatide_containing_product_now)
    :named REQ6_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "currently receiving exenatide"

;; Exclusion: currently receiving insulin
(assert
(! (not patient_is_taking_insulin_containing_product_now)
    :named REQ6_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "currently receiving insulin"

;; Exclusion: currently receiving oral anti-hyperglycemic medication
(assert
(! (not patient_is_taking_oral_anti_hyperglycemic_medication_now)
    :named REQ6_COMPONENT5_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "currently receiving an oral anti-hyperglycemic medication"

;; Exclusion: nonfasting blood glucose level ≥ 200 mg/dL
(assert
(! (not (and patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@nonfasting
             (>= patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl 200)))
    :named REQ6_COMPONENT6_OTHER_REQUIREMENTS)) ;; "nonfasting blood glucose level ≥ 200 milligrams per deciliter"

;; Exclusion: fasting blood glucose level ≥ 126 mg/dL on 2 separate tests
(assert
(! (not (and patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@fasting
             patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl@@measured_on_two_separate_tests
             (>= patient_blood_glucose_level_finding_value_recorded_now_withunit_mg_per_dl 126)))
    :named REQ6_COMPONENT7_OTHER_REQUIREMENTS)) ;; "fasting blood glucose level ≥ 126 milligrams per deciliter on 2 separate tests"

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder of the nervous system (neurological disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system."} ;; "neurological disorder"
(declare-const patient_has_finding_of_epilepsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of epilepsy.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of epilepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of epilepsy.","meaning":"Boolean indicating whether the patient currently has a clinical finding of epilepsy."} ;; "epilepsy"
(declare-const patient_has_finding_of_stroke_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of stroke.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of stroke.","meaning":"Boolean indicating whether the patient currently has a clinical finding of stroke."} ;; "stroke"
(declare-const patient_has_finding_of_severe_head_trauma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of severe head trauma.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of severe head trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of severe head trauma.","meaning":"Boolean indicating whether the patient currently has a clinical finding of severe head trauma."} ;; "severe head trauma"
(declare-const patient_has_finding_of_intellectual_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of intellectual disability (mental retardation).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of intellectual disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intellectual disability.","meaning":"Boolean indicating whether the patient currently has intellectual disability."} ;; "mental retardation"
(declare-const patient_intelligence_quotient_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the patient's current intelligence quotient (IQ) score if available.","when_to_set_to_null":"Set to null if the patient's current IQ score is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current intelligence quotient (IQ) score, measured in standard IQ score units."} ;; "intelligence quotient < 70"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_epilepsy_now
           patient_has_finding_of_stroke_now
           patient_has_finding_of_severe_head_trauma_now)
        patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ7_AUXILIARY0)) ;; "neurological disorder with non-exhaustive examples (epilepsy OR stroke OR severe head trauma)"

;; Qualifier variables imply corresponding stem variables (none present in this requirement)

;; Definition: mental retardation (intellectual disability) is IQ < 70
(assert
(! (= patient_has_finding_of_intellectual_disability_now
     (< patient_intelligence_quotient_value_recorded_now_withunit_score 70))
:named REQ7_AUXILIARY1)) ;; "mental retardation (intelligence quotient < 70)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_disorder_of_nervous_system_now
            patient_has_finding_of_intellectual_disability_now))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a neurological disorder with non-exhaustive examples (epilepsy OR stroke OR severe head trauma)) OR (the patient has mental retardation (intelligence quotient < 70)))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const dosing_interval_for_depot_neuroleptic_injection_in_days Real) ;; {"when_to_set_to_value":"Set to the standard dosing interval in days for the depot neuroleptic injection administered to the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the standard dosing interval in days is for the depot neuroleptic injection administered to the patient.","meaning":"Numeric variable indicating the standard dosing interval, in days, for the depot neuroleptic injection administered to the patient."} ;; "one dosing interval between depot neuroleptic injections"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to an anti-psychotic agent (neuroleptic) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to an anti-psychotic agent (neuroleptic) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to an anti-psychotic agent (neuroleptic).","meaning":"Boolean indicating whether the patient has ever been exposed to an anti-psychotic agent (neuroleptic) in the past."} ;; "neuroleptic"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthehistory@@is_depot_formulation Bool) ;; {"when_to_set_to_true":"Set to true if the anti-psychotic agent (neuroleptic) exposure was specifically to a depot formulation.","when_to_set_to_false":"Set to false if the anti-psychotic agent (neuroleptic) exposure was not to a depot formulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was to a depot formulation.","meaning":"Boolean indicating whether the anti-psychotic agent (neuroleptic) exposure was to a depot formulation."} ;; "depot formulation"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthehistory@@is_injectable_formulation Bool) ;; {"when_to_set_to_true":"Set to true if the anti-psychotic agent (neuroleptic) exposure was specifically to an injectable formulation.","when_to_set_to_false":"Set to false if the anti-psychotic agent (neuroleptic) exposure was not to an injectable formulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was to an injectable formulation.","meaning":"Boolean indicating whether the anti-psychotic agent (neuroleptic) exposure was to an injectable formulation."} ;; "injectable formulation"
(declare-const patient_is_exposed_to_anti_psychotic_agent_inthehistory@@temporalcontext_within_less_than_one_dosing_interval_between_depot_neuroleptic_injections_and_day_0 Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to depot injectable anti-psychotic agent (neuroleptic) occurred within less than one dosing interval between depot neuroleptic injections and day 0.","when_to_set_to_false":"Set to false if the exposure did not occur within less than one dosing interval between depot neuroleptic injections and day 0.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within less than one dosing interval between depot neuroleptic injections and day 0.","meaning":"Boolean indicating whether the exposure occurred within less than one dosing interval between depot neuroleptic injections and day 0."} ;; "within less than one dosing interval between depot neuroleptic injections and day 0"
(declare-const time_since_last_depot_neuroleptic_injection_before_day_0_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the patient's last depot neuroleptic injection and day 0.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have elapsed between the patient's last depot neuroleptic injection and day 0.","meaning":"Numeric variable indicating the number of days between the patient's last depot neuroleptic injection and day 0."} ;; "within less than one dosing interval between depot neuroleptic injections and day 0"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Define the temporal context qualifier in terms of the numeric interval
(assert
(! (= patient_is_exposed_to_anti_psychotic_agent_inthehistory@@temporalcontext_within_less_than_one_dosing_interval_between_depot_neuroleptic_injections_and_day_0
(< time_since_last_depot_neuroleptic_injection_before_day_0_in_days dosing_interval_for_depot_neuroleptic_injection_in_days))
:named REQ8_AUXILIARY0)) ;; "within less than one dosing interval between depot neuroleptic injections and day 0"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_anti_psychotic_agent_inthehistory@@is_depot_formulation
patient_is_exposed_to_anti_psychotic_agent_inthehistory)
:named REQ8_AUXILIARY1)) ;; "depot formulation"

(assert
(! (=> patient_is_exposed_to_anti_psychotic_agent_inthehistory@@is_injectable_formulation
patient_is_exposed_to_anti_psychotic_agent_inthehistory)
:named REQ8_AUXILIARY2)) ;; "injectable formulation"

(assert
(! (=> patient_is_exposed_to_anti_psychotic_agent_inthehistory@@temporalcontext_within_less_than_one_dosing_interval_between_depot_neuroleptic_injections_and_day_0
patient_is_exposed_to_anti_psychotic_agent_inthehistory)
:named REQ8_AUXILIARY3)) ;; "temporal context qualifier implies stem variable"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have been treated with an injectable depot neuroleptic within less than one dosing interval between depot neuroleptic injections and day 0
(assert
(! (not (and patient_is_exposed_to_anti_psychotic_agent_inthehistory@@is_depot_formulation
             patient_is_exposed_to_anti_psychotic_agent_inthehistory@@is_injectable_formulation
             patient_is_exposed_to_anti_psychotic_agent_inthehistory@@temporalcontext_within_less_than_one_dosing_interval_between_depot_neuroleptic_injections_and_day_0))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been treated with an injectable depot neuroleptic within less than one dosing interval between depot neuroleptic injections and day 0."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_undergoing_concurrent_mood_stabilizer_therapy_now_excluding_lithium Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with a mood stabilizer therapy, and the therapy does not include lithium.","when_to_set_to_false":"Set to false if the patient is currently not being treated with any mood stabilizer therapy, or is only being treated with lithium as a mood stabilizer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with a mood stabilizer therapy excluding lithium.","meaning":"Boolean indicating whether the patient is currently being treated with concurrent mood stabilizer therapy, excluding lithium therapy."} ;; "the patient is being treated with concurrent mood stabilizer therapy EXCEPT lithium therapy"
(declare-const patient_is_undergoing_anticonvulsant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with anticonvulsant therapy.","when_to_set_to_false":"Set to false if the patient is currently not being treated with anticonvulsant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with anticonvulsant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticonvulsant therapy."} ;; "the patient is being treated with anticonvulsant therapy"
(declare-const patient_is_undergoing_antipsychotic_drug_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with antipsychotic drug therapy.","when_to_set_to_false":"Set to false if the patient is currently not being treated with antipsychotic drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with antipsychotic drug therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antipsychotic drug therapy."} ;; "the patient is being treated with antipsychotic therapy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_is_undergoing_concurrent_mood_stabilizer_therapy_now_excluding_lithium
            patient_is_undergoing_anticonvulsant_therapy_now
            patient_is_undergoing_antipsychotic_drug_therapy_now))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is being treated with concurrent mood stabilizer therapy EXCEPT lithium therapy) OR (the patient is being treated with anticonvulsant therapy) OR (the patient is being treated with antipsychotic therapy))."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have any psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any psychotic disorder.","meaning":"Boolean indicating whether the patient currently has any psychotic disorder."} ;; "psychotic disorder"
(declare-const patient_has_finding_of_psychotic_disorder_now@@defined_in_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's psychotic disorder is defined according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's psychotic disorder is not defined according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's psychotic disorder is defined according to DSM-IV.","meaning":"Boolean indicating whether the patient's psychotic disorder is defined according to DSM-IV."} ;; "as defined in the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"
(declare-const patient_has_finding_of_delusional_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has delusional disorder.","when_to_set_to_false":"Set to false if the patient currently does not have delusional disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has delusional disorder.","meaning":"Boolean indicating whether the patient currently has delusional disorder."} ;; "delusional disorder"
(declare-const patient_has_finding_of_brief_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has brief psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have brief psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has brief psychotic disorder.","meaning":"Boolean indicating whether the patient currently has brief psychotic disorder."} ;; "brief psychotic disorder"
(declare-const patient_has_finding_of_psychotic_disorder_due_to_general_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychotic disorder due to a general medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have psychotic disorder due to a general medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychotic disorder due to a general medical condition.","meaning":"Boolean indicating whether the patient currently has psychotic disorder due to a general medical condition."} ;; "psychotic disorder due to a general medical condition"
(declare-const patient_has_finding_of_substance_induced_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has substance-induced psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have substance-induced psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has substance-induced psychotic disorder.","meaning":"Boolean indicating whether the patient currently has substance-induced psychotic disorder."} ;; "substance-induced psychotic disorder"
(declare-const patient_has_finding_of_psychotic_disorder_not_otherwise_specified_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychotic disorder not otherwise specified.","when_to_set_to_false":"Set to false if the patient currently does not have psychotic disorder not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychotic disorder not otherwise specified.","meaning":"Boolean indicating whether the patient currently has psychotic disorder not otherwise specified."} ;; "psychotic disorder not otherwise specified"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_delusional_disorder_now
           patient_has_finding_of_brief_psychotic_disorder_now
           patient_has_finding_of_psychotic_disorder_due_to_general_medical_condition_now
           patient_has_finding_of_substance_induced_psychotic_disorder_now
           patient_has_finding_of_psychotic_disorder_not_otherwise_specified_now)
        patient_has_finding_of_psychotic_disorder_now@@defined_in_dsm_iv)
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples ((delusional disorder) OR (brief psychotic disorder) OR (psychotic disorder due to a general medical condition) OR (substance-induced psychotic disorder) OR (psychotic disorder not otherwise specified))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_psychotic_disorder_now@@defined_in_dsm_iv
       patient_has_finding_of_psychotic_disorder_now)
:named REQ10_AUXILIARY1)) ;; "as defined in the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_psychotic_disorder_now@@defined_in_dsm_iv)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other psychotic disorder (as defined in the Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition) with non-exhaustive examples ((delusional disorder) OR (brief psychotic disorder) OR (psychotic disorder due to a general medical condition) OR (substance-induced psychotic disorder) OR (psychotic disorder not otherwise specified))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_dysthymia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dysthymia (dysthymic disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dysthymia (dysthymic disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dysthymia (dysthymic disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of dysthymia (dysthymic disorder)."} ;; "dysthymic disorder"
(declare-const patient_has_diagnosis_of_depressive_disorder_not_otherwise_specified_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of depressive disorder not otherwise specified.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of depressive disorder not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of depressive disorder not otherwise specified.","meaning":"Boolean indicating whether the patient currently has a diagnosis of depressive disorder not otherwise specified."} ;; "depressive disorder not otherwise specified"
(declare-const patient_has_diagnosis_of_bipolar_disorder_not_otherwise_specified_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bipolar disorder not otherwise specified.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bipolar disorder not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bipolar disorder not otherwise specified.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bipolar disorder not otherwise specified."} ;; "bipolar disorder not otherwise specified"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_dysthymia_now)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dysthymic disorder."

(assert
(! (not patient_has_diagnosis_of_depressive_disorder_not_otherwise_specified_now)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has depressive disorder not otherwise specified."

(assert
(! (not patient_has_diagnosis_of_bipolar_disorder_not_otherwise_specified_now)
    :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bipolar disorder not otherwise specified."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_been_enrolled_in_this_study_in_the_past Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously been enrolled in this study at any time in the past.","when_to_set_to_false":"Set to false if the patient has never previously been enrolled in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously been enrolled in this study.","meaning":"Boolean indicating whether the patient has previously been enrolled in this study at any time in the past."} ;; "the patient has previously been enrolled in this study"
(declare-const patient_has_taken_exenatide_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously taken any exenatide-containing product at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never previously taken any exenatide-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever previously taken any exenatide-containing product.","meaning":"Boolean indicating whether the patient has ever previously taken any exenatide-containing product."} ;; "the patient has previously been treated with exenatide"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (or patient_has_been_enrolled_in_this_study_in_the_past
            patient_has_taken_exenatide_containing_product_inthehistory))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has previously been enrolled in this study) OR (the patient has previously been treated with exenatide)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a drug or medicament within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a drug or medicament within the past thirty days.","meaning":"Boolean indicating whether the patient has been exposed to a drug or medicament within the past thirty days."} ;; "has received an experimental drug within thirty days."
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@experimental Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past thirty days is experimental.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past thirty days is not experimental.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient was exposed to within the past thirty days is experimental.","meaning":"Boolean indicating whether the drug or medicament exposure within the past thirty days was to an experimental drug or medicament."} ;; "has received an experimental drug within thirty days."

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@experimental
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ13_AUXILIARY0)) ;; "experimental drug exposure within thirty days""

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast30days@@experimental)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received an experimental drug within thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Montgomery-Åsberg Depression Rating Scale score recorded now, in points.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's Montgomery-Åsberg Depression Rating Scale score recorded now, in points."} ;; "Montgomery-Åsberg Depression Rating Scale score > twenty-four"

(declare-const patient_has_symptoms_of_symptoms_of_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently displaying symptoms of depression.","when_to_set_to_false":"Set to false if the patient is currently not displaying symptoms of depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently displaying symptoms of depression.","meaning":"Boolean indicating whether the patient is currently displaying symptoms of depression."} ;; "depressive symptoms"

(declare-const patient_has_symptoms_of_symptoms_of_depression_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current symptoms of depression are clinically significant.","when_to_set_to_false":"Set to false if the patient's current symptoms of depression are not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current symptoms of depression are clinically significant.","meaning":"Boolean indicating whether the patient's current symptoms of depression are clinically significant."} ;; "clinically significant depressive symptoms"

(declare-const young_mania_rating_scale_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Young Mania Rating Scale score recorded now, in points.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's Young Mania Rating Scale score recorded now, in points."} ;; "Young Mania Rating Scale score > sixteen"

(declare-const patient_has_symptoms_of_mania_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently displaying symptoms of mania.","when_to_set_to_false":"Set to false if the patient is currently not displaying symptoms of mania.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently displaying symptoms of mania.","meaning":"Boolean indicating whether the patient is currently displaying symptoms of mania."} ;; "manic symptoms"

(declare-const patient_has_symptoms_of_mania_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current symptoms of mania are clinically significant.","when_to_set_to_false":"Set to false if the patient's current symptoms of mania are not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current symptoms of mania are clinically significant.","meaning":"Boolean indicating whether the patient's current symptoms of mania are clinically significant."} ;; "clinically significant manic symptoms"

(declare-const patient_meets_dsm_iv_tr_criteria_for_manic_episode_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets DSM-IV-TR criteria for a manic episode.","when_to_set_to_false":"Set to false if the patient currently does not meet DSM-IV-TR criteria for a manic episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets DSM-IV-TR criteria for a manic episode.","meaning":"Boolean indicating whether the patient currently meets DSM-IV-TR criteria for a manic episode."} ;; "meets DSM-IV-TR criteria for a manic episode"

(declare-const patient_meets_dsm_iv_tr_criteria_for_mixed_episode_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets DSM-IV-TR criteria for a mixed episode.","when_to_set_to_false":"Set to false if the patient currently does not meet DSM-IV-TR criteria for a mixed episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets DSM-IV-TR criteria for a mixed episode.","meaning":"Boolean indicating whether the patient currently meets DSM-IV-TR criteria for a mixed episode."} ;; "meets DSM-IV-TR criteria for a mixed episode"

(declare-const patient_meets_dsm_iv_tr_criteria_for_hypomanic_episode_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets DSM-IV-TR criteria for a hypomanic episode.","when_to_set_to_false":"Set to false if the patient currently does not meet DSM-IV-TR criteria for a hypomanic episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets DSM-IV-TR criteria for a hypomanic episode.","meaning":"Boolean indicating whether the patient currently meets DSM-IV-TR criteria for a hypomanic episode."} ;; "meets DSM-IV-TR criteria for a hypomanic episode"

(declare-const patient_meets_dsm_iv_tr_criteria_for_depressive_episode_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets DSM-IV-TR criteria for a depressive episode.","when_to_set_to_false":"Set to false if the patient currently does not meet DSM-IV-TR criteria for a depressive episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets DSM-IV-TR criteria for a depressive episode.","meaning":"Boolean indicating whether the patient currently meets DSM-IV-TR criteria for a depressive episode."} ;; "meets DSM-IV-TR criteria for a depressive episode"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Definition: clinically significant depressive symptoms = Montgomery-Åsberg Depression Rating Scale score > 24
(assert
(! (= patient_has_symptoms_of_symptoms_of_depression_now@@clinically_significant
     (> montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_points 24))
:named REQ14_AUXILIARY0)) ;; "clinically significant depressive symptoms defined as Montgomery-Åsberg Depression Rating Scale score > twenty-four"

;; Qualifier variable implies stem variable (depression)
(assert
(! (=> patient_has_symptoms_of_symptoms_of_depression_now@@clinically_significant
       patient_has_symptoms_of_symptoms_of_depression_now)
:named REQ14_AUXILIARY1)) ;; "clinically significant depressive symptoms"

;; Definition: clinically significant manic symptoms = Young Mania Rating Scale score > 16
(assert
(! (= patient_has_symptoms_of_mania_now@@clinically_significant
     (> young_mania_rating_scale_score_value_recorded_now_withunit_points 16))
:named REQ14_AUXILIARY2)) ;; "clinically significant manic symptoms defined as Young Mania Rating Scale score > sixteen"

;; Qualifier variable implies stem variable (mania)
(assert
(! (=> patient_has_symptoms_of_mania_now@@clinically_significant
       patient_has_symptoms_of_mania_now)
:named REQ14_AUXILIARY3)) ;; "clinically significant manic symptoms"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have any of the following:
;; (1) current clinically significant depressive symptoms
(assert
(! (not patient_has_symptoms_of_symptoms_of_depression_now@@clinically_significant)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is displaying current clinically significant depressive symptoms defined as Montgomery-Åsberg Depression Rating Scale score > twenty-four."

;; (2) current clinically significant manic symptoms
(assert
(! (not patient_has_symptoms_of_mania_now@@clinically_significant)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is displaying current clinically significant manic symptoms defined as Young Mania Rating Scale score > sixteen."

;; (3) currently meets DSM-IV-TR criteria for a manic episode
(assert
(! (not patient_meets_dsm_iv_tr_criteria_for_manic_episode_now)
:named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently meets Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria for a manic episode."

;; (4) currently meets DSM-IV-TR criteria for a mixed episode
(assert
(! (not patient_meets_dsm_iv_tr_criteria_for_mixed_episode_now)
:named REQ14_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently meets Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria for a mixed episode."

;; (5) currently meets DSM-IV-TR criteria for a hypomanic episode
(assert
(! (not patient_meets_dsm_iv_tr_criteria_for_hypomanic_episode_now)
:named REQ14_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently meets Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria for a hypomanic episode."

;; (6) currently meets DSM-IV-TR criteria for a depressive episode
(assert
(! (not patient_meets_dsm_iv_tr_criteria_for_depressive_episode_now)
:named REQ14_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently meets Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition, Text Revision criteria for a depressive episode."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_psychotic_symptom_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured SAPS subscale score for psychotic symptoms if a current value is available.","when_to_set_to_null":"Set to null if no current SAPS subscale score for psychotic symptoms is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current SAPS subscale score for psychotic symptoms."} ;; "psychotic symptoms"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not (> patient_psychotic_symptom_value_recorded_now_withunit_score 2))
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is displaying current clinically significant psychotic symptoms defined as any Scale for the Assessment of Positive Symptoms subscale score > two."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_disorder_of_gallbladder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the gallbladder.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the gallbladder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the gallbladder.","meaning":"Boolean indicating whether the patient currently has a disorder of the gallbladder."} ;; "history of gallbladder disease"
(declare-const patient_has_finding_of_gallstone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gallstones.","when_to_set_to_false":"Set to false if the patient currently does not have gallstones.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gallstones.","meaning":"Boolean indicating whether the patient currently has gallstones."} ;; "history of gallstones"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Non-exhaustive examples imply risk factors for developing pancreatitis
(declare-const patient_has_any_risk_factor_for_developing_pancreatitis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any risk factor for developing pancreatitis, including but not limited to alcohol use, history of gallbladder disease, history of gallstones, diabetes, or family history of pancreatitis.","when_to_set_to_false":"Set to false if the patient does not have any risk factor for developing pancreatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any risk factor for developing pancreatitis.","meaning":"Boolean indicating whether the patient has any risk factor for developing pancreatitis."} ;; "any risk factors for developing pancreatitis"
(assert
(! (=> (or patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now
          patient_has_finding_of_disorder_of_gallbladder_now
          patient_has_finding_of_gallstone_now
          patient_has_diagnosis_of_diabetes_mellitus_inthehistory
          patient_has_finding_of_family_history_of_pancreatitis)
    patient_has_any_risk_factor_for_developing_pancreatitis)
:named REQ16_AUXILIARY0)) ;; "with non-exhaustive examples (alcohol use, history of gallbladder disease, history of gallstones, diabetes, family history of pancreatitis)"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: history of pancreatitis
(assert
(! (not patient_has_diagnosis_of_pancreatitis_inthehistory)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pancreatitis."

;; Exclusion: any risk factors for developing pancreatitis
(assert
(! (not patient_has_any_risk_factor_for_developing_pancreatitis)
:named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any risk factors for developing pancreatitis with non-exhaustive examples (alcohol use, history of gallbladder disease, history of gallstones, diabetes, family history of pancreatitis)."
