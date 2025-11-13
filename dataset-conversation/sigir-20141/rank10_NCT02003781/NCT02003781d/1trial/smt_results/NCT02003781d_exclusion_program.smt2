;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute myocardial infarction."} ;; "the patient has acute myocardial infarction"
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "the patient has acute coronary syndrome"
(declare-const patient_has_finding_of_symptomatic_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptomatic coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have symptomatic coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptomatic coronary artery disease.","meaning":"Boolean indicating whether the patient currently has symptomatic coronary artery disease."} ;; "the patient has symptomatic coronary artery disease"
(declare-const patient_has_finding_of_acute_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had acute myocardial infarction in the past (i.e., history of acute myocardial infarction).","when_to_set_to_false":"Set to false if the patient has never had acute myocardial infarction in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had acute myocardial infarction in the past.","meaning":"Boolean indicating whether the patient has ever had acute myocardial infarction in the past."} ;; "the patient has a history of acute myocardial infarction"
(declare-const patient_has_finding_of_acute_coronary_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had acute coronary syndrome in the past (i.e., history of acute coronary syndrome).","when_to_set_to_false":"Set to false if the patient has never had acute coronary syndrome in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had acute coronary syndrome in the past.","meaning":"Boolean indicating whether the patient has ever had acute coronary syndrome in the past."} ;; "the patient has a history of acute coronary syndrome"
(declare-const patient_has_finding_of_symptomatic_coronary_artery_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had symptomatic coronary artery disease in the past (i.e., history of symptomatic coronary artery disease).","when_to_set_to_false":"Set to false if the patient has never had symptomatic coronary artery disease in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had symptomatic coronary artery disease in the past.","meaning":"Boolean indicating whether the patient has ever had symptomatic coronary artery disease in the past."} ;; "the patient has a history of symptomatic coronary artery disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_acute_myocardial_infarction_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute myocardial infarction."

(assert
(! (not patient_has_finding_of_acute_coronary_syndrome_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute coronary syndrome."

(assert
(! (not patient_has_finding_of_symptomatic_coronary_artery_disease_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptomatic coronary artery disease."

(assert
(! (not patient_has_finding_of_acute_myocardial_infarction_inthehistory)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of acute myocardial infarction."

(assert
(! (not patient_has_finding_of_acute_coronary_syndrome_inthehistory)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of acute coronary syndrome."

(assert
(! (not patient_has_finding_of_symptomatic_coronary_artery_disease_inthehistory)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of symptomatic coronary artery disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease."} ;; "the patient has symptomatic peripheral artery disease"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral arterial occlusive disease and the disease is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has peripheral arterial occlusive disease and the disease is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peripheral arterial occlusive disease is symptomatic.","meaning":"Boolean indicating whether the patient's current peripheral arterial occlusive disease is symptomatic."} ;; "the patient has symptomatic peripheral artery disease"
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "the patient has heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure and the heart failure is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has heart failure and the heart failure is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is symptomatic.","meaning":"Boolean indicating whether the patient currently has symptomatic heart failure."} ;; "the patient has heart failure"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of peripheral arterial occlusive disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of peripheral arterial occlusive disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had the clinical finding of peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient has ever had peripheral arterial occlusive disease in the past."} ;; "the patient has a history of symptomatic peripheral artery disease"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had peripheral arterial occlusive disease at any time in the past and the disease was symptomatic.","when_to_set_to_false":"Set to false if the patient has ever had peripheral arterial occlusive disease at any time in the past and the disease was not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's past peripheral arterial occlusive disease was symptomatic.","meaning":"Boolean indicating whether the patient has ever had symptomatic peripheral arterial occlusive disease in the past."} ;; "the patient has a history of symptomatic peripheral artery disease"
(declare-const patient_has_finding_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of heart failure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of heart failure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient has ever had heart failure in the past."} ;; "the patient has a history of heart failure"
(declare-const patient_has_finding_of_heart_failure_inthehistory@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had heart failure at any time in the past and the heart failure was symptomatic.","when_to_set_to_false":"Set to false if the patient has ever had heart failure at any time in the past and the heart failure was not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's past heart failure was symptomatic.","meaning":"Boolean indicating whether the patient has ever had symptomatic heart failure in the past."} ;; "the patient has a history of heart failure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@symptomatic
      patient_has_finding_of_peripheral_arterial_occlusive_disease_now)
:named REQ1_AUXILIARY0)) ;; "the patient has symptomatic peripheral artery disease"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@symptomatic
      patient_has_finding_of_heart_failure_now)
:named REQ1_AUXILIARY1)) ;; "the patient has heart failure"

(assert
(! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@symptomatic
      patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory)
:named REQ1_AUXILIARY2)) ;; "the patient has a history of symptomatic peripheral artery disease"

(assert
(! (=> patient_has_finding_of_heart_failure_inthehistory@@symptomatic
      patient_has_finding_of_heart_failure_inthehistory)
:named REQ1_AUXILIARY3)) ;; "the patient has a history of heart failure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@symptomatic)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptomatic peripheral artery disease."

(assert
(! (not patient_has_finding_of_heart_failure_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure."

(assert
(! (not patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@symptomatic)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of symptomatic peripheral artery disease."

(assert
(! (not patient_has_finding_of_heart_failure_inthehistory)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_desired_lifetime_value_in_months_due_to_non_cardiovascular_disease Real) ;; {"when_to_set_to_value":"Set to the number of months if the patient's expected or desired remaining lifetime due to a non-cardiovascular disease is known and can be estimated.","when_to_set_to_null":"Set to null if the patient's expected or desired remaining lifetime due to a non-cardiovascular disease is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's expected or desired remaining lifetime in months, as estimated due to a non-cardiovascular disease."} ;; "desired lifetime < 6 months due to a non-cardiovascular disease"
(declare-const patient_has_non_cardiovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any non-cardiovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have any non-cardiovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any non-cardiovascular disease.","meaning":"Boolean indicating whether the patient currently has any non-cardiovascular disease."} ;; "due to a non-cardiovascular disease"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} ;; "cancer"
(declare-const patient_has_diagnosis_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sepsis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sepsis."} ;; "sepsis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_malignant_neoplastic_disease_now
          patient_has_diagnosis_of_sepsis_now)
       patient_has_non_cardiovascular_disease_now)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (cancer, sepsis)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and
         (< patient_desired_lifetime_value_in_months_due_to_non_cardiovascular_disease 6)
         patient_has_non_cardiovascular_disease_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a desired lifetime < 6 months due to a non-cardiovascular disease with non-exhaustive examples (cancer, sepsis))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is a woman who is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently documented as not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently breastfeeding."} ;; "the patient is a woman who is nursing"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "the patient is a woman"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and patient_sex_is_female_now patient_is_pregnant_now))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

(assert
  (! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is nursing."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_contrast_media_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis or documented history of allergy to contrast media at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis or documented history of allergy to contrast media at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis or documented history of allergy to contrast media.","meaning":"Boolean indicating whether the patient has ever had a diagnosis or documented history of allergy to contrast media at any point in their medical history."} ;; "contrast allergy"
(declare-const patient_has_finding_of_related_side_effects_of_contrast_allergy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of side effects related to contrast allergy at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented history of side effects related to contrast allergy at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a documented history of side effects related to contrast allergy.","meaning":"Boolean indicating whether the patient has ever had a documented history of side effects related to contrast allergy at any point in their medical history."} ;; "related side effects of contrast allergy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_contrast_media_inthehistory)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of contrast allergy."

(assert
  (! (not patient_has_finding_of_related_side_effects_of_contrast_allergy_inthehistory)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of related side effects of contrast allergy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const months_since_transplantation_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months that have elapsed since the patient's most recent transplantation event, measured in months, if known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months have elapsed since the patient's most recent transplantation event.","meaning":"Numeric value representing the number of months since the patient's most recent transplantation event."} ;; "within the first three months after transplantation"

(declare-const patient_has_undergone_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a transplantation procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a transplantation procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a transplantation procedure in the past."} ;; "transplantation"

(declare-const patient_has_undergone_transplantation_inthehistory@@temporalcontext_within_3_months_after_transplantation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently within the first three months after having undergone transplantation.","when_to_set_to_false":"Set to false if the patient is not currently within the first three months after transplantation (i.e., more than three months have passed since transplantation or transplantation never occurred).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is within the first three months after transplantation.","meaning":"Boolean indicating whether the patient is currently within the first three months after transplantation."} ;; "within the first three months after transplantation"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: within 3 months after transplantation means patient has undergone transplantation and months since transplantation < 3
(assert
(! (= patient_has_undergone_transplantation_inthehistory@@temporalcontext_within_3_months_after_transplantation
     (and patient_has_undergone_transplantation_inthehistory
          (< months_since_transplantation_value_recorded_now_in_months 3)))
:named REQ5_AUXILIARY0)) ;; "within the first three months after transplantation"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_undergone_transplantation_inthehistory@@temporalcontext_within_3_months_after_transplantation
      patient_has_undergone_transplantation_inthehistory)
:named REQ5_AUXILIARY1)) ;; "within the first three months after transplantation" implies "transplantation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_transplantation_inthehistory@@temporalcontext_within_3_months_after_transplantation)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is within the first three months after transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_acute_rejection_of_renal_transplant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute rejection of a renal transplant.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute rejection of a renal transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute rejection of a renal transplant.","meaning":"Boolean indicating whether the patient currently has acute rejection of a renal transplant."} ;; "acute renal allograft rejection"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_acute_rejection_of_renal_transplant_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute renal allograft rejection."
