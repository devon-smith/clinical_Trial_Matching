;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pneumonia."} ;; "the patient has a current diagnosis of pneumonia"

(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has the clinical finding of pneumonia."} ;; "the patient meets the study definition of clinically defined pneumonia at the time of screening"

(declare-const patient_has_finding_of_pneumonia_now@@clinically_defined Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia finding meets the study definition of 'clinically defined'.","when_to_set_to_false":"Set to false if the patient's current pneumonia finding does not meet the study definition of 'clinically defined'.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia finding meets the study definition of 'clinically defined'.","meaning":"Boolean indicating whether the patient's current pneumonia finding meets the study definition of 'clinically defined'."} ;; "the patient meets the study definition of clinically defined pneumonia at the time of screening"

(declare-const patient_has_finding_of_pneumonia_now@@present_at_time_of_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia finding is present at the time of screening.","when_to_set_to_false":"Set to false if the patient's current pneumonia finding is not present at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia finding is present at the time of screening.","meaning":"Boolean indicating whether the patient's current pneumonia finding is present at the time of screening."} ;; "at the time of screening"

(declare-const patient_is_receiving_antibiotics_now_for_treatment_of_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antibiotics for the treatment of pneumonia.","when_to_set_to_false":"Set to false if the patient is not currently receiving antibiotics for the treatment of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antibiotics for the treatment of pneumonia.","meaning":"Boolean indicating whether the patient is currently receiving antibiotics for the treatment of pneumonia."} ;; "the patient is currently receiving antibiotics for treatment of pneumonia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pneumonia_now@@clinically_defined
       patient_has_finding_of_pneumonia_now)
   :named REQ0_AUXILIARY0)) ;; "the patient meets the study definition of clinically defined pneumonia at the time of screening"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pneumonia_now@@present_at_time_of_screening
       patient_has_finding_of_pneumonia_now)
   :named REQ0_AUXILIARY1)) ;; "at the time of screening"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a current diagnosis of pneumonia
