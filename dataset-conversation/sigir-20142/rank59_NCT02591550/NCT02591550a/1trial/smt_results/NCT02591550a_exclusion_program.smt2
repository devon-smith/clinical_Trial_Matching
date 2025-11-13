;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_respiratory_tract_infection_inthepast8weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of respiratory tract infection at any time within the past eight weeks.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of respiratory tract infection at any time within the past eight weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of respiratory tract infection within the past eight weeks.","meaning":"Boolean indicating whether the patient has had a diagnosis of respiratory tract infection within the past eight weeks."} ;; "The patient is excluded if the patient has had a respiratory tract infection within the past eight weeks."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_respiratory_tract_infection_inthepast8weeks)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a respiratory tract infection within the past eight weeks."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chronic_disease_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease of the respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease of the respiratory system.","meaning":"Boolean indicating whether the patient currently has a chronic disease of the respiratory system."} ;; "the patient has chronic respiratory disease"

(declare-const patient_has_finding_of_heart_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease and the heart disease is severe.","when_to_set_to_false":"Set to false if the patient currently has heart disease but it is not severe, or does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart disease is severe.","meaning":"Boolean indicating whether the patient currently has severe heart disease."} ;; "the patient has severe heart disease"

(declare-const patient_has_finding_of_disease_of_liver_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease and the liver disease is severe.","when_to_set_to_false":"Set to false if the patient currently has liver disease but it is not severe, or does not have liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's liver disease is severe.","meaning":"Boolean indicating whether the patient currently has severe liver disease."} ;; "the patient has severe liver disease"

(declare-const patient_has_finding_of_kidney_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease and the kidney disease is severe.","when_to_set_to_false":"Set to false if the patient currently has kidney disease but it is not severe, or does not have kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease is severe.","meaning":"Boolean indicating whether the patient currently has severe kidney disease."} ;; "the patient has severe kidney disease"

(declare-const patient_has_finding_of_autoimmune_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has autoimmune disease and the autoimmune disease is severe.","when_to_set_to_false":"Set to false if the patient currently has autoimmune disease but it is not severe, or does not have autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's autoimmune disease is severe.","meaning":"Boolean indicating whether the patient currently has severe autoimmune disease."} ;; "the patient has severe autoimmune disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_of_respiratory_system_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic respiratory disease."

(assert
(! (not patient_has_finding_of_heart_disease_now@@severe)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe heart disease."

(assert
(! (not patient_has_finding_of_disease_of_liver_now@@severe)
    :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe liver disease."

(assert
(! (not patient_has_finding_of_kidney_disease_now@@severe)
    :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe kidney disease."

(assert
(! (not patient_has_finding_of_autoimmune_disease_now@@severe)
    :named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe autoimmune disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_taken_angiotensin_converting_enzyme_inhibitor_containing_product_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any angiotensin-converting enzyme inhibitor-containing product within the past one week.","when_to_set_to_false":"Set to false if the patient has not taken any angiotensin-converting enzyme inhibitor-containing product within the past one week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any angiotensin-converting enzyme inhibitor-containing product within the past one week.","meaning":"Boolean indicating whether the patient has taken any angiotensin-converting enzyme inhibitor-containing product within the past one week."} ;; "the patient has used angiotensin-converting enzyme inhibitor within the past one week"
(declare-const patient_is_exposed_to_bronchodilator_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any bronchodilator within the past one week.","when_to_set_to_false":"Set to false if the patient has not been exposed to any bronchodilator within the past one week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any bronchodilator within the past one week.","meaning":"Boolean indicating whether the patient has been exposed to any bronchodilator within the past one week."} ;; "the patient has used bronchodilator within the past one week"
(declare-const patient_has_used_glucocorticosteroid_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any glucocorticosteroid within the past one week.","when_to_set_to_false":"Set to false if the patient has not used any glucocorticosteroid within the past one week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any glucocorticosteroid within the past one week.","meaning":"Boolean indicating whether the patient has used any glucocorticosteroid within the past one week."} ;; "the patient has used glucocorticosteroid within the past one week"
(declare-const patient_has_used_antihistaminic_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any antihistaminic within the past one week.","when_to_set_to_false":"Set to false if the patient has not used any antihistaminic within the past one week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any antihistaminic within the past one week.","meaning":"Boolean indicating whether the patient has used any antihistaminic within the past one week."} ;; "the patient has used antihistaminic within the past one week"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_taken_angiotensin_converting_enzyme_inhibitor_containing_product_inthepast1weeks)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used angiotensin-converting enzyme inhibitor within the past one week."

(assert
(! (not patient_is_exposed_to_bronchodilator_inthepast1weeks)
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used bronchodilator within the past one week."

(assert
(! (not patient_has_used_glucocorticosteroid_inthepast1weeks)
:named REQ2_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used glucocorticosteroid within the past one week."

(assert
(! (not patient_has_used_antihistaminic_inthepast1weeks)
:named REQ2_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used antihistaminic within the past one week."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's lactation status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "the patient is a woman"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignant tumour).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignant tumour).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignant tumour).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignant tumour) at the present time."} ;; "malignant tumour"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant tumour."
