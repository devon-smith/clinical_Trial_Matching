;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the cardiovascular system (major cardiovascular disease) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the cardiovascular system (major cardiovascular disease) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the cardiovascular system (major cardiovascular disease).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a disorder of the cardiovascular system (major cardiovascular disease)."} ;; "major cardiovascular disease"

(declare-const patient_has_diagnosis_of_obesity_associated_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with an obesity-associated disorder (serious obesity-related complication) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an obesity-associated disorder (serious obesity-related complication) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an obesity-associated disorder (serious obesity-related complication).","meaning":"Boolean indicating whether the patient has ever been diagnosed with an obesity-associated disorder (serious obesity-related complication)."} ;; "serious obesity-related complication"

(declare-const patient_has_diagnosis_of_obesity_associated_disorder_inthehistory@@assessed_during_history_and_physical_exam Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of obesity-associated disorder was specifically assessed during history and physical exam.","when_to_set_to_false":"Set to false if the diagnosis of obesity-associated disorder was not assessed during history and physical exam.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of obesity-associated disorder was assessed during history and physical exam.","meaning":"Boolean indicating whether the diagnosis of obesity-associated disorder was assessed during history and physical exam."} ;; "as assessed during history and physical exam"

(declare-const patient_has_untreated_illness_relating_to_endocrine_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of untreated illness relating to the endocrine system.","when_to_set_to_false":"Set to false if the patient does not have a history of untreated illness relating to the endocrine system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of untreated illness relating to the endocrine system.","meaning":"Boolean indicating whether the patient has a history of untreated illness relating to the endocrine system."} ;; "untreated illness relating to the endocrine system"

(declare-const patient_has_untreated_illness_relating_to_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of untreated illness relating to the cardiovascular system.","when_to_set_to_false":"Set to false if the patient does not have a history of untreated illness relating to the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of untreated illness relating to the cardiovascular system.","meaning":"Boolean indicating whether the patient has a history of untreated illness relating to the cardiovascular system."} ;; "untreated illness relating to the cardiovascular system"

(declare-const patient_has_major_illness_relating_to_endocrine_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of major illness relating to the endocrine system.","when_to_set_to_false":"Set to false if the patient does not have a history of major illness relating to the endocrine system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of major illness relating to the endocrine system.","meaning":"Boolean indicating whether the patient has a history of major illness relating to the endocrine system."} ;; "major illness relating to the endocrine system"

(declare-const patient_has_major_illness_relating_to_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of major illness relating to the cardiovascular system.","when_to_set_to_false":"Set to false if the patient does not have a history of major illness relating to the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of major illness relating to the cardiovascular system.","meaning":"Boolean indicating whether the patient has a history of major illness relating to the cardiovascular system."} ;; "major illness relating to the cardiovascular system"

(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a hypertensive disorder (hypertension) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a hypertensive disorder (hypertension) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a hypertensive disorder (hypertension)."} ;; "hypertension"

(declare-const patient_has_finding_of_fasting_hyperglycemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of fasting hyperglycemia.","when_to_set_to_false":"Set to false if the patient does not have a history of fasting hyperglycemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of fasting hyperglycemia.","meaning":"Boolean indicating whether the patient has a history of fasting hyperglycemia."} ;; "fasting hyperglycemia"

(declare-const fasting_glucose_value_recorded_inthehistory_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the value of the patient's fasting glucose (mg/dL) recorded in the history.","when_to_set_to_null":"Set to null if the patient's fasting glucose value (mg/dL) in the history is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's fasting glucose level (mg/dL) recorded in the history."} ;; "fasting glucose > 126 mg/dL"

(declare-const patient_has_diagnosis_of_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with diabetes mellitus at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with diabetes mellitus at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with diabetes mellitus.","meaning":"Boolean indicating whether the patient has ever been diagnosed with diabetes mellitus."} ;; "diabetes"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_obesity_associated_disorder_inthehistory@@assessed_during_history_and_physical_exam
       patient_has_diagnosis_of_obesity_associated_disorder_inthehistory)
:named REQ0_AUXILIARY0)) ;; "as assessed during history and physical exam"

;; Hypertension definition: age-, sex-, and height-specific standards are referenced but not encoded here; use diagnosis variable
;; Fasting hyperglycemia consistent with diabetes: fasting glucose > 126 mg/dL
(assert
(! (=> (> fasting_glucose_value_recorded_inthehistory_withunit_mg_per_dl 126)
       patient_has_finding_of_fasting_hyperglycemia_inthehistory)
:named REQ0_AUXILIARY1)) ;; "fasting hyperglycemia consistent with diabetes (fasting glucose > 126 mg/dL)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion 1: history of major cardiovascular disease
(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of major cardiovascular disease."

;; Exclusion 2: history of any other serious obesity-related complication as assessed during history and physical exam, including untreated illness relating to the endocrine system or untreated illness relating to the cardiovascular system or major illness relating to the endocrine system or major illness relating to the cardiovascular system, such as hypertension or fasting hyperglycemia consistent with diabetes
(assert
(! (not
     (or
       patient_has_diagnosis_of_obesity_associated_disorder_inthehistory@@assessed_during_history_and_physical_exam
       patient_has_untreated_illness_relating_to_endocrine_system_inthehistory
       patient_has_untreated_illness_relating_to_cardiovascular_system_inthehistory
       patient_has_major_illness_relating_to_endocrine_system_inthehistory
       patient_has_major_illness_relating_to_cardiovascular_system_inthehistory
       patient_has_diagnosis_of_hypertensive_disorder_inthehistory
       patient_has_finding_of_fasting_hyperglycemia_inthehistory
     )
   )
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of any other serious obesity-related complication as assessed during history and physical exam, including untreated illness relating to the endocrine system or untreated illness relating to the cardiovascular system or major illness relating to the endocrine system or major illness relating to the cardiovascular system, such as hypertension (defined by age-, sex-, and height-specific standards) or fasting hyperglycemia consistent with diabetes (fasting glucose > 126 mg/dL)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_serious_physical_health_problem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of serious physical health problems (major illnesses).","when_to_set_to_false":"Set to false if the patient does not have a history of serious physical health problems (major illnesses).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of serious physical health problems (major illnesses).","meaning":"Boolean indicating whether the patient has a history of serious physical health problems (major illnesses)."} ;; "major illnesses"
(declare-const patient_has_finding_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of kidney disease (renal illness).","when_to_set_to_false":"Set to false if the patient does not have a history of kidney disease (renal illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of kidney disease (renal illness).","meaning":"Boolean indicating whether the patient has a history of kidney disease (renal illness)."} ;; "renal illness"
(declare-const patient_has_finding_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of liver disease (hepatic illness).","when_to_set_to_false":"Set to false if the patient does not have a history of liver disease (hepatic illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of liver disease (hepatic illness).","meaning":"Boolean indicating whether the patient has a history of liver disease (hepatic illness)."} ;; "hepatic illness"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of gastrointestinal tract disorder (gastrointestinal illness).","when_to_set_to_false":"Set to false if the patient does not have a history of gastrointestinal tract disorder (gastrointestinal illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of gastrointestinal tract disorder (gastrointestinal illness).","meaning":"Boolean indicating whether the patient has a history of gastrointestinal tract disorder (gastrointestinal illness)."} ;; "gastrointestinal illness"
(declare-const patient_has_finding_of_disorder_of_endocrine_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of disorder of the endocrine system (endocrinologic illness).","when_to_set_to_false":"Set to false if the patient does not have a history of disorder of the endocrine system (endocrinologic illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of disorder of the endocrine system (endocrinologic illness).","meaning":"Boolean indicating whether the patient has a history of disorder of the endocrine system (endocrinologic illness)."} ;; "endocrinologic illness"
(declare-const patient_has_major_illness_relating_to_endocrine_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of major illness relating to the endocrine system.","when_to_set_to_false":"Set to false if the patient does not have a history of major illness relating to the endocrine system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of major illness relating to the endocrine system.","meaning":"Boolean indicating whether the patient has a history of major illness relating to the endocrine system."} ;; "major illness relating to the endocrine system"
(declare-const patient_has_finding_of_adrenal_cushing_s_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of adrenal Cushing's syndrome.","when_to_set_to_false":"Set to false if the patient does not have a history of adrenal Cushing's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of adrenal Cushing's syndrome.","meaning":"Boolean indicating whether the patient has a history of adrenal Cushing's syndrome."} ;; "Cushing syndrome"
(declare-const patient_has_finding_of_untreated_hyperthyroidism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of untreated hyperthyroidism.","when_to_set_to_false":"Set to false if the patient does not have a history of untreated hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of untreated hyperthyroidism.","meaning":"Boolean indicating whether the patient has a history of untreated hyperthyroidism."} ;; "untreated hyperthyroidism"
(declare-const patient_has_finding_of_untreated_hypothyroidism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of untreated hypothyroidism.","when_to_set_to_false":"Set to false if the patient does not have a history of untreated hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of untreated hypothyroidism.","meaning":"Boolean indicating whether the patient has a history of untreated hypothyroidism."} ;; "untreated hypothyroidism"
(declare-const patient_has_finding_of_hematological_problem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of hematological problem.","when_to_set_to_false":"Set to false if the patient does not have a history of hematological problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hematological problem.","meaning":"Boolean indicating whether the patient has a history of hematological problem."} ;; "hematological problem"
(declare-const patient_has_finding_of_disorder_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of lung disorder (pulmonary disorder).","when_to_set_to_false":"Set to false if the patient does not have a history of lung disorder (pulmonary disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of lung disorder (pulmonary disorder).","meaning":"Boolean indicating whether the patient has a history of lung disorder (pulmonary disorder)."} ;; "pulmonary disorder"
(declare-const patient_has_finding_of_disorder_of_lung_inthehistory@@other_than_asthma_not_requiring_continuous_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of lung disorder (pulmonary disorder) is other than asthma not requiring continuous medication.","when_to_set_to_false":"Set to false if the patient's history of lung disorder (pulmonary disorder) is asthma not requiring continuous medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of lung disorder (pulmonary disorder) is other than asthma not requiring continuous medication.","meaning":"Boolean indicating whether the patient's history of lung disorder (pulmonary disorder) is other than asthma not requiring continuous medication."} ;; "pulmonary disorder (other than asthma not requiring continuous medication)"
(declare-const patient_has_finding_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of asthma.","when_to_set_to_false":"Set to false if the patient does not have a history of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of asthma.","meaning":"Boolean indicating whether the patient has a history of asthma."} ;; "asthma"
(declare-const patient_has_finding_of_asthma_inthehistory@@does_not_require_continuous_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of asthma does not require continuous medication.","when_to_set_to_false":"Set to false if the patient's history of asthma does require continuous medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of asthma requires continuous medication.","meaning":"Boolean indicating whether the patient's history of asthma does not require continuous medication."} ;; "asthma not requiring continuous medication"
(declare-const patient_has_finding_of_non_serious_medical_illness_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of non-serious medical illness.","when_to_set_to_false":"Set to false if the patient does not have a history of non-serious medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of non-serious medical illness.","meaning":"Boolean indicating whether the patient has a history of non-serious medical illness."} ;; "non-serious medical illness"
(declare-const patient_has_finding_of_non_serious_medical_illness_inthehistory@@determined_to_be_exclusionary_on_case_by_case_review Bool) ;; {"when_to_set_to_true":"Set to true if the patient's non-serious medical illness is determined to be exclusionary upon case-by-case review.","when_to_set_to_false":"Set to false if the patient's non-serious medical illness is not determined to be exclusionary upon case-by-case review.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's non-serious medical illness is determined to be exclusionary upon case-by-case review.","meaning":"Boolean indicating whether the patient's non-serious medical illness is determined to be exclusionary upon case-by-case review."} ;; "non-serious medical illness that, upon case-by-case review, is determined to be exclusionary"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term for major illnesses
(assert
(! (=> (or patient_has_finding_of_kidney_disease_inthehistory
          patient_has_finding_of_disease_of_liver_inthehistory
          patient_has_finding_of_disorder_of_gastrointestinal_tract_inthehistory
          patient_has_finding_of_disorder_of_endocrine_system_inthehistory
          patient_has_major_illness_relating_to_endocrine_system_inthehistory
          patient_has_finding_of_hematological_problem_inthehistory
          patient_has_finding_of_disorder_of_lung_inthehistory@@other_than_asthma_not_requiring_continuous_medication)
    patient_has_finding_of_serious_physical_health_problem_inthehistory)
:named REQ1_AUXILIARY0)) ;; "other major illnesses with non-exhaustive examples (renal illness, hepatic illness, gastrointestinal illness, most endocrinologic illness with non-exhaustive examples (Cushing syndrome, untreated hyperthyroidism, untreated hypothyroidism), hematological problem, pulmonary disorder (other than asthma not requiring continuous medication))"

;; Non-exhaustive examples imply umbrella term for most endocrinologic illness
(assert
(! (=> (or patient_has_finding_of_adrenal_cushing_s_syndrome_inthehistory
          patient_has_finding_of_untreated_hyperthyroidism_inthehistory
          patient_has_finding_of_untreated_hypothyroidism_inthehistory)
    patient_has_major_illness_relating_to_endocrine_system_inthehistory)
:named REQ1_AUXILIARY1)) ;; "most endocrinologic illness with non-exhaustive examples (Cushing syndrome, untreated hyperthyroidism, untreated hypothyroidism)"

;; Qualifier variable for pulmonary disorder (other than asthma not requiring continuous medication)
(assert
(! (=> patient_has_finding_of_disorder_of_lung_inthehistory@@other_than_asthma_not_requiring_continuous_medication
       patient_has_finding_of_disorder_of_lung_inthehistory)
:named REQ1_AUXILIARY2)) ;; "pulmonary disorder (other than asthma not requiring continuous medication)"

;; Qualifier variable for asthma not requiring continuous medication
(assert
(! (=> patient_has_finding_of_asthma_inthehistory@@does_not_require_continuous_medication
       patient_has_finding_of_asthma_inthehistory)
:named REQ1_AUXILIARY3)) ;; "asthma not requiring continuous medication"

;; Qualifier variable for non-serious medical illness determined to be exclusionary
(assert
(! (=> patient_has_finding_of_non_serious_medical_illness_inthehistory@@determined_to_be_exclusionary_on_case_by_case_review
       patient_has_finding_of_non_serious_medical_illness_inthehistory)
:named REQ1_AUXILIARY4)) ;; "non-serious medical illness that, upon case-by-case review, is determined to be exclusionary"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have other major illnesses (as defined by umbrella term)
(assert
(! (not patient_has_finding_of_serious_physical_health_problem_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other major illnesses with non-exhaustive examples..."

;; Exclusion: patient must NOT have non-serious medical illness determined to be exclusionary
(assert
(! (not patient_has_finding_of_non_serious_medical_illness_inthehistory@@determined_to_be_exclusionary_on_case_by_case_review)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-serious medical illness that, upon case-by-case review, is determined to be exclusionary."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_regularly_uses_medication_known_to_affect_body_weight_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient regularly uses any medication known to affect body weight at any time in the history.","when_to_set_to_false":"Set to false if the patient does not regularly use any medication known to affect body weight at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient regularly uses any medication known to affect body weight at any time in the history.","meaning":"Boolean indicating whether the patient regularly uses any medication known to affect body weight at any time in the history."} ;; "The patient regularly uses any medication known to affect body weight."

(declare-const patient_regularly_uses_medication_known_to_affect_eating_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient regularly uses any medication known to affect eating behavior at any time in the history.","when_to_set_to_false":"Set to false if the patient does not regularly use any medication known to affect eating behavior at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient regularly uses any medication known to affect eating behavior at any time in the history.","meaning":"Boolean indicating whether the patient regularly uses any medication known to affect eating behavior at any time in the history."} ;; "The patient regularly uses any medication known to affect eating behavior."

(declare-const patient_has_diagnosis_of_attention_deficit_hyperactivity_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of attention deficit hyperactivity disorder (ADHD) at any time in the history.","when_to_set_to_false":"Set to false if the patient does not have such a diagnosis documented at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of ADHD in the history.","meaning":"Boolean indicating whether the patient has a diagnosis of attention deficit hyperactivity disorder (ADHD) at any time in the history."} ;; "many medications prescribed for attention deficit hyperactivity disorder"

(declare-const patient_uses_medication_for_non_serious_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient uses medication for a non-serious condition at any time in the history.","when_to_set_to_false":"Set to false if the patient does not use medication for a non-serious condition at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient uses medication for a non-serious condition at any time in the history.","meaning":"Boolean indicating whether the patient uses medication for a non-serious condition at any time in the history."} ;; "The patient uses medication for non-serious condition"

(declare-const patient_has_finding_of_non_serious_medical_illness_inthehistory@@determined_to_be_exclusionary_on_case_by_case_review Bool) ;; {"when_to_set_to_true":"Set to true if the patient's non-serious medical illness is determined to be exclusionary upon case-by-case review.","when_to_set_to_false":"Set to false if the patient's non-serious medical illness is not determined to be exclusionary upon case-by-case review.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's non-serious medical illness is determined to be exclusionary upon case-by-case review.","meaning":"Boolean indicating whether the patient's non-serious medical illness is determined to be exclusionary upon case-by-case review."} ;; "non-serious medical illness that, upon case-by-case review, is determined to be exclusionary"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples: many medications prescribed for ADHD may affect eating behavior, but other medications may also qualify.
(assert
(! (=> patient_has_diagnosis_of_attention_deficit_hyperactivity_disorder_inthehistory
patient_regularly_uses_medication_known_to_affect_eating_behavior_inthehistory)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (many medications prescribed for attention deficit hyperactivity disorder)"

;; Medication for non-serious condition is exclusionary only if determined so on case-by-case review.
(assert
(! (=> patient_has_finding_of_non_serious_medical_illness_inthehistory@@determined_to_be_exclusionary_on_case_by_case_review
patient_uses_medication_for_non_serious_condition_inthehistory)
:named REQ2_AUXILIARY1)) ;; "medication for non-serious condition that, upon case-by-case review, is determined to be exclusionary"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_regularly_uses_medication_known_to_affect_body_weight_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient regularly uses any medication known to affect body weight."

(assert
(! (not patient_regularly_uses_medication_known_to_affect_eating_behavior_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient regularly uses any medication known to affect eating behavior with non-exhaustive examples (many medications prescribed for attention deficit hyperactivity disorder)."

(assert
(! (not patient_uses_medication_for_non_serious_condition_inthehistory)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses medication for non-serious condition that, upon case-by-case review, is determined to be exclusionary."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be pregnant at the present time.","when_to_set_to_false":"Set to false if the patient is confirmed not to be pregnant at the present time.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is currently pregnant"
(declare-const patient_is_pregnant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient has ever been pregnant in the past.","when_to_set_to_false":"Set to false if there is documented evidence that the patient has never been pregnant in the past.","when_to_set_to_null":"Set to null if the patient's history of pregnancy is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient has ever been pregnant in the past."} ;; "the patient has a history of pregnancy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently pregnant."

(assert
(! (not patient_is_pregnant_inthehistory)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pregnancy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_tobacco_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to tobacco product (i.e., currently uses tobacco product).","when_to_set_to_false":"Set to false if the patient is currently not exposed to tobacco product (i.e., does not currently use tobacco product).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to tobacco product.","meaning":"Boolean indicating whether the patient is currently exposed to tobacco product as a substance."} ;; "the patient currently and regularly uses tobacco product"
(declare-const patient_is_exposed_to_tobacco_product_now@@regularly_uses Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to tobacco product and this exposure is regular (the patient regularly uses tobacco product).","when_to_set_to_false":"Set to false if the patient is currently exposed to tobacco product but this exposure is not regular, or if the patient is not currently exposed to tobacco product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to tobacco product is regular.","meaning":"Boolean indicating whether the patient's current exposure to tobacco product is regular (regular use)."} ;; "the patient currently and regularly uses tobacco product"
(declare-const patient_is_exposed_to_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alcohol (i.e., currently uses alcohol).","when_to_set_to_false":"Set to false if the patient is currently not exposed to alcohol (i.e., does not currently use alcohol).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to alcohol.","meaning":"Boolean indicating whether the patient is currently exposed to alcohol as a substance."} ;; "the patient currently and regularly uses alcohol"
(declare-const patient_is_exposed_to_alcohol_now@@regularly_uses Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alcohol and this exposure is regular (the patient regularly uses alcohol).","when_to_set_to_false":"Set to false if the patient is currently exposed to alcohol but this exposure is not regular, or if the patient is not currently exposed to alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to alcohol is regular.","meaning":"Boolean indicating whether the patient's current exposure to alcohol is regular (regular use)."} ;; "the patient currently and regularly uses alcohol"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_tobacco_product_now@@regularly_uses
      patient_is_exposed_to_tobacco_product_now)
    :named REQ4_AUXILIARY0)) ;; "the patient currently and regularly uses tobacco product"

(assert
(! (=> patient_is_exposed_to_alcohol_now@@regularly_uses
      patient_is_exposed_to_alcohol_now)
    :named REQ4_AUXILIARY1)) ;; "the patient currently and regularly uses alcohol"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_exposed_to_tobacco_product_now@@regularly_uses)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently and regularly uses tobacco product."

(assert
(! (not patient_is_exposed_to_alcohol_now@@regularly_uses)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently and regularly uses alcohol."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_body_weight_value_recorded_3months_ago_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight was recorded approximately three months ago in kilograms.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight recorded approximately three months ago, in kilograms."} ;; "body weight recorded approximately three months ago"
(declare-const patient_body_weight_value_recorded_inthepast3months_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight was recorded during the past three months in kilograms.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's body weight recorded during the past three months, in kilograms."} ;; "body weight recorded during the past three months"
(declare-const patient_has_finding_of_weight_decreased_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a reduction in body weight during the past three months.","when_to_set_to_false":"Set to false if the patient has not had a reduction in body weight during the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a reduction in body weight during the past three months.","meaning":"Boolean indicating whether the patient has had a reduction in body weight during the past three months."} ;; "reduction in body weight during the past three months"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: significant reduction in body weight during the past three months, for any reason, exceeding 5% of body weight
(assert
(! (= patient_has_finding_of_weight_decreased_inthepast3months
    (and
      (< patient_body_weight_value_recorded_inthepast3months_withunit_kg
         (* patient_body_weight_value_recorded_3months_ago_withunit_kg 0.95))
      (< patient_body_weight_value_recorded_inthepast3months_withunit_kg
         patient_body_weight_value_recorded_3months_ago_withunit_kg)))
:named REQ5_AUXILIARY0)) ;; "significant reduction in body weight during the past three months, for any reason, exceeding 5% of body weight"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_weight_decreased_inthepast3months)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a significant reduction in body weight during the past three months, for any reason, exceeding 5% of body weight."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of traumatic and/or non-traumatic brain injury at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of traumatic and/or non-traumatic brain injury at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of traumatic and/or non-traumatic brain injury.","meaning":"Boolean indicating whether the patient has any history of traumatic and/or non-traumatic brain injury."} ;; "history of significant brain injury"

(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory@@may_considerably_influence_performance_on_neurocognitive_measure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of traumatic and/or non-traumatic brain injury may considerably influence performance on neurocognitive measures.","when_to_set_to_false":"Set to false if the patient's history of traumatic and/or non-traumatic brain injury does not or is not expected to considerably influence performance on neurocognitive measures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the brain injury may considerably influence neurocognitive performance.","meaning":"Boolean indicating whether the patient's history of brain injury may considerably influence neurocognitive performance."} ;; "history of recent brain injury that may considerably influence performance on neurocognitive measure"

(declare-const patient_has_finding_of_loss_of_consciousness_inthehistory@@associated_with_head_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of loss of consciousness was associated with head injury.","when_to_set_to_false":"Set to false if the patient's history of loss of consciousness was not associated with head injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the loss of consciousness was associated with head injury.","meaning":"Boolean indicating whether the patient's history of loss of consciousness was associated with head injury."} ;; "loss of consciousness ... associated with head injury"

(declare-const patient_has_finding_of_loss_of_consciousness_inthehistory@@duration_greater_than_or_equal_to_30_minutes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of loss of consciousness lasted greater than or equal to 30 minutes.","when_to_set_to_false":"Set to false if the patient's history of loss of consciousness lasted less than 30 minutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the loss of consciousness lasted at least 30 minutes.","meaning":"Boolean indicating whether the patient's history of loss of consciousness lasted at least 30 minutes."} ;; "loss of consciousness greater than or equal to 30 minutes"

(declare-const patient_has_finding_of_amnesia_inthehistory@@associated_with_head_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of amnesia was associated with head injury.","when_to_set_to_false":"Set to false if the patient's history of amnesia was not associated with head injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the amnesia was associated with head injury.","meaning":"Boolean indicating whether the patient's history of amnesia was associated with head injury."} ;; "memory loss associated with head injury"

(declare-const patient_has_history_of_hospitalization_inthehistory@@associated_with_head_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of hospitalization at any time in the past that was associated with head injury.","when_to_set_to_false":"Set to false if the patient has no documented history of hospitalization at any time in the past associated with head injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of hospitalization associated with head injury.","meaning":"Boolean indicating whether the patient has any history of hospitalization associated with head injury."} ;; "history of hospitalization associated with head injury"

(declare-const patient_concussion_injury_of_brain_value_recorded_inthepast1years_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of concussions (brain injuries) the patient has had within the past 1 year.","when_to_set_to_null":"Set to null if the number of concussions within the past 1 year is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of concussions the patient has had within the past 1 year."} ;; "greater than or equal to 2 concussion within the last year"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of significant brain injury."

(assert
(! (not patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory@@may_considerably_influence_performance_on_neurocognitive_measure)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of recent brain injury that may considerably influence performance on neurocognitive measure."

(assert
(! (not (and patient_has_finding_of_loss_of_consciousness_inthehistory@@associated_with_head_injury
             patient_has_finding_of_loss_of_consciousness_inthehistory@@duration_greater_than_or_equal_to_30_minutes))
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of loss of consciousness greater than or equal to 30 minutes associated with head injury."

(assert
(! (not patient_has_finding_of_amnesia_inthehistory@@associated_with_head_injury)
    :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of memory loss associated with head injury."

(assert
(! (not patient_has_history_of_hospitalization_inthehistory@@associated_with_head_injury)
    :named REQ6_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of hospitalization associated with head injury."

(assert
(! (not (>= patient_concussion_injury_of_brain_value_recorded_inthepast1years_withunit_count 2))
    :named REQ6_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has greater than or equal to 2 concussion within the last year."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder."} ;; "psychiatric disorder"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@significant_full_threshold_based_on_dsm_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of mental disorder is significant, full-threshold, and based on DSM criteria.","when_to_set_to_false":"Set to false if the patient's current diagnosis of mental disorder is not significant, not full-threshold, or not based on DSM criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is significant, full-threshold, and based on DSM criteria.","meaning":"Boolean indicating whether the patient's current diagnosis of mental disorder is significant, full-threshold, and based on DSM criteria."} ;; "significant, full-threshold psychiatric disorder based on Diagnostic and Statistical Manual of Mental Disorders criteria"
(declare-const patient_has_diagnosis_of_schizophrenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of schizophrenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of schizophrenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of schizophrenia."} ;; "schizophrenia"
(declare-const patient_has_diagnosis_of_bipolar_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bipolar disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bipolar disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bipolar disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bipolar disorder."} ;; "bipolar disorder"
(declare-const patient_has_diagnosis_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has a diagnosis of alcohol abuse."} ;; "alcohol abuse"
(declare-const patient_has_diagnosis_of_substance_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of substance abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of substance abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of substance abuse.","meaning":"Boolean indicating whether the patient currently has a diagnosis of substance abuse."} ;; "substance abuse"
(declare-const patient_has_diagnosis_of_substance_abuse_now@@significant_full_threshold_based_on_dsm_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of substance abuse is significant, full-threshold, and based on DSM criteria.","when_to_set_to_false":"Set to false if the patient's current diagnosis of substance abuse is not significant, not full-threshold, or not based on DSM criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is significant, full-threshold, and based on DSM criteria.","meaning":"Boolean indicating whether the patient's current diagnosis of substance abuse is significant, full-threshold, and based on DSM criteria."} ;; "substance abuse (significant, full-threshold, DSM criteria)"
(declare-const patient_has_diagnosis_of_anorexia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of anorexia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of anorexia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of anorexia nervosa.","meaning":"Boolean indicating whether the patient currently has a diagnosis of anorexia nervosa."} ;; "anorexia nervosa"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bulimia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bulimia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bulimia nervosa.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bulimia nervosa."} ;; "bulimia nervosa"
(declare-const patient_has_diagnosis_of_disorder_that_impedes_competence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder that, in the opinion of the investigators, would impede competence.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder that, in the opinion of the investigators, would impede competence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder that, in the opinion of the investigators, would impede competence.","meaning":"Boolean indicating whether the patient currently has any disorder that, in the opinion of the investigators, would impede competence."} ;; "any disorder that, in the opinion of the investigators, would impede competence"
(declare-const patient_has_diagnosis_of_disorder_that_impedes_compliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder that, in the opinion of the investigators, would impede compliance.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder that, in the opinion of the investigators, would impede compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder that, in the opinion of the investigators, would impede compliance.","meaning":"Boolean indicating whether the patient currently has any disorder that, in the opinion of the investigators, would impede compliance."} ;; "any disorder that, in the opinion of the investigators, would impede compliance"
(declare-const patient_has_diagnosis_of_disorder_that_possibly_hinders_study_completion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder that, in the opinion of the investigators, would possibly hinder completion of the study.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder that, in the opinion of the investigators, would possibly hinder completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder that, in the opinion of the investigators, would possibly hinder completion of the study.","meaning":"Boolean indicating whether the patient currently has any disorder that, in the opinion of the investigators, would possibly hinder completion of the study."} ;; "any disorder that, in the opinion of the investigators, would possibly hinder completion of the study"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@sub_threshold_not_meeting_dsm_threshold_but_impairing_or_distressing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of mental disorder is sub-threshold (does not meet DSM threshold) but is significantly impairing or distressing.","when_to_set_to_false":"Set to false if the patient's current diagnosis of mental disorder is not sub-threshold, or is not significantly impairing or distressing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is sub-threshold and significantly impairing or distressing.","meaning":"Boolean indicating whether the patient's current diagnosis of mental disorder is sub-threshold (does not meet DSM threshold) but is significantly impairing or distressing."} ;; "sub-threshold psychiatric disorder (symptom that does not meet diagnostic threshold based on DSM criteria for mental disorder, but which is nevertheless significantly impairing or distressing)"
(declare-const patient_has_diagnosis_of_mental_disorder_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient develops a diagnosis of mental disorder at any follow-up assessment during the study.","when_to_set_to_false":"Set to false if the patient does not develop a diagnosis of mental disorder at any follow-up assessment during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient develops a diagnosis of mental disorder at any follow-up assessment during the study.","meaning":"Boolean indicating whether the patient develops a diagnosis of mental disorder in the future."} ;; "psychiatric disorder at any follow-up assessment during the study"
(declare-const patient_has_diagnosis_of_mental_disorder_inthefuture@@at_any_follow_up_assessment_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient develops a diagnosis of mental disorder at any follow-up assessment during the study.","when_to_set_to_false":"Set to false if the patient does not develop a diagnosis of mental disorder at any follow-up assessment during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient develops a diagnosis of mental disorder at any follow-up assessment during the study.","meaning":"Boolean indicating whether the patient develops a diagnosis of mental disorder at any follow-up assessment during the study."} ;; "psychiatric disorder at any follow-up assessment during the study"
(declare-const patient_has_symptoms_of_psychiatric_symptom_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient develops symptoms of psychiatric symptom at any follow-up assessment during the study.","when_to_set_to_false":"Set to false if the patient does not develop symptoms of psychiatric symptom at any follow-up assessment during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient develops symptoms of psychiatric symptom at any follow-up assessment during the study.","meaning":"Boolean indicating whether the patient develops symptoms of psychiatric symptom in the future."} ;; "significant psychiatric symptom at any follow-up assessment during the study"
(declare-const patient_has_symptoms_of_psychiatric_symptom_inthefuture@@at_any_follow_up_assessment_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient develops symptoms of psychiatric symptom at any follow-up assessment during the study.","when_to_set_to_false":"Set to false if the patient does not develop symptoms of psychiatric symptom at any follow-up assessment during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient develops symptoms of psychiatric symptom at any follow-up assessment during the study.","meaning":"Boolean indicating whether the patient develops symptoms of psychiatric symptom at any follow-up assessment during the study."} ;; "significant psychiatric symptom at any follow-up assessment during the study"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_schizophrenia_now
          patient_has_diagnosis_of_bipolar_disorder_now
          patient_has_diagnosis_of_alcohol_abuse_now
          patient_has_diagnosis_of_substance_abuse_now@@significant_full_threshold_based_on_dsm_criteria
          patient_has_diagnosis_of_anorexia_nervosa_now
          patient_has_diagnosis_of_bulimia_nervosa_now)
    patient_has_diagnosis_of_mental_disorder_now@@significant_full_threshold_based_on_dsm_criteria)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (schizophrenia, bipolar disorder, alcohol abuse, substance abuse, anorexia nervosa, bulimia nervosa)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@significant_full_threshold_based_on_dsm_criteria
    patient_has_diagnosis_of_mental_disorder_now)
:named REQ7_AUXILIARY1)) ;; "significant, full-threshold psychiatric disorder based on DSM criteria"

(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@sub_threshold_not_meeting_dsm_threshold_but_impairing_or_distressing
    patient_has_diagnosis_of_mental_disorder_now)
:named REQ7_AUXILIARY2)) ;; "sub-threshold psychiatric disorder"

(assert
(! (=> patient_has_diagnosis_of_substance_abuse_now@@significant_full_threshold_based_on_dsm_criteria
    patient_has_diagnosis_of_substance_abuse_now)
:named REQ7_AUXILIARY3)) ;; "substance abuse (significant, full-threshold, DSM criteria)"

(assert
(! (=> patient_has_diagnosis_of_mental_disorder_inthefuture@@at_any_follow_up_assessment_during_study
    patient_has_diagnosis_of_mental_disorder_inthefuture)
:named REQ7_AUXILIARY4)) ;; "psychiatric disorder at any follow-up assessment during the study"

(assert
(! (=> patient_has_symptoms_of_psychiatric_symptom_inthefuture@@at_any_follow_up_assessment_during_study
    patient_has_symptoms_of_psychiatric_symptom_inthefuture)
:named REQ7_AUXILIARY5)) ;; "significant psychiatric symptom at any follow-up assessment during the study"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have any significant, full-threshold psychiatric disorder (DSM criteria)
(assert
(! (not patient_has_diagnosis_of_mental_disorder_now@@significant_full_threshold_based_on_dsm_criteria)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any significant, full-threshold psychiatric disorder based on DSM criteria..."

;; Exclusion: patient must NOT have any disorder that, in the opinion of the investigators, would impede competence
(assert
(! (not patient_has_diagnosis_of_disorder_that_impedes_competence_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disorder that, in the opinion of the investigators, would impede competence."

;; Exclusion: patient must NOT have any disorder that, in the opinion of the investigators, would impede compliance
(assert
(! (not patient_has_diagnosis_of_disorder_that_impedes_compliance_now)
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disorder that, in the opinion of the investigators, would impede compliance."

;; Exclusion: patient must NOT have any disorder that, in the opinion of the investigators, would possibly hinder completion of the study
(assert
(! (not patient_has_diagnosis_of_disorder_that_possibly_hinders_study_completion_now)
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any disorder that, in the opinion of the investigators, would possibly hinder completion of the study."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const parent_has_diagnosis_of_disorder_that_impedes_compliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent currently has any condition that, in the opinion of the investigators, would impede compliance.","when_to_set_to_false":"Set to false if the patient's parent currently does not have any condition that, in the opinion of the investigators, would impede compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent currently has any condition that, in the opinion of the investigators, would impede compliance.","meaning":"Boolean indicating whether the patient's parent currently has any condition that, in the opinion of the investigators, would impede compliance."} ;; "the patient's parent has any other condition that, in the opinion of the investigators, would impede compliance."
(declare-const parent_has_diagnosis_of_disorder_that_possibly_hinders_study_completion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent currently has any condition that, in the opinion of the investigators, would possibly hinder completion of the study.","when_to_set_to_false":"Set to false if the patient's parent currently does not have any condition that, in the opinion of the investigators, would possibly hinder completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent currently has any condition that, in the opinion of the investigators, would possibly hinder completion of the study.","meaning":"Boolean indicating whether the patient's parent currently has any condition that, in the opinion of the investigators, would possibly hinder completion of the study."} ;; "the patient's parent has any other condition that, in the opinion of the investigators, would possibly hinder completion of the study."
(declare-const guardian_has_diagnosis_of_disorder_that_impedes_compliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's guardian currently has any condition that, in the opinion of the investigators, would impede compliance.","when_to_set_to_false":"Set to false if the patient's guardian currently does not have any condition that, in the opinion of the investigators, would impede compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's guardian currently has any condition that, in the opinion of the investigators, would impede compliance.","meaning":"Boolean indicating whether the patient's guardian currently has any condition that, in the opinion of the investigators, would impede compliance."} ;; "the patient's guardian has any other condition that, in the opinion of the investigators, would impede compliance."
(declare-const guardian_has_diagnosis_of_disorder_that_possibly_hinders_study_completion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's guardian currently has any condition that, in the opinion of the investigators, would possibly hinder completion of the study.","when_to_set_to_false":"Set to false if the patient's guardian currently does not have any condition that, in the opinion of the investigators, would possibly hinder completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's guardian currently has any condition that, in the opinion of the investigators, would possibly hinder completion of the study.","meaning":"Boolean indicating whether the patient's guardian currently has any condition that, in the opinion of the investigators, would possibly hinder completion of the study."} ;; "the patient's guardian has any other condition that, in the opinion of the investigators, would possibly hinder completion of the study."
(declare-const patient_has_diagnosis_of_developmental_academic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a developmental academic disorder (learning disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a developmental academic disorder (learning disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a developmental academic disorder (learning disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of a developmental academic disorder (learning disorder)."} ;; "significant learning disorder"
(declare-const patient_has_diagnosis_of_developmental_academic_disorder_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of developmental academic disorder (learning disorder) is significant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of developmental academic disorder (learning disorder) is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of developmental academic disorder (learning disorder) is significant.","meaning":"Boolean indicating whether the patient's current diagnosis of developmental academic disorder (learning disorder) is significant."} ;; "significant learning disorder"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive example: significant learning disorder implies possibly hinders study completion
(assert
(! (=> patient_has_diagnosis_of_developmental_academic_disorder_now@@is_significant
     patient_has_diagnosis_of_disorder_that_possibly_hinders_study_completion_now)
:named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (significant learning disorder)"

;; Qualifier variable implies stem variable for learning disorder
(assert
(! (=> patient_has_diagnosis_of_developmental_academic_disorder_now@@is_significant
     patient_has_diagnosis_of_developmental_academic_disorder_now)
:named REQ8_AUXILIARY1)) ;; "significant learning disorder"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_that_impedes_compliance_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other condition that, in the opinion of the investigators, would impede compliance."

(assert
(! (not patient_has_diagnosis_of_disorder_that_possibly_hinders_study_completion_now)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other condition that, in the opinion of the investigators, would possibly hinder completion of the study with non-exhaustive examples (significant learning disorder)."

(assert
(! (not parent_has_diagnosis_of_disorder_that_impedes_compliance_now)
    :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's parent has any other condition that, in the opinion of the investigators, would impede compliance."

(assert
(! (not parent_has_diagnosis_of_disorder_that_possibly_hinders_study_completion_now)
    :named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's parent has any other condition that, in the opinion of the investigators, would possibly hinder completion of the study."

(assert
(! (not guardian_has_diagnosis_of_disorder_that_impedes_compliance_now)
    :named REQ8_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's guardian has any other condition that, in the opinion of the investigators, would impede compliance."

(assert
(! (not guardian_has_diagnosis_of_disorder_that_possibly_hinders_study_completion_now)
    :named REQ8_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's guardian has any other condition that, in the opinion of the investigators, would possibly hinder completion of the study."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_inflammatory_bowel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of inflammatory bowel disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of inflammatory bowel disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of inflammatory bowel disease."} ;; "the patient has a diagnosis of inflammatory bowel disease"

(declare-const patient_has_finding_of_ulcerative_colitis_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of ulcerative colitis.","when_to_set_to_false":"Set to false if the patient does not have a history of ulcerative colitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of ulcerative colitis.","meaning":"Boolean indicating whether the patient has a history of ulcerative colitis."} ;; "ulcerative colitis"

(declare-const patient_has_finding_of_crohns_disease_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of Crohn's disease.","when_to_set_to_false":"Set to false if the patient does not have a history of Crohn's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of Crohn's disease.","meaning":"Boolean indicating whether the patient has a history of Crohn's disease."} ;; "Crohn's disease"

(declare-const patient_has_finding_of_celiac_sprue_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of celiac sprue.","when_to_set_to_false":"Set to false if the patient does not have a history of celiac sprue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of celiac sprue.","meaning":"Boolean indicating whether the patient has a history of celiac sprue."} ;; "celiac sprue"

(declare-const patient_has_finding_of_irritable_bowel_syndrome_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of irritable bowel syndrome.","when_to_set_to_false":"Set to false if the patient does not have a history of irritable bowel syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of irritable bowel syndrome.","meaning":"Boolean indicating whether the patient has a history of irritable bowel syndrome."} ;; "irritable bowel syndrome"

(declare-const patient_has_finding_of_other_inflammatory_disorder_of_intestine_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of other inflammatory disorder of the intestine.","when_to_set_to_false":"Set to false if the patient does not have a history of other inflammatory disorder of the intestine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of other inflammatory disorder of the intestine.","meaning":"Boolean indicating whether the patient has a history of other inflammatory disorder of the intestine."} ;; "other inflammatory disorder of the intestine"

(declare-const patient_has_finding_of_diarrhea_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had diarrhea at any time within the 1 week prior to the reference event (sampling).","when_to_set_to_false":"Set to false if the patient has not had diarrhea at any time within the 1 week prior to the reference event (sampling).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had diarrhea within the 1 week prior to the reference event (sampling).","meaning":"Boolean indicating whether the patient has had diarrhea within the 1 week prior to sampling."} ;; "the patient has had diarrhea within 1 week prior to sampling"

(declare-const patient_has_used_antibiotic_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any antibiotic at any time within the 4 weeks prior to the reference event (sampling).","when_to_set_to_false":"Set to false if the patient has not used any antibiotic at any time within the 4 weeks prior to the reference event (sampling).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any antibiotic within the 4 weeks prior to the reference event (sampling).","meaning":"Boolean indicating whether the patient has used any antibiotic within the 4 weeks prior to sampling."} ;; "the patient has used antibiotic within 4 weeks prior to sampling"

(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of gastrointestinal tract disorder (gastrointestinal illness).","when_to_set_to_false":"Set to false if the patient does not have a history of gastrointestinal tract disorder (gastrointestinal illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of gastrointestinal tract disorder (gastrointestinal illness).","meaning":"Boolean indicating whether the patient has a history of gastrointestinal tract disorder (gastrointestinal illness)."} ;; "gastrointestinal illness"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term (history of inflammatory bowel disease)
(assert
(! (=> (or patient_has_finding_of_ulcerative_colitis_in_the_history
          patient_has_finding_of_crohns_disease_in_the_history
          patient_has_finding_of_celiac_sprue_in_the_history
          patient_has_finding_of_irritable_bowel_syndrome_in_the_history
          patient_has_finding_of_other_inflammatory_disorder_of_intestine_in_the_history)
    patient_has_finding_of_disorder_of_gastrointestinal_tract_inthehistory)
:named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (ulcerative colitis, Crohn's disease, celiac sprue, irritable bowel syndrome, other inflammatory disorder of the intestine)"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have any of the following:
(assert
(! (not patient_has_finding_of_inflammatory_bowel_disease_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a diagnosis of inflammatory bowel disease"

(assert
(! (not patient_has_finding_of_disorder_of_gastrointestinal_tract_inthehistory)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of inflammatory bowel disease with non-exhaustive examples (ulcerative colitis, Crohn's disease, celiac sprue, irritable bowel syndrome, other inflammatory disorder of the intestine)"

(assert
(! (not patient_has_finding_of_diarrhea_inthepast1weeks)
:named REQ9_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has had diarrhea within 1 week prior to sampling"

(assert
(! (not patient_has_used_antibiotic_inthepast4weeks)
:named REQ9_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has used antibiotic within 4 weeks prior to sampling"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patients_autonomic_nervous_system_function_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's autonomic nervous system function is currently abnormal.","when_to_set_to_false":"Set to false if the patient's autonomic nervous system function is currently normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's autonomic nervous system function is currently abnormal.","meaning":"Boolean indicating whether the patient's autonomic nervous system function is currently abnormal."} ;; "autonomic functioning"
(declare-const patients_endocrine_function_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's endocrine function is currently abnormal.","when_to_set_to_false":"Set to false if the patient's endocrine function is currently normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's endocrine function is currently abnormal.","meaning":"Boolean indicating whether the patient's endocrine function is currently abnormal."} ;; "endocrine functioning"
(declare-const patient_is_exposed_to_alpha_adrenergic_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alpha adrenergic receptor antagonists (alpha blockers).","when_to_set_to_false":"Set to false if the patient is currently not exposed to alpha adrenergic receptor antagonists.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to alpha adrenergic receptor antagonists.","meaning":"Boolean indicating whether the patient is currently exposed to alpha adrenergic receptor antagonists."} ;; "alpha blocker"
(declare-const patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to beta adrenergic receptor antagonists (beta blockers).","when_to_set_to_false":"Set to false if the patient is currently not exposed to beta adrenergic receptor antagonists.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to beta adrenergic receptor antagonists.","meaning":"Boolean indicating whether the patient is currently exposed to beta adrenergic receptor antagonists."} ;; "beta blocker"
(declare-const patient_has_finding_of_oral_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking oral contraception.","when_to_set_to_false":"Set to false if the patient is currently not taking oral contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking oral contraception.","meaning":"Boolean indicating whether the patient is currently taking oral contraception."} ;; "oral contraceptive"
(declare-const patient_is_exposed_to_prescription_pain_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to prescription pain medication.","when_to_set_to_false":"Set to false if the patient is currently not exposed to prescription pain medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to prescription pain medication.","meaning":"Boolean indicating whether the patient is currently exposed to prescription pain medication."} ;; "prescription pain medication"
(declare-const patient_regularly_uses_medication_that_could_influence_autonomic_functioning_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient regularly uses medication that could influence autonomic functioning at the present time.","when_to_set_to_false":"Set to false if the patient does not regularly use medication that could influence autonomic functioning at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient regularly uses medication that could influence autonomic functioning at the present time.","meaning":"Boolean indicating whether the patient regularly uses medication that could influence autonomic functioning at the present time."} ;; "regularly uses medication that could influence autonomic functioning"
(declare-const patient_regularly_uses_medication_that_could_influence_endocrine_functioning_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient regularly uses medication that could influence endocrine functioning at the present time.","when_to_set_to_false":"Set to false if the patient does not regularly use medication that could influence endocrine functioning at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient regularly uses medication that could influence endocrine functioning at the present time.","meaning":"Boolean indicating whether the patient regularly uses medication that could influence endocrine functioning at the present time."} ;; "regularly uses medication that could influence endocrine functioning"
(declare-const patient_is_highly_active_on_international_physical_activity_questionnaire_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently scores as highly active on the International Physical Activity Questionnaire.","when_to_set_to_false":"Set to false if the patient currently does not score as highly active on the International Physical Activity Questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently scores as highly active on the International Physical Activity Questionnaire.","meaning":"Boolean indicating whether the patient currently scores as highly active on the International Physical Activity Questionnaire."} ;; "scores as highly active on the International Physical Activity Questionnaire"
(declare-const international_physical_activity_questionnaire_total_score_value_recorded_now_withunit_mets_min_week Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's total score on the International Physical Activity Questionnaire, recorded now, in MET-minutes per week.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's total score on the International Physical Activity Questionnaire, recorded now, in units of MET-minutes per week."} ;; "total score on the International Physical Activity Questionnaire"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term for autonomic functioning
(assert
(! (=> (or patient_is_exposed_to_alpha_adrenergic_receptor_antagonist_now
           patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now
           patient_has_finding_of_oral_contraception_now
           patient_is_exposed_to_prescription_pain_medication_now)
        patient_regularly_uses_medication_that_could_influence_autonomic_functioning_now)
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples (alpha blocker, beta blocker, oral contraceptive, prescription pain medication)" for autonomic functioning

;; Non-exhaustive examples imply umbrella term for endocrine functioning
(assert
(! (=> (or patient_is_exposed_to_alpha_adrenergic_receptor_antagonist_now
           patient_is_exposed_to_beta_adrenergic_receptor_antagonist_now
           patient_has_finding_of_oral_contraception_now
           patient_is_exposed_to_prescription_pain_medication_now)
        patient_regularly_uses_medication_that_could_influence_endocrine_functioning_now)
:named REQ10_AUXILIARY1)) ;; "with non-exhaustive examples (alpha blocker, beta blocker, oral contraceptive, prescription pain medication)" for endocrine functioning

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_regularly_uses_medication_that_could_influence_autonomic_functioning_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient regularly uses medication that could influence autonomic functioning..."

(assert
(! (not patient_regularly_uses_medication_that_could_influence_endocrine_functioning_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient regularly uses medication that could influence endocrine functioning..."

(assert
(! (not patient_is_highly_active_on_international_physical_activity_questionnaire_now)
:named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient scores as highly active on the International Physical Activity Questionnaire."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo magnetic resonance imaging (MRI) without contraindication.","when_to_set_to_false":"Set to false if the patient currently cannot undergo magnetic resonance imaging (MRI) due to contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient can currently undergo magnetic resonance imaging (MRI)."} ;; "magnetic resonance imaging is contraindicated"

(declare-const patient_can_undergo_magnetoencephalography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo magnetoencephalography (MEG) without contraindication.","when_to_set_to_false":"Set to false if the patient currently cannot undergo magnetoencephalography (MEG) due to contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo magnetoencephalography (MEG).","meaning":"Boolean indicating whether the patient can currently undergo magnetoencephalography (MEG)."} ;; "magnetoencephalography is contraindicated"

(declare-const patient_has_brace_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a brace present on their body.","when_to_set_to_false":"Set to false if the patient currently does not have a brace present on their body.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a brace present on their body.","meaning":"Boolean indicating whether the patient currently has a brace present on their body."} ;; "brace"

(declare-const patient_has_cerebral_clip_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cerebral clip present in their body.","when_to_set_to_false":"Set to false if the patient currently does not have a cerebral clip present in their body.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cerebral clip present in their body.","meaning":"Boolean indicating whether the patient currently has a cerebral clip present in their body."} ;; "cerebral clip"

(declare-const patient_has_cochlear_implant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cochlear implant present in their body.","when_to_set_to_false":"Set to false if the patient currently does not have a cochlear implant present in their body.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cochlear implant present in their body.","meaning":"Boolean indicating whether the patient currently has a cochlear implant present in their body."} ;; "cochlear implant"

(declare-const patient_has_non_organic_implant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a non-organic implant present in their body.","when_to_set_to_false":"Set to false if the patient currently does not have a non-organic implant present in their body.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a non-organic implant present in their body.","meaning":"Boolean indicating whether the patient currently has a non-organic implant present in their body."} ;; "presence of non-organic implant"

(declare-const patient_has_undergone_tattooing_of_permanent_makeup_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has undergone tattooing of permanent makeup (i.e., has permanent tattooed makeup).","when_to_set_to_false":"Set to false if the patient currently has not undergone tattooing of permanent makeup.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has undergone tattooing of permanent makeup.","meaning":"Boolean indicating whether the patient currently has undergone tattooing of permanent makeup."} ;; "permanent tattooed makeup"

(declare-const patient_is_exposed_to_iron_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to iron (e.g., via tattoo pigment, implant, or other means).","when_to_set_to_false":"Set to false if the patient is currently not exposed to iron.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to iron.","meaning":"Boolean indicating whether the patient is currently exposed to iron."} ;; "general tattoo made with color whose content in iron cannot be definitely ruled out"

(declare-const patient_has_finding_of_left_handed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently left-handed.","when_to_set_to_false":"Set to false if the patient is currently not left-handed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently left-handed.","meaning":"Boolean indicating whether the patient is currently left-handed."} ;; "the patient is left-handed"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples imply MRI contraindication
(assert
(! (=> (or patient_has_brace_now
           patient_has_cerebral_clip_now
           patient_has_non_organic_implant_now
           patient_has_cochlear_implant_now
           patient_has_undergone_tattooing_of_permanent_makeup_now
           patient_is_exposed_to_iron_now)
        (not patient_can_undergo_magnetic_resonance_imaging_now))
   :named REQ11_AUXILIARY0)) ;; "magnetic resonance imaging is contraindicated with non-exhaustive examples (metal in body, brace, glasses required to correct vision, presence of non-organic implant with non-exhaustive examples (cochlear implant), cerebral clip, permanent tattooed makeup, general tattoo in a dangerous location on the body, general tattoo made with color whose content in iron cannot be definitely ruled out)."

;; Non-exhaustive examples imply MEG contraindication
(assert
(! (=> (or patient_has_brace_now
           patient_has_cerebral_clip_now
           patient_has_non_organic_implant_now
           patient_has_cochlear_implant_now
           patient_has_undergone_tattooing_of_permanent_makeup_now
           patient_is_exposed_to_iron_now)
        (not patient_can_undergo_magnetoencephalography_now))
   :named REQ11_AUXILIARY1)) ;; "magnetoencephalography is contraindicated with non-exhaustive examples (metal in body, brace, glasses required to correct vision, presence of non-organic implant with non-exhaustive examples (cochlear implant), cerebral clip, permanent tattooed makeup, general tattoo in a dangerous location on the body, general tattoo made with color whose content in iron cannot be definitely ruled out)."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_can_undergo_magnetic_resonance_imaging_now)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if magnetic resonance imaging is contraindicated..."

(assert
(! (not patient_can_undergo_magnetoencephalography_now)
   :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if magnetoencephalography is contraindicated..."

(assert
(! (not (not patient_has_finding_of_left_handed_now))
   :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is left-handed."