(assert
(! (not patient_has_diagnosis_of_pneumonia_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a current diagnosis of pneumonia"

;; Exclusion: patient must NOT be currently receiving antibiotics for treatment of pneumonia
(assert
(! (not patient_is_receiving_antibiotics_now_for_treatment_of_pneumonia)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is currently receiving antibiotics for treatment of pneumonia"

;; Exclusion: patient must NOT meet the study definition of clinically defined pneumonia at the time of screening
(assert
(! (not (and patient_has_finding_of_pneumonia_now@@clinically_defined
             patient_has_finding_of_pneumonia_now@@present_at_time_of_screening))
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient meets the study definition of clinically defined pneumonia at the time of screening"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const absolute_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current absolute neutrophil count measured in number per cubic millimeter if available.","when_to_set_to_null":"Set to null if the patient's current absolute neutrophil count is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current absolute neutrophil count in number per cubic millimeter."} ;; "absolute neutrophil count less than 1,000 per cubic millimeter"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< absolute_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter 1000))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an absolute neutrophil count less than 1,000 per cubic millimeter."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "the patient has human immunodeficiency virus infection"

(declare-const patient_absolute_cd4_count_procedure_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's CD4 lymphocyte count (cells per cubic millimeter) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's CD4 lymphocyte count (cells per cubic millimeter) recorded now."} ;; "the patient's last known CD4 lymphocyte count is less than 500 per cubic millimeter"

(declare-const patient_absolute_cd4_count_procedure_value_recorded_now_withunit_per_cubic_millimeter@@last_known_value Bool) ;; {"when_to_set_to_true":"Set to true if the value represents the patient's last known CD4 lymphocyte count.","when_to_set_to_false":"Set to false if the value does not represent the patient's last known CD4 lymphocyte count.","when_to_set_to_null":"Set to null if it is unknown whether the value is the last known CD4 lymphocyte count.","meaning":"Boolean indicating whether the numeric value is the patient's last known CD4 lymphocyte count."} ;; "the patient's last known CD4 lymphocyte count"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
             patient_absolute_cd4_count_procedure_value_recorded_now_withunit_per_cubic_millimeter@@last_known_value
             (< patient_absolute_cd4_count_procedure_value_recorded_now_withunit_per_cubic_millimeter 500)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has human immunodeficiency virus infection) AND (the patient's last known CD4 lymphocyte count is less than 500 per cubic millimeter))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone transplantation (of any organ) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone transplantation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone transplantation.","meaning":"Boolean indicating whether the patient has ever undergone transplantation at any time in the past."} ;; "the patient is a recipient of organ transplantation"
(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving immunosuppressive therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving immunosuppressive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently receiving immunosuppressive therapy."} ;; "the patient is receiving immunosuppressive therapy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_has_undergone_transplantation_inthehistory
             patient_is_undergoing_immunosuppressive_therapy_now))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a recipient of organ transplantation) AND (the patient is receiving immunosuppressive therapy))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of lymphoid, hemopoietic, and related tissue (hematologic malignancy).","meaning":"Boolean indicating whether the patient currently has a hematologic malignancy (malignant tumor of lymphoid, hemopoietic, and related tissue)."} ;; "hematologic malignancy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current hematologic malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of cystic fibrosis at any time in their medical history (prior to now).","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of cystic fibrosis at any time in their medical history (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient has ever had a documented diagnosis of cystic fibrosis in their medical history."} ;; "previously documented cystic fibrosis"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_cystic_fibrosis_inthehistory)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously documented cystic fibrosis."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_traumatic_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic injury.","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic injury.","meaning":"Boolean indicating whether the patient currently has a traumatic injury."} ;; "trauma"

(declare-const patient_has_finding_of_traumatic_injury_now@@craniofacial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current traumatic injury is craniofacial.","when_to_set_to_false":"Set to false if the patient's current traumatic injury is not craniofacial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current traumatic injury is craniofacial.","meaning":"Boolean indicating whether the patient's current traumatic injury is craniofacial."} ;; "craniofacial trauma"

(declare-const patient_has_finding_of_traumatic_injury_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current traumatic injury is severe.","when_to_set_to_false":"Set to false if the patient's current traumatic injury is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current traumatic injury is severe.","meaning":"Boolean indicating whether the patient's current traumatic injury is severe."} ;; "severe trauma"

(declare-const patient_has_condition_expected_to_require_imminent_tracheostomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another medical condition that is expected to require imminent tracheostomy.","when_to_set_to_false":"Set to false if the patient currently does not have another medical condition that is expected to require imminent tracheostomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another medical condition that is expected to require imminent tracheostomy.","meaning":"Boolean indicating whether the patient currently has another medical condition that is expected to require imminent tracheostomy."} ;; "another medical condition expected to require imminent tracheostomy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_traumatic_injury_now@@craniofacial
patient_has_finding_of_traumatic_injury_now)
:named REQ6_AUXILIARY0)) ;; "craniofacial trauma"

(assert
(! (=> patient_has_finding_of_traumatic_injury_now@@severe
patient_has_finding_of_traumatic_injury_now)
:named REQ6_AUXILIARY1)) ;; "severe trauma"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have severe craniofacial trauma
(assert
(! (not (and patient_has_finding_of_traumatic_injury_now@@craniofacial
             patient_has_finding_of_traumatic_injury_now@@severe))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe craniofacial trauma."

;; Exclusion: patient must NOT have another medical condition expected to require imminent tracheostomy
(assert
(! (not patient_has_condition_expected_to_require_imminent_tracheostomy_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another medical condition expected to require imminent tracheostomy."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_in_favor_of_aggressive_medical_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in favor of aggressive medical management.","when_to_set_to_false":"Set to false if the patient is currently not in favor of aggressive medical management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in favor of aggressive medical management.","meaning":"Boolean indicating whether the patient is currently in favor of aggressive medical management."} ;; "the patient is not in favor of aggressive medical management"
(declare-const patient_family_is_in_favor_of_aggressive_medical_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's family is currently in favor of aggressive medical management.","when_to_set_to_false":"Set to false if the patient's family is currently not in favor of aggressive medical management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's family is currently in favor of aggressive medical management.","meaning":"Boolean indicating whether the patient's family is currently in favor of aggressive medical management."} ;; "the patient's family is not in favor of aggressive medical management"
(declare-const patient_physician_is_in_favor_of_aggressive_medical_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physician is currently in favor of aggressive medical management.","when_to_set_to_false":"Set to false if the patient's physician is currently not in favor of aggressive medical management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physician is currently in favor of aggressive medical management.","meaning":"Boolean indicating whether the patient's physician is currently in favor of aggressive medical management."} ;; "the patient's physician is not in favor of aggressive medical management"
(declare-const advanced_directive_to_withhold_life_sustaining_treatment_exists_now Bool) ;; {"when_to_set_to_true":"Set to true if there is currently an advanced directive to withhold life-sustaining treatment.","when_to_set_to_false":"Set to false if there is currently no advanced directive to withhold life-sustaining treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is currently an advanced directive to withhold life-sustaining treatment.","meaning":"Boolean indicating whether there is currently an advanced directive to withhold life-sustaining treatment."} ;; "there is an advanced directive to withhold life-sustaining treatment"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (not patient_is_in_favor_of_aggressive_medical_management_now))
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is not in favor of aggressive medical management."

(assert
(! (not (not patient_family_is_in_favor_of_aggressive_medical_management_now))
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient's family is not in favor of aggressive medical management."

(assert
(! (not (not patient_physician_is_in_favor_of_aggressive_medical_management_now))
:named REQ7_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient's physician is not in favor of aggressive medical management."

(assert
(! (not (not (not advanced_directive_to_withhold_life_sustaining_treatment_exists_now)))
:named REQ7_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if there is an advanced directive to withhold life-sustaining treatment."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_moribund_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a moribund state.","when_to_set_to_false":"Set to false if the patient is currently not in a moribund state.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a moribund state.","meaning":"Boolean indicating whether the patient is currently in a moribund state."} ;; "the patient is in a moribund state"

(declare-const patient_expected_survival_duration_now_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient is expected to survive from now, based on current medical assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient is expected to survive from now.","meaning":"Numeric value representing the number of days the patient is expected to survive from now."} ;; "the patient is expected to survive less than 21 days"

(declare-const patient_expected_survival_duration_now_in_days@@due_to_uncorrectable_medical_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's expected survival duration is limited due to an uncorrectable medical condition.","when_to_set_to_false":"Set to false if the patient's expected survival duration is not limited due to an uncorrectable medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the limited survival is due to an uncorrectable medical condition.","meaning":"Boolean indicating whether the patient's expected survival duration is limited due to an uncorrectable medical condition."} ;; "due to an uncorrectable medical condition"

(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease or medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have a disease or medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease or medical condition.","meaning":"Boolean indicating whether the patient currently has a disease or medical condition."} ;; "medical condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@uncorrectable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease or medical condition is uncorrectable.","when_to_set_to_false":"Set to false if the patient's current disease or medical condition is correctable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease or medical condition is uncorrectable.","meaning":"Boolean indicating whether the patient's current disease or medical condition is uncorrectable."} ;; "uncorrectable medical condition"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_expected_survival_duration_now_in_days@@due_to_uncorrectable_medical_condition
      (< patient_expected_survival_duration_now_in_days 21))
:named REQ8_AUXILIARY0)) ;; "expected to survive less than 21 days due to an uncorrectable medical condition"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@uncorrectable
      patient_has_finding_of_disease_condition_finding_now)
:named REQ8_AUXILIARY1)) ;; "uncorrectable medical condition"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient is in a moribund state
(assert
(! (not (not patient_has_finding_of_moribund_now))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is in a moribund state"

;; Exclusion: patient is expected to survive less than 21 days due to an uncorrectable medical condition
(assert
(! (not (and
         (< patient_expected_survival_duration_now_in_days 21)
         patient_expected_survival_duration_now_in_days@@due_to_uncorrectable_medical_condition))
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is expected to survive less than 21 days due to an uncorrectable medical condition"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_undergone_clinical_trial_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical trial procedure within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical trial procedure within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical trial procedure within the past 30 days.","meaning":"Boolean indicating whether the patient has undergone a clinical trial procedure within the past 30 days."} ;; "clinical trial"
(declare-const patient_has_undergone_clinical_trial_inthepast30days@@involved_any_unlicensed_drug Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial the patient underwent within the past 30 days involved any unlicensed drug.","when_to_set_to_false":"Set to false if the clinical trial did not involve any unlicensed drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial involved any unlicensed drug.","meaning":"Boolean indicating whether the clinical trial procedure within the past 30 days involved any unlicensed drug."} ;; "the patient has participated in a clinical trial of any unlicensed drug within 30 days prior to the first dose of study drug"
(declare-const patient_has_undergone_clinical_trial_inthepast30days@@involved_any_unlicensed_biologic Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial the patient underwent within the past 30 days involved any unlicensed biologic.","when_to_set_to_false":"Set to false if the clinical trial did not involve any unlicensed biologic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial involved any unlicensed biologic.","meaning":"Boolean indicating whether the clinical trial procedure within the past 30 days involved any unlicensed biologic."} ;; "the patient has participated in a clinical trial of any unlicensed biologic within 30 days prior to the first dose of study drug"
(declare-const patient_has_undergone_clinical_trial_inthepast30days@@involved_any_unlicensed_device Bool) ;; {"when_to_set_to_true":"Set to true if the clinical trial the patient underwent within the past 30 days involved any unlicensed device.","when_to_set_to_false":"Set to false if the clinical trial did not involve any unlicensed device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical trial involved any unlicensed device.","meaning":"Boolean indicating whether the clinical trial procedure within the past 30 days involved any unlicensed device."} ;; "the patient has participated in a clinical trial of any unlicensed device within 30 days prior to the first dose of study drug"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_clinical_trial_inthepast30days@@involved_any_unlicensed_drug
      patient_has_undergone_clinical_trial_inthepast30days)
:named REQ9_AUXILIARY0)) ;; "the patient has participated in a clinical trial of any unlicensed drug within 30 days prior to the first dose of study drug"

(assert
(! (=> patient_has_undergone_clinical_trial_inthepast30days@@involved_any_unlicensed_biologic
      patient_has_undergone_clinical_trial_inthepast30days)
:named REQ9_AUXILIARY1)) ;; "the patient has participated in a clinical trial of any unlicensed biologic within 30 days prior to the first dose of study drug"

(assert
(! (=> patient_has_undergone_clinical_trial_inthepast30days@@involved_any_unlicensed_device
      patient_has_undergone_clinical_trial_inthepast30days)
:named REQ9_AUXILIARY2)) ;; "the patient has participated in a clinical trial of any unlicensed device within 30 days prior to the first dose of study drug"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_undergone_clinical_trial_inthepast30days@@involved_any_unlicensed_drug)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has participated in a clinical trial of any unlicensed drug within 30 days prior to the first dose of study drug"

(assert
(! (not patient_has_undergone_clinical_trial_inthepast30days@@involved_any_unlicensed_biologic)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has participated in a clinical trial of any unlicensed biologic within 30 days prior to the first dose of study drug"

(assert
(! (not patient_has_undergone_clinical_trial_inthepast30days@@involved_any_unlicensed_device)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has participated in a clinical trial of any unlicensed device within 30 days prior to the first dose of study drug"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_concurrently_participating_in_clinical_trial_of_unlicensed_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial of any unlicensed drug.","when_to_set_to_false":"Set to false if the patient is currently not participating in a clinical trial of any unlicensed drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical trial of any unlicensed drug.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial of any unlicensed drug."} ;; "the patient is concurrently participating in a clinical trial of any unlicensed drug"
(declare-const patient_is_concurrently_participating_in_clinical_trial_of_unlicensed_biologic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial of any unlicensed biologic.","when_to_set_to_false":"Set to false if the patient is currently not participating in a clinical trial of any unlicensed biologic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical trial of any unlicensed biologic.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial of any unlicensed biologic."} ;; "the patient is concurrently participating in a clinical trial of any unlicensed biologic"
(declare-const patient_is_concurrently_participating_in_clinical_trial_of_unlicensed_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial of any unlicensed device.","when_to_set_to_false":"Set to false if the patient is currently not participating in a clinical trial of any unlicensed device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical trial of any unlicensed device.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial of any unlicensed device."} ;; "the patient is concurrently participating in a clinical trial of any unlicensed device"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not (or patient_is_concurrently_participating_in_clinical_trial_of_unlicensed_drug_now
              patient_is_concurrently_participating_in_clinical_trial_of_unlicensed_biologic_now
              patient_is_concurrently_participating_in_clinical_trial_of_unlicensed_device_now))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is concurrently participating in a clinical trial of any unlicensed drug) OR (the patient is concurrently participating in a clinical trial of any unlicensed biologic) OR (the patient is concurrently participating in a clinical trial of any unlicensed device))."
