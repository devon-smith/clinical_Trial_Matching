;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_biomass_smoke_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of exposure to biomass smoke at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of exposure to biomass smoke at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to biomass smoke.","meaning":"Boolean indicating whether the patient has ever been exposed to biomass smoke at any time in the past."} ;; "has a history of exposure to biomass smoke."
(declare-const patient_is_exposed_to_smoke_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of exposure to smoke (including biomass smoke) at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of exposure to smoke at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to smoke.","meaning":"Boolean indicating whether the patient has ever been exposed to smoke at any time in the past."} ;; "smoke"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Biomass smoke exposure is a subtype of smoke exposure
(assert
(! (=> patient_is_exposed_to_biomass_smoke_inthehistory
       patient_is_exposed_to_smoke_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "biomass smoke" is a type of "smoke"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_exposed_to_biomass_smoke_inthehistory)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of exposure to biomass smoke."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient's current age in years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 40))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than forty years old."

(assert
(! (not (> patient_age_value_recorded_now_in_years 75))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is older than seventy-five years old."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute exacerbation of chronic obstructive airways disease (COPD exacerbation).","when_to_set_to_false":"Set to false if the patient currently does not have an acute exacerbation of chronic obstructive airways disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute exacerbation of chronic obstructive airways disease.","meaning":"Boolean indicating whether the patient currently has an acute exacerbation of chronic obstructive airways disease."} ;; "exacerbation of chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current exacerbation of chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_asthma_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of tuberculosis.","meaning":"Boolean indicating whether the patient currently has tuberculosis."} ;; "tuberculosis"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disorder of lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disorder of lung (pulmonary disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of disorder of lung (pulmonary disease).","meaning":"Boolean indicating whether the patient currently has disorder of lung (pulmonary disease)."} ;; "pulmonary diseases"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_tuberculosis_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tuberculosis."

(assert
  (! (not patient_has_finding_of_disorder_of_lung_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other pulmonary diseases."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_allergic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any allergic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any allergic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any allergic disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any allergic disorder."} ;; "allergic disorders"
(declare-const patient_has_diagnosis_of_autoimmune_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any autoimmune disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any autoimmune disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any autoimmune disease."} ;; "autoimmune disorders"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_allergic_disorder_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergic disorders."

(assert
(! (not patient_has_diagnosis_of_autoimmune_disease_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has autoimmune disorders."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder due to infection (i.e., an active infection).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "active infections"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active infections."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "immunodeficiency"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_immunodeficiency_disorder_now
            patient_has_finding_of_human_immunodeficiency_virus_infection_now))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has immunodeficiency) OR (the patient has human immunodeficiency virus infection)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_disease_caused_by_parasite_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of a disease caused by a parasite.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of a disease caused by a parasite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease caused by a parasite.","meaning":"Boolean indicating whether the patient currently has a disease caused by a parasite."} ;; "parasitological diseases"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_disease_caused_by_parasite_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has parasitological diseases."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} ;; "malignancies"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignancies."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently provided informed consent.","when_to_set_to_false":"Set to false if the patient currently has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has provided informed consent.","meaning":"Boolean indicating whether the patient currently has provided informed consent."} ;; "lacks informed consent."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_informed_consent_now)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lacks informed consent."
