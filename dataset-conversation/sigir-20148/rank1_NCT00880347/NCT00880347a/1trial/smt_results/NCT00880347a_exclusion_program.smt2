;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pathology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any pathology.","when_to_set_to_false":"Set to false if the patient currently does not have any pathology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any pathology.","meaning":"Boolean indicating whether the patient currently has any pathology."} ;; "any pathology"
(declare-const patient_has_finding_of_pathology_now@@may_affect_initial_diagnosis_of_probable_alzheimer_s_disease_according_to_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pathology may lead to reconsider or render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator.","when_to_set_to_false":"Set to false if the patient's current pathology does not affect the initial diagnosis of probable Alzheimer's disease in this way.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pathology may affect the initial diagnosis of probable Alzheimer's disease according to the investigator.","meaning":"Boolean indicating whether the patient's current pathology may affect the initial diagnosis of probable Alzheimer's disease according to the investigator."} ;; "any pathology that may lead to reconsider the initial diagnosis of probable Alzheimer's disease OR that may render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator"

(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have any medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any medical condition.","meaning":"Boolean indicating whether the patient currently has any medical condition."} ;; "any medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@may_affect_initial_diagnosis_of_probable_alzheimer_s_disease_according_to_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition may lead to reconsider or render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator.","when_to_set_to_false":"Set to false if the patient's current medical condition does not affect the initial diagnosis of probable Alzheimer's disease in this way.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medical condition may affect the initial diagnosis of probable Alzheimer's disease according to the investigator.","meaning":"Boolean indicating whether the patient's current medical condition may affect the initial diagnosis of probable Alzheimer's disease according to the investigator."} ;; "any medical condition that may lead to reconsider the initial diagnosis of probable Alzheimer's disease OR that may render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator"

(declare-const patient_has_finding_of_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have any symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any symptoms.","meaning":"Boolean indicating whether the patient currently has any symptoms."} ;; "any symptoms"
(declare-const patient_has_finding_of_symptom_now@@may_affect_initial_diagnosis_of_probable_alzheimer_s_disease_according_to_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current symptoms may lead to reconsider or render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator.","when_to_set_to_false":"Set to false if the patient's current symptoms do not affect the initial diagnosis of probable Alzheimer's disease in this way.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptoms may affect the initial diagnosis of probable Alzheimer's disease according to the investigator.","meaning":"Boolean indicating whether the patient's current symptoms may affect the initial diagnosis of probable Alzheimer's disease according to the investigator."} ;; "any symptoms that may lead to reconsider the initial diagnosis of probable Alzheimer's disease OR that may render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pathology_now@@may_affect_initial_diagnosis_of_probable_alzheimer_s_disease_according_to_investigator
      patient_has_finding_of_pathology_now)
   :named REQ0_AUXILIARY0)) ;; "any pathology that may lead to reconsider the initial diagnosis of probable Alzheimer's disease OR that may render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_affect_initial_diagnosis_of_probable_alzheimer_s_disease_according_to_investigator
      patient_has_finding_of_disease_condition_finding_now)
   :named REQ0_AUXILIARY1)) ;; "any medical condition that may lead to reconsider the initial diagnosis of probable Alzheimer's disease OR that may render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator"

(assert
(! (=> patient_has_finding_of_symptom_now@@may_affect_initial_diagnosis_of_probable_alzheimer_s_disease_according_to_investigator
      patient_has_finding_of_symptom_now)
   :named REQ0_AUXILIARY2)) ;; "any symptoms that may lead to reconsider the initial diagnosis of probable Alzheimer's disease OR that may render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_pathology_now@@may_affect_initial_diagnosis_of_probable_alzheimer_s_disease_according_to_investigator)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any pathology that may lead to reconsider the initial diagnosis of probable Alzheimer's disease OR that may render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@may_affect_initial_diagnosis_of_probable_alzheimer_s_disease_according_to_investigator)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any medical condition that may lead to reconsider the initial diagnosis of probable Alzheimer's disease OR that may render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator."

