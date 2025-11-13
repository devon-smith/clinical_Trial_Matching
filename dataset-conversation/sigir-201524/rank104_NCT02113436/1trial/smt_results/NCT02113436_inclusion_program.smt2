;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const written_informed_consent_obtained_from_parent_or_legally_acceptable_representative Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from either the parent of the patient or the legally acceptable representative of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from either the parent of the patient or the legally acceptable representative of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from either the parent of the patient or the legally acceptable representative of the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from either the parent of the patient or the legally acceptable representative of the patient."} ;; "written informed consent obtained from (the parent of the patient OR the legally acceptable representative of the patient)"
(declare-const oral_consent_obtained_from_patient Bool) ;; {"when_to_set_to_true":"Set to true if oral consent has been obtained from the patient.","when_to_set_to_false":"Set to false if oral consent has not been obtained from the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether oral consent has been obtained from the patient.","meaning":"Boolean indicating whether oral consent has been obtained from the patient."} ;; "oral consent obtained from the patient"
(declare-const oral_consent_recorded_in_informed_consent_signed_by_parent_or_legally_acceptable_representative Bool) ;; {"when_to_set_to_true":"Set to true if oral consent obtained from the patient is recorded in the informed consent document, and the document is signed by either the parent of the patient or the legally acceptable representative of the patient.","when_to_set_to_false":"Set to false if oral consent obtained from the patient is not recorded in the informed consent document, or the document is not signed by either the parent of the patient or the legally acceptable representative of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether oral consent obtained from the patient is recorded in the informed consent document signed by either the parent of the patient or the legally acceptable representative of the patient.","meaning":"Boolean indicating whether oral consent obtained from the patient is recorded in the informed consent document, which is signed by either the parent of the patient or the legally acceptable representative of the patient."} ;; "oral consent recorded in the informed consent which is signed by (the parent of the patient OR the legally acceptable representative of the patient)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must have (written informed consent obtained from (the parent of the patient OR the legally acceptable representative of the patient)) OR ((oral consent obtained from the patient) AND (oral consent recorded in the informed consent which is signed by (the parent of the patient OR the legally acceptable representative of the patient))).
(assert
  (! (or written_informed_consent_obtained_from_parent_or_legally_acceptable_representative
         (and oral_consent_obtained_from_patient
              oral_consent_recorded_in_informed_consent_signed_by_parent_or_legally_acceptable_representative))
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (written informed consent obtained from (the parent of the patient OR the legally acceptable representative of the patient)) OR ((oral consent obtained from the patient) AND (oral consent recorded in the informed consent which is signed by (the parent of the patient OR the legally acceptable representative of the patient)))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_japanese_ethnic_origin Bool) ;; {"when_to_set_to_true":"Set to true if the patient is of Japanese ethnic origin.","when_to_set_to_false":"Set to false if the patient is not of Japanese ethnic origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is of Japanese ethnic origin.","meaning":"Boolean indicating whether the patient is of Japanese ethnic origin."} ;; "the patient must be of Japanese ethnic origin"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_japanese_ethnic_origin
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be of Japanese ethnic origin"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_at_visit_1_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's age in months as recorded at Visit 1 if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in months at Visit 1 is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in months as recorded at Visit 1."} ;; "aged ≥ 6 months AND aged ≤ 4 years at Visit 1"
(declare-const patient_age_value_recorded_at_visit_1_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years as recorded at Visit 1 if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at Visit 1 is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years as recorded at Visit 1."} ;; "aged ≥ 6 months AND aged ≤ 4 years at Visit 1"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be (aged ≥ 6 months AND aged ≤ 4 years) at Visit 1.
(assert
  (! (and (>= patient_age_value_recorded_at_visit_1_in_months 6.0)
          (<= patient_age_value_recorded_at_visit_1_in_years 4.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged ≥ 6 months AND aged ≤ 4 years at Visit 1"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_pre_menarchial_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently female and has not yet begun menses (pre-menarchial).","when_to_set_to_false":"Set to false if the patient is currently female and has begun menses (post-menarchial), or if the patient is not currently female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a pre-menarchial female.","meaning":"Boolean indicating whether the patient is currently a pre-menarchial female (has not yet begun menses)."} ;; "Boolean value indicating whether the patient is currently a pre-menarchial female (defined as any female who has yet to begin menses)."
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "pre-menarchial female (defined as any female who has yet to begin menses)"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "the patient must be (male) OR (pre-menarchial female (defined as any female who has yet to begin menses))"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: pre-menarchial female is any female who has yet to begin menses
(assert
  (! (= patient_is_pre_menarchial_female_now
        (and patient_sex_is_female_now
             ;; "has yet to begin menses" is captured by the variable definition
             ))
     :named REQ3_AUXILIARY0)) ;; "Pre-menarchial females are defined as any female who has yet to begin menses."

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must be (male) OR (pre-menarchial female)
(assert
  (! (or patient_sex_is_male_now
         patient_is_pre_menarchial_female_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be (male) OR (pre-menarchial female (defined as any female who has yet to begin menses))"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient (e.g., inpatient, emergency, etc.).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an outpatient.","meaning":"Boolean indicating whether the patient is currently classified as an outpatient."} ;; "the patient must be an outpatient"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_outpatient_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an outpatient."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================

(declare-const patient_has_diagnosis_of_childhood_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of childhood asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of childhood asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of childhood asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of childhood asthma."} ;; "a diagnosis of pediatric asthma"
(declare-const patient_has_diagnosis_of_childhood_asthma_now@@diagnosed_by_reference_to_jpgl_2012 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of childhood asthma was made by reference to JPGL 2012.","when_to_set_to_false":"Set to false if the patient's diagnosis of childhood asthma was not made by reference to JPGL 2012.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made by reference to JPGL 2012.","meaning":"Boolean indicating whether the patient's diagnosis of childhood asthma was made by reference to JPGL 2012."} ;; "diagnosis of pediatric asthma made by reference to JPGL 2012"
(declare-const patient_has_source_document_for_diagnosis_of_childhood_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if there is a source document available as evidence for the diagnosis of childhood asthma in the patient.","when_to_set_to_false":"Set to false if there is no source document available as evidence for the diagnosis of childhood asthma in the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a source document available as evidence for the diagnosis of childhood asthma in the patient.","meaning":"Boolean indicating whether there is a source document available as evidence for the diagnosis of childhood asthma in the patient."} ;; "the document which is of help as evidence kept as source document"

(declare-const patient_age_value_recorded_at_visit_1_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years as recorded at Visit 1 if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at Visit 1 is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years as recorded at Visit 1."} ;; "if the patient is aged < 2 years at Visit 1"

(declare-const patient_has_finding_of_expiratory_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has expiratory wheezing.","when_to_set_to_false":"Set to false if the patient currently does not have expiratory wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has expiratory wheezing.","meaning":"Boolean indicating whether the patient currently has expiratory wheezing."} ;; "expiratory wheezing"
(declare-const patient_has_finding_of_expiratory_wheezing_now@@at_least_3_episodes Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has expiratory wheezing and there are at least 3 episodes.","when_to_set_to_false":"Set to false if the patient currently has expiratory wheezing but there are fewer than 3 episodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there are at least 3 episodes.","meaning":"Boolean indicating whether the patient currently has expiratory wheezing with at least 3 episodes."} ;; "the patient has ≥ 3 episodes of marked expiratory wheezing"
(declare-const patient_has_finding_of_expiratory_wheezing_now@@asymptomatic_period_about_a_week_between_episodes Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has expiratory wheezing and there is an asymptomatic period of about a week between each episode.","when_to_set_to_false":"Set to false if the patient currently has expiratory wheezing but there is not an asymptomatic period of about a week between each episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is an asymptomatic period of about a week between each episode.","meaning":"Boolean indicating whether the patient currently has expiratory wheezing with an asymptomatic period of about a week between each episode."} ;; "there is an asymptomatic period for about a week between each episode"

(declare-const parent_has_diagnosis_of_bronchial_asthma_by_physician_in_history Bool) ;; {"when_to_set_to_true":"Set to true if at least one of the patient's parents has a diagnosis of bronchial asthma by a physician, including past history.","when_to_set_to_false":"Set to false if neither parent has a diagnosis of bronchial asthma by a physician, including past history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether at least one parent has a diagnosis of bronchial asthma by a physician, including past history.","meaning":"Boolean indicating whether at least one of the patient's parents has a diagnosis of bronchial asthma by a physician, including past history."} ;; "at least one of the parents of the patient is diagnosed with bronchial asthma by a physician (including past history)"
(declare-const parent_has_specific_immunoglobulin_e_antibody_for_inhalation_antigen_detected_now Bool) ;; {"when_to_set_to_true":"Set to true if specific immunoglobulin E antibody for inhalation antigen is detected in at least one of the patient's parents.","when_to_set_to_false":"Set to false if specific immunoglobulin E antibody for inhalation antigen is not detected in either parent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether specific immunoglobulin E antibody for inhalation antigen is detected in at least one of the patient's parents.","meaning":"Boolean indicating whether specific immunoglobulin E antibody for inhalation antigen is detected in at least one of the patient's parents."} ;; "specific immunoglobulin E antibody for inhalation antigen is detected in at least one of the parents"
(declare-const patient_has_diagnosis_of_atopic_dermatitis_by_physician_in_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of atopic dermatitis by a physician, including past history.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of atopic dermatitis by a physician, including past history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of atopic dermatitis by a physician, including past history.","meaning":"Boolean indicating whether the patient has a diagnosis of atopic dermatitis by a physician, including past history."} ;; "the patient is diagnosed with atopic dermatitis by a physician (including past history)"
(declare-const patient_has_specific_immunoglobulin_e_antibody_for_inhalation_antigen_detected_now Bool) ;; {"when_to_set_to_true":"Set to true if specific immunoglobulin E antibody for inhalation antigen is detected in the patient.","when_to_set_to_false":"Set to false if specific immunoglobulin E antibody for inhalation antigen is not detected in the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether specific immunoglobulin E antibody for inhalation antigen is detected in the patient.","meaning":"Boolean indicating whether specific immunoglobulin E antibody for inhalation antigen is detected in the patient."} ;; "specific immunoglobulin E antibody for inhalation antigen is detected in the patient"
(declare-const serum_immunoglobulin_e_level_value_recorded_now_in_iu_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's serum immunoglobulin E level recorded now in IU/mL.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's serum immunoglobulin E level is now in IU/mL.","meaning":"Numeric value indicating the serum immunoglobulin E level in the patient, recorded now, in IU/mL."} ;; "high serum immunoglobulin E level in the patient"
(declare-const family_member_has_high_serum_immunoglobulin_e_level_now Bool) ;; {"when_to_set_to_true":"Set to true if a family member of the patient has a high serum immunoglobulin E level, considering age.","when_to_set_to_false":"Set to false if no family member of the patient has a high serum immunoglobulin E level, considering age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a family member of the patient has a high serum immunoglobulin E level, considering age.","meaning":"Boolean indicating whether a family member of the patient has a high serum immunoglobulin E level, considering age."} ;; "high serum immunoglobulin E level in the family of the patient"
(declare-const patient_has_eosinophils_found_in_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if eosinophils are found in the patient's sputum now.","when_to_set_to_false":"Set to false if eosinophils are not found in the patient's sputum now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether eosinophils are found in the patient's sputum now.","meaning":"Boolean indicating whether eosinophils are found in the patient's sputum now."} ;; "eosinophils found in sputum"
(declare-const patient_has_creola_bodies_found_in_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if creola bodies are found in the patient's sputum now.","when_to_set_to_false":"Set to false if creola bodies are not found in the patient's sputum now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether creola bodies are found in the patient's sputum now.","meaning":"Boolean indicating whether creola bodies are found in the patient's sputum now."} ;; "creola bodies found in sputum"
(declare-const patient_has_nasal_discharge_eosinophilia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nasal discharge eosinophilia.","when_to_set_to_false":"Set to false if the patient currently does not have nasal discharge eosinophilia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nasal discharge eosinophilia.","meaning":"Boolean indicating whether the patient currently has nasal discharge eosinophilia."} ;; "nasal discharge eosinophilia"
(declare-const patient_has_peripheral_blood_eosinophilia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral blood eosinophilia.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral blood eosinophilia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral blood eosinophilia.","meaning":"Boolean indicating whether the patient currently has peripheral blood eosinophilia."} ;; "peripheral blood eosinophilia"
(declare-const patient_has_expiratory_wheezing_occurring_without_airway_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has expiratory wheezing occurring when there is no airway infection.","when_to_set_to_false":"Set to false if the patient currently does not have expiratory wheezing occurring when there is no airway infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has expiratory wheezing occurring when there is no airway infection.","meaning":"Boolean indicating whether the patient currently has expiratory wheezing occurring when there is no airway infection."} ;; "expiratory wheezing occurs when there is no airway infection"
(declare-const patient_has_expiratory_wheezing_and_labored_respiration_improved_after_beta_2_stimulant_inhalation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's expiratory wheezing and labored respiration are improved after beta-2 stimulant inhalation now.","when_to_set_to_false":"Set to false if the patient's expiratory wheezing and labored respiration are not improved after beta-2 stimulant inhalation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's expiratory wheezing and labored respiration are improved after beta-2 stimulant inhalation now.","meaning":"Boolean indicating whether the patient's expiratory wheezing and labored respiration are improved after beta-2 stimulant inhalation now."} ;; "expiratory wheezing AND labored respiration are improved after beta-2 stimulant inhalation"
(declare-const patient_has_oxygen_saturation_improved_after_beta_2_stimulant_inhalation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's oxygen saturation is improved after beta-2 stimulant inhalation now.","when_to_set_to_false":"Set to false if the patient's oxygen saturation is not improved after beta-2 stimulant inhalation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's oxygen saturation is improved after beta-2 stimulant inhalation now.","meaning":"Boolean indicating whether the patient's oxygen saturation is improved after beta-2 stimulant inhalation now."} ;; "oxygen saturation improved after beta-2 stimulant inhalation"

;; ===================== Auxiliary Assertions (REQ 5) =====================

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_childhood_asthma_now@@diagnosed_by_reference_to_jpgl_2012
         patient_has_diagnosis_of_childhood_asthma_now)
     :named REQ5_AUXILIARY0)) ;; "diagnosis of pediatric asthma made by reference to JPGL 2012"

(assert
  (! (=> patient_has_finding_of_expiratory_wheezing_now@@at_least_3_episodes
         patient_has_finding_of_expiratory_wheezing_now)
     :named REQ5_AUXILIARY1)) ;; "the patient has ≥ 3 episodes of marked expiratory wheezing"

(assert
  (! (=> patient_has_finding_of_expiratory_wheezing_now@@asymptomatic_period_about_a_week_between_episodes
         patient_has_finding_of_expiratory_wheezing_now)
     :named REQ5_AUXILIARY2)) ;; "there is an asymptomatic period for about a week between each episode"

;; "at least one of the following findings" (OR of all findings)
(define-fun at_least_one_supportive_finding_present () Bool
  (or
    parent_has_diagnosis_of_bronchial_asthma_by_physician_in_history
    parent_has_specific_immunoglobulin_e_antibody_for_inhalation_antigen_detected_now
    patient_has_diagnosis_of_atopic_dermatitis_by_physician_in_history
    patient_has_specific_immunoglobulin_e_antibody_for_inhalation_antigen_detected_now
    ;; High serum IgE in patient or family
    (or
      ;; Patient's own high IgE (threshold to be determined by age, not specified here)
      ;; For SMT, we only check if value is set and high, but threshold is not specified in requirement
      ;; So we use a placeholder for "high" as a Boolean, or use the family member variable
      ;; Here, we use the family_member_has_high_serum_immunoglobulin_e_level_now variable as per variable set
      family_member_has_high_serum_immunoglobulin_e_level_now
    )
    ;; Eosinophils and/or creola bodies in sputum, nasal discharge eosinophilia, peripheral blood eosinophilia
    patient_has_eosinophils_found_in_sputum_now
    patient_has_creola_bodies_found_in_sputum_now
    patient_has_nasal_discharge_eosinophilia_now
    patient_has_peripheral_blood_eosinophilia_now
    ;; Expiratory wheezing occurs when there is no airway infection
    patient_has_expiratory_wheezing_occurring_without_airway_infection_now
    ;; Expiratory wheezing and labored respiration or oxygen saturation improved after beta-2 stimulant inhalation
    patient_has_expiratory_wheezing_and_labored_respiration_improved_after_beta_2_stimulant_inhalation_now
    patient_has_oxygen_saturation_improved_after_beta_2_stimulant_inhalation_now
  )
) ;; "if there is at least one of the following findings, it is more helpful to diagnose infantile asthma"

;; ===================== Constraint Assertions (REQ 5) =====================

(assert
  (! (and patient_has_diagnosis_of_childhood_asthma_now
          patient_has_diagnosis_of_childhood_asthma_now@@diagnosed_by_reference_to_jpgl_2012
          patient_has_source_document_for_diagnosis_of_childhood_asthma_now)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a diagnosis of pediatric asthma made by reference to JPGL 2012 AND the document which is of help as evidence kept as source document"

(assert
  (! (or (>= patient_age_value_recorded_at_visit_1_in_years 2)
         (and
           patient_has_finding_of_expiratory_wheezing_now@@at_least_3_episodes
           patient_has_finding_of_expiratory_wheezing_now@@asymptomatic_period_about_a_week_between_episodes
           at_least_one_supportive_finding_present
         ))
     :named REQ5_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "if the patient is aged < 2 years at Visit 1, the diagnosis must be according to the following instruction in JPGL 2012 as a reference: (the patient has ≥ 3 episodes of marked expiratory wheezing (regardless of the presence of respiratory tract infection) AND there is an asymptomatic period for about a week between each episode) AND (if there is at least one of the following findings, it is more helpful to diagnose infantile asthma: ... )"

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_inhaled_steroid_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing inhaled corticosteroid therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing inhaled corticosteroid therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing inhaled corticosteroid therapy.","meaning":"Boolean indicating whether the patient is currently undergoing inhaled corticosteroid therapy."} ;; "need to be treated with inhaled corticosteroid"
(declare-const patient_is_taking_selective_beta_2_agonist_containing_product_now@@is_long_acting Bool) ;; {"when_to_set_to_true":"Set to true if the selective beta 2 agonist containing product the patient is currently taking is long-acting.","when_to_set_to_false":"Set to false if the selective beta 2 agonist containing product the patient is currently taking is not long-acting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the selective beta 2 agonist containing product is long-acting.","meaning":"Boolean indicating whether the selective beta 2 agonist containing product the patient is currently taking is long-acting."} ;; "need to be treated with long-acting beta 2 agonist"

(declare-const patient_has_documented_exacerbation_treated_with_systemic_glucocorticosteroid_in_12_months_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at least one documented exacerbation treated with systemic glucocorticosteroid in the 12 months prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not have any documented exacerbation treated with systemic glucocorticosteroid in the 12 months prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has at least one documented exacerbation treated with systemic glucocorticosteroid in the 12 months prior to Visit 1.","meaning":"Boolean indicating whether the patient has at least one documented exacerbation treated with systemic glucocorticosteroid in the 12 months prior to Visit 1."} ;; "at least one documented exacerbation in which the patient was treated with systemic glucocorticosteroid in the 12 months prior to Visit 1"
(declare-const patient_has_documented_exacerbation_treated_with_aminophylline_intravenous_dose_in_12_months_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at least one documented exacerbation treated with aminophylline intravenous dose in the 12 months prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not have any documented exacerbation treated with aminophylline intravenous dose in the 12 months prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has at least one documented exacerbation treated with aminophylline intravenous dose in the 12 months prior to Visit 1.","meaning":"Boolean indicating whether the patient has at least one documented exacerbation treated with aminophylline intravenous dose in the 12 months prior to Visit 1."} ;; "at least one documented exacerbation in which the patient was treated with aminophylline intravenous dose in the 12 months prior to Visit 1"
(declare-const patient_has_documented_exacerbation_treated_with_continuous_isoproterenol_inhalation_in_12_months_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at least one documented exacerbation treated with continuous isoproterenol inhalation in the 12 months prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not have any documented exacerbation treated with continuous isoproterenol inhalation in the 12 months prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has at least one documented exacerbation treated with continuous isoproterenol inhalation in the 12 months prior to Visit 1.","meaning":"Boolean indicating whether the patient has at least one documented exacerbation treated with continuous isoproterenol inhalation in the 12 months prior to Visit 1."} ;; "at least one documented exacerbation in which the patient was treated with continuous isoproterenol inhalation in the 12 months prior to Visit 1"

(declare-const patient_has_regular_treatment_with_inhaled_corticosteroid_in_12_months_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has well-documented regular treatment with inhaled corticosteroid (fluticasone propionate 200-400 microgram daily or equivalent) with continuous use in the 12 months prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not have well-documented regular treatment with inhaled corticosteroid (fluticasone propionate 200-400 microgram daily or equivalent) with continuous use in the 12 months prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has well-documented regular treatment with inhaled corticosteroid (fluticasone propionate 200-400 microgram daily or equivalent) with continuous use in the 12 months prior to Visit 1.","meaning":"Boolean indicating whether the patient has well-documented regular treatment with inhaled corticosteroid (fluticasone propionate 200-400 microgram daily or equivalent) with continuous use in the 12 months prior to Visit 1."} ;; "well-documented regular treatment with inhaled corticosteroid (fluticasone propionate 200-400 microgram daily or equivalent) continuous use in the 12 months prior to Visit 1"

(declare-const patient_has_received_systemic_glucocorticosteroid_in_4_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received systemic glucocorticosteroid within 4 weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient has not received systemic glucocorticosteroid within 4 weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received systemic glucocorticosteroid within 4 weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient has received systemic glucocorticosteroid within 4 weeks prior to Visit 1."} ;; "the patient has NOT received systemic glucocorticosteroid within 4 weeks prior to Visit 1"
(declare-const patient_has_received_aminophylline_intravenous_dose_in_4_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received aminophylline intravenous dose within 4 weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient has not received aminophylline intravenous dose within 4 weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received aminophylline intravenous dose within 4 weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient has received aminophylline intravenous dose within 4 weeks prior to Visit 1."} ;; "the patient has NOT received aminophylline intravenous dose within 4 weeks prior to Visit 1"
(declare-const patient_has_received_inhaled_corticosteroid_in_4_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received inhaled corticosteroid (fluticasone propionate > 200 microgram daily or equivalent) within 4 weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient has not received inhaled corticosteroid (fluticasone propionate > 200 microgram daily or equivalent) within 4 weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received inhaled corticosteroid (fluticasone propionate > 200 microgram daily or equivalent) within 4 weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient has received inhaled corticosteroid (fluticasone propionate > 200 microgram daily or equivalent) within 4 weeks prior to Visit 1."} ;; "the patient has NOT received inhaled corticosteroid (fluticasone propionate > 200 microgram daily or equivalent) within 4 weeks prior to Visit 1"
(declare-const patient_has_received_continuous_isoproterenol_inhalation_in_4_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received continuous isoproterenol inhalation within 4 weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient has not received continuous isoproterenol inhalation within 4 weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received continuous isoproterenol inhalation within 4 weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient has received continuous isoproterenol inhalation within 4 weeks prior to Visit 1."} ;; "the patient has NOT received continuous isoproterenol inhalation within 4 weeks prior to Visit 1"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; None required for this requirement (all relationships are direct from requirement).

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: "need to be treated with inhaled corticosteroid"
(assert
  (! patient_is_undergoing_inhaled_steroid_therapy_now
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "need to be treated with inhaled corticosteroid"

;; Component 1: "need to be treated with long-acting beta 2 agonist"
(assert
  (! patient_is_taking_selective_beta_2_agonist_containing_product_now@@is_long_acting
     :named REQ6_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "need to be treated with long-acting beta 2 agonist"

;; Component 2: Fulfill all of the following conditions:
;; ((at least one documented exacerbation in which the patient was treated with (systemic glucocorticosteroid OR aminophylline intravenous dose OR continuous isoproterenol inhalation) in the 12 months prior to Visit 1)
;; OR (well-documented regular treatment with inhaled corticosteroid (fluticasone propionate 200-400 microgram daily OR equivalent) continuous use in the 12 months prior to Visit 1))
;; AND (the patient has NOT received (systemic glucocorticosteroid OR aminophylline intravenous dose OR inhaled corticosteroid (fluticasone propionate > 200 microgram daily OR equivalent) OR continuous isoproterenol inhalation) within 4 weeks prior to Visit 1)

(assert
  (! (and
        (or
          patient_has_documented_exacerbation_treated_with_systemic_glucocorticosteroid_in_12_months_prior_to_visit_1
          patient_has_documented_exacerbation_treated_with_aminophylline_intravenous_dose_in_12_months_prior_to_visit_1
          patient_has_documented_exacerbation_treated_with_continuous_isoproterenol_inhalation_in_12_months_prior_to_visit_1
          patient_has_regular_treatment_with_inhaled_corticosteroid_in_12_months_prior_to_visit_1
        )
        (and
          (not patient_has_received_systemic_glucocorticosteroid_in_4_weeks_prior_to_visit_1)
          (not patient_has_received_aminophylline_intravenous_dose_in_4_weeks_prior_to_visit_1)
          (not patient_has_received_inhaled_corticosteroid_in_4_weeks_prior_to_visit_1)
          (not patient_has_received_continuous_isoproterenol_inhalation_in_4_weeks_prior_to_visit_1)
        )
     )
     :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "fulfill all of the following conditions: ..."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const asthma_symptom_score_daytime_completed_last_7_days_of_run_in_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient completed the daytime asthma symptom score entry for a given day in the last 7 consecutive days during the run-in period.","when_to_set_to_false":"Set to false if the patient did not complete the daytime asthma symptom score entry for a given day in the last 7 consecutive days during the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient completed the daytime asthma symptom score entry for a given day in the last 7 consecutive days during the run-in period.","meaning":"Boolean indicating whether the patient completed the daytime asthma symptom score entry for each of the last 7 consecutive days during the run-in period."} ;; "completion of symptom scores (daytime) on ≥ 5 days out of the last 7 consecutive days during the run-in period"
(declare-const asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points (Array Int Real)) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's daytime asthma symptom score for each of the last 7 consecutive days of the run-in period, excluding the day of Visit 2, in points.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined for any of the last 7 consecutive days of the run-in period, excluding the day of Visit 2.","meaning":"Numeric value indicating the patient's daytime asthma symptom score recorded for each of the last 7 consecutive days of the run-in period, excluding the day of Visit 2, in units of points."} ;; "asthma symptom scores (daytime) for each of the last 7 consecutive days of the run-in period, excluding the day of Visit 2"
(declare-const asthma_symptom_score_nighttime_completed_last_7_days_of_run_in_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient completed the night-time asthma symptom score entry for a given day in the last 7 consecutive days during the run-in period.","when_to_set_to_false":"Set to false if the patient did not complete the night-time asthma symptom score entry for a given day in the last 7 consecutive days during the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient completed the night-time asthma symptom score entry for a given day in the last 7 consecutive days during the run-in period.","meaning":"Boolean indicating whether the patient completed the night-time asthma symptom score entry for each of the last 7 consecutive days during the run-in period."} ;; "completion of symptom scores (night-time) on ≥ 5 days out of the last 7 consecutive days during the run-in period"
(declare-const asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points (Array Int Real)) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's night-time asthma symptom score for each of the last 7 consecutive days of the run-in period, excluding the day of Visit 2, in points.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined for any of the last 7 consecutive days of the run-in period, excluding the day of Visit 2.","meaning":"Numeric value indicating the patient's night-time asthma symptom score recorded for each of the last 7 consecutive days of the run-in period, excluding the day of Visit 2, in units of points."} ;; "asthma symptom scores (night-time) for each of the last 7 consecutive days of the run-in period, excluding the day of Visit 2"
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "diagnosis of asthma"

;; Declare additional variables for per-day completion and per-day score thresholds
(declare-const asthma_symptom_score_daytime_completed_last_7_days_of_run_in_period_excluding_visit_2 (Array Int Bool)) ;; {"when_to_set_to_true":"Set to true if the patient completed the daytime asthma symptom score entry for a given day (excluding Visit 2) in the last 7 consecutive days during the run-in period.","when_to_set_to_false":"Set to false if the patient did not complete the daytime asthma symptom score entry for a given day (excluding Visit 2) in the last 7 consecutive days during the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient completed the daytime asthma symptom score entry for a given day (excluding Visit 2) in the last 7 consecutive days during the run-in period.","meaning":"Boolean indicating whether the patient completed the daytime asthma symptom score entry for each of the last 7 consecutive days during the run-in period, excluding the day of Visit 2."} ;; "completion of daytime asthma symptom score for each day (excluding Visit 2) in last 7 days"
(declare-const asthma_symptom_score_nighttime_completed_last_7_days_of_run_in_period_excluding_visit_2 (Array Int Bool)) ;; {"when_to_set_to_true":"Set to true if the patient completed the night-time asthma symptom score entry for a given day (excluding Visit 2) in the last 7 consecutive days during the run-in period.","when_to_set_to_false":"Set to false if the patient did not complete the night-time asthma symptom score entry for a given day (excluding Visit 2) in the last 7 consecutive days during the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient completed the night-time asthma symptom score entry for a given day (excluding Visit 2) in the last 7 consecutive days during the run-in period.","meaning":"Boolean indicating whether the patient completed the night-time asthma symptom score entry for each of the last 7 consecutive days during the run-in period, excluding the day of Visit 2."} ;; "completion of night-time asthma symptom score for each day (excluding Visit 2) in last 7 days"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Define the set of days (indices) for the last 7 consecutive days of the run-in period, excluding Visit 2.
;; For SMT, we use indices 0 to 6, and let visit_2_day_idx be the index to exclude.
(declare-const visit_2_day_idx Int) ;; {"when_to_set_to_value":"Set to the index (0-based) of the day corresponding to Visit 2 in the last 7 consecutive days of the run-in period.","when_to_set_to_null":"Set to null if the index is unknown, not documented, or cannot be determined.","meaning":"Index (0-based) of the day corresponding to Visit 2 in the last 7 consecutive days of the run-in period."} ;; "excluding the day of Visit 2"

;; Define total daytime and night-time scores (excluding Visit 2)
(define-fun total_daytime_score_last_7_days_excluding_visit_2 () Real
  (let ((sum
    (ite (= visit_2_day_idx 0) 0 (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 0))
    ))
    (let ((sum
      (+ sum
         (ite (= visit_2_day_idx 1) 0 (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 1))
         (ite (= visit_2_day_idx 2) 0 (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 2))
         (ite (= visit_2_day_idx 3) 0 (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 3))
         (ite (= visit_2_day_idx 4) 0 (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 4))
         (ite (= visit_2_day_idx 5) 0 (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 5))
         (ite (= visit_2_day_idx 6) 0 (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 6))
      )))
      sum
    )
  )
) ;; "asthma symptom scores (daytime) total for last 7 days excluding Visit 2"

(define-fun total_nighttime_score_last_7_days_excluding_visit_2 () Real
  (let ((sum
    (ite (= visit_2_day_idx 0) 0 (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 0))
    ))
    (let ((sum
      (+ sum
         (ite (= visit_2_day_idx 1) 0 (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 1))
         (ite (= visit_2_day_idx 2) 0 (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 2))
         (ite (= visit_2_day_idx 3) 0 (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 3))
         (ite (= visit_2_day_idx 4) 0 (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 4))
         (ite (= visit_2_day_idx 5) 0 (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 5))
         (ite (= visit_2_day_idx 6) 0 (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 6))
      )))
      sum
    )
  )
) ;; "asthma symptom scores (night-time) total for last 7 days excluding Visit 2"

;; Count days with daytime score >= 1 (excluding Visit 2)
(define-fun daytime_score_ge_1_days_count () Int
  (+ (ite (and (not (= visit_2_day_idx 0)) (>= (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 0) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 1)) (>= (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 1) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 2)) (>= (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 2) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 3)) (>= (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 3) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 4)) (>= (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 4) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 5)) (>= (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 5) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 6)) (>= (select asthma_symptom_score_daytime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 6) 1.0)) 1 0)
  )
) ;; "daytime asthma symptom score >= 1 for ≥ 3 days in last 7 days excluding Visit 2"

;; Count days with night-time score >= 1 (excluding Visit 2)
(define-fun nighttime_score_ge_1_days_count () Int
  (+ (ite (and (not (= visit_2_day_idx 0)) (>= (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 0) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 1)) (>= (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 1) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 2)) (>= (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 2) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 3)) (>= (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 3) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 4)) (>= (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 4) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 5)) (>= (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 5) 1.0)) 1 0)
     (ite (and (not (= visit_2_day_idx 6)) (>= (select asthma_symptom_score_nighttime_value_recorded_last_7_days_of_run_in_period_excluding_visit_2_withunit_points 6) 1.0)) 1 0)
  )
) ;; "night-time asthma symptom score >= 1 for ≥ 3 days in last 7 days excluding Visit 2"

;; Count days with completed daytime score (excluding Visit 2)
(define-fun daytime_score_completed_days_count () Int
  (+ (ite (and (not (= visit_2_day_idx 0)) (select asthma_symptom_score_daytime_completed_last_7_days_of_run_in_period_excluding_visit_2 0)) 1 0)
     (ite (and (not (= visit_2_day_idx 1)) (select asthma_symptom_score_daytime_completed_last_7_days_of_run_in_period_excluding_visit_2 1)) 1 0)
     (ite (and (not (= visit_2_day_idx 2)) (select asthma_symptom_score_daytime_completed_last_7_days_of_run_in_period_excluding_visit_2 2)) 1 0)
     (ite (and (not (= visit_2_day_idx 3)) (select asthma_symptom_score_daytime_completed_last_7_days_of_run_in_period_excluding_visit_2 3)) 1 0)
     (ite (and (not (= visit_2_day_idx 4)) (select asthma_symptom_score_daytime_completed_last_7_days_of_run_in_period_excluding_visit_2 4)) 1 0)
     (ite (and (not (= visit_2_day_idx 5)) (select asthma_symptom_score_daytime_completed_last_7_days_of_run_in_period_excluding_visit_2 5)) 1 0)
     (ite (and (not (= visit_2_day_idx 6)) (select asthma_symptom_score_daytime_completed_last_7_days_of_run_in_period_excluding_visit_2 6)) 1 0)
  )
) ;; "completion of daytime asthma symptom score on ≥ 5 days out of last 7 days excluding Visit 2"

;; Count days with completed night-time score (excluding Visit 2)
(define-fun nighttime_score_completed_days_count () Int
  (+ (ite (and (not (= visit_2_day_idx 0)) (select asthma_symptom_score_nighttime_completed_last_7_days_of_run_in_period_excluding_visit_2 0)) 1 0)
     (ite (and (not (= visit_2_day_idx 1)) (select asthma_symptom_score_nighttime_completed_last_7_days_of_run_in_period_excluding_visit_2 1)) 1 0)
     (ite (and (not (= visit_2_day_idx 2)) (select asthma_symptom_score_nighttime_completed_last_7_days_of_run_in_period_excluding_visit_2 2)) 1 0)
     (ite (and (not (= visit_2_day_idx 3)) (select asthma_symptom_score_nighttime_completed_last_7_days_of_run_in_period_excluding_visit_2 3)) 1 0)
     (ite (and (not (= visit_2_day_idx 4)) (select asthma_symptom_score_nighttime_completed_last_7_days_of_run_in_period_excluding_visit_2 4)) 1 0)
     (ite (and (not (= visit_2_day_idx 5)) (select asthma_symptom_score_nighttime_completed_last_7_days_of_run_in_period_excluding_visit_2 5)) 1 0)
     (ite (and (not (= visit_2_day_idx 6)) (select asthma_symptom_score_nighttime_completed_last_7_days_of_run_in_period_excluding_visit_2 6)) 1 0)
  )
) ;; "completion of night-time asthma symptom score on ≥ 5 days out of last 7 days excluding Visit 2"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: Both total daytime and night-time scores ≥ 6, and both daytime and night-time scores ≥ 1 per day for ≥ 3 days, and completion of scores on ≥ 5 days for both daytime and night-time
(assert
  (! (and
        (>= total_daytime_score_last_7_days_excluding_visit_2 6.0)
        (>= total_nighttime_score_last_7_days_excluding_visit_2 6.0)
        (>= daytime_score_ge_1_days_count 3)
        (>= nighttime_score_ge_1_days_count 3)
        (>= daytime_score_completed_days_count 5)
        (>= nighttime_score_completed_days_count 5)
     )
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "asthma symptom scores (total of daytime and night-time) both ≥ 6 in total AND ≥ 1 per day for ≥ 3 days in the last 7 consecutive days of the run-in period (excluding the day of Visit 2) AND completion of symptom scores (daytime and night-time) on ≥ 5 days out of the last 7 consecutive days during the run-in period"
