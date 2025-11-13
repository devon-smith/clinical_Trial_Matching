;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "cardiac illness"
(declare-const patient_has_finding_of_heart_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart disease is severe.","when_to_set_to_false":"Set to false if the patient's heart disease is not severe.","when_to_set_to_null":"Set to null if severity of the patient's heart disease is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's heart disease is severe."} ;; "severe cardiac illness"
(declare-const patient_has_finding_of_heart_disease_now@@co_morbid Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart disease is co-morbid (present alongside another primary condition).","when_to_set_to_false":"Set to false if the patient's heart disease is not co-morbid.","when_to_set_to_null":"Set to null if co-morbidity status of the patient's heart disease is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's heart disease is co-morbid."} ;; "co-morbid cardiac illness"

(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disorder of lung.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disorder of lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of disorder of lung.","meaning":"Boolean indicating whether the patient currently has disorder of lung."} ;; "pulmonary illness"
(declare-const patient_has_finding_of_disorder_of_lung_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of lung is severe.","when_to_set_to_false":"Set to false if the patient's disorder of lung is not severe.","when_to_set_to_null":"Set to null if severity of the patient's disorder of lung is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's disorder of lung is severe."} ;; "severe pulmonary illness"
(declare-const patient_has_finding_of_disorder_of_lung_now@@co_morbid Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of lung is co-morbid (present alongside another primary condition).","when_to_set_to_false":"Set to false if the patient's disorder of lung is not co-morbid.","when_to_set_to_null":"Set to null if co-morbidity status of the patient's disorder of lung is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's disorder of lung is co-morbid."} ;; "co-morbid pulmonary illness"

(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "renal illness"
(declare-const patient_has_finding_of_kidney_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease is severe.","when_to_set_to_false":"Set to false if the patient's kidney disease is not severe.","when_to_set_to_null":"Set to null if severity of the patient's kidney disease is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's kidney disease is severe."} ;; "severe renal illness"
(declare-const patient_has_finding_of_kidney_disease_now@@co_morbid Bool) ;; {"when_to_set_to_true":"Set to true if the patient's kidney disease is co-morbid (present alongside another primary condition).","when_to_set_to_false":"Set to false if the patient's kidney disease is not co-morbid.","when_to_set_to_null":"Set to null if co-morbidity status of the patient's kidney disease is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's kidney disease is co-morbid."} ;; "co-morbid renal illness"

(declare-const patient_has_finding_of_hematologic_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hematologic illness.","when_to_set_to_false":"Set to false if the patient currently does not have a hematologic illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hematologic illness.","meaning":"Boolean indicating whether the patient currently has a hematologic illness."} ;; "hematologic illness"
(declare-const patient_has_finding_of_hematologic_illness_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hematologic illness is severe.","when_to_set_to_false":"Set to false if the patient's hematologic illness is not severe.","when_to_set_to_null":"Set to null if severity of the patient's hematologic illness is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's hematologic illness is severe."} ;; "severe hematologic illness"
(declare-const patient_has_finding_of_hematologic_illness_now@@co_morbid Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hematologic illness is co-morbid (present alongside another primary condition).","when_to_set_to_false":"Set to false if the patient's hematologic illness is not co-morbid.","when_to_set_to_null":"Set to null if co-morbidity status of the patient's hematologic illness is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's hematologic illness is co-morbid."} ;; "co-morbid hematologic illness"

(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disease of liver.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disease of liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of disease of liver.","meaning":"Boolean indicating whether the patient currently has disease of liver."} ;; "hepatic illness"
(declare-const patient_has_finding_of_disease_of_liver_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disease of liver is severe.","when_to_set_to_false":"Set to false if the patient's disease of liver is not severe.","when_to_set_to_null":"Set to null if severity of the patient's disease of liver is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's disease of liver is severe."} ;; "severe hepatic illness"
(declare-const patient_has_finding_of_disease_of_liver_now@@co_morbid Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disease of liver is co-morbid (present alongside another primary condition).","when_to_set_to_false":"Set to false if the patient's disease of liver is not co-morbid.","when_to_set_to_null":"Set to null if co-morbidity status of the patient's disease of liver is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's disease of liver is co-morbid."} ;; "co-morbid hepatic illness"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_disease_now@@severe
patient_has_finding_of_heart_disease_now)
:named REQ0_AUXILIARY0)) ;; "severe co-morbid cardiac illness"

(assert
(! (=> patient_has_finding_of_heart_disease_now@@co_morbid
patient_has_finding_of_heart_disease_now)
:named REQ0_AUXILIARY1)) ;; "co-morbid cardiac illness"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@severe
patient_has_finding_of_disorder_of_lung_now)
:named REQ0_AUXILIARY2)) ;; "severe co-morbid pulmonary illness"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@co_morbid
patient_has_finding_of_disorder_of_lung_now)
:named REQ0_AUXILIARY3)) ;; "co-morbid pulmonary illness"

(assert
(! (=> patient_has_finding_of_kidney_disease_now@@severe
patient_has_finding_of_kidney_disease_now)
:named REQ0_AUXILIARY4)) ;; "severe co-morbid renal illness"

(assert
(! (=> patient_has_finding_of_kidney_disease_now@@co_morbid
patient_has_finding_of_kidney_disease_now)
:named REQ0_AUXILIARY5)) ;; "co-morbid renal illness"

(assert
(! (=> patient_has_finding_of_hematologic_illness_now@@severe
patient_has_finding_of_hematologic_illness_now)
:named REQ0_AUXILIARY6)) ;; "severe co-morbid hematologic illness"

(assert
(! (=> patient_has_finding_of_hematologic_illness_now@@co_morbid
patient_has_finding_of_hematologic_illness_now)
:named REQ0_AUXILIARY7)) ;; "co-morbid hematologic illness"

(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@severe
patient_has_finding_of_disease_of_liver_now)
:named REQ0_AUXILIARY8)) ;; "severe co-morbid hepatic illness"

(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@co_morbid
patient_has_finding_of_disease_of_liver_now)
:named REQ0_AUXILIARY9)) ;; "co-morbid hepatic illness"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_finding_of_heart_disease_now@@severe
             patient_has_finding_of_heart_disease_now@@co_morbid))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe co-morbid cardiac illness."

