;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute myocardial infarction."} ;; "the patient has acute myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute coronary syndrome."} ;; "the patient has acute coronary syndrome"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary artery disease (coronary arteriosclerosis) and the disease is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of coronary artery disease (coronary arteriosclerosis) and the disease is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery disease is symptomatic.","meaning":"Boolean indicating whether the patient's current coronary artery disease is symptomatic."} ;; "the patient has symptomatic coronary artery disease"
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of acute myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of acute myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of acute myocardial infarction."} ;; "the patient has a history of acute myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of acute coronary syndrome at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of acute coronary syndrome."} ;; "the patient has a history of acute coronary syndrome"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of coronary artery disease (coronary arteriosclerosis) and the disease was symptomatic.","when_to_set_to_false":"Set to false if the patient has ever had a diagnosis of coronary artery disease (coronary arteriosclerosis) and the disease was not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery disease was symptomatic.","meaning":"Boolean indicating whether the patient's historical coronary artery disease was symptomatic."} ;; "the patient has a history of symptomatic coronary artery disease"
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_now_or_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has or has ever had a diagnosis of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have and has never had a diagnosis of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has or has ever had a diagnosis of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has or has ever had a diagnosis of acute myocardial infarction."} ;; "the patient has acute myocardial infarction OR the patient has a history of acute myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now_or_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has or has ever had a diagnosis of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have and has never had a diagnosis of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has or has ever had a diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has or has ever had a diagnosis of acute coronary syndrome."} ;; "the patient has acute coronary syndrome OR the patient has a history of acute coronary syndrome"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now_or_inthehistory@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has or has ever had a diagnosis of coronary artery disease (coronary arteriosclerosis) and the disease is or was symptomatic.","when_to_set_to_false":"Set to false if the patient currently has or has ever had a diagnosis of coronary artery disease (coronary arteriosclerosis) and the disease is or was not symptomatic, or if the patient has never had the disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has or has ever had symptomatic coronary artery disease (coronary arteriosclerosis).","meaning":"Boolean indicating whether the patient currently has or has ever had symptomatic coronary artery disease (coronary arteriosclerosis)."} ;; "the patient has symptomatic coronary artery disease OR the patient has a history of symptomatic coronary artery disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Combine current and historical acute myocardial infarction
(assert
(! (= patient_has_diagnosis_of_acute_myocardial_infarction_now_or_inthehistory
     (or patient_has_diagnosis_of_acute_myocardial_infarction_now
         patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory))
:named REQ0_AUXILIARY0)) ;; "the patient has acute myocardial infarction OR the patient has a history of acute myocardial infarction"

;; Combine current and historical acute coronary syndrome
(assert
(! (= patient_has_diagnosis_of_acute_coronary_syndrome_now_or_inthehistory
     (or patient_has_diagnosis_of_acute_coronary_syndrome_now
         patient_has_diagnosis_of_acute_coronary_syndrome_inthehistory))
:named REQ0_AUXILIARY1)) ;; "the patient has acute coronary syndrome OR the patient has a history of acute coronary syndrome"

;; Combine current and historical symptomatic coronary artery disease
(assert
(! (= patient_has_diagnosis_of_coronary_arteriosclerosis_now_or_inthehistory@@symptomatic
     (or patient_has_diagnosis_of_coronary_arteriosclerosis_now@@symptomatic
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@symptomatic))
:named REQ0_AUXILIARY2)) ;; "the patient has symptomatic coronary artery disease OR the patient has a history of symptomatic coronary artery disease"

;; Qualifier variables imply corresponding stem variables (current)
(assert
(! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_now@@symptomatic
       true) ;; No stem variable for "coronary artery disease now" is used in this requirement, so this is a placeholder for completeness.
:named REQ0_AUXILIARY3)) ;; "the patient has symptomatic coronary artery disease"

