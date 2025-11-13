;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing oxygen therapy."} ;; "oxygen therapy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_undergoing_oxygen_therapy_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently requires oxygen therapy for the health of the patient."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_plain_chest_x_ray_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest x-ray of the chest within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone a plain chest x-ray of the chest within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest x-ray of the chest within the past six months.","meaning":"Boolean indicating whether the patient has undergone a plain chest x-ray of the chest within the past six months."} ;; "chest x-ray of the chest within the last six months"
(declare-const patient_has_undergone_ct_of_chest_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a computed tomography scan of the chest within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone a computed tomography scan of the chest within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a computed tomography scan of the chest within the past six months.","meaning":"Boolean indicating whether the patient has undergone a computed tomography scan of the chest within the past six months."} ;; "computed tomography scan of the chest within the last six months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_undergone_plain_chest_x_ray_inthepast6months
            patient_has_undergone_ct_of_chest_inthepast6months))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had a chest x-ray of the chest within the last six months) OR (the patient has had a computed tomography scan of the chest within the last six months)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_total_pneumonectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a total pneumonectomy at any time in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone a total pneumonectomy prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a total pneumonectomy.","meaning":"Boolean indicating whether the patient has ever undergone a total pneumonectomy at any time in the past."} ;; "pneumonectomy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_undergone_total_pneumonectomy_inthehistory)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous pneumonectomy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_lobectomy_of_lung_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a lobectomy of the lung at any time within the past five years.","when_to_set_to_false":"Set to false if the patient has not undergone a lobectomy of the lung within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a lobectomy of the lung within the past five years.","meaning":"Boolean indicating whether the patient has undergone a lobectomy of the lung within the past five years."} ;; "lobectomy of the lung within the last five years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_lobectomy_of_lung_inthepast5years)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a lobectomy of the lung within the last five years."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of malignant neoplastic disease (malignancy) within the past five years.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of malignant neoplastic disease (malignancy) within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with malignant neoplastic disease (malignancy) within the past five years.","meaning":"Boolean indicating whether the patient has been diagnosed with malignant neoplastic disease (malignancy) within the past five years."} ;; "malignancy within the last five years"

(declare-const patient_has_diagnosis_of_nonmelanoma_skin_cancer_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of non-melanoma skin cancer within the past five years.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of non-melanoma skin cancer within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with non-melanoma skin cancer within the past five years.","meaning":"Boolean indicating whether the patient has been diagnosed with non-melanoma skin cancer within the past five years."} ;; "the malignancy is NOT non-melanoma skin cancer"

(declare-const patient_has_diagnosis_of_carcinoma_in_situ_of_cervix_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of carcinoma in situ of the cervix within the past five years.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of carcinoma in situ of the cervix within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with carcinoma in situ of the cervix within the past five years.","meaning":"Boolean indicating whether the patient has been diagnosed with carcinoma in situ of the cervix within the past five years."} ;; "the malignancy is NOT carcinoma in situ of the cervix"

(declare-const patient_has_diagnosis_of_localized_prostate_cancer_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of localized prostate cancer within the past five years.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of localized prostate cancer within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been diagnosed with localized prostate cancer within the past five years.","meaning":"Boolean indicating whether the patient has been diagnosed with localized prostate cancer within the past five years."} ;; "the malignancy is NOT localized prostate cancer"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
               (not patient_has_diagnosis_of_nonmelanoma_skin_cancer_inthepast5years)
               (not patient_has_diagnosis_of_carcinoma_in_situ_of_cervix_inthepast5years)
               (not patient_has_diagnosis_of_localized_prostate_cancer_inthepast5years)))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has been diagnosed with a malignancy within the last five years) AND (the malignancy is NOT non-melanoma skin cancer) AND (the malignancy is NOT carcinoma in situ of the cervix) AND (the malignancy is NOT localized prostate cancer)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@would_prevent_treatment_for_lung_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding, and that condition would prevent treatment for lung cancer.","when_to_set_to_false":"Set to false if the patient currently has a disease, condition, or clinical finding, but it would not prevent treatment for lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition would prevent treatment for lung cancer.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding would prevent treatment for lung cancer."} ;; "medical condition that would prevent treatment for lung cancer"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@would_prevent_treatment_for_lung_cancer
      patient_has_finding_of_disease_condition_finding_now)
