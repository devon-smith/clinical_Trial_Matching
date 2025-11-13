;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_smoke_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to smoke at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to smoke at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to smoke.","meaning":"Boolean indicating whether the patient has ever been exposed to smoke in their history."} ;; "has a history of exposure to biomass smoke."
(declare-const patient_is_exposed_to_smoke_inthehistory@@is_biomass_smoke Bool) ;; {"when_to_set_to_true":"Set to true if the smoke exposure in the patient's history is specifically biomass smoke.","when_to_set_to_false":"Set to false if the smoke exposure in the patient's history is not biomass smoke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the smoke exposure is biomass smoke.","meaning":"Boolean indicating whether the smoke exposure in the patient's history is specifically biomass smoke."} ;; "biomass smoke"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_smoke_inthehistory@@is_biomass_smoke
      patient_is_exposed_to_smoke_inthehistory)
:named REQ0_AUXILIARY0)) ;; "biomass smoke" exposure implies smoke exposure

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_exposed_to_smoke_inthehistory@@is_biomass_smoke)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of exposure to biomass smoke."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is less than 40 years old OR the patient is greater than 75 years old"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (< patient_age_value_recorded_now_in_years 40))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than 40 years old."

(assert
  (! (not (> patient_age_value_recorded_now_in_years 75))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is greater than 75 years old."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute exacerbation of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have an acute exacerbation of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute exacerbation of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has an acute exacerbation of chronic obstructive pulmonary disease (COPD)."} ;; "current exacerbation of chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current exacerbation of chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_asthma_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has concomitant asthma."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of tuberculosis."} ;; "tuberculosis"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disorder of the lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disorder of the lung (pulmonary disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disorder of the lung (pulmonary disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disorder of the lung (pulmonary disease)."} ;; "pulmonary diseases"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_tuberculosis_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tuberculosis."

(assert
(! (not patient_has_diagnosis_of_disorder_of_lung_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other pulmonary diseases."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_allergic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any allergic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have any allergic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any allergic disorder.","meaning":"Boolean indicating whether the patient currently has any allergic disorder."} ;; "allergic disorders"
(declare-const patient_has_finding_of_autoimmune_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any autoimmune disease.","when_to_set_to_false":"Set to false if the patient currently does not have any autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any autoimmune disease.","meaning":"Boolean indicating whether the patient currently has any autoimmune disease."} ;; "autoimmune disorders"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_allergic_disorder_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergic disorders."

(assert
(! (not patient_has_finding_of_autoimmune_disease_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has autoimmune disorders."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder due to infection (i.e., an active infection).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder due to infection."} ;; "active infections"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_due_to_infection_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active infections."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any immunodeficiency disorder."} ;; "immunodeficiency"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus (HIV) infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus (HIV) infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus (HIV) infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus (HIV) infection."} ;; "human immunodeficiency virus infection"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
      patient_has_diagnosis_of_immunodeficiency_disorder_now)
   :named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (human immunodeficiency virus infection)."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_immunodeficiency_disorder_now)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunodeficiency with non-exhaustive examples (human immunodeficiency virus infection)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_disease_caused_by_parasite_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disease caused by a parasite.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disease caused by a parasite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disease caused by a parasite.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disease caused by a parasite."} ;; "parasitological diseases"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_disease_caused_by_parasite_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has parasitological diseases."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} ;; "malignancies"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignancies."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_given_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent at the current time.","when_to_set_to_false":"Set to false if the patient has not provided informed consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent at the current time.","meaning":"Boolean indicating whether the patient has provided informed consent at the current time."} ;; "lacks informed consent"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_given_informed_consent_now)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lacks informed consent."
