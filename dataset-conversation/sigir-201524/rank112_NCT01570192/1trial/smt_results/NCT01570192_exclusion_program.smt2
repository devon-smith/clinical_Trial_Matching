;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"

(declare-const patient_has_finding_of_pneumonia_now@@caused_by_pathogens_resistant_to_meropenem_minimum_inhibitory_concentration_gte_16_micrograms_per_milliliter Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia is caused by pathogens resistant to meropenem (MIC ≥ 16 mcg/mL).","when_to_set_to_false":"Set to false if the patient's current pneumonia is not caused by pathogens resistant to meropenem (MIC ≥ 16 mcg/mL).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia is caused by pathogens resistant to meropenem (MIC ≥ 16 mcg/mL).","meaning":"Boolean indicating whether the patient's current pneumonia is caused by pathogens resistant to meropenem (MIC ≥ 16 mcg/mL)."} ;; "pneumonia caused by pathogens resistant to meropenem (minimum inhibitory concentration ≥ 16 micrograms per milliliter)"

(declare-const patient_has_had_prior_failure_of_meropenem_therapy_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had prior failure of meropenem therapy in the history.","when_to_set_to_false":"Set to false if the patient has not had prior failure of meropenem therapy in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had prior failure of meropenem therapy in the history.","meaning":"Boolean indicating whether the patient has had prior failure of meropenem therapy in the history."} ;; "prior failure of meropenem therapy"

(declare-const patient_has_taken_meropenem_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received meropenem-containing therapy in the past.","when_to_set_to_false":"Set to false if the patient has never received meropenem-containing therapy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received meropenem-containing therapy in the past.","meaning":"Boolean indicating whether the patient has ever received meropenem-containing therapy in the past."} ;; "meropenem-containing therapy in the past"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pneumonia_now@@caused_by_pathogens_resistant_to_meropenem_minimum_inhibitory_concentration_gte_16_micrograms_per_milliliter
      patient_has_finding_of_pneumonia_now)
:named REQ0_AUXILIARY0)) ;; "pneumonia caused by pathogens resistant to meropenem (minimum inhibitory concentration ≥ 16 micrograms per milliliter)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have pneumonia caused by pathogens resistant to meropenem (MIC ≥ 16 mcg/mL)
(assert
(! (not patient_has_finding_of_pneumonia_now@@caused_by_pathogens_resistant_to_meropenem_minimum_inhibitory_concentration_gte_16_micrograms_per_milliliter)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumonia caused by pathogens resistant to meropenem (minimum inhibitory concentration ≥ 16 micrograms per milliliter)."

;; Exclusion: patient must NOT have had prior failure of meropenem therapy
(assert
(! (not patient_has_had_prior_failure_of_meropenem_therapy_in_the_history)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior failure of meropenem therapy."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_contraindication_to_study_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to any study medication.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to any study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to any study medication.","meaning":"Boolean indicating whether the patient currently has a contraindication to any study medication."} ;; "contraindication to any study medication"
(declare-const patient_has_finding_of_allergy_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to any drug or medicament.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to any drug or medicament.","meaning":"Boolean indicating whether the patient currently has a known allergy to any drug or medicament."} ;; "known allergy to any study medication"
(declare-const patient_has_suspicion_of_allergy_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have an allergy to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have an allergy to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have an allergy to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently suspected to have an allergy to any drug or medicament."} ;; "suspected allergy to any study medication"
(declare-const patient_has_finding_of_non_allergic_hypersensitivity_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known non-allergic hypersensitivity to any drug or medicament.","when_to_set_to_false":"Set to false if the patient currently does not have a known non-allergic hypersensitivity to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known non-allergic hypersensitivity to any drug or medicament.","meaning":"Boolean indicating whether the patient currently has a non-allergic hypersensitivity to any drug or medicament."} ;; "known hypersensitivity to any study medication"
(declare-const patient_has_suspicion_of_non_allergic_hypersensitivity_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have a non-allergic hypersensitivity to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have a non-allergic hypersensitivity to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have a non-allergic hypersensitivity to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently suspected to have a non-allergic hypersensitivity to any drug or medicament."} ;; "suspected hypersensitivity to any study medication"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_contraindication_to_study_medication_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindication to any study medication."

(assert
(! (not patient_has_finding_of_allergy_to_drug_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known allergy to any study medication."

(assert
(! (not patient_has_suspicion_of_allergy_to_drug_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected allergy to any study medication."

(assert
(! (not patient_has_finding_of_non_allergic_hypersensitivity_to_drug_or_medicament_now)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to any study medication."

(assert
(! (not patient_has_suspicion_of_non_allergic_hypersensitivity_to_drug_or_medicament_now)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected hypersensitivity to any study medication."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's lactation status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "the patient is a woman"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const enrollment_is_at_discretion_of_site_investigator_now Bool) ;; {"when_to_set_to_true":"Set to true if enrollment is currently at the discretion of the site investigator.","when_to_set_to_false":"Set to false if enrollment is currently not at the discretion of the site investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether enrollment is at the discretion of the site investigator.","meaning":"Boolean indicating whether enrollment is at the discretion of the site investigator at the current time."} ;; "enrollment is at the discretion of the site investigator"

(declare-const patient_has_diagnosis_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of seizure disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of seizure disorder."} ;; "seizure disorder"

(declare-const patient_has_finding_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of seizure.","when_to_set_to_false":"Set to false if the patient does not have a documented history of seizure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of seizure.","meaning":"Boolean indicating whether the patient has a history of seizure."} ;; "history of seizure"

(declare-const patient_has_finding_of_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of seizure.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of seizure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of seizure.","meaning":"Boolean indicating whether the patient currently has a finding of seizure."} ;; "finding of seizure now"

(declare-const patient_is_stabilized_on_anti_seizure_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently stabilized on anti-seizure medication.","when_to_set_to_false":"Set to false if the patient is currently not stabilized on anti-seizure medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently stabilized on anti-seizure medication.","meaning":"Boolean indicating whether the patient is currently stabilized on anti-seizure medication."} ;; "stabilized on anti-seizure medication"

(declare-const patient_is_taking_anticonvulsant_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking anticonvulsant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking anticonvulsant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking anticonvulsant medication.","meaning":"Boolean indicating whether the patient is currently taking anticonvulsant medication."} ;; "taking anticonvulsant medication now"

(declare-const patient_is_taking_anticonvulsant_medication_now@@for_seizure_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking anticonvulsant medication specifically for seizure disorder.","when_to_set_to_false":"Set to false if the patient is currently taking anticonvulsant medication for a reason other than seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anticonvulsant medication is being taken for seizure disorder.","meaning":"Boolean indicating whether the patient is currently taking anticonvulsant medication for seizure disorder."} ;; "taking anticonvulsant medication for seizure disorder"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_anticonvulsant_medication_now@@for_seizure_disorder
      patient_is_taking_anticonvulsant_medication_now)
:named REQ3_AUXILIARY0)) ;; "taking anticonvulsant medication for seizure disorder implies taking anticonvulsant medication"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient is taking anticonvulsant medication for seizure disorder AND NOT (history of seizure AND stabilized on anti-seizure medication AND enrollment is at discretion of site investigator)
(assert
(! (not (and patient_is_taking_anticonvulsant_medication_now@@for_seizure_disorder
             (not (and patient_has_finding_of_seizure_inthehistory
                       patient_is_stabilized_on_anti_seizure_medication_now
                       enrollment_is_at_discretion_of_site_investigator_now))))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is taking anticonvulsant medication for seizure disorder) AND (NOT ((the patient has a history of seizure) AND (the patient is stabilized on anti-seizure medication) AND (enrollment is at the discretion of the site investigator)))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_bacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has bacterial pneumonia."} ;; "bacterial pneumonia"
(declare-const patient_has_finding_of_bacterial_pneumonia_now@@community_acquired Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bacterial pneumonia is community acquired.","when_to_set_to_false":"Set to false if the patient's current bacterial pneumonia is not community acquired.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bacterial pneumonia is community acquired.","meaning":"Boolean indicating whether the patient's current bacterial pneumonia is community acquired."} ;; "community acquired bacterial pneumonia"
(declare-const patient_has_finding_of_viral_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of viral pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of viral pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of viral pneumonia.","meaning":"Boolean indicating whether the patient currently has viral pneumonia."} ;; "viral pneumonia"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute exacerbation of chronic bronchitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute exacerbation of chronic bronchitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute exacerbation of chronic bronchitis.","meaning":"Boolean indicating whether the patient currently has acute exacerbation of chronic bronchitis."} ;; "acute exacerbation of chronic bronchitis"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_now@@without_evidence_of_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute exacerbation of chronic bronchitis and there is no evidence of pneumonia.","when_to_set_to_false":"Set to false if the patient currently has acute exacerbation of chronic bronchitis and there is evidence of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is evidence of pneumonia in the context of acute exacerbation of chronic bronchitis.","meaning":"Boolean indicating whether the patient currently has acute exacerbation of chronic bronchitis without evidence of pneumonia."} ;; "acute exacerbation of chronic bronchitis without evidence of pneumonia"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for community acquired implies stem variable
(assert
(! (=> patient_has_finding_of_bacterial_pneumonia_now@@community_acquired
       patient_has_finding_of_bacterial_pneumonia_now)
   :named REQ4_AUXILIARY0)) ;; "community acquired bacterial pneumonia"

;; Qualifier variable for acute exacerbation of chronic bronchitis without evidence of pneumonia implies stem variable
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_now@@without_evidence_of_pneumonia
       patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_now)
   :named REQ4_AUXILIARY1)) ;; "acute exacerbation of chronic bronchitis without evidence of pneumonia"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: community acquired bacterial pneumonia
(assert
(! (not patient_has_finding_of_bacterial_pneumonia_now@@community_acquired)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has community acquired bacterial pneumonia."

;; Exclusion: viral pneumonia
(assert
(! (not patient_has_finding_of_viral_pneumonia_now)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has viral pneumonia."

;; Exclusion: acute exacerbation of chronic bronchitis without evidence of pneumonia
(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_bronchitis_now@@without_evidence_of_pneumonia)
   :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute exacerbation of chronic bronchitis without evidence of pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of the lung (primary lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of the lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of the lung."} ;; "primary lung cancer"
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of secondary malignant neoplasm of the lung (malignancy metastatic to the lungs).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of secondary malignant neoplasm of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of secondary malignant neoplasm of the lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of secondary malignant neoplasm of the lung."} ;; "malignancy metastatic to the lungs"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has primary lung cancer."

(assert
  (! (not patient_has_diagnosis_of_secondary_malignant_neoplasm_of_lung_now)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignancy metastatic to the lungs."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_was_previously_enrolled_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient was previously enrolled in this study at any time in the past.","when_to_set_to_false":"Set to false if the patient was never previously enrolled in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was previously enrolled in this study.","meaning":"Boolean indicating whether the patient was previously enrolled in this study."} ;; "the patient was previously enrolled in this study"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_was_previously_enrolled_in_this_study)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was previously enrolled in this study."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a drug or medicament at any time within the past 30 days prior to entering the study.","when_to_set_to_false":"Set to false if the patient has not been exposed to a drug or medicament within the past 30 days prior to entering the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a drug or medicament within the past 30 days prior to entering the study.","meaning":"Boolean indicating whether the patient has been exposed to a drug or medicament within the past 30 days."} ;; "the patient has had an investigational drug within 30 days prior to entering the study"
(declare-const patient_has_used_investigational_device_in_the_past_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used an investigational device at any time within the past 30 days prior to entering the study.","when_to_set_to_false":"Set to false if the patient has not used an investigational device within the past 30 days prior to entering the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used an investigational device within the past 30 days prior to entering the study.","meaning":"Boolean indicating whether the patient has used an investigational device within the past 30 days prior to entering the study."} ;; "the patient has used an investigational device within 30 days prior to entering the study"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (or patient_is_exposed_to_drug_or_medicament_inthepast30days
              patient_has_used_investigational_device_in_the_past_30_days))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has had an investigational drug within 30 days prior to entering the study) OR (the patient has used an investigational device within 30 days prior to entering the study))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@requires_concurrent_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection requires concurrent antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection does not require concurrent antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection requires concurrent antibiotic therapy.","meaning":"Boolean indicating whether the patient's current disorder due to infection requires concurrent antibiotic therapy."} ;; "requiring concurrent antibiotic therapy"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@would_interfere_with_evaluation_of_response_to_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection would interfere with evaluation of the response to study drug.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection would not interfere with evaluation of the response to study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection would interfere with evaluation of the response to study drug.","meaning":"Boolean indicating whether the patient's current disorder due to infection would interfere with evaluation of the response to study drug."} ;; "would interfere with evaluation of the response to study drug"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@requires_concurrent_antibiotic_therapy
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ8_AUXILIARY0)) ;; "requiring concurrent antibiotic therapy"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@would_interfere_with_evaluation_of_response_to_study_drug
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ8_AUXILIARY1)) ;; "would interfere with evaluation of the response to study drug"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have another focus of infection requiring concurrent antibiotic therapy that would interfere with evaluation of the response to study drug
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@requires_concurrent_antibiotic_therapy
             patient_has_finding_of_disorder_due_to_infection_now@@would_interfere_with_evaluation_of_response_to_study_drug))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another focus of infection requiring concurrent antibiotic therapy that would interfere with evaluation of the response to study drug."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "the patient has cystic fibrosis"

(declare-const patient_has_diagnosis_of_aids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of AIDS (acquired immunodeficiency syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of AIDS (acquired immunodeficiency syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of AIDS (acquired immunodeficiency syndrome).","meaning":"Boolean indicating whether the patient currently has a diagnosis of AIDS (acquired immunodeficiency syndrome)."} ;; "the patient has acquired immunodeficiency syndrome"

(declare-const cd4_lymphocyte_count_value_recorded_now_withunit_cells_per_microliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent CD4 lymphocyte count, recorded now, in units of cells per microliter.","when_to_set_to_null":"Set to null if the patient's most recent CD4 lymphocyte count is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's most recent CD4 lymphocyte count, recorded now, in units of cells per microliter."} ;; "CD4 lymphocyte count < 200 cells per microliter"

(declare-const patient_has_diagnosis_of_neutropenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neutropenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of neutropenia."} ;; "the patient has neutropenia"

(declare-const absolute_neutrophil_count_value_recorded_now_withunit_cells_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent absolute neutrophil count, recorded now, in units of cells per milliliter.","when_to_set_to_null":"Set to null if the patient's most recent absolute neutrophil count is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's most recent absolute neutrophil count, recorded now, in units of cells per milliliter."} ;; "absolute neutrophil count < 500 cells per milliliter"

(declare-const patient_has_diagnosis_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of active tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of active tuberculosis."} ;; "the patient has active tuberculosis"

(declare-const patient_has_diagnosis_of_active_tuberculosis_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis and the diagnosis is suspected (not confirmed).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of active tuberculosis and the diagnosis is not suspected (i.e., confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of active tuberculosis is suspected.","meaning":"Boolean indicating whether the diagnosis of active tuberculosis is suspected (not confirmed)."} ;; "the patient has suspected active tuberculosis"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_active_tuberculosis_now@@suspected
      patient_has_diagnosis_of_active_tuberculosis_now)
:named REQ9_AUXILIARY0)) ;; "suspected active tuberculosis" implies "active tuberculosis"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_cystic_fibrosis_now)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cystic fibrosis."

(assert
(! (not (and patient_has_diagnosis_of_aids_now
             (< cd4_lymphocyte_count_value_recorded_now_withunit_cells_per_microliter 200)))
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acquired immunodeficiency syndrome with CD4 lymphocyte count < 200 cells per microliter."

(assert
(! (not (and patient_has_diagnosis_of_neutropenic_disorder_now
             (< absolute_neutrophil_count_value_recorded_now_withunit_cells_per_milliliter 500)))
    :named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neutropenia (absolute neutrophil count < 500 cells per milliliter)."

(assert
(! (not patient_has_diagnosis_of_active_tuberculosis_now)
    :named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active tuberculosis."

(assert
(! (not patient_has_diagnosis_of_active_tuberculosis_now@@suspected)
    :named REQ9_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected active tuberculosis."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_prognosis_bad_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a poor prognosis, specifically a little chance of survival.","when_to_set_to_false":"Set to false if the patient currently does not have a poor prognosis (little chance of survival).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a poor prognosis (little chance of survival).","meaning":"Boolean indicating whether the patient currently has a poor prognosis (little chance of survival)."} ;; "little chance of survival"
(declare-const patient_has_finding_of_prognosis_bad_now@@applies_for_duration_of_study_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's poor prognosis (little chance of survival) is judged to apply for the entire duration of study therapy.","when_to_set_to_false":"Set to false if the patient's poor prognosis (little chance of survival) does not apply for the duration of study therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the poor prognosis applies for the duration of study therapy.","meaning":"Boolean indicating whether the patient's poor prognosis (little chance of survival) applies for the duration of study therapy."} ;; "little chance of survival for the duration of study therapy"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_prognosis_bad_now@@applies_for_duration_of_study_therapy
      patient_has_finding_of_prognosis_bad_now)
   :named REQ10_AUXILIARY0)) ;; "little chance of survival for the duration of study therapy"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_prognosis_bad_now@@applies_for_duration_of_study_therapy)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has little chance of survival for the duration of study therapy."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_apache_ii_acute_physiology_and_chronic_health_evaluation_ii_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured APACHE II score if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such score measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's APACHE II score recorded now."} ;; "acute physiology and chronic health evaluation II (APACHE II) score"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (> patient_apache_ii_acute_physiology_and_chronic_health_evaluation_ii_score_value_recorded_now_withunit_score 35))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute physiology and chronic health evaluation II (APACHE II) score > 35."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_pre_existing_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pre-existing (underlying) condition.","when_to_set_to_false":"Set to false if the patient currently does not have a pre-existing (underlying) condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pre-existing (underlying) condition.","meaning":"Boolean indicating whether the patient currently has a pre-existing (underlying) condition."} ;; "underlying condition"
(declare-const patient_has_finding_of_pre_existing_condition_now@@would_make_it_difficult_to_interpret_response_to_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pre-existing (underlying) condition would make it difficult to interpret response to the study drug.","when_to_set_to_false":"Set to false if the patient's current pre-existing (underlying) condition would not make it difficult to interpret response to the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pre-existing (underlying) condition would make it difficult to interpret response to the study drug.","meaning":"Boolean indicating whether the patient's current pre-existing (underlying) condition would make it difficult to interpret response to the study drug."} ;; "underlying condition that would make it difficult to interpret response to the study drug"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pre_existing_condition_now@@would_make_it_difficult_to_interpret_response_to_study_drug
      patient_has_finding_of_pre_existing_condition_now)
:named REQ12_AUXILIARY0)) ;; "underlying condition that would make it difficult to interpret response to the study drug"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_pre_existing_condition_now@@would_make_it_difficult_to_interpret_response_to_study_drug)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an underlying condition that would make it difficult to interpret response to the study drug."

(assert
(! (not patient_has_finding_of_pre_existing_condition_now@@would_make_it_difficult_to_interpret_response_to_study_drug)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying conditions that would make it difficult to interpret response to the study drug."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)."} ;; "hypotension"
(declare-const patient_has_finding_of_low_blood_pressure_now@@persists_despite_attempts_at_fluid_resuscitation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypotension persists despite attempts at fluid resuscitation.","when_to_set_to_false":"Set to false if the patient's hypotension does not persist despite attempts at fluid resuscitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypotension persists despite attempts at fluid resuscitation.","meaning":"Boolean indicating whether the patient's hypotension persists despite attempts at fluid resuscitation."} ;; "hypotension despite attempts at fluid resuscitation"
(declare-const patient_has_finding_of_low_blood_pressure_now@@is_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypotension is controlled.","when_to_set_to_false":"Set to false if the patient's hypotension is not controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypotension is controlled.","meaning":"Boolean indicating whether the patient's hypotension is controlled."} ;; "hypotension is controlled"
(declare-const patient_has_finding_of_acidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acidosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acidosis.","meaning":"Boolean indicating whether the patient currently has acidosis."} ;; "acidosis"
(declare-const patient_has_finding_of_acidosis_now@@persists_despite_attempts_at_fluid_resuscitation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acidosis persists despite attempts at fluid resuscitation.","when_to_set_to_false":"Set to false if the patient's acidosis does not persist despite attempts at fluid resuscitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acidosis persists despite attempts at fluid resuscitation.","meaning":"Boolean indicating whether the patient's acidosis persists despite attempts at fluid resuscitation."} ;; "acidosis despite attempts at fluid resuscitation"
(declare-const patient_has_finding_of_acidosis_now@@has_resolved Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acidosis has resolved.","when_to_set_to_false":"Set to false if the patient's acidosis has not resolved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acidosis has resolved.","meaning":"Boolean indicating whether the patient's acidosis has resolved."} ;; "acidosis has resolved"
(declare-const patient_requires_ongoing_treatment_with_vasopressor_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires ongoing treatment with vasopressor therapy.","when_to_set_to_false":"Set to false if the patient does not currently require ongoing treatment with vasopressor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires ongoing treatment with vasopressor therapy.","meaning":"Boolean indicating whether the patient currently requires ongoing treatment with vasopressor therapy."} ;; "requires ongoing treatment with vasopressor therapy"
(declare-const patient_has_finding_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has septic shock.","meaning":"Boolean indicating whether the patient currently has septic shock."} ;; "septic shock"
(declare-const patient_has_finding_of_septic_shock_now@@is_intractable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's septic shock is intractable.","when_to_set_to_false":"Set to false if the patient's septic shock is not intractable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's septic shock is intractable.","meaning":"Boolean indicating whether the patient's septic shock is intractable."} ;; "intractable septic shock"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_low_blood_pressure_now@@persists_despite_attempts_at_fluid_resuscitation
      patient_has_finding_of_low_blood_pressure_now)
:named REQ13_AUXILIARY0)) ;; "hypotension despite attempts at fluid resuscitation"

(assert
(! (=> patient_has_finding_of_low_blood_pressure_now@@is_controlled
      patient_has_finding_of_low_blood_pressure_now)
:named REQ13_AUXILIARY1)) ;; "hypotension is controlled"

(assert
(! (=> patient_has_finding_of_acidosis_now@@persists_despite_attempts_at_fluid_resuscitation
      patient_has_finding_of_acidosis_now)
:named REQ13_AUXILIARY2)) ;; "acidosis despite attempts at fluid resuscitation"

(assert
(! (=> patient_has_finding_of_acidosis_now@@has_resolved
      patient_has_finding_of_acidosis_now)
:named REQ13_AUXILIARY3)) ;; "acidosis has resolved"

(assert
(! (=> patient_has_finding_of_septic_shock_now@@is_intractable
      patient_has_finding_of_septic_shock_now)
:named REQ13_AUXILIARY4)) ;; "intractable septic shock"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: ((hypotension despite fluid OR acidosis despite fluid) AND NOT (vasopressor AND hypotension controlled AND acidosis resolved)) OR intractable septic shock
(assert
(! (not
     (or
       (and
         (or patient_has_finding_of_low_blood_pressure_now@@persists_despite_attempts_at_fluid_resuscitation
             patient_has_finding_of_acidosis_now@@persists_despite_attempts_at_fluid_resuscitation)
         (not
           (and patient_requires_ongoing_treatment_with_vasopressor_therapy_now
                patient_has_finding_of_low_blood_pressure_now@@is_controlled
                patient_has_finding_of_acidosis_now@@has_resolved)))
       patient_has_finding_of_septic_shock_now@@is_intractable))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((the patient has hypotension despite attempts at fluid resuscitation OR the patient has acidosis despite attempts at fluid resuscitation) AND NOT (the patient requires ongoing treatment with vasopressor therapy AND the hypotension is controlled AND the acidosis has resolved)) OR (the patient has intractable septic shock)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_undergone_transplantation_of_bone_marrow_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone bone marrow transplantation at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone bone marrow transplantation at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone bone marrow transplantation.","meaning":"Boolean indicating whether the patient has ever undergone bone marrow transplantation in their medical history."} ;; "bone marrow transplantation"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_undergone_transplantation_of_bone_marrow_inthehistory)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone bone marrow transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_arterial_partial_pressure_oxygen_to_fraction_inspired_oxygen_ratio_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the calculated value if both the patient's current arterial partial pressure of oxygen (PaO2) in mmHg and fraction of inspired oxygen (FiO2) in percent are available; calculate as PaO2 divided by FiO2 (converted to fraction if needed).","when_to_set_to_null":"Set to null if either PaO2 or FiO2 measurement is unavailable or indeterminate, or if the ratio cannot be calculated.","meaning":"Numeric value representing the patient's current ratio of arterial partial pressure of oxygen (PaO2) to fraction of inspired oxygen (FiO2), unitless."} ;; "partial pressure of oxygen (PaO2) / fraction of inspired oxygen (FiO2) ratio"
(declare-const patient_has_finding_of_hypoxia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoxia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoxia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoxia.","meaning":"Boolean indicating whether the patient currently has hypoxia."} ;; "hypoxia"
(declare-const patient_inspired_oxygen_concentration_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current fraction of inspired oxygen (FiO2) in percent is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current fraction of inspired oxygen (FiO2) in percent."} ;; "fraction of inspired oxygen (FiO2)"
(declare-const patient_oxygen_measurement_partial_pressure_arterial_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current arterial partial pressure of oxygen (PaO2) in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current arterial partial pressure of oxygen (PaO2) in mmHg."} ;; "partial pressure of oxygen (PaO2)"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Definition: hypoxia as defined by PaO2/FiO2 ratio < 100
(assert
(! (= patient_has_finding_of_hypoxia_now
(< patient_arterial_partial_pressure_oxygen_to_fraction_inspired_oxygen_ratio_value_recorded_now_withunit_none 100))
:named REQ15_AUXILIARY0)) ;; "hypoxia as defined by partial pressure of oxygen (PaO2) / fraction of inspired oxygen (FiO2) ratio < 100."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_hypoxia_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypoxia as defined by partial pressure of oxygen (PaO2) / fraction of inspired oxygen (FiO2) ratio < 100."