(assert
(! (not patient_has_finding_of_symptom_now@@may_affect_initial_diagnosis_of_probable_alzheimer_s_disease_according_to_investigator)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any symptoms that may lead to reconsider the initial diagnosis of probable Alzheimer's disease OR that may render the initial diagnosis of probable Alzheimer's disease doubtful at entry, according to the opinion of the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "current history of drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "current history of alcohol abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical finding of drug abuse in their history (recent or past).","when_to_set_to_false":"Set to false if the patient does not have a clinical finding of drug abuse in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical finding of drug abuse in their history.","meaning":"Boolean indicating whether the patient has a history of drug abuse."} ;; "recent history of drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical finding of alcohol abuse in their history (recent or past).","when_to_set_to_false":"Set to false if the patient does not have a clinical finding of alcohol abuse in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical finding of alcohol abuse in their history.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse."} ;; "recent history of alcohol abuse"
(declare-const patient_has_finding_of_psychoactive_substance_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of drug dependence.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of drug dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of drug dependence.","meaning":"Boolean indicating whether the patient currently has drug dependence."} ;; "current history of drug dependence"
(declare-const patient_has_finding_of_alcohol_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of alcohol dependence.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of alcohol dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of alcohol dependence.","meaning":"Boolean indicating whether the patient currently has alcohol dependence."} ;; "current history of alcohol dependence"
(declare-const patient_has_finding_of_psychoactive_substance_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical finding of drug dependence in their history (recent or past).","when_to_set_to_false":"Set to false if the patient does not have a clinical finding of drug dependence in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical finding of drug dependence in their history.","meaning":"Boolean indicating whether the patient has a history of drug dependence."} ;; "recent history of drug dependence"
(declare-const patient_has_finding_of_alcohol_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a clinical finding of alcohol dependence in their history (recent or past).","when_to_set_to_false":"Set to false if the patient does not have a clinical finding of alcohol dependence in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical finding of alcohol dependence in their history.","meaning":"Boolean indicating whether the patient has a history of alcohol dependence."} ;; "recent history of alcohol dependence"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current history of drug abuse."

(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current history of alcohol abuse."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history of drug abuse."

(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history of alcohol abuse."

(assert
(! (not patient_has_finding_of_psychoactive_substance_dependence_now)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current history of drug dependence."

(assert
(! (not patient_has_finding_of_alcohol_dependence_now)
:named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current history of alcohol dependence."

(assert
(! (not patient_has_finding_of_psychoactive_substance_dependence_inthehistory)
:named REQ1_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history of drug dependence."

(assert
(! (not patient_has_finding_of_alcohol_dependence_inthehistory)
:named REQ1_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history of alcohol dependence."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_mild_cognitive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mild cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mild cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mild cognitive impairment.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mild cognitive impairment."} ;; "diagnosis of mild cognitive impairment"

(declare-const patient_has_subjective_complaints_of_memory_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has subjective complaints regarding memory symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have subjective complaints regarding memory symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has subjective complaints regarding memory symptoms.","meaning":"Boolean indicating whether the patient currently has subjective complaints regarding memory symptoms."} ;; "subjective complaints regarding memory symptoms"

(declare-const patient_has_subjective_complaints_of_cognitive_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has subjective complaints regarding cognitive symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have subjective complaints regarding cognitive symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has subjective complaints regarding cognitive symptoms.","meaning":"Boolean indicating whether the patient currently has subjective complaints regarding cognitive symptoms."} ;; "subjective complaints regarding cognitive symptoms"

(declare-const patient_has_finding_of_memory_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has memory impairment.","when_to_set_to_false":"Set to false if the patient currently does not have memory impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has memory impairment.","meaning":"Boolean indicating whether the patient currently has memory impairment."} ;; "memory impairment"

(declare-const patient_has_finding_of_memory_impairment_now@@objective_at_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current memory impairment is objective and identified at testing.","when_to_set_to_false":"Set to false if the patient's current memory impairment is not objective or not identified at testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current memory impairment is objective and identified at testing.","meaning":"Boolean indicating whether the patient's current memory impairment is objective and identified at testing."} ;; "objective memory impairment at testing"

(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cognitive impairment.","meaning":"Boolean indicating whether the patient currently has cognitive impairment."} ;; "cognitive impairment"

(declare-const patient_has_finding_of_impaired_cognition_now@@objective_at_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cognitive impairment is objective and identified at testing.","when_to_set_to_false":"Set to false if the patient's current cognitive impairment is not objective or not identified at testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cognitive impairment is objective and identified at testing.","meaning":"Boolean indicating whether the patient's current cognitive impairment is objective and identified at testing."} ;; "objective cognitive impairment at testing"

(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets Alzheimer's disease diagnostic criteria.","when_to_set_to_false":"Set to false if the patient currently does not meet Alzheimer's disease diagnostic criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets Alzheimer's disease diagnostic criteria.","meaning":"Boolean indicating whether the patient currently meets Alzheimer's disease diagnostic criteria."} ;; "Alzheimer's disease diagnostic criteria"

(declare-const patients_activity_of_daily_living_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's daily living activities are currently abnormal.","when_to_set_to_false":"Set to false if the patient's daily living activities are currently normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's daily living activities are currently abnormal.","meaning":"Boolean indicating whether the patient's daily living activities are currently abnormal."} ;; "daily living activities are abnormal"

(declare-const patients_activity_of_daily_living_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's daily living activities are currently normal.","when_to_set_to_false":"Set to false if the patient's daily living activities are currently abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's daily living activities are currently normal.","meaning":"Boolean indicating whether the patient's daily living activities are currently normal."} ;; "daily living activities are normal"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_memory_impairment_now@@objective_at_testing
      patient_has_finding_of_memory_impairment_now)
    :named REQ2_AUXILIARY0)) ;; "objective memory impairment at testing" implies "memory impairment"

(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@objective_at_testing
      patient_has_finding_of_impaired_cognition_now)
    :named REQ2_AUXILIARY1)) ;; "objective cognitive impairment at testing" implies "cognitive impairment"

;; ===================== Definition of mild cognitive impairment (REQ 2) =====================
;; Definition: mild cognitive impairment = (subjective complaints regarding memory symptoms OR subjective complaints regarding cognitive symptoms)
;; AND (objective memory impairment at testing OR objective cognitive impairment at testing)
;; AND (NOT Alzheimer's disease diagnostic criteria)
;; AND (diagnosis does NOT affect daily living activities)
(assert
(! (= patient_has_diagnosis_of_mild_cognitive_disorder_now
      (and
        (or patient_has_subjective_complaints_of_memory_symptoms_now
            patient_has_subjective_complaints_of_cognitive_symptoms_now)
        (or patient_has_finding_of_memory_impairment_now@@objective_at_testing
            patient_has_finding_of_impaired_cognition_now@@objective_at_testing)
        (not patient_has_diagnosis_of_alzheimer_s_disease_now)
        (not patients_activity_of_daily_living_is_abnormal_now)
      ))
    :named REQ2_AUXILIARY2)) ;; "diagnosis of mild cognitive impairment defined by (subjective complaints regarding memory symptoms OR subjective complaints regarding cognitive symptoms) AND (objective memory impairment at testing OR objective cognitive impairment at testing) AND (the patient does NOT meet Alzheimer's disease diagnostic criteria) AND (the diagnosis does NOT affect daily living activities)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_mild_cognitive_disorder_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of mild cognitive impairment defined by ..."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_pathology_now@@pathology_is_brain_tumour Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pathology finding is specifically brain tumour (neoplasm of brain).","when_to_set_to_false":"Set to false if the patient's current pathology finding is not brain tumour (neoplasm of brain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pathology finding is brain tumour (neoplasm of brain).","meaning":"Boolean indicating whether the patient's current pathology finding is brain tumour (neoplasm of brain)."} ;; "current diagnosis of brain tumour"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_pathology_now@@pathology_is_brain_tumour)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of brain tumour."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_current_pathology_for_which_blood_sampling_may_involve_risk_for_patient_health_according_to_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any current pathology and, according to the opinion of the investigator, blood sampling may involve a risk for the patient's health due to this pathology.","when_to_set_to_false":"Set to false if the patient does not have any current pathology for which blood sampling may involve a risk for the patient's health according to the investigator's opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any current pathology for which blood sampling may involve a risk for the patient's health according to the investigator's opinion.","meaning":"Boolean indicating whether the patient has any current pathology for which blood sampling may involve a risk for the patient's health according to the investigator's opinion."} ;; "any current pathology for which blood sampling may involve a risk for the patient's health, according to the opinion of the investigator"

(declare-const patient_has_current_medical_condition_for_which_blood_sampling_may_involve_risk_for_patient_health_according_to_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any current medical condition and, according to the opinion of the investigator, blood sampling may involve a risk for the patient's health due to this condition.","when_to_set_to_false":"Set to false if the patient does not have any current medical condition for which blood sampling may involve a risk for the patient's health according to the investigator's opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any current medical condition for which blood sampling may involve a risk for the patient's health according to the investigator's opinion.","meaning":"Boolean indicating whether the patient has any current medical condition for which blood sampling may involve a risk for the patient's health according to the investigator's opinion."} ;; "any current medical condition for which blood sampling may involve a risk for the patient's health, according to the opinion of the investigator"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_current_pathology_for_which_blood_sampling_may_involve_risk_for_patient_health_according_to_investigator_opinion)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any current pathology for which blood sampling may involve a risk for the patient's health, according to the opinion of the investigator."

(assert
(! (not patient_has_current_medical_condition_for_which_blood_sampling_may_involve_risk_for_patient_health_according_to_investigator_opinion)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any current medical condition for which blood sampling may involve a risk for the patient's health, according to the opinion of the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_registered_at_securite_sociale_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently registered at Sécurité Sociale.","when_to_set_to_false":"Set to false if the patient is currently not registered at Sécurité Sociale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently registered at Sécurité Sociale.","meaning":"Boolean indicating whether the patient is currently registered at Sécurité Sociale."} ;; "the patient is not registered at Sécurité Sociale"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (not patient_is_registered_at_securite_sociale_now))
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is not registered at Sécurité Sociale."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_participating_in_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any study.","when_to_set_to_false":"Set to false if the patient is currently not participating in any study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any study.","meaning":"Boolean indicating whether the patient is currently participating in any study."} ;; "is currently participating in another study"
(declare-const patient_is_participating_in_study_now@@another_study Bool) ;; {"when_to_set_to_true":"Set to true if the study the patient is currently participating in is another study (not the current study under consideration).","when_to_set_to_false":"Set to false if the study the patient is currently participating in is not another study (i.e., it is the current study under consideration).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the study is another study.","meaning":"Boolean indicating whether the study the patient is currently participating in is another study (not the current study under consideration)."} ;; "another study"
(declare-const patient_is_participating_in_study_now@@using_investigational_non_marketed_product Bool) ;; {"when_to_set_to_true":"Set to true if the study the patient is currently participating in is using an investigational non-marketed product.","when_to_set_to_false":"Set to false if the study the patient is currently participating in is not using an investigational non-marketed product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the study is using an investigational non-marketed product.","meaning":"Boolean indicating whether the study the patient is currently participating in is using an investigational non-marketed product."} ;; "using an investigational non-marketed product"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_participating_in_study_now@@another_study
      patient_is_participating_in_study_now)
:named REQ7_AUXILIARY0)) ;; "another study"

(assert
(! (=> patient_is_participating_in_study_now@@using_investigational_non_marketed_product
      patient_is_participating_in_study_now)
:named REQ7_AUXILIARY1)) ;; "using an investigational non-marketed product"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT be currently participating in another study using an investigational non-marketed product
(assert
(! (not (and patient_is_participating_in_study_now@@another_study
             patient_is_participating_in_study_now@@using_investigational_non_marketed_product))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently participating in another study using an investigational non-marketed product."
