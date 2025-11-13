;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_serious_concomitant_non_oncological_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious concomitant non-oncological disease.","when_to_set_to_false":"Set to false if the patient currently does not have a serious concomitant non-oncological disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious concomitant non-oncological disease.","meaning":"Boolean indicating whether the patient currently has a serious concomitant non-oncological disease."} ;; "the patient has a serious concomitant non-oncological disease"

(declare-const patient_has_serious_concomitant_non_oncological_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious concomitant non-oncological illness.","when_to_set_to_false":"Set to false if the patient currently does not have a serious concomitant non-oncological illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious concomitant non-oncological illness.","meaning":"Boolean indicating whether the patient currently has a serious concomitant non-oncological illness."} ;; "the patient has a serious concomitant non-oncological illness"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_serious_concomitant_non_oncological_disease_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious concomitant non-oncological disease."

(assert
(! (not patient_has_serious_concomitant_non_oncological_illness_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious concomitant non-oncological illness."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of secondary malignant neoplasm of brain (brain metastases).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of secondary malignant neoplasm of brain (brain metastases).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of secondary malignant neoplasm of brain (brain metastases).","meaning":"Boolean indicating whether the patient currently has a clinical finding of secondary malignant neoplasm of brain (brain metastases)."} ;; "brain metastases"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active brain metastases (secondary malignant neoplasm of brain).","when_to_set_to_false":"Set to false if the patient currently has brain metastases but they are not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the brain metastases are active.","meaning":"Boolean indicating whether the patient's current brain metastases are active."} ;; "active brain metastases"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptomatic brain metastases (secondary malignant neoplasm of brain).","when_to_set_to_false":"Set to false if the patient currently has brain metastases but they are not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the brain metastases are symptomatic.","meaning":"Boolean indicating whether the patient's current brain metastases are symptomatic."} ;; "symptomatic brain metastases"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@active
      patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now)
   :named REQ1_AUXILIARY0)) ;; "active brain metastases" implies "brain metastases"

(assert
(! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@symptomatic
      patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now)
   :named REQ1_AUXILIARY1)) ;; "symptomatic brain metastases" implies "brain metastases"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@active)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active brain metastases."

(assert
(! (not patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@symptomatic)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptomatic brain metastases."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a second malignancy (secondary malignant neoplastic disease).","when_to_set_to_false":"Set to false if the patient currently does not have a second malignancy (secondary malignant neoplastic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a second malignancy (secondary malignant neoplastic disease).","meaning":"Boolean indicating whether the patient currently has a second malignancy (secondary malignant neoplastic disease)."} ;; "second malignancy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_secondary_malignant_neoplastic_disease_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a second malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Link alternate breastfeeding variable to main variable
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ3_AUXILIARY0)) ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
(! (not patient_is_breastfeeding_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} ;; "sexually active"
(declare-const patient_is_unwilling_to_use_medically_acceptable_method_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to use a medically acceptable method of contraception.","when_to_set_to_false":"Set to false if the patient is currently willing to use a medically acceptable method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to use a medically acceptable method of contraception.","meaning":"Boolean indicating whether the patient is currently unwilling to use a medically acceptable method of contraception."} ;; "unwilling to use a medically acceptable method of contraception"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any method of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any method of contraception.","meaning":"Boolean indicating whether the patient is currently using any method of contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@medically_acceptable_method Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a method of contraception that is medically acceptable.","when_to_set_to_false":"Set to false if the patient is currently using a method of contraception that is not medically acceptable, or is not using contraception at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the method of contraception is medically acceptable.","meaning":"Boolean indicating whether the patient's current method of contraception is medically acceptable."} ;; "medically acceptable method of contraception"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_contraception_now@@medically_acceptable_method
       patient_has_finding_of_contraception_now)
:named REQ4_AUXILIARY0)) ;; "medically acceptable method of contraception" implies "contraception"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient is sexually active AND unwilling to use a medically acceptable method of contraception
(assert
(! (not (and patient_has_finding_of_sexually_active_now
             patient_is_unwilling_to_use_medically_acceptable_method_of_contraception_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is sexually active) AND (the patient is unwilling to use a medically acceptable method of contraception)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone any therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any therapy.","meaning":"Boolean indicating whether the patient has ever undergone any therapy at any time in the past."} ;; "therapy"
(declare-const patient_has_undergone_therapy_inthehistory@@is_cytotoxic_anti_cancer_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the therapy undergone by the patient at any time in the past is cytotoxic anti-cancer therapy.","when_to_set_to_false":"Set to false if the therapy undergone by the patient at any time in the past is not cytotoxic anti-cancer therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy undergone is cytotoxic anti-cancer therapy.","meaning":"Boolean indicating whether the therapy undergone is cytotoxic anti-cancer therapy."} ;; "cytotoxic anti-cancer therapy"
(declare-const patient_has_undergone_therapy_inthehistory@@temporalcontext_within_4_weeks_of_first_treatment_with_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the therapy undergone by the patient occurred within four weeks of the patient's first treatment with the study medication.","when_to_set_to_false":"Set to false if the therapy undergone by the patient did not occur within four weeks of the patient's first treatment with the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy occurred within four weeks of the patient's first treatment with the study medication.","meaning":"Boolean indicating whether the therapy occurred within four weeks of the patient's first treatment with the study medication."} ;; "within four weeks of the first treatment with the study medication"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any drug or medicament at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any drug or medicament at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient has ever been exposed to any drug or medicament at any time in the past."} ;; "drug"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@is_investigational_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed is an investigational drug.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed is not an investigational drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament is investigational."} ;; "investigational drug"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_4_weeks_of_first_treatment_with_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to investigational drug occurred within four weeks of the patient's first treatment with the study medication.","when_to_set_to_false":"Set to false if the exposure to investigational drug did not occur within four weeks of the patient's first treatment with the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within four weeks of first study medication treatment.","meaning":"Boolean indicating whether the exposure to investigational drug occurred within four weeks of first study medication treatment."} ;; "within four weeks of the first treatment with the study medication"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable for cytotoxic anti-cancer therapy
(assert
(! (=> patient_has_undergone_therapy_inthehistory@@is_cytotoxic_anti_cancer_therapy
      patient_has_undergone_therapy_inthehistory)
:named REQ5_AUXILIARY0)) ;; "cytotoxic anti-cancer therapy"

;; Qualifier variable implies stem variable for investigational drug
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@is_investigational_drug
      patient_is_exposed_to_drug_or_medicament_inthehistory)
:named REQ5_AUXILIARY1)) ;; "investigational drug"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: cytotoxic anti-cancer therapy within 4 weeks of first study medication
(assert
(! (not (and patient_has_undergone_therapy_inthehistory@@is_cytotoxic_anti_cancer_therapy
             patient_has_undergone_therapy_inthehistory@@temporalcontext_within_4_weeks_of_first_treatment_with_study_medication))
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "has received treatment with cytotoxic anti-cancer therapy within four weeks of the first treatment with the study medication."

;; Exclusion: investigational drug within 4 weeks of first study medication
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_inthehistory@@is_investigational_drug
             patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_4_weeks_of_first_treatment_with_study_medication))
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "has received treatment with investigational drug within four weeks of the first treatment with the study medication."