(assert
(! (not (and patient_has_finding_of_disorder_of_lung_now@@severe
             patient_has_finding_of_disorder_of_lung_now@@co_morbid))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe co-morbid pulmonary illness."

(assert
(! (not (and patient_has_finding_of_kidney_disease_now@@severe
             patient_has_finding_of_kidney_disease_now@@co_morbid))
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe co-morbid renal illness."

(assert
(! (not (and patient_has_finding_of_hematologic_illness_now@@severe
             patient_has_finding_of_hematologic_illness_now@@co_morbid))
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe co-morbid hematologic illness."

(assert
(! (not (and patient_has_finding_of_disease_of_liver_now@@severe
             patient_has_finding_of_disease_of_liver_now@@co_morbid))
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe co-morbid hepatic illness."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_had_prior_treatment_with_hypnosis_for_medical_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had prior treatment with hypnosis for a medical condition.","when_to_set_to_false":"Set to false if the patient has not had prior treatment with hypnosis for a medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had prior treatment with hypnosis for a medical condition.","meaning":"Boolean indicating whether the patient has had prior treatment with hypnosis for a medical condition."} ;; "the patient has had prior treatment with hypnosis for a medical condition"
(declare-const patient_has_had_prior_treatment_with_hypnotherapy_for_medical_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had prior treatment with hypnotherapy for a medical condition.","when_to_set_to_false":"Set to false if the patient has not had prior treatment with hypnotherapy for a medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had prior treatment with hypnotherapy for a medical condition.","meaning":"Boolean indicating whether the patient has had prior treatment with hypnotherapy for a medical condition."} ;; "the patient has had prior treatment with hypnotherapy for a medical condition"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_had_prior_treatment_with_hypnosis_for_medical_condition
            patient_has_had_prior_treatment_with_hypnotherapy_for_medical_condition))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has had prior treatment with hypnosis for a medical condition) OR (the patient has had prior treatment with hypnotherapy for a medical condition))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_surgical_procedure_on_thorax_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure on the thorax at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure on the thorax at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure on the thorax.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure on the thorax in the past."} ;; "thoracic surgery"
(declare-const patient_has_undergone_surgical_procedure_on_thorax_inthehistory@@major Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure on the thorax was major.","when_to_set_to_false":"Set to false if the surgical procedure on the thorax was not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure on the thorax was major.","meaning":"Boolean indicating whether the surgical procedure on the thorax was major."} ;; "major thoracic surgery"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_on_thorax_inthehistory@@major
      patient_has_undergone_surgical_procedure_on_thorax_inthehistory)
:named REQ2_AUXILIARY0)) ;; "major thoracic surgery" implies "thoracic surgery"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_on_thorax_inthehistory@@major)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior major thoracic surgery."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_dissociative_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with dissociative disorder at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with dissociative disorder prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with dissociative disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of dissociative disorder in their history."} ;; "the patient has had a prior diagnosis of dissociative disorder"
(declare-const patient_has_finding_of_dissociative_disorder_treated_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received treatment for dissociative disorder at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never received treatment for dissociative disorder prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received treatment for dissociative disorder.","meaning":"Boolean indicating whether the patient has ever received treatment for dissociative disorder in their history."} ;; "the patient has had prior treatment for dissociative disorder"
(declare-const patient_has_diagnosis_of_posttraumatic_stress_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with post-traumatic stress disorder at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with post-traumatic stress disorder prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with post-traumatic stress disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of post-traumatic stress disorder in their history."} ;; "the patient has had a prior diagnosis of post-traumatic stress disorder"
(declare-const patient_has_finding_of_posttraumatic_stress_disorder_treated_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received treatment for post-traumatic stress disorder at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never received treatment for post-traumatic stress disorder prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received treatment for post-traumatic stress disorder.","meaning":"Boolean indicating whether the patient has ever received treatment for post-traumatic stress disorder in their history."} ;; "the patient has had prior treatment for post-traumatic stress disorder"
(declare-const patient_has_diagnosis_of_borderline_personality_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with borderline personality disorder at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with borderline personality disorder prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with borderline personality disorder.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of borderline personality disorder in their history."} ;; "the patient has had a prior diagnosis of borderline personality disorder"
(declare-const patient_has_finding_of_borderline_personality_disorder_treated_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received treatment for borderline personality disorder at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never received treatment for borderline personality disorder prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received treatment for borderline personality disorder.","meaning":"Boolean indicating whether the patient has ever received treatment for borderline personality disorder in their history."} ;; "the patient has had prior treatment for borderline personality disorder"
(declare-const patient_has_diagnosis_of_psychiatric_disorder_with_psychotic_features_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any psychiatric disorder that includes psychotic features at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any psychiatric disorder that includes psychotic features prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any psychiatric disorder that includes psychotic features.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any psychiatric disorder that includes psychotic features in their history."} ;; "the patient has had a prior diagnosis of other psychiatric disorder that includes psychotic features"
(declare-const patient_has_finding_of_psychiatric_disorder_with_psychotic_features_treated_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received treatment for any psychiatric disorder that includes psychotic features at any time prior to the current evaluation.","when_to_set_to_false":"Set to false if the patient has never received treatment for any psychiatric disorder that includes psychotic features prior to the current evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received treatment for any psychiatric disorder that includes psychotic features.","meaning":"Boolean indicating whether the patient has ever received treatment for any psychiatric disorder that includes psychotic features in their history."} ;; "the patient has had prior treatment for other psychiatric disorder that includes psychotic features"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_dissociative_disorder_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a prior diagnosis of dissociative disorder."

(assert
(! (not patient_has_finding_of_dissociative_disorder_treated_inthehistory)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior treatment for dissociative disorder."

(assert
(! (not patient_has_diagnosis_of_posttraumatic_stress_disorder_inthehistory)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a prior diagnosis of post-traumatic stress disorder."

(assert
(! (not patient_has_finding_of_posttraumatic_stress_disorder_treated_inthehistory)
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior treatment for post-traumatic stress disorder."

(assert
(! (not patient_has_diagnosis_of_borderline_personality_disorder_inthehistory)
:named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a prior diagnosis of borderline personality disorder."

(assert
(! (not patient_has_finding_of_borderline_personality_disorder_treated_inthehistory)
:named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior treatment for borderline personality disorder."

(assert
(! (not patient_has_diagnosis_of_psychiatric_disorder_with_psychotic_features_inthehistory)
:named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a prior diagnosis of other psychiatric disorder that includes psychotic features."

(assert
(! (not patient_has_finding_of_psychiatric_disorder_with_psychotic_features_treated_inthehistory)
:named REQ3_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior treatment for other psychiatric disorder that includes psychotic features."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be currently pregnant.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_pregnant_inthefuture3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a planned pregnancy within the upcoming three months.","when_to_set_to_false":"Set to false if the patient does not have a planned pregnancy within the upcoming three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a planned pregnancy within the upcoming three months.","meaning":"Boolean value indicating whether the patient has a planned pregnancy within the upcoming three months."} ;; "the patient has a planned pregnancy within the upcoming three months"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_is_pregnant_now
            patient_is_pregnant_inthefuture3months))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is pregnant) OR (the patient has a planned pregnancy within the upcoming three months))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_unable_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to give informed consent.","meaning":"Boolean indicating whether the patient is currently unable to give informed consent."} ;; "the patient is unable to give informed consent"
(declare-const patient_is_unwilling_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently willing to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to give informed consent.","meaning":"Boolean indicating whether the patient is currently unwilling to give informed consent."} ;; "the patient is unwilling to give informed consent"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_unable_to_give_informed_consent_now)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to give informed consent."

(assert
(! (not patient_is_unwilling_to_give_informed_consent_now)
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to give informed consent."
