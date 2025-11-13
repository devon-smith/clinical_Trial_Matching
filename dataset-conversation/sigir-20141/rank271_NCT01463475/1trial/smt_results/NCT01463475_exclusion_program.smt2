;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_i_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus type 1 infection or risk factors for it.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus type 1 infection nor risk factors for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus type 1 infection or risk factors for it.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus type 1 infection or risk factors for it."} ;; "risk factors for human immunodeficiency virus infection (type 1)" and "clinical evidence of human immunodeficiency virus infection (type 1)"

(declare-const patient_has_finding_of_human_immunodeficiency_virus_ii_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus type 2 infection or risk factors for it.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus type 2 infection nor risk factors for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus type 2 infection or risk factors for it.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus type 2 infection or risk factors for it."} ;; "risk factors for human immunodeficiency virus infection (type 2)" and "clinical evidence of human immunodeficiency virus infection (type 2)"

(declare-const patient_has_finding_of_type_b_viral_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatitis B virus infection or risk factors for it.","when_to_set_to_false":"Set to false if the patient currently does not have hepatitis B virus infection nor risk factors for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis B virus infection or risk factors for it.","meaning":"Boolean indicating whether the patient currently has hepatitis B virus infection or risk factors for it."} ;; "risk factors for hepatitis B virus infection" and "clinical evidence of hepatitis B virus infection"

(declare-const patient_has_finding_of_viral_hepatitis_c_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatitis C virus infection or risk factors for it.","when_to_set_to_false":"Set to false if the patient currently does not have hepatitis C virus infection nor risk factors for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis C virus infection or risk factors for it.","meaning":"Boolean indicating whether the patient currently has hepatitis C virus infection or risk factors for it."} ;; "risk factors for hepatitis C virus infection" and "clinical evidence of hepatitis C virus infection"

(declare-const patient_has_finding_of_human_t_lymphotropic_virus_1_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human T-lymphotropic virus type I infection or risk factors for it.","when_to_set_to_false":"Set to false if the patient currently does not have human T-lymphotropic virus type I infection nor risk factors for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human T-lymphotropic virus type I infection or risk factors for it.","meaning":"Boolean indicating whether the patient currently has human T-lymphotropic virus type I infection or risk factors for it."} ;; "risk factors for human T-lymphotrophic virus infection (type I)" and "clinical evidence of human T-lymphotrophic virus infection (type I)"

(declare-const patient_has_finding_of_human_t_lymphotropic_virus_2_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human T-lymphotropic virus type II infection or risk factors for it.","when_to_set_to_false":"Set to false if the patient currently does not have human T-lymphotropic virus type II infection nor risk factors for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human T-lymphotropic virus type II infection or risk factors for it.","meaning":"Boolean indicating whether the patient currently has human T-lymphotropic virus type II infection or risk factors for it."} ;; "risk factors for human T-lymphotrophic virus infection (type II)" and "clinical evidence of human T-lymphotrophic virus infection (type II)"

(declare-const patient_has_finding_of_prion_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has prion disease.","when_to_set_to_false":"Set to false if the patient currently does not have prion disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has prion disease.","meaning":"Boolean indicating whether the patient currently has prion disease."} ;; "clinical evidence of human transmissible spongiform encephalopathy with non-exhaustive examples (Creutzfeldt-Jakob disease)"

(declare-const patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has risk factors for variant Creutzfeldt-Jakob disease.","when_to_set_to_false":"Set to false if the patient currently does not have risk factors for variant Creutzfeldt-Jakob disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has risk factors for variant Creutzfeldt-Jakob disease.","meaning":"Boolean indicating whether the patient currently has risk factors for variant Creutzfeldt-Jakob disease."} ;; "risk factors for human transmissible spongiform encephalopathy with non-exhaustive examples (Creutzfeldt-Jakob disease)"

(declare-const patient_has_finding_of_syphilis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has syphilis or risk factors for it.","when_to_set_to_false":"Set to false if the patient currently does not have syphilis nor risk factors for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has syphilis or risk factors for it.","meaning":"Boolean indicating whether the patient currently has syphilis or risk factors for it."} ;; "risk factors for treponema pallidum infection" and "clinical evidence of treponema pallidum infection"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive example: Creutzfeldt-Jakob disease is an example of prion disease
(assert
(! (=> patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_now
patient_has_finding_of_prion_disease_now)
:named REQ0_AUXILIARY0)) ;; "risk factors for human transmissible spongiform encephalopathy with non-exhaustive examples (Creutzfeldt-Jakob disease)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_i_infection_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "risk factors for human immunodeficiency virus infection (type 1)" OR "clinical evidence of human immunodeficiency virus infection (type 1)"

(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_ii_infection_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "risk factors for human immunodeficiency virus infection (type 2)" OR "clinical evidence of human immunodeficiency virus infection (type 2)"

(assert
(! (not patient_has_finding_of_type_b_viral_hepatitis_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "risk factors for hepatitis B virus infection" OR "clinical evidence of hepatitis B virus infection"

(assert
(! (not patient_has_finding_of_viral_hepatitis_c_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "risk factors for hepatitis C virus infection" OR "clinical evidence of hepatitis C virus infection"

(assert
(! (not patient_has_finding_of_human_t_lymphotropic_virus_1_infection_now)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "risk factors for human T-lymphotrophic virus infection (type I)" OR "clinical evidence of human T-lymphotrophic virus infection (type I)"

(assert
(! (not patient_has_finding_of_human_t_lymphotropic_virus_2_infection_now)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "risk factors for human T-lymphotrophic virus infection (type II)" OR "clinical evidence of human T-lymphotrophic virus infection (type II)"

(assert
(! (not patient_has_finding_of_prion_disease_now)
:named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "clinical evidence of human transmissible spongiform encephalopathy with non-exhaustive examples (Creutzfeldt-Jakob disease)"

(assert
(! (not patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_now)
:named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "risk factors for human transmissible spongiform encephalopathy with non-exhaustive examples (Creutzfeldt-Jakob disease)"

(assert
(! (not patient_has_finding_of_syphilis_now)
:named REQ0_COMPONENT8_OTHER_REQUIREMENTS)) ;; "risk factors for treponema pallidum infection" OR "clinical evidence of treponema pallidum infection"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_xenogeneic_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone xenogeneic transplantation at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone xenogeneic transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone xenogeneic transplantation.","meaning":"Boolean indicating whether the patient has ever undergone xenogeneic transplantation."} ;; "xenotransplantation"
(declare-const patient_has_undergone_xenogeneic_transplantation_inthehistory@@associated_with_communicable_disease_risk Bool) ;; {"when_to_set_to_true":"Set to true if the patient's xenogeneic transplantation procedure is associated with communicable disease risk.","when_to_set_to_false":"Set to false if the patient's xenogeneic transplantation procedure is not associated with communicable disease risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's xenogeneic transplantation procedure is associated with communicable disease risk.","meaning":"Boolean indicating whether the patient's xenogeneic transplantation procedure is associated with communicable disease risk."} ;; "communicable disease risk associated with xenotransplantation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_xenogeneic_transplantation_inthehistory@@associated_with_communicable_disease_risk
      patient_has_undergone_xenogeneic_transplantation_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "associated with communicable disease risk" implies "xenotransplantation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_xenogeneic_transplantation_inthehistory@@associated_with_communicable_disease_risk)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a communicable disease risk associated with xenotransplantation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cytomegalovirus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cytomegalovirus infection (e.g., based on a positive test result).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cytomegalovirus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cytomegalovirus infection.","meaning":"Boolean indicating whether the patient currently has cytomegalovirus infection."} ;; "cytomegalovirus infection"
(declare-const patient_has_finding_of_disease_due_to_west_nile_virus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of West Nile virus infection (e.g., based on a positive test result).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of West Nile virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has West Nile virus infection.","meaning":"Boolean indicating whether the patient currently has West Nile virus infection."} ;; "West Nile virus infection"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_human_immunodeficiency_virus_i_infection_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient tests positive for human immunodeficiency virus infection (type 1)."

(assert
  (! (not patient_has_finding_of_human_immunodeficiency_virus_ii_infection_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient tests positive for human immunodeficiency virus infection (type 2)."

(assert
  (! (not patient_has_finding_of_type_b_viral_hepatitis_now)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient tests positive for hepatitis B virus infection."

(assert
  (! (not patient_has_finding_of_viral_hepatitis_c_now)
     :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient tests positive for hepatitis C virus infection."

(assert
  (! (not patient_has_finding_of_human_t_lymphotropic_virus_1_infection_now)
     :named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient tests positive for human T-lymphotrophic virus infection (type I)."

(assert
  (! (not patient_has_finding_of_human_t_lymphotropic_virus_2_infection_now)
     :named REQ2_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient tests positive for human T-lymphotrophic virus infection (type II)."

(assert
  (! (not patient_has_finding_of_cytomegalovirus_infection_now)
     :named REQ2_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient tests positive for cytomegalovirus infection."

(assert
  (! (not patient_has_finding_of_disease_due_to_west_nile_virus_now)
     :named REQ2_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient tests positive for West Nile virus infection."

(assert
  (! (not patient_has_finding_of_syphilis_now)
     :named REQ2_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient tests positive for treponema pallidum infection."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const investigational_drug_half_life_value_in_days Real) ;; {"when_to_set_to_value":"Set to the numeric value of the investigational drug's half-life in days, if known.","when_to_set_to_null":"Set to null if the half-life of the investigational drug is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the half-life of the investigational drug in days."} ;; "five half-lives of the investigational drug"
(declare-const patient_last_investigational_drug_use_days_ago Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's last use of any investigational drug, if known.","when_to_set_to_null":"Set to null if the number of days since last use is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days since the patient's last use of any investigational drug."} ;; "within thirty days OR five half-lives of the investigational drug, whichever duration is longer"
(declare-const patient_has_used_investigational_drug_within_threshold_timeframe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any investigational drug within the threshold timeframe (the longer of thirty days or five half-lives of the investigational drug) prior to the reference timepoint.","when_to_set_to_false":"Set to false if the patient has not used any investigational drug within the threshold timeframe prior to the reference timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any investigational drug within the threshold timeframe prior to the reference timepoint.","meaning":"Boolean indicating whether the patient has used any investigational drug within the threshold timeframe, defined as the longer of thirty days or five half-lives of the investigational drug."} ;; "within thirty days OR five half-lives of the investigational drug, whichever duration is longer"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: patient_has_used_investigational_drug_within_threshold_timeframe is true iff the last use was within the longer of 30 days or 5 half-lives
(assert
(! (= patient_has_used_investigational_drug_within_threshold_timeframe
(< patient_last_investigational_drug_use_days_ago
    (ite (> 30 (* 5 investigational_drug_half_life_value_in_days))
         30
         (* 5 investigational_drug_half_life_value_in_days))))
:named REQ3_AUXILIARY0)) ;; "within thirty days OR five half-lives of the investigational drug, whichever duration is longer"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_used_investigational_drug_within_threshold_timeframe)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used an investigational drug within thirty days OR five half-lives of the investigational drug, whichever duration is longer."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_used_investigational_implanted_device_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever used an investigational implanted device at any point in their history.","when_to_set_to_false":"Set to false if the patient has never used an investigational implanted device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used an investigational implanted device.","meaning":"Boolean indicating whether the patient has ever used an investigational implanted device."} ;; "has used an investigational implanted device"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_used_investigational_implanted_device_ever)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used an investigational implanted device."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (malignant neoplasm) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (malignant neoplasm) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (malignant neoplasm).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (malignant neoplasm) in their history."} ;; "malignant neoplasm"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malignant neoplasm."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_can_undergo_donation_of_bone_marrow_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo bone marrow donation.","when_to_set_to_false":"Set to false if the patient cannot currently undergo bone marrow donation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo bone marrow donation.","meaning":"Boolean indicating whether the patient can currently undergo bone marrow donation."} ;; "bone marrow donation"
(declare-const patient_can_undergo_donation_of_bone_marrow_now@@safely_provide Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo bone marrow donation and the procedure can be provided safely.","when_to_set_to_false":"Set to false if the patient can currently undergo bone marrow donation but the procedure cannot be provided safely.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether bone marrow donation can be provided safely.","meaning":"Boolean indicating whether the patient can currently undergo bone marrow donation and the procedure can be provided safely."} ;; "safely provide bone marrow donation"
(declare-const patient_has_condition_that_compromises_ability_to_safely_provide_bone_marrow_donation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a condition that compromises the ability to safely provide bone marrow donation.","when_to_set_to_false":"Set to false if the patient currently does not have a condition that compromises the ability to safely provide bone marrow donation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a condition that compromises the ability to safely provide bone marrow donation.","meaning":"Boolean indicating whether the patient currently has a condition that compromises the ability to safely provide bone marrow donation."} ;; "condition that compromises the ability to safely provide bone marrow donation"
(declare-const patient_has_condition_that_compromises_ability_to_safely_provide_bone_marrow_donation_now@@in_opinion_of_hematologist_or_investigator Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the hematologist or the investigator, the patient currently has a condition that compromises the ability to safely provide bone marrow donation.","when_to_set_to_false":"Set to false if, in the opinion of the hematologist or the investigator, the patient currently does not have a condition that compromises the ability to safely provide bone marrow donation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the hematologist or the investigator, the patient currently has a condition that compromises the ability to safely provide bone marrow donation.","meaning":"Boolean indicating whether, in the opinion of the hematologist or the investigator, the patient currently has a condition that compromises the ability to safely provide bone marrow donation."} ;; "in the opinion of the hematologist OR the investigator"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_can_undergo_donation_of_bone_marrow_now@@safely_provide
      patient_can_undergo_donation_of_bone_marrow_now)
:named REQ7_AUXILIARY0)) ;; "safely provide bone marrow donation"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_condition_that_compromises_ability_to_safely_provide_bone_marrow_donation_now@@in_opinion_of_hematologist_or_investigator
      patient_has_condition_that_compromises_ability_to_safely_provide_bone_marrow_donation_now)
:named REQ7_AUXILIARY1)) ;; "in the opinion of the hematologist OR the investigator"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_condition_that_compromises_ability_to_safely_provide_bone_marrow_donation_now@@in_opinion_of_hematologist_or_investigator)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (in the opinion of the hematologist OR the investigator), the patient has a condition that compromises the ability of the patient to safely provide bone marrow donation."
