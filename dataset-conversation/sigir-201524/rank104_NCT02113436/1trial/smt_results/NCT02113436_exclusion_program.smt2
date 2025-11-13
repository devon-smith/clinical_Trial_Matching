;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_upper_respiratory_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of upper respiratory tract infection documented at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of upper respiratory tract infection documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of upper respiratory tract infection.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of upper respiratory tract infection in their history."} ;; "the patient has suffered from upper respiratory tract infection"

(declare-const patient_has_finding_of_lower_respiratory_tract_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of lower respiratory tract infection documented at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of lower respiratory tract infection documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of lower respiratory tract infection.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of lower respiratory tract infection in their history."} ;; "the patient has suffered from lower respiratory tract infection"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past two weeks prior to the anchor event (Visit 1).","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past two weeks prior to the anchor event (Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past two weeks prior to the anchor event (Visit 1).","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past two weeks prior to the anchor event (Visit 1)."} ;; "the patient has received medication within two weeks prior to Visit 1"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast2weeks@@temporalcontext_within2weeks_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the two-week window for drug or medicament exposure is anchored to the period before Visit 1.","when_to_set_to_false":"Set to false if the two-week window for drug or medicament exposure is not anchored to the period before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the two-week window for drug or medicament exposure is anchored to the period before Visit 1.","meaning":"Boolean indicating whether the two-week window for drug or medicament exposure is anchored to the period before Visit 1."} ;; "within two weeks prior to Visit 1"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast2weeks@@temporalcontext_within2weeks_before_visit_1
       patient_is_exposed_to_drug_or_medicament_inthepast2weeks)
   :named REQ0_AUXILIARY0)) ;; "within two weeks prior to Visit 1"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_finding_of_upper_respiratory_infection_inthehistory
             patient_has_finding_of_lower_respiratory_tract_infection_inthehistory
             patient_is_exposed_to_drug_or_medicament_inthepast2weeks@@temporalcontext_within2weeks_before_visit_1))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has suffered from upper respiratory tract infection) AND (the patient has suffered from lower respiratory tract infection) AND (the patient has received medication within two weeks prior to Visit 1))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_upper_respiratory_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with upper respiratory tract infection.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with upper respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with upper respiratory tract infection.","meaning":"Boolean indicating whether the patient is currently diagnosed with upper respiratory tract infection."} ;; "the patient is diagnosed with upper respiratory tract infection at Visit 1"