:named REQ5_AUXILIARY0)) ;; "medical condition that would prevent treatment for lung cancer""

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@would_prevent_treatment_for_lung_cancer)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical condition that would prevent treatment for lung cancer."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_new_cough_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a new cough within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had a new cough within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a new cough within the past six weeks.","meaning":"Boolean indicating whether the patient has had a new cough within the past six weeks."} ;; "a new cough"
(declare-const patient_has_finding_of_chronic_cough_worsened_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a chronic cough that has gotten worse within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had a chronic cough that has gotten worse within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a chronic cough that has gotten worse within the past six weeks.","meaning":"Boolean indicating whether the patient has had a chronic cough that has gotten worse within the past six weeks."} ;; "a chronic cough that has gotten worse"
(declare-const patient_has_finding_of_new_shortness_of_breath_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had new shortness of breath within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had new shortness of breath within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had new shortness of breath within the past six weeks.","meaning":"Boolean indicating whether the patient has had new shortness of breath within the past six weeks."} ;; "new shortness of breath"
(declare-const patient_has_finding_of_worsening_shortness_of_breath_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any worsening of shortness of breath within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had any worsening of shortness of breath within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any worsening of shortness of breath within the past six weeks.","meaning":"Boolean indicating whether the patient has had any worsening of shortness of breath within the past six weeks."} ;; "any worsening of shortness of breath"
(declare-const patient_has_finding_of_hemoptysis_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had hemoptysis (cough producing blood) within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had hemoptysis within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had hemoptysis within the past six weeks.","meaning":"Boolean indicating whether the patient has had hemoptysis (cough producing blood) within the past six weeks."} ;; "a cough producing blood"
(declare-const patient_has_finding_of_constant_chest_pain_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had constant chest pain within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had constant chest pain within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had constant chest pain within the past six weeks.","meaning":"Boolean indicating whether the patient has had constant chest pain within the past six weeks."} ;; "constant chest pain"
(declare-const patient_has_finding_of_respiratory_tract_infection_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a respiratory tract infection within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had a respiratory tract infection within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a respiratory tract infection within the past six weeks.","meaning":"Boolean indicating whether the patient has had a respiratory tract infection within the past six weeks."} ;; "respiratory infection"
(declare-const patient_has_finding_of_pneumonia_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had pneumonia within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had pneumonia within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had pneumonia within the past six weeks.","meaning":"Boolean indicating whether the patient has had pneumonia within the past six weeks."} ;; "pneumonia"
(declare-const patient_has_finding_of_common_cold_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a common cold within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had a common cold within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a common cold within the past six weeks.","meaning":"Boolean indicating whether the patient has had a common cold within the past six weeks."} ;; "cold"
(declare-const patient_has_finding_of_unintentional_unexplained_weight_loss_gt5percent_body_weight_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had unintentional and unexplained weight loss greater than five percent of total body weight within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had unintentional and unexplained weight loss greater than five percent of total body weight within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had unintentional and unexplained weight loss greater than five percent of total body weight within the past six weeks.","meaning":"Boolean indicating whether the patient has had unintentional and unexplained weight loss greater than five percent of total body weight within the past six weeks."} ;; "unintentional and unexplained weight loss greater than five percent of total body weight"
(declare-const patient_body_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current total body weight in kilograms is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current total body weight in kilograms."} ;; "total body weight"
(declare-const patient_weight_loss_value_recorded_inthepast6weeks_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total weight loss in kilograms within the past six weeks is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total weight loss in kilograms recorded within the past six weeks."} ;; "weight loss in the past six weeks"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_new_cough_inthepast6weeks)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had a new cough."

(assert
(! (not patient_has_finding_of_chronic_cough_worsened_inthepast6weeks)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had a chronic cough that has gotten worse."

(assert
(! (not patient_has_finding_of_new_shortness_of_breath_inthepast6weeks)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had new shortness of breath."

(assert
(! (not patient_has_finding_of_worsening_shortness_of_breath_inthepast6weeks)
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had any worsening of shortness of breath."

(assert
(! (not patient_has_finding_of_hemoptysis_inthepast6weeks)
:named REQ6_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had a cough producing blood."

(assert
(! (not patient_has_finding_of_constant_chest_pain_inthepast6weeks)
:named REQ6_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had constant chest pain."

(assert
(! (not patient_has_finding_of_respiratory_tract_infection_inthepast6weeks)
:named REQ6_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had a respiratory infection."

(assert
(! (not patient_has_finding_of_pneumonia_inthepast6weeks)
:named REQ6_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had pneumonia."

(assert
(! (not patient_has_finding_of_common_cold_inthepast6weeks)
:named REQ6_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had a cold."

(assert
(! (not patient_has_finding_of_unintentional_unexplained_weight_loss_gt5percent_body_weight_inthepast6weeks)
:named REQ6_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, within the last six weeks, the patient has had unintentional and unexplained weight loss greater than five percent of total body weight."