;; Qualifier variables imply corresponding stem variables (history)
(assert
(! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@symptomatic
       true) ;; No stem variable for "coronary artery disease in the history" is used in this requirement, so this is a placeholder for completeness.
:named REQ0_AUXILIARY4)) ;; "the patient has a history of symptomatic coronary artery disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_diagnosis_of_acute_myocardial_infarction_now_or_inthehistory
            patient_has_diagnosis_of_acute_coronary_syndrome_now_or_inthehistory
            patient_has_diagnosis_of_coronary_arteriosclerosis_now_or_inthehistory@@symptomatic))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has acute myocardial infarction) OR (the patient has acute coronary syndrome) OR (the patient has symptomatic coronary artery disease) OR (the patient has a history of acute myocardial infarction) OR (the patient has a history of acute coronary syndrome) OR (the patient has a history of symptomatic coronary artery disease))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease."} ;; "the patient has peripheral artery disease"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral arterial occlusive disease and the disease is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has peripheral arterial occlusive disease but the disease is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peripheral arterial occlusive disease is symptomatic.","meaning":"Boolean indicating whether the patient's current peripheral arterial occlusive disease is symptomatic."} ;; "the patient has symptomatic peripheral artery disease"
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "the patient has heart failure"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient does not have a history of peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient has a history of peripheral arterial occlusive disease."} ;; "the patient has a history of peripheral artery disease"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of peripheral arterial occlusive disease and the disease was symptomatic.","when_to_set_to_false":"Set to false if the patient has a history of peripheral arterial occlusive disease but the disease was not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the historical peripheral arterial occlusive disease was symptomatic.","meaning":"Boolean indicating whether the patient's historical peripheral arterial occlusive disease was symptomatic."} ;; "the patient has a history of symptomatic peripheral artery disease"
(declare-const patient_has_finding_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of heart failure.","when_to_set_to_false":"Set to false if the patient does not have a history of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of heart failure.","meaning":"Boolean indicating whether the patient has a history of heart failure."} ;; "the patient has a history of heart failure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@symptomatic
      patient_has_finding_of_peripheral_arterial_occlusive_disease_now)
:named REQ1_AUXILIARY0)) ;; "the patient has symptomatic peripheral artery disease"

(assert
(! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@symptomatic
      patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory)
:named REQ1_AUXILIARY1)) ;; "the patient has a history of symptomatic peripheral artery disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@symptomatic
            patient_has_finding_of_heart_failure_now
            patient_has_finding_of_peripheral_arterial_occlusive_disease_inthehistory@@symptomatic
            patient_has_finding_of_heart_failure_inthehistory))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has symptomatic peripheral artery disease) OR (the patient has heart failure) OR (the patient has a history of symptomatic peripheral artery disease) OR (the patient has a history of heart failure))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_desired_lifetime_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's desired lifetime in months, as recorded at the present time.","when_to_set_to_null":"Set to null if the patient's desired lifetime in months is unknown, not documented, or cannot be determined at the present time.","meaning":"Numeric value indicating the patient's desired lifetime, recorded at the present time, in months."} ;; "desired lifetime less than six months"

(declare-const patient_has_non_cardiovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a non-cardiovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a non-cardiovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a non-cardiovascular disease.","meaning":"Boolean indicating whether the patient currently has a non-cardiovascular disease."} ;; "due to a non-cardiovascular disease"

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
(! (not (and (< patient_desired_lifetime_value_recorded_now_in_months 6)
             patient_has_non_cardiovascular_disease_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a desired lifetime less than six months due to a non-cardiovascular disease with non-exhaustive examples (cancer, sepsis)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is a woman who is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently documented as not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently breastfeeding."} ;; "the patient is a woman who is nursing"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "the patient is a woman"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient is a woman who is pregnant
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

;; Exclusion: patient is a woman who is nursing
(assert
(! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is nursing."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_contrast_media_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergy to contrast media at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergy to contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergy to contrast media.","meaning":"Boolean indicating whether the patient has ever had a history of allergy to contrast media."} ;; "the patient has a history of contrast allergy"
(declare-const patient_has_finding_of_related_side_effects_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of side effects related to contrast media or similar agents at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented history of side effects related to contrast media or similar agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of side effects related to contrast media or similar agents.","meaning":"Boolean indicating whether the patient has ever had a history of side effects related to contrast media or similar agents."} ;; "the patient has a history of related side effects"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergy_to_contrast_media_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of contrast allergy."

(assert
(! (not patient_has_finding_of_related_side_effects_inthehistory)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of related side effects."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone transplantation at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone transplantation in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone transplantation in the past.","meaning":"Boolean indicating whether the patient has ever undergone transplantation in the past."} ;; "transplantation"
(declare-const patient_has_undergone_transplantation_inthehistory@@temporalcontext_within_3_months_after_transplantation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone transplantation in the past and the current assessment is within the first three months after transplantation.","when_to_set_to_false":"Set to false if the patient has undergone transplantation in the past but the current assessment is not within the first three months after transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current assessment is within the first three months after transplantation.","meaning":"Boolean indicating whether the patient is within the first three months after transplantation."} ;; "the patient is within the first three months after transplantation"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_transplantation_inthehistory@@temporalcontext_within_3_months_after_transplantation
      patient_has_undergone_transplantation_inthehistory)
:named REQ5_AUXILIARY0)) ;; "the patient is within the first three months after transplantation""

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_transplantation_inthehistory@@temporalcontext_within_3_months_after_transplantation)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is within the first three months after transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_acute_rejection_of_renal_transplant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute rejection of a renal transplant.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute rejection of a renal transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute rejection of a renal transplant.","meaning":"Boolean indicating whether the patient currently has acute rejection of a renal transplant."} ;; "acute renal allograft rejection"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_acute_rejection_of_renal_transplant_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute renal allograft rejection."