(declare-const patient_has_diagnosis_of_upper_respiratory_infection_now@@diagnosed_at_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is diagnosed with upper respiratory tract infection at Visit 1.","when_to_set_to_false":"Set to false if the patient is not diagnosed with upper respiratory tract infection at Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis occurred at Visit 1.","meaning":"Boolean indicating whether the patient is diagnosed with upper respiratory tract infection at Visit 1."} ;; "diagnosed at Visit 1"
(declare-const patient_has_diagnosis_of_lower_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with lower respiratory tract infection.","meaning":"Boolean indicating whether the patient is currently diagnosed with lower respiratory tract infection."} ;; "the patient is diagnosed with lower respiratory tract infection at Visit 1"
(declare-const patient_has_diagnosis_of_lower_respiratory_tract_infection_now@@diagnosed_at_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is diagnosed with lower respiratory tract infection at Visit 1.","when_to_set_to_false":"Set to false if the patient is not diagnosed with lower respiratory tract infection at Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis occurred at Visit 1.","meaning":"Boolean indicating whether the patient is diagnosed with lower respiratory tract infection at Visit 1."} ;; "diagnosed at Visit 1"
(declare-const patient_has_finding_of_deep_mycosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has deep-seated mycosis.","when_to_set_to_false":"Set to false if the patient currently does not have deep-seated mycosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has deep-seated mycosis.","meaning":"Boolean indicating whether the patient currently has deep-seated mycosis."} ;; "the patient has deep-seated mycosis"
(declare-const patient_has_suspicion_of_deep_mycosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have deep-seated mycosis.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have deep-seated mycosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have deep-seated mycosis.","meaning":"Boolean indicating whether the patient is currently suspected to have deep-seated mycosis."} ;; "the patient is suspected to have deep-seated mycosis"
(declare-const patient_has_finding_of_infection_to_which_no_effective_antibacterial_is_available_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infection for which no effective antibacterial agent is available.","when_to_set_to_false":"Set to false if the patient currently does not have an infection for which no effective antibacterial agent is available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infection for which no effective antibacterial agent is available.","meaning":"Boolean indicating whether the patient currently has an infection for which no effective antibacterial agent is available."} ;; "the patient has infection to which no effective antibacterial agent is available"
(declare-const patient_is_suspected_to_have_infection_to_which_no_effective_antibacterial_is_available_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have an infection for which no effective antibacterial agent is available.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have an infection for which no effective antibacterial agent is available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have an infection for which no effective antibacterial agent is available.","meaning":"Boolean indicating whether the patient is currently suspected to have an infection for which no effective antibacterial agent is available."} ;; "the patient is suspected to have infection to which no effective antibacterial agent is available"
(declare-const patient_has_finding_of_respiratory_syncytial_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory syncytial virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory syncytial virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory syncytial virus infection.","meaning":"Boolean indicating whether the patient currently has respiratory syncytial virus infection."} ;; "the patient has respiratory syncytial virus infection"
(declare-const patient_has_suspicion_of_respiratory_syncytial_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have respiratory syncytial virus infection.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have respiratory syncytial virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have respiratory syncytial virus infection.","meaning":"Boolean indicating whether the patient is currently suspected to have respiratory syncytial virus infection."} ;; "the patient is suspected to have respiratory syncytial virus infection"
(declare-const patient_has_suspicion_of_respiratory_syncytial_virus_infection_now@@cannot_be_identified_to_be_negative_for_respiratory_syncytial_virus_antigen Bool) ;; {"when_to_set_to_true":"Set to true if the patient is suspected to have respiratory syncytial virus infection and cannot be identified to be negative for respiratory syncytial virus antigen.","when_to_set_to_false":"Set to false if the patient is suspected to have respiratory syncytial virus infection and can be identified to be negative for respiratory syncytial virus antigen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can be identified to be negative for respiratory syncytial virus antigen.","meaning":"Boolean indicating whether the patient is suspected to have respiratory syncytial virus infection and cannot be identified to be negative for respiratory syncytial virus antigen."} ;; "the patient is suspected to have respiratory syncytial virus infection AND the patient cannot be identified to be negative for respiratory syncytial virus antigen"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_upper_respiratory_infection_now@@diagnosed_at_visit_1
      patient_has_diagnosis_of_upper_respiratory_infection_now)
:named REQ1_AUXILIARY0)) ;; "diagnosed with upper respiratory tract infection at Visit 1"

(assert
(! (=> patient_has_diagnosis_of_lower_respiratory_tract_infection_now@@diagnosed_at_visit_1
      patient_has_diagnosis_of_lower_respiratory_tract_infection_now)
:named REQ1_AUXILIARY1)) ;; "diagnosed with lower respiratory tract infection at Visit 1"

(assert
(! (=> patient_has_suspicion_of_respiratory_syncytial_virus_infection_now@@cannot_be_identified_to_be_negative_for_respiratory_syncytial_virus_antigen
      patient_has_suspicion_of_respiratory_syncytial_virus_infection_now)
:named REQ1_AUXILIARY2)) ;; "suspected to have respiratory syncytial virus infection AND cannot be identified to be negative for respiratory syncytial virus antigen"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_upper_respiratory_infection_now@@diagnosed_at_visit_1)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with upper respiratory tract infection at Visit 1."

(assert
(! (not patient_has_diagnosis_of_lower_respiratory_tract_infection_now@@diagnosed_at_visit_1)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with lower respiratory tract infection at Visit 1."

(assert
(! (not patient_has_finding_of_deep_mycosis_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has deep-seated mycosis."

(assert
(! (not patient_has_suspicion_of_deep_mycosis_now)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected to have deep-seated mycosis."

(assert
(! (not patient_has_finding_of_infection_to_which_no_effective_antibacterial_is_available_now)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infection to which no effective antibacterial agent is available."

(assert
(! (not patient_is_suspected_to_have_infection_to_which_no_effective_antibacterial_is_available_now)
:named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected to have infection to which no effective antibacterial agent is available."

(assert
(! (not patient_has_finding_of_respiratory_syncytial_virus_infection_now)
:named REQ1_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has respiratory syncytial virus infection."

(assert
(! (not patient_has_suspicion_of_respiratory_syncytial_virus_infection_now@@cannot_be_identified_to_be_negative_for_respiratory_syncytial_virus_antigen)
:named REQ1_COMPONENT7_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is suspected to have respiratory syncytial virus infection AND the patient cannot be identified to be negative for respiratory syncytial virus antigen."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the respiratory system.","meaning":"Boolean indicating whether the patient currently has a disorder of the respiratory system."} ;; "respiratory disorder"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now@@other_than_bronchial_asthma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the respiratory system is not bronchial asthma.","when_to_set_to_false":"Set to false if the patient's current disorder of the respiratory system is bronchial asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is other than bronchial asthma.","meaning":"Boolean indicating whether the patient's current disorder of the respiratory system is not bronchial asthma."} ;; "respiratory disorder other than bronchial asthma"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now@@affects_assessment_of_efficacy_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the respiratory system affects the assessment of efficacy in this study (as judged by the investigator).","when_to_set_to_false":"Set to false if the patient's current disorder of the respiratory system does not affect the assessment of efficacy in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder affects the assessment of efficacy in this study.","meaning":"Boolean indicating whether the patient's current disorder of the respiratory system affects the assessment of efficacy in this study."} ;; "the investigator judges that the respiratory disorder affects the assessment of efficacy in this study"
(declare-const patient_has_finding_of_disorder_of_respiratory_system_now@@other_than_bronchial_asthma@@affects_assessment_of_efficacy_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the respiratory system that is not bronchial asthma and the investigator judges that this disorder affects the assessment of efficacy in this study.","when_to_set_to_false":"Set to false if the patient does not currently have a disorder of the respiratory system that is not bronchial asthma, or if the investigator judges that the disorder does not affect the assessment of efficacy in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the respiratory system that is not bronchial asthma and whether it affects the assessment of efficacy in this study.","meaning":"Boolean indicating whether the patient currently has a disorder of the respiratory system that is not bronchial asthma and that affects the assessment of efficacy in this study."} ;; "respiratory disorder other than bronchial asthma AND the investigator judges that the respiratory disorder affects the assessment of efficacy in this study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable (other_than_bronchial_asthma) implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_respiratory_system_now@@other_than_bronchial_asthma
      patient_has_finding_of_disorder_of_respiratory_system_now)
    :named REQ2_AUXILIARY0)) ;; "respiratory disorder other than bronchial asthma" implies "respiratory disorder"

;; Qualifier variable (affects_assessment_of_efficacy_in_this_study) implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_respiratory_system_now@@affects_assessment_of_efficacy_in_this_study
      patient_has_finding_of_disorder_of_respiratory_system_now)
    :named REQ2_AUXILIARY1)) ;; "respiratory disorder affects the assessment of efficacy in this study" implies "respiratory disorder"

;; Double qualifier variable is equivalent to conjunction of single qualifiers
(assert
(! (= patient_has_finding_of_disorder_of_respiratory_system_now@@other_than_bronchial_asthma@@affects_assessment_of_efficacy_in_this_study
      (and patient_has_finding_of_disorder_of_respiratory_system_now@@other_than_bronchial_asthma
           patient_has_finding_of_disorder_of_respiratory_system_now@@affects_assessment_of_efficacy_in_this_study))
    :named REQ2_AUXILIARY2)) ;; "respiratory disorder other than bronchial asthma AND affects assessment of efficacy in this study"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorder_of_respiratory_system_now@@other_than_bronchial_asthma@@affects_assessment_of_efficacy_in_this_study)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has respiratory disorder other than bronchial asthma) AND (the investigator judges that the respiratory disorder affects the assessment of efficacy in this study))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_unstable_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unstable liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have unstable liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable liver disease.","meaning":"Boolean indicating whether the patient currently has unstable liver disease."} ;; "the patient has unstable liver disease"

(declare-const patient_has_finding_of_chronic_stable_hepatitis_b_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic stable hepatitis B.","when_to_set_to_false":"Set to false if the patient currently does not have chronic stable hepatitis B.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic stable hepatitis B.","meaning":"Boolean indicating whether the patient currently has chronic stable hepatitis B."} ;; "the patient has chronic stable hepatitis B"

(declare-const patient_is_receiving_significant_immunosuppressive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving a significant immunosuppressive agent.","when_to_set_to_false":"Set to false if the patient is currently not receiving a significant immunosuppressive agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving a significant immunosuppressive agent.","meaning":"Boolean indicating whether the patient is currently receiving a significant immunosuppressive agent."} ;; "the patient is receiving significant immunosuppressive agent"

(declare-const patient_is_exposed_to_immunosuppressant_now@@due_to_risk_of_hepatitis_b_reactivation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to an immunosuppressive agent is specifically due to risk of hepatitis B reactivation.","when_to_set_to_false":"Set to false if the patient's current exposure to an immunosuppressive agent is not due to risk of hepatitis B reactivation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is due to risk of hepatitis B reactivation.","meaning":"Boolean indicating whether the patient's current exposure to an immunosuppressive agent is due to risk of hepatitis B reactivation."} ;; "due to risk of hepatitis B reactivation"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: unstable liver disease
(assert
(! (not patient_has_finding_of_unstable_liver_disease_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable liver disease."

;; Exclusion: chronic stable hepatitis B AND receiving significant immunosuppressive agent due to risk of hepatitis B reactivation
(assert
(! (not (and patient_has_finding_of_chronic_stable_hepatitis_b_now
             patient_is_receiving_significant_immunosuppressive_agent_now
             patient_is_exposed_to_immunosuppressant_now@@due_to_risk_of_hepatitis_b_reactivation))
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic stable hepatitis B AND the patient is receiving significant immunosuppressive agent due to risk of hepatitis B reactivation."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_malformation_of_airway_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malformation in an airway.","when_to_set_to_false":"Set to false if the patient currently does not have a malformation in an airway.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malformation in an airway.","meaning":"Boolean indicating whether the patient currently has a malformation in an airway."} ;; "the patient has malformation in an airway"

(declare-const patient_has_finding_of_obstruction_of_airway_by_foreign_body_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an obstruction of the airway by a foreign body.","when_to_set_to_false":"Set to false if the patient currently does not have an obstruction of the airway by a foreign body.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an obstruction of the airway by a foreign body.","meaning":"Boolean indicating whether the patient currently has an obstruction of the airway by a foreign body."} ;; "the patient has foreign particle lodged in an airway"

(declare-const patient_has_finding_of_gastroesophageal_reflux_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastroesophageal reflux disease and it is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has gastroesophageal reflux disease but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's gastroesophageal reflux disease is clinically significant.","meaning":"Boolean indicating whether the patient's current gastroesophageal reflux disease is clinically significant."} ;; "the patient has known pre-existing clinically significant gastroesophageal reflux disease"

(declare-const patient_has_finding_of_disorder_of_endocrine_system_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the endocrine system and it is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the endocrine system but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder of the endocrine system is clinically significant.","meaning":"Boolean indicating whether the patient's current disorder of the endocrine system is clinically significant."} ;; "the patient has known pre-existing clinically significant endocrine abnormality"

(declare-const patient_has_finding_of_autoimmune_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an autoimmune disease and it is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has an autoimmune disease but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's autoimmune disease is clinically significant.","meaning":"Boolean indicating whether the patient's current autoimmune disease is clinically significant."} ;; "the patient has known pre-existing clinically significant autoimmune abnormality"

(declare-const patient_has_finding_of_metabolic_disease_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a metabolic disease and it is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a metabolic disease but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's metabolic disease is clinically significant.","meaning":"Boolean indicating whether the patient's current metabolic disease is clinically significant."} ;; "the patient has known pre-existing clinically significant metabolic abnormality"

(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the nervous system and it is clinically significant.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the nervous system but it is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder of the nervous system is clinically significant.","meaning":"Boolean indicating whether the patient's current disorder of the nervous system is clinically significant."} ;; "the patient has known pre-existing clinically significant neurological abnormality"

(declare-const patient_has_finding_of_renal_abnormality_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically significant renal abnormality.","when_to_set_to_false":"Set to false if the patient currently has a renal abnormality but it is not clinically significant, or does not have a renal abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant renal abnormality.","meaning":"Boolean indicating whether the patient currently has a clinically significant renal abnormality."} ;; "the patient has known pre-existing clinically significant renal abnormality"

(declare-const patient_has_finding_of_gastrointestinal_abnormality_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically significant gastrointestinal abnormality.","when_to_set_to_false":"Set to false if the patient currently has a gastrointestinal abnormality but it is not clinically significant, or does not have a gastrointestinal abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant gastrointestinal abnormality.","meaning":"Boolean indicating whether the patient currently has a clinically significant gastrointestinal abnormality."} ;; "the patient has known pre-existing clinically significant gastrointestinal abnormality"

(declare-const patient_has_finding_of_hepatic_abnormality_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically significant hepatic abnormality.","when_to_set_to_false":"Set to false if the patient currently has a hepatic abnormality but it is not clinically significant, or does not have a hepatic abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant hepatic abnormality.","meaning":"Boolean indicating whether the patient currently has a clinically significant hepatic abnormality."} ;; "the patient has known pre-existing clinically significant hepatic abnormality"

(declare-const patient_has_finding_of_haematological_abnormality_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically significant haematological abnormality.","when_to_set_to_false":"Set to false if the patient currently has a haematological abnormality but it is not clinically significant, or does not have a haematological abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant haematological abnormality.","meaning":"Boolean indicating whether the patient currently has a clinically significant haematological abnormality."} ;; "the patient has known pre-existing clinically significant haematological abnormality"

(declare-const patient_has_finding_of_abnormality_of_other_system_now@@clinically_significant@@uncontrolled_with_standard_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically significant abnormality of any other system and it is uncontrolled with standard treatment.","when_to_set_to_false":"Set to false if the patient currently has a clinically significant abnormality of any other system but it is controlled with standard treatment, or does not have such an abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant abnormality of any other system that is uncontrolled with standard treatment.","meaning":"Boolean indicating whether the patient currently has a clinically significant abnormality of any other system that is uncontrolled with standard treatment."} ;; "the patient has known pre-existing clinically significant abnormality of any other system that is uncontrolled with standard treatment"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_malformation_of_airway_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malformation in an airway."

(assert
(! (not patient_has_finding_of_obstruction_of_airway_by_foreign_body_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has foreign particle lodged in an airway."

(assert
(! (not patient_has_finding_of_gastroesophageal_reflux_disease_now@@clinically_significant)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant gastroesophageal reflux disease."

(assert
(! (not patient_has_finding_of_disorder_of_endocrine_system_now@@clinically_significant)
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant endocrine abnormality."

(assert
(! (not patient_has_finding_of_autoimmune_disease_now@@clinically_significant)
    :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant autoimmune abnormality."

(assert
(! (not patient_has_finding_of_metabolic_disease_now@@clinically_significant)
    :named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant metabolic abnormality."

(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now@@clinically_significant)
    :named REQ4_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant neurological abnormality."

(assert
(! (not patient_has_finding_of_renal_abnormality_now@@clinically_significant)
    :named REQ4_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant renal abnormality."

(assert
(! (not patient_has_finding_of_gastrointestinal_abnormality_now@@clinically_significant)
    :named REQ4_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant gastrointestinal abnormality."

(assert
(! (not patient_has_finding_of_hepatic_abnormality_now@@clinically_significant)
    :named REQ4_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant hepatic abnormality."

(assert
(! (not patient_has_finding_of_haematological_abnormality_now@@clinically_significant)
    :named REQ4_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant haematological abnormality."

(assert
(! (not patient_has_finding_of_abnormality_of_other_system_now@@clinically_significant@@uncontrolled_with_standard_treatment)
    :named REQ4_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pre-existing clinically significant abnormality of any other system that is uncontrolled with standard treatment."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hypersensitivity (of any type).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hypersensitivity (of any type).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hypersensitivity (of any type).","meaning":"Boolean indicating whether the patient currently has hypersensitivity (of any type)."} ;; "hypersensitivity"

(declare-const patient_has_finding_of_hypersensitivity_condition_now@@to_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity is specifically to study medication.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity is not to study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to study medication.","meaning":"Boolean indicating whether the patient's current hypersensitivity is to study medication."} ;; "hypersensitivity to study medication"

(declare-const patient_has_finding_of_hypersensitivity_condition_now@@to_any_ingredient_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity is specifically to any ingredient of study medication.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity is not to any ingredient of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to any ingredient of study medication.","meaning":"Boolean indicating whether the patient's current hypersensitivity is to any ingredient of study medication."} ;; "hypersensitivity to any ingredient of study medication"

(declare-const patient_has_finding_of_hypersensitivity_condition_now@@to_any_ingredient_of_rescue_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypersensitivity is specifically to any ingredient of rescue medication.","when_to_set_to_false":"Set to false if the patient's current hypersensitivity is not to any ingredient of rescue medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to any ingredient of rescue medication.","meaning":"Boolean indicating whether the patient's current hypersensitivity is to any ingredient of rescue medication."} ;; "hypersensitivity to any ingredient of rescue medication"

(declare-const patient_has_finding_of_non_allergic_hypersensitivity_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has non-allergic hypersensitivity to a drug or medicament (here, rescue medication).","when_to_set_to_false":"Set to false if the patient currently does not have non-allergic hypersensitivity to a drug or medicament (here, rescue medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-allergic hypersensitivity to a drug or medicament (here, rescue medication).","meaning":"Boolean indicating whether the patient currently has non-allergic hypersensitivity to a drug or medicament (here, rescue medication)."} ;; "hypersensitivity to rescue medication"

(declare-const patient_has_suspicion_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have hypersensitivity (of any type).","when_to_set_to_false":"Set to false if the patient is currently not suspected to have hypersensitivity (of any type).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suspected to have hypersensitivity (of any type).","meaning":"Boolean indicating whether the patient is currently suspected to have hypersensitivity (of any type)."} ;; "suspected hypersensitivity"

(declare-const patient_has_suspicion_of_hypersensitivity_condition_now@@to_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the suspicion of hypersensitivity is specifically to study medication.","when_to_set_to_false":"Set to false if the suspicion of hypersensitivity is not to study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion of hypersensitivity is to study medication.","meaning":"Boolean indicating whether the suspicion of hypersensitivity is to study medication."} ;; "suspected hypersensitivity to study medication"

(declare-const patient_has_suspicion_of_hypersensitivity_condition_now@@to_any_ingredient_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the suspicion of hypersensitivity is specifically to any ingredient of study medication.","when_to_set_to_false":"Set to false if the suspicion of hypersensitivity is not to any ingredient of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion of hypersensitivity is to any ingredient of study medication.","meaning":"Boolean indicating whether the suspicion of hypersensitivity is to any ingredient of study medication."} ;; "suspected hypersensitivity to any ingredient of study medication"

(declare-const patient_has_suspicion_of_hypersensitivity_condition_now@@to_any_ingredient_of_rescue_medication Bool) ;; {"when_to_set_to_true":"Set to true if the suspicion of hypersensitivity is specifically to any ingredient of rescue medication.","when_to_set_to_false":"Set to false if the suspicion of hypersensitivity is not to any ingredient of rescue medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion of hypersensitivity is to any ingredient of rescue medication.","meaning":"Boolean indicating whether the suspicion of hypersensitivity is to any ingredient of rescue medication."} ;; "suspected hypersensitivity to any ingredient of rescue medication"

(declare-const patient_has_suspicion_of_non_allergic_hypersensitivity_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have non-allergic hypersensitivity to a drug or medicament (here, rescue medication).","when_to_set_to_false":"Set to false if the patient is currently not suspected to have non-allergic hypersensitivity to a drug or medicament (here, rescue medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is suspected to have non-allergic hypersensitivity to a drug or medicament (here, rescue medication).","meaning":"Boolean indicating whether the patient is currently suspected to have non-allergic hypersensitivity to a drug or medicament (here, rescue medication)."} ;; "suspected hypersensitivity to rescue medication"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@to_study_medication
      patient_has_finding_of_hypersensitivity_condition_now)
:named REQ5_AUXILIARY0)) ;; "hypersensitivity to study medication"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@to_any_ingredient_of_study_medication
      patient_has_finding_of_hypersensitivity_condition_now)
:named REQ5_AUXILIARY1)) ;; "hypersensitivity to any ingredient of study medication"

(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_now@@to_any_ingredient_of_rescue_medication
      patient_has_finding_of_hypersensitivity_condition_now)
:named REQ5_AUXILIARY2)) ;; "hypersensitivity to any ingredient of rescue medication"

(assert
(! (=> patient_has_suspicion_of_hypersensitivity_condition_now@@to_study_medication
      patient_has_suspicion_of_hypersensitivity_condition_now)
:named REQ5_AUXILIARY3)) ;; "suspected hypersensitivity to study medication"

(assert
(! (=> patient_has_suspicion_of_hypersensitivity_condition_now@@to_any_ingredient_of_study_medication
      patient_has_suspicion_of_hypersensitivity_condition_now)
:named REQ5_AUXILIARY4)) ;; "suspected hypersensitivity to any ingredient of study medication"

(assert
(! (=> patient_has_suspicion_of_hypersensitivity_condition_now@@to_any_ingredient_of_rescue_medication
      patient_has_suspicion_of_hypersensitivity_condition_now)
:named REQ5_AUXILIARY5)) ;; "suspected hypersensitivity to any ingredient of rescue medication"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_now@@to_study_medication)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to study medication."

(assert
(! (not patient_has_finding_of_non_allergic_hypersensitivity_to_drug_or_medicament_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to rescue medication."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_now@@to_any_ingredient_of_study_medication)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to any ingredient of study medication."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_now@@to_any_ingredient_of_rescue_medication)
:named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to any ingredient of rescue medication."

(assert
(! (not patient_has_suspicion_of_hypersensitivity_condition_now@@to_study_medication)
:named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected to have hypersensitivity to study medication."

(assert
(! (not patient_has_suspicion_of_non_allergic_hypersensitivity_to_drug_or_medicament_now)
:named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected to have hypersensitivity to rescue medication."

(assert
(! (not patient_has_suspicion_of_hypersensitivity_condition_now@@to_any_ingredient_of_study_medication)
:named REQ5_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected to have hypersensitivity to any ingredient of study medication."

(assert
(! (not patient_has_suspicion_of_hypersensitivity_condition_now@@to_any_ingredient_of_rescue_medication)
:named REQ5_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected to have hypersensitivity to any ingredient of rescue medication."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a pharmaceutical or biologic product (investigational product) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken a pharmaceutical or biologic product (investigational product) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a pharmaceutical or biologic product (investigational product) in the past.","meaning":"Boolean indicating whether the patient has ever taken a pharmaceutical or biologic product (investigational product) in the past."} ;; "product"

(declare-const patient_has_taken_pharmaceutical_biologic_product_inthehistory@@temporalcontext_within_1_month_prior_to_visit_1_or_within_five_half_lives_of_prior_investigational_study_whichever_is_longer Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a pharmaceutical or biologic product (investigational product) within 1 month prior to Visit 1 or within five half-lives of the prior investigational study (whichever is longer).","when_to_set_to_false":"Set to false if the patient has not taken a pharmaceutical or biologic product (investigational product) within 1 month prior to Visit 1 or within five half-lives of the prior investigational study (whichever is longer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a pharmaceutical or biologic product (investigational product) within the specified exclusionary window.","meaning":"Boolean indicating whether the patient has taken a pharmaceutical or biologic product (investigational product) within the exclusionary window (1 month prior to Visit 1 or within five half-lives of the prior investigational study, whichever is longer)."} ;; "within 1 month prior to Visit 1 or within five half-lives (t-half) of the prior investigational study (whichever is the longer of the two)"

(declare-const prior_investigational_product_half_life_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the half-life of the prior investigational product in days.","when_to_set_to_null":"Set to null if the half-life of the prior investigational product is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the half-life of the prior investigational product in days."} ;; "half-life of the prior investigational product in days"

(declare-const prior_investigational_product_last_treatment_date_value_recorded_in_days_before_visit_1 Real) ;; {"when_to_set_to_value":"Set to the number of days between the date of the patient's last treatment with a prior investigational product and Visit 1.","when_to_set_to_null":"Set to null if the date of last treatment or Visit 1 is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days between the patient's last treatment with a prior investigational product and Visit 1."} ;; "number of days between last treatment with prior investigational product and Visit 1"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_taken_pharmaceutical_biologic_product_inthehistory@@temporalcontext_within_1_month_prior_to_visit_1_or_within_five_half_lives_of_prior_investigational_study_whichever_is_longer
      patient_has_taken_pharmaceutical_biologic_product_inthehistory)
:named REQ6_AUXILIARY0)) ;; "patient_has_taken_pharmaceutical_biologic_product_inthehistory@@temporalcontext_within_1_month_prior_to_visit_1_or_within_five_half_lives_of_prior_investigational_study_whichever_is_longer implies patient_has_taken_pharmaceutical_biologic_product_inthehistory"

;; Definition of the exclusionary window: within 1 month prior to Visit 1 or within five half-lives (whichever is longer)
(assert
(! (= patient_has_taken_pharmaceutical_biologic_product_inthehistory@@temporalcontext_within_1_month_prior_to_visit_1_or_within_five_half_lives_of_prior_investigational_study_whichever_is_longer
     (and patient_has_taken_pharmaceutical_biologic_product_inthehistory
          (<= prior_investigational_product_last_treatment_date_value_recorded_in_days_before_visit_1
              (ite (> 30 (* 5 prior_investigational_product_half_life_value_recorded_in_days))
                   30
                   (* 5 prior_investigational_product_half_life_value_recorded_in_days)))))
:named REQ6_AUXILIARY1)) ;; "within 1 month prior to Visit 1 or within five half-lives (t-half) of the prior investigational study (whichever is the longer of the two)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_taken_pharmaceutical_biologic_product_inthehistory@@temporalcontext_within_1_month_prior_to_visit_1_or_within_five_half_lives_of_prior_investigational_study_whichever_is_longer)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has been treated with another investigational product within 1 month prior to Visit 1 or within five half-lives (t-half) of the prior investigational study (whichever is the longer of the two)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_electrocardiographic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an electrocardiographic procedure (ECG) now.","when_to_set_to_false":"Set to false if the patient has not undergone an electrocardiographic procedure (ECG) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an electrocardiographic procedure (ECG) now.","meaning":"Boolean indicating whether the patient has undergone an electrocardiographic procedure (ECG) now."} ;; "electrocardiogram"
(declare-const patient_has_undergone_electrocardiographic_procedure_now@@evaluable Bool) ;; {"when_to_set_to_true":"Set to true if the electrocardiographic procedure (ECG) now is evaluable.","when_to_set_to_false":"Set to false if the electrocardiographic procedure (ECG) now is not evaluable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the electrocardiographic procedure (ECG) now is evaluable.","meaning":"Boolean indicating whether the electrocardiographic procedure (ECG) now is evaluable."} ;; "evaluable electrocardiogram data"
(declare-const patient_has_undergone_electrocardiographic_procedure_now@@performed_at_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the electrocardiographic procedure (ECG) now was performed at Visit 1.","when_to_set_to_false":"Set to false if the electrocardiographic procedure (ECG) now was not performed at Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the electrocardiographic procedure (ECG) now was performed at Visit 1.","meaning":"Boolean indicating whether the electrocardiographic procedure (ECG) now was performed at Visit 1."} ;; "performed at Visit 1"
(declare-const patient_qt_interval_feature_value_recorded_now_withunit_milliseconds Real) ;; {"when_to_set_to_value":"Set to the measured QT interval (QTc) value in milliseconds if recorded now.","when_to_set_to_null":"Set to null if no QT interval (QTc) value in milliseconds is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's QT interval (QTc) recorded now in milliseconds."} ;; "QT interval"
(declare-const patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@based_on_averaged_qtc_values_of_triplicate_ecgs_over_brief_recording_period Bool) ;; {"when_to_set_to_true":"Set to true if the QT interval (QTc) value recorded now in milliseconds is based on averaged QTc values of triplicate electrocardiograms obtained over a brief recording period.","when_to_set_to_false":"Set to false if the QT interval (QTc) value recorded now in milliseconds is not based on averaged QTc values of triplicate electrocardiograms obtained over a brief recording period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the QT interval (QTc) value recorded now in milliseconds is based on averaged QTc values of triplicate electrocardiograms obtained over a brief recording period.","meaning":"Boolean indicating whether the QT interval (QTc) value recorded now in milliseconds is based on averaged QTc values of triplicate electrocardiograms obtained over a brief recording period."} ;; "based on averaged QTc values of triplicate electrocardiograms obtained over a brief recording period"
(declare-const patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@corrected_for_heart_rate_fridericia_correction Bool) ;; {"when_to_set_to_true":"Set to true if the QT interval (QTc) value recorded now in milliseconds is corrected for heart rate using the Fridericia correction.","when_to_set_to_false":"Set to false if the QT interval (QTc) value recorded now in milliseconds is not corrected for heart rate using the Fridericia correction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the QT interval (QTc) value recorded now in milliseconds is corrected for heart rate using the Fridericia correction.","meaning":"Boolean indicating whether the QT interval (QTc) value recorded now in milliseconds is corrected for heart rate using the Fridericia correction."} ;; "QT interval corrected for heart rate (Fridericia correction)"
(declare-const patient_has_finding_of_prolonged_qt_interval_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a prolonged QT interval.","when_to_set_to_false":"Set to false if the patient currently does not have a prolonged QT interval.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a prolonged QT interval.","meaning":"Boolean indicating whether the patient currently has a prolonged QT interval."} ;; "prolonged QTc"
(declare-const patient_has_finding_of_prolonged_qt_interval_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the prolonged QT interval is known.","when_to_set_to_false":"Set to false if the prolonged QT interval is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prolonged QT interval is known.","meaning":"Boolean indicating whether the prolonged QT interval is known."} ;; "known prolonged QTc"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Evaluable ECG at Visit 1 = evaluable ECG now AND performed at Visit 1
(assert
(! (= patient_has_undergone_electrocardiographic_procedure_now@@evaluable
(and patient_has_undergone_electrocardiographic_procedure_now
     patient_has_undergone_electrocardiographic_procedure_now@@performed_at_visit_1))
:named REQ7_AUXILIARY0)) ;; "evaluable electrocardiogram data at Visit 1"

;; QTc (Fridericia) based on triplicate ECGs = QT interval value recorded now, based on averaged triplicate ECGs, and Fridericia correction
(assert
(! (= patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@based_on_averaged_qtc_values_of_triplicate_ecgs_over_brief_recording_period
     (and patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@based_on_averaged_qtc_values_of_triplicate_ecgs_over_brief_recording_period
          patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@corrected_for_heart_rate_fridericia_correction))
:named REQ7_AUXILIARY1)) ;; "QT interval corrected for heart rate (Fridericia correction) based on averaged QTc values of triplicate electrocardiograms obtained over a brief recording period"

;; Known prolonged QTc = prolonged QT interval now AND known
(assert
(! (= patient_has_finding_of_prolonged_qt_interval_now@@known
     (and patient_has_finding_of_prolonged_qt_interval_now
          patient_has_finding_of_prolonged_qt_interval_now@@known))
:named REQ7_AUXILIARY2)) ;; "known prolonged QTc"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 1: Evaluable ECG at Visit 1 AND QTc (Fridericia, triplicate, averaged) >= 450 ms
(assert
(! (not (and patient_has_undergone_electrocardiographic_procedure_now@@evaluable
             (>= patient_qt_interval_feature_value_recorded_now_withunit_milliseconds 450)
             patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@based_on_averaged_qtc_values_of_triplicate_ecgs_over_brief_recording_period
             patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@corrected_for_heart_rate_fridericia_correction))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evaluable electrocardiogram data at Visit 1 AND the QT interval corrected for heart rate (Fridericia correction) is greater than or equal to 450 milliseconds based on averaged QTc values of triplicate electrocardiograms obtained over a brief recording period."

;; Component 2: Not evaluable ECG at Visit 1 AND known prolonged QTc >= 450 ms (any correction)
(assert
(! (not (and (not patient_has_undergone_electrocardiographic_procedure_now@@evaluable)
             patient_has_finding_of_prolonged_qt_interval_now@@known
             (>= patient_qt_interval_feature_value_recorded_now_withunit_milliseconds 450)))
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does not have evaluable electrocardiogram data at Visit 1 AND the patient has known prolonged QTc greater than or equal to 450 milliseconds (any correction is valid)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_child_in_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a child in care, including being in the foster parent system.","when_to_set_to_false":"Set to false if the patient is currently not a child in care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a child in care.","meaning":"Boolean indicating whether the patient is currently a child in care."} ;; "the patient is a child in care (including foster parent system)"
(declare-const investigator_judges_patient_inappropriate_for_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the investigator currently judges the patient to be inappropriate for the study.","when_to_set_to_false":"Set to false if the investigator currently does not judge the patient to be inappropriate for the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator currently judges the patient to be inappropriate for the study.","meaning":"Boolean indicating whether the investigator currently judges the patient to be inappropriate for the study."} ;; "the investigator judges the patient inappropriate for the study"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_child_in_care_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a child in care (including foster parent system)."

(assert
(! (not investigator_judges_patient_inappropriate_for_study_now)
:named REQ8_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the investigator judges the patient inappropriate for the study."
