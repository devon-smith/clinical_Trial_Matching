;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_now@@serious@@concomitant@@non_oncological Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease that is serious, concomitant, and non-oncological.","when_to_set_to_false":"Set to false if the patient currently does not have a disease that is serious, concomitant, and non-oncological.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease that is serious, concomitant, and non-oncological.","meaning":"Boolean indicating whether the patient currently has a disease that is serious, concomitant, and non-oncological (not related to cancer)."} ;; "the patient has a serious concomitant non-oncological disease"
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness.","when_to_set_to_false":"Set to false if the patient currently does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an illness.","meaning":"Boolean indicating whether the patient currently has an illness."} ;; "the patient has a serious concomitant non-oncological illness"
(declare-const patient_has_finding_of_illness_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the illness present in the patient is serious.","when_to_set_to_false":"Set to false if the illness present in the patient is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness present in the patient is serious.","meaning":"Boolean indicating whether the illness present in the patient is serious."} ;; "serious"
(declare-const patient_has_finding_of_illness_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the illness present in the patient is concomitant (occurring at the same time as the index condition or treatment).","when_to_set_to_false":"Set to false if the illness present in the patient is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness present in the patient is concomitant.","meaning":"Boolean indicating whether the illness present in the patient is concomitant."} ;; "concomitant"
(declare-const patient_has_finding_of_illness_now@@non_oncological Bool) ;; {"when_to_set_to_true":"Set to true if the illness present in the patient is non-oncological (not related to cancer).","when_to_set_to_false":"Set to false if the illness present in the patient is oncological (related to cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness present in the patient is non-oncological.","meaning":"Boolean indicating whether the illness present in the patient is non-oncological (not related to cancer)."} ;; "non-oncological"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable for illness
(assert
(! (=> patient_has_finding_of_illness_now@@serious
       patient_has_finding_of_illness_now)
:named REQ0_AUXILIARY0)) ;; "serious"

(assert
(! (=> patient_has_finding_of_illness_now@@concomitant
       patient_has_finding_of_illness_now)
:named REQ0_AUXILIARY1)) ;; "concomitant"

(assert
(! (=> patient_has_finding_of_illness_now@@non_oncological
       patient_has_finding_of_illness_now)
:named REQ0_AUXILIARY2)) ;; "non-oncological"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a serious concomitant non-oncological disease
(assert
(! (not patient_has_finding_of_disease_now@@serious@@concomitant@@non_oncological)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a serious concomitant non-oncological disease"

;; Exclusion: patient must NOT have a serious concomitant non-oncological illness
(assert
(! (not (and patient_has_finding_of_illness_now@@serious
             patient_has_finding_of_illness_now@@concomitant
             patient_has_finding_of_illness_now@@non_oncological))
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a serious concomitant non-oncological illness"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has brain metastases.","when_to_set_to_false":"Set to false if the patient currently does not have brain metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has brain metastases.","meaning":"Boolean indicating whether the patient currently has brain metastases."} ;; "brain metastases"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current brain metastases are active.","when_to_set_to_false":"Set to false if the patient's current brain metastases are not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current brain metastases are active.","meaning":"Boolean indicating whether the patient's current brain metastases are active."} ;; "active brain metastases"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current brain metastases are symptomatic.","when_to_set_to_false":"Set to false if the patient's current brain metastases are not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current brain metastases are symptomatic.","meaning":"Boolean indicating whether the patient's current brain metastases are symptomatic."} ;; "symptomatic brain metastases"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@active
      patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now)
:named REQ1_AUXILIARY0)) ;; "active brain metastases""

(assert
(! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@symptomatic
      patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now)
:named REQ1_AUXILIARY1)) ;; "symptomatic brain metastases""

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@active
            patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@symptomatic))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has active brain metastases) OR (the patient has symptomatic brain metastases)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any secondary malignant neoplastic disease (second malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have any secondary malignant neoplastic disease (second malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any secondary malignant neoplastic disease (second malignancy).","meaning":"Boolean indicating whether the patient currently has any secondary malignant neoplastic disease (second malignancy)."} ;; "second malignancy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_secondary_malignant_neoplastic_disease_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a second malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (or patient_is_pregnant_now patient_is_breastfeeding_now))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is breastfeeding)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} ;; "the patient is sexually active"
(declare-const patient_is_unwilling_to_use_medically_acceptable_method_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to use a medically acceptable method of contraception.","when_to_set_to_false":"Set to false if the patient is currently willing to use a medically acceptable method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to use a medically acceptable method of contraception.","meaning":"Boolean indicating whether the patient is currently unwilling to use a medically acceptable method of contraception."} ;; "the patient is unwilling to use a medically acceptable method of contraception"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_is_sexually_active_now
             patient_is_unwilling_to_use_medically_acceptable_method_of_contraception_now))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is sexually active) AND (the patient is unwilling to use a medically acceptable method of contraception)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const duration_in_weeks_between_last_investigational_drug_treatment_and_first_study_medication_treatment Real) ;; {"when_to_set_to_value":"Set to the number of weeks between the patient's last treatment with investigational drugs and the first treatment with the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the duration in weeks is between the patient's last treatment with investigational drugs and the first treatment with the study medication.","meaning":"Numeric value indicating the duration in weeks between the patient's last treatment with investigational drugs and the first treatment with the study medication."} ;; "within four weeks of the first treatment with the study medication"
(declare-const patient_has_received_treatment_with_cytotoxic_anti_cancer_therapies_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with cytotoxic anti-cancer therapies at any time in the history.","when_to_set_to_false":"Set to false if the patient has not received treatment with cytotoxic anti-cancer therapies at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with cytotoxic anti-cancer therapies at any time in the history.","meaning":"Boolean indicating whether the patient has received treatment with cytotoxic anti-cancer therapies at any time in the history."} ;; "has received treatment with cytotoxic anti-cancer therapies"
(declare-const patient_has_received_treatment_with_investigational_drugs_within_4_weeks_prior_to_first_study_medication_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with investigational drugs within 4 weeks prior to the first treatment with the study medication.","when_to_set_to_false":"Set to false if the patient has not received treatment with investigational drugs within 4 weeks prior to the first treatment with the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with investigational drugs within 4 weeks prior to the first treatment with the study medication.","meaning":"Boolean indicating whether the patient has received treatment with investigational drugs within 4 weeks prior to the first treatment with the study medication."} ;; "has received treatment with investigational drugs within four weeks of the first treatment with the study medication"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Link the duration variable to the Boolean for investigational drugs within 4 weeks
(assert
(! (= patient_has_received_treatment_with_investigational_drugs_within_4_weeks_prior_to_first_study_medication_treatment
     (<= duration_in_weeks_between_last_investigational_drug_treatment_and_first_study_medication_treatment 4))
:named REQ5_AUXILIARY0)) ;; "has received treatment with investigational drugs within four weeks of the first treatment with the study medication"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_received_treatment_with_cytotoxic_anti_cancer_therapies_in_the_history)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with cytotoxic anti-cancer therapies within four weeks of the first treatment with the study medication."

(assert
(! (not patient_has_received_treatment_with_investigational_drugs_within_4_weeks_prior_to_first_study_medication_treatment)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with investigational drugs within four weeks of the first treatment with the study medication."
