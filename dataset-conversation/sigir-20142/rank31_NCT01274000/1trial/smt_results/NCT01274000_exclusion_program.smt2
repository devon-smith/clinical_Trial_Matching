;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_gastrectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone gastrectomy (surgical resection of the stomach) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone gastrectomy (surgical resection of the stomach) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone gastrectomy (surgical resection of the stomach).","meaning":"Boolean indicating whether the patient has ever undergone gastrectomy (surgical resection of the stomach) at any time in their history."} ;; "surgical resection of the stomach"
(declare-const patient_has_undergone_small_intestine_excision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone small intestine excision (surgical resection of the small intestine) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone small intestine excision (surgical resection of the small intestine) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone small intestine excision (surgical resection of the small intestine).","meaning":"Boolean indicating whether the patient has ever undergone small intestine excision (surgical resection of the small intestine) at any time in their history."} ;; "surgical resection of the small intestine"
(declare-const patient_has_undergone_large_intestine_excision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone large intestine excision (surgical resection of the large intestine) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone large intestine excision (surgical resection of the large intestine) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone large intestine excision (surgical resection of the large intestine).","meaning":"Boolean indicating whether the patient has ever undergone large intestine excision (surgical resection of the large intestine) at any time in their history."} ;; "surgical resection of the large intestine"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_undergone_gastrectomy_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of surgical resection of the stomach."

(assert
  (! (not patient_has_undergone_small_intestine_excision_inthehistory)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of surgical resection of the small intestine."

(assert
  (! (not patient_has_undergone_large_intestine_excision_inthehistory)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of surgical resection of the large intestine."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_inflammatory_bowel_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of inflammatory bowel disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of inflammatory bowel disease.","meaning":"Boolean indicating whether the patient has a history of inflammatory bowel disease."} ;; "history of inflammatory bowel disease"
(declare-const patient_has_finding_of_crohn_s_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of Crohn's disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of Crohn's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of Crohn's disease.","meaning":"Boolean indicating whether the patient has a history of Crohn's disease."} ;; "history of Crohn's disease"
(declare-const patient_has_finding_of_ulcerative_colitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of ulcerative colitis.","when_to_set_to_false":"Set to false if the patient does not have a documented history of ulcerative colitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of ulcerative colitis.","meaning":"Boolean indicating whether the patient has a history of ulcerative colitis."} ;; "history of ulcerative colitis"
(declare-const patient_has_diagnosis_of_inflammatory_bowel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of inflammatory bowel disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of inflammatory bowel disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of inflammatory bowel disease."} ;; "current diagnosis of inflammatory bowel disease"
(declare-const patient_has_diagnosis_of_crohn_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Crohn's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Crohn's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Crohn's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Crohn's disease."} ;; "current diagnosis of Crohn's disease"
(declare-const patient_has_diagnosis_of_ulcerative_colitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ulcerative colitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ulcerative colitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ulcerative colitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ulcerative colitis."} ;; "current diagnosis of ulcerative colitis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories define the umbrella exactly for history:
(assert
(! (= patient_has_finding_of_inflammatory_bowel_disease_inthehistory
(or patient_has_finding_of_crohn_s_disease_inthehistory
    patient_has_finding_of_ulcerative_colitis_inthehistory))
:named REQ1_AUXILIARY0)) ;; "history of inflammatory bowel disease with exhaustive subcategories (Crohn's disease, ulcerative colitis)"

;; Exhaustive subcategories define the umbrella exactly for current diagnosis:
(assert
(! (= patient_has_diagnosis_of_inflammatory_bowel_disease_now
(or patient_has_diagnosis_of_crohn_s_disease_now
    patient_has_diagnosis_of_ulcerative_colitis_now))
:named REQ1_AUXILIARY1)) ;; "current diagnosis of inflammatory bowel disease with exhaustive subcategories (Crohn's disease, ulcerative colitis)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have a history of inflammatory bowel disease (Crohn's disease or ulcerative colitis)
(assert
(! (not patient_has_finding_of_inflammatory_bowel_disease_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of inflammatory bowel disease with exhaustive subcategories (Crohn's disease, ulcerative colitis)."

;; Exclusion: patient must NOT have a current diagnosis of inflammatory bowel disease (Crohn's disease or ulcerative colitis)
(assert
(! (not patient_has_diagnosis_of_inflammatory_bowel_disease_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of inflammatory bowel disease with exhaustive subcategories (Crohn's disease, ulcerative colitis)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_ischemic_colitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with ischemic colitis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with ischemic colitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with ischemic colitis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of ischemic colitis in their history."} ;; "the patient has a history of ischemic colitis"
(declare-const patient_has_diagnosis_of_ischemic_colitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic colitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic colitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic colitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic colitis."} ;; "the patient has a current diagnosis of ischemic colitis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_ischemic_colitis_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of ischemic colitis."

(assert
(! (not patient_has_diagnosis_of_ischemic_colitis_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of ischemic colitis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_infectious_enteritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of infectious enteritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of infectious enteritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of infectious enteritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of infectious enteritis."} ;; "the patient has a current diagnosis of infectious enteritis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_infectious_enteritis_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of infectious enteritis."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hyperthyroidism."} ;; "the patient has a current diagnosis of hyperthyroidism"
(declare-const patient_has_diagnosis_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypothyroidism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypothyroidism."} ;; "the patient has a current diagnosis of hypothyroidism"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_hyperthyroidism_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of hyperthyroidism."

(assert
(! (not patient_has_diagnosis_of_hypothyroidism_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of hypothyroidism."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not participating in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial."} ;; "the patient is currently participating in another clinical trial"
(declare-const patient_is_currently_participating_in_post_marketing_clinical_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a post-marketing clinical study.","when_to_set_to_false":"Set to false if the patient is currently not participating in a post-marketing clinical study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a post-marketing clinical study.","meaning":"Boolean indicating whether the patient is currently participating in a post-marketing clinical study."} ;; "currently participating in post-marketing clinical study"
(declare-const patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within12weeks_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in a clinical trial occurred within the 12 weeks before the study.","when_to_set_to_false":"Set to false if the patient's participation in a clinical trial did not occur within the 12 weeks before the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in a clinical trial occurred within the 12 weeks before the study.","meaning":"Boolean indicating whether the patient's participation in a clinical trial occurred within the 12 weeks before the study."} ;; "participated in another clinical trial within the 12 weeks before the study"
(declare-const patient_has_participated_in_post_marketing_clinical_study_within_12_weeks_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a post-marketing clinical study within the 12 weeks before the study.","when_to_set_to_false":"Set to false if the patient has not participated in a post-marketing clinical study within the 12 weeks before the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a post-marketing clinical study within the 12 weeks before the study.","meaning":"Boolean indicating whether the patient has participated in a post-marketing clinical study within the 12 weeks before the study."} ;; "participated in post-marketing clinical study within the 12 weeks before the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term (current participation)
(assert
(! (=> patient_is_currently_participating_in_post_marketing_clinical_study
      patient_is_undergoing_clinical_trial_now)
    :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (post-marketing clinical study)" for current participation

;; Non-exhaustive examples imply umbrella term (past participation within 12 weeks)
(assert
(! (=> patient_has_participated_in_post_marketing_clinical_study_within_12_weeks_before_study
      patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within12weeks_before_study)
    :named REQ5_AUXILIARY1)) ;; "with non-exhaustive examples (post-marketing clinical study) within the 12 weeks before the study"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT be currently participating in another clinical trial
(assert
(! (not patient_is_undergoing_clinical_trial_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently participating in another clinical trial with non-exhaustive examples (post-marketing clinical study)."

;; Exclusion: patient must NOT have participated in another clinical trial within the 12 weeks before the study
(assert
(! (not patient_has_undergone_clinical_trial_inthehistory@@temporalcontext_within12weeks_before_study)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient participated in another clinical trial with non-exhaustive examples (post-marketing clinical study) within the 12 weeks before the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of malignant neoplastic disease (malignant tumor) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of malignant neoplastic disease (malignant tumor) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of malignant neoplastic disease (malignant tumor).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (malignant tumor) in their history."} ;; "the patient has a history of malignant tumor"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignant tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignant tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (malignant tumor).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (malignant tumor)."} ;; "the patient has a current diagnosis of malignant tumor"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malignant tumor."

(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current diagnosis of malignant tumor."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_misuses_drugs_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of misusing drugs within the past 1 year.","when_to_set_to_false":"Set to false if the patient does not have a documented history of misusing drugs within the past 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has misused drugs within the past 1 year.","meaning":"Boolean indicating whether the patient has misused drugs within the past 1 year."} ;; "the patient has a history of abuse of drugs within 1 year"
(declare-const patient_has_finding_of_alcohol_abuse_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of abusing alcohol within the past 1 year.","when_to_set_to_false":"Set to false if the patient does not have a documented history of abusing alcohol within the past 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has abused alcohol within the past 1 year.","meaning":"Boolean indicating whether the patient has abused alcohol within the past 1 year."} ;; "the patient has a history of abuse of alcohol within 1 year"
(declare-const patient_has_finding_of_misuses_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently misusing drugs.","when_to_set_to_false":"Set to false if the patient is currently not misusing drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently misusing drugs.","meaning":"Boolean indicating whether the patient is currently misusing drugs."} ;; "the patient is currently abusing drugs"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently abusing alcohol.","when_to_set_to_false":"Set to false if the patient is currently not abusing alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently abusing alcohol.","meaning":"Boolean indicating whether the patient is currently abusing alcohol."} ;; "the patient is currently abusing alcohol"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_misuses_drugs_inthepast1years
            patient_has_finding_of_alcohol_abuse_inthepast1years
            patient_has_finding_of_misuses_drugs_now
            patient_has_finding_of_alcohol_abuse_now))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of abuse of drugs within 1 year) OR (the patient has a history of abuse of alcohol within 1 year) OR (the patient is currently abusing drugs) OR (the patient is currently abusing alcohol))."
