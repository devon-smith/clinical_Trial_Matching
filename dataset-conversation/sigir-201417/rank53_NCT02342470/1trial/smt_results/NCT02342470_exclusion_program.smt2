;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_aspirin_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to aspirin at any time during the 4 weeks prior to the screening period.","when_to_set_to_false":"Set to false if the patient was not exposed to aspirin at any time during the 4 weeks prior to the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to aspirin during the 4 weeks prior to the screening period.","meaning":"Boolean indicating whether the patient was exposed to aspirin during the 4 weeks prior to the screening period."} ;; "aspirin"
(declare-const patient_is_exposed_to_aspirin_inthepast4weeks@@continuously_taken Bool) ;; {"when_to_set_to_true":"Set to true if the patient was continuously exposed to aspirin throughout the entire 4 weeks prior to the screening period.","when_to_set_to_false":"Set to false if the patient was exposed to aspirin during the 4 weeks prior to screening but not continuously.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to aspirin was continuous during the 4 weeks prior to the screening period.","meaning":"Boolean indicating whether the patient's exposure to aspirin during the 4 weeks prior to screening was continuous."} ;; "has continuously taken aspirin within 4 weeks prior to the screening period"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to non-steroidal anti-inflammatory agents at any time during the 4 weeks prior to the screening period.","when_to_set_to_false":"Set to false if the patient was not exposed to non-steroidal anti-inflammatory agents at any time during the 4 weeks prior to the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to non-steroidal anti-inflammatory agents during the 4 weeks prior to the screening period.","meaning":"Boolean indicating whether the patient was exposed to non-steroidal anti-inflammatory agents during the 4 weeks prior to the screening period."} ;; "non-steroidal anti-inflammatory drugs"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@continuously_taken Bool) ;; {"when_to_set_to_true":"Set to true if the patient was continuously exposed to non-steroidal anti-inflammatory agents throughout the entire 4 weeks prior to the screening period.","when_to_set_to_false":"Set to false if the patient was exposed to non-steroidal anti-inflammatory agents during the 4 weeks prior to screening but not continuously.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to non-steroidal anti-inflammatory agents was continuous during the 4 weeks prior to the screening period.","meaning":"Boolean indicating whether the patient's exposure to non-steroidal anti-inflammatory agents during the 4 weeks prior to screening was continuous."} ;; "has continuously taken non-steroidal anti-inflammatory drugs within 4 weeks prior to the screening period"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_aspirin_inthepast4weeks@@continuously_taken
      patient_is_exposed_to_aspirin_inthepast4weeks)
   :named REQ0_AUXILIARY0)) ;; "has continuously taken aspirin within 4 weeks prior to the screening period"

(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@continuously_taken
      patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks)
   :named REQ0_AUXILIARY1)) ;; "has continuously taken non-steroidal anti-inflammatory drugs within 4 weeks prior to the screening period"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_is_exposed_to_aspirin_inthepast4weeks@@continuously_taken
            patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@continuously_taken))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has continuously taken aspirin within 4 weeks prior to the screening period) OR (the patient has continuously taken non-steroidal anti-inflammatory drugs within 4 weeks prior to the screening period)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hypersensitivity_to_pmk_s005_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of hypersensitivity to PMK-S005 documented in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of hypersensitivity to PMK-S005 documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of hypersensitivity to PMK-S005.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of hypersensitivity to PMK-S005 in their medical history."} ;; "has hypersensitivity to PMK-S005"
(declare-const patient_has_finding_of_hypersensitivity_to_aspirin_components_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of hypersensitivity to aspirin components documented in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of hypersensitivity to aspirin components documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of hypersensitivity to aspirin components.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of hypersensitivity to aspirin components in their medical history."} ;; "has hypersensitivity to aspirin components"
(declare-const patient_is_banned_from_using_pmk_s005_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently banned from using PMK-S005.","when_to_set_to_false":"Set to false if the patient is not currently banned from using PMK-S005.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently banned from using PMK-S005.","meaning":"Boolean indicating whether the patient is currently banned from using PMK-S005."} ;; "is banned from using PMK-S005"
(declare-const patient_is_banned_from_using_aspirin_components_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently banned from using aspirin components.","when_to_set_to_false":"Set to false if the patient is not currently banned from using aspirin components.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently banned from using aspirin components.","meaning":"Boolean indicating whether the patient is currently banned from using aspirin components."} ;; "is banned from using aspirin components"
(declare-const patient_has_finding_of_allergy_to_aspirin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of allergy to aspirin or its components documented in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of allergy to aspirin or its components documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergy to aspirin or its components.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to aspirin or its components in their medical history."} ;; "hypersensitivity to aspirin components"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_to_pmk_s005_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to PMK-S005."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_aspirin_components_inthehistory)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to aspirin components."

(assert
(! (not patient_is_banned_from_using_pmk_s005_now)
    :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is banned from using PMK-S005."

(assert
(! (not patient_is_banned_from_using_aspirin_components_now)
    :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is banned from using aspirin components."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_abdominal_surgery_inthehistory@@is_appendectomy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone abdominal surgery in the past and the surgery is specifically an appendectomy.","when_to_set_to_false":"Set to false if the patient has never undergone abdominal surgery in the past or the surgery is not an appendectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone abdominal surgery that is specifically an appendectomy.","meaning":"Boolean indicating whether the patient has ever undergone abdominal surgery in the past, and the surgery is specifically an appendectomy."} ;; "the abdominal surgery is NOT appendectomy"
(declare-const patient_has_undergone_abdominal_surgery_inthehistory@@is_hysterectomy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone abdominal surgery in the past and the surgery is specifically a hysterectomy.","when_to_set_to_false":"Set to false if the patient has never undergone abdominal surgery in the past or the surgery is not a hysterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone abdominal surgery that is specifically a hysterectomy.","meaning":"Boolean indicating whether the patient has ever undergone abdominal surgery in the past, and the surgery is specifically a hysterectomy."} ;; "the abdominal surgery is NOT hysterectomy"
(declare-const patient_has_undergone_operation_on_abdominal_region_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any operation on the abdominal region at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone any operation on the abdominal region at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any operation on the abdominal region.","meaning":"Boolean indicating whether the patient has ever undergone any operation on the abdominal region at any time in the past."} ;; "abdominal surgery"
(declare-const patient_has_undergone_operation_on_abdominal_region_inthehistory@@affects_gastrointestinal_motility Bool) ;; {"when_to_set_to_true":"Set to true if the operation on the abdominal region affects gastrointestinal motility.","when_to_set_to_false":"Set to false if the operation on the abdominal region does not affect gastrointestinal motility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the operation on the abdominal region affects gastrointestinal motility.","meaning":"Boolean indicating whether the operation on the abdominal region affects gastrointestinal motility."} ;; "abdominal surgery that affects gastrointestinal motility"
(declare-const patient_has_undergone_partial_excision_of_small_intestine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a partial excision of the small intestine (enterectomy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a partial excision of the small intestine (enterectomy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a partial excision of the small intestine (enterectomy).","meaning":"Boolean indicating whether the patient has ever undergone a partial excision of the small intestine (enterectomy) at any time in the past."} ;; "enterectomy regardless of the time period"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_abdominal_surgery_inthehistory@@is_appendectomy
      patient_has_undergone_operation_on_abdominal_region_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "the abdominal surgery is NOT appendectomy"

(assert
(! (=> patient_has_undergone_abdominal_surgery_inthehistory@@is_hysterectomy
      patient_has_undergone_operation_on_abdominal_region_inthehistory)
   :named REQ2_AUXILIARY1)) ;; "the abdominal surgery is NOT hysterectomy"

(assert
(! (=> patient_has_undergone_operation_on_abdominal_region_inthehistory@@affects_gastrointestinal_motility
      patient_has_undergone_operation_on_abdominal_region_inthehistory)
   :named REQ2_AUXILIARY2)) ;; "abdominal surgery that affects gastrointestinal motility"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient has had abdominal surgery that affects GI motility, and it is NOT appendectomy, and it is NOT hysterectomy
(assert
(! (not (and
         patient_has_undergone_operation_on_abdominal_region_inthehistory@@affects_gastrointestinal_motility
         (not patient_has_undergone_abdominal_surgery_inthehistory@@is_appendectomy)
         (not patient_has_undergone_abdominal_surgery_inthehistory@@is_hysterectomy)))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had abdominal surgery that affects gastrointestinal motility AND the abdominal surgery is NOT appendectomy AND the abdominal surgery is NOT hysterectomy."

;; Exclusion: patient has had enterectomy regardless of time period
(assert
(! (not patient_has_undergone_partial_excision_of_small_intestine_inthehistory)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had enterectomy regardless of the time period."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_judged_by_investigator_to_have_other_upper_gastroesophageal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the investigator currently judges the patient to have other upper gastroesophageal disease.","when_to_set_to_false":"Set to false if the investigator currently does not judge the patient to have other upper gastroesophageal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator currently judges the patient to have other upper gastroesophageal disease.","meaning":"Boolean indicating whether the patient is currently judged by the investigator to have other upper gastroesophageal disease."} ;; "judged by the investigator to have other upper gastroesophageal disease"

(declare-const patient_has_finding_of_acute_peptic_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute (active) peptic ulcer.","when_to_set_to_false":"Set to false if the patient currently does not have an acute (active) peptic ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute (active) peptic ulcer.","meaning":"Boolean indicating whether the patient currently has an acute (active) peptic ulcer."} ;; "active peptic ulcer"

(declare-const patient_has_finding_of_peptic_ulcer_now@@healing_stage Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a peptic ulcer and the ulcer is in the healing stage.","when_to_set_to_false":"Set to false if the patient currently has a peptic ulcer but it is not in the healing stage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peptic ulcer is in the healing stage.","meaning":"Boolean indicating whether the patient's current peptic ulcer is in the healing stage."} ;; "healing-stage peptic ulcer"

(declare-const patient_has_finding_of_malignant_neoplasm_of_digestive_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplasm of the digestive system.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplasm of the digestive system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplasm of the digestive system.","meaning":"Boolean indicating whether the patient currently has a malignant neoplasm of the digestive system."} ;; "digestive malignant tumor"

(declare-const patient_has_finding_of_barrett_s_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Barrett's esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have Barrett's esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Barrett's esophagus.","meaning":"Boolean indicating whether the patient currently has Barrett's esophagus."} ;; "Barrett's esophagus"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_judged_by_investigator_to_have_other_upper_gastroesophageal_disease_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is judged by the investigator to have other upper gastroesophageal disease."

(assert
(! (not patient_has_finding_of_acute_peptic_ulcer_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active peptic ulcer."

(assert
(! (not patient_has_finding_of_peptic_ulcer_now@@healing_stage)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has healing-stage peptic ulcer."

(assert
(! (not patient_has_finding_of_malignant_neoplasm_of_digestive_system_now)
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has digestive malignant tumor."

(assert
(! (not patient_has_finding_of_barrett_s_esophagus_now)
:named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Barrett's esophagus."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_irritable_bowel_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of irritable bowel syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of irritable bowel syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of irritable bowel syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of irritable bowel syndrome."} ;; "irritable bowel syndrome"
(declare-const patient_has_diagnosis_of_inflammatory_bowel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of inflammatory bowel disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of inflammatory bowel disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of inflammatory bowel disease."} ;; "inflammatory bowel disease"
(declare-const patient_has_diagnosis_of_ulcerative_colitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ulcerative colitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ulcerative colitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ulcerative colitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ulcerative colitis."} ;; "ulcerative colitis"
(declare-const patient_has_diagnosis_of_crohn_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Crohn's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Crohn's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Crohn's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Crohn's disease."} ;; "Crohn's disease"
(declare-const patient_has_diagnosis_of_zollinger_ellison_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Zollinger-Ellison syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Zollinger-Ellison syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Zollinger-Ellison syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Zollinger-Ellison syndrome."} ;; "Zollinger-Ellison syndrome"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_irritable_bowel_syndrome_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has irritable bowel syndrome."

(assert
(! (not patient_has_diagnosis_of_inflammatory_bowel_disease_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inflammatory bowel disease."

(assert
(! (not patient_has_diagnosis_of_ulcerative_colitis_now)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ulcerative colitis."

(assert
(! (not patient_has_diagnosis_of_crohn_s_disease_now)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Crohn's disease."

(assert
(! (not patient_has_diagnosis_of_zollinger_ellison_syndrome_now)
:named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Zollinger-Ellison syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_history_of_esophagus_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of esophagus cancer.","when_to_set_to_false":"Set to false if the patient does not have a documented history of esophagus cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of esophagus cancer.","meaning":"Boolean indicating whether the patient has a history of esophagus cancer."} ;; "The patient is excluded if the patient has a history of esophagus cancer."
(declare-const patient_has_history_of_liver_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of liver cancer.","when_to_set_to_false":"Set to false if the patient does not have a documented history of liver cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of liver cancer.","meaning":"Boolean indicating whether the patient has a history of liver cancer."} ;; "The patient is excluded if the patient has a history of liver cancer."
(declare-const patient_has_history_of_pancreas_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of pancreas cancer.","when_to_set_to_false":"Set to false if the patient does not have a documented history of pancreas cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of pancreas cancer.","meaning":"Boolean indicating whether the patient has a history of pancreas cancer."} ;; "The patient is excluded if the patient has a history of pancreas cancer."
(declare-const patient_has_history_of_stomach_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of stomach cancer.","when_to_set_to_false":"Set to false if the patient does not have a documented history of stomach cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of stomach cancer.","meaning":"Boolean indicating whether the patient has a history of stomach cancer."} ;; "The patient is excluded if the patient has a history of stomach cancer."
(declare-const patient_has_history_of_colorectal_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of colorectal cancer.","when_to_set_to_false":"Set to false if the patient does not have a documented history of colorectal cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of colorectal cancer.","meaning":"Boolean indicating whether the patient has a history of colorectal cancer."} ;; "The patient is excluded if the patient has a history of colorectal cancer."
(declare-const patient_has_history_of_malignant_tumor_within_5_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of malignant tumor diagnosed or treated within the past 5 years.","when_to_set_to_false":"Set to false if the patient does not have a documented history of malignant tumor diagnosed or treated within the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of malignant tumor within the past 5 years.","meaning":"Boolean indicating whether the patient has a history of malignant tumor within the past 5 years."} ;; "The patient is excluded if the patient has a history of malignant tumors within 5 years."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_history_of_esophagus_cancer)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of esophagus cancer."

(assert
(! (not patient_has_history_of_liver_cancer)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of liver cancer."

(assert
(! (not patient_has_history_of_pancreas_cancer)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pancreas cancer."

(assert
(! (not patient_has_history_of_stomach_cancer)
:named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stomach cancer."

(assert
(! (not patient_has_history_of_colorectal_cancer)
:named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of colorectal cancer."

(assert
(! (not patient_has_history_of_malignant_tumor_within_5_years)
:named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malignant tumors within 5 years."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_malabsorption_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of malabsorption syndrome at any time in the past, regardless of recency.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of malabsorption syndrome in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had malabsorption syndrome.","meaning":"Boolean indicating whether the patient has ever had malabsorption syndrome in the past."} ;; "malabsorption"
(declare-const patient_has_finding_of_malabsorption_syndrome_inthehistory@@temporalcontext_within3months_before_screening_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malabsorption syndrome occurred within 3 months before the start of the screening period.","when_to_set_to_false":"Set to false if the patient's malabsorption syndrome did not occur within 3 months before the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malabsorption syndrome occurred within 3 months before the screening period.","meaning":"Boolean indicating whether the patient's malabsorption syndrome occurred within 3 months prior to the screening period."} ;; "malabsorption within 3 months prior to the screening period"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_malabsorption_syndrome_inthehistory@@temporalcontext_within3months_before_screening_period
      patient_has_finding_of_malabsorption_syndrome_inthehistory)
:named REQ6_AUXILIARY0)) ;; "malabsorption syndrome occurred within 3 months prior to the screening period implies malabsorption syndrome in the history"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_malabsorption_syndrome_inthehistory@@temporalcontext_within3months_before_screening_period)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malabsorption within 3 months prior to the screening period."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past 2 weeks.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 2 weeks."} ;; "drugs"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast2weeks@@affects_validity_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past 2 weeks affects the validity of the study.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past 2 weeks does not affect the validity of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament affects the validity of the study.","meaning":"Boolean indicating whether the drug or medicament the patient was exposed to within the past 2 weeks affects the validity of the study."} ;; "drugs that affect the validity of the study within 2 weeks before the beginning of the clinical test"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast2weeks@@affects_validity_of_study
      patient_is_exposed_to_drug_or_medicament_inthepast2weeks)
:named REQ7_AUXILIARY0)) ;; "drugs that affect the validity of the study within 2 weeks before the beginning of the clinical test"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast2weeks@@affects_validity_of_study)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken drugs that affect the validity of the study within 2 weeks before the beginning of the clinical test)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_antithrombotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antithrombotic agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to antithrombotic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antithrombotic agents.","meaning":"Boolean indicating whether the patient is currently exposed to antithrombotic agents."} ;; "the patient needs to continuously take antithrombotic agents during the clinical test"
(declare-const patient_is_exposed_to_antithrombotic_agent_now@@continuous_exposure_during_clinical_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is continuously exposed to antithrombotic agents throughout the clinical test period.","when_to_set_to_false":"Set to false if the patient is not continuously exposed to antithrombotic agents throughout the clinical test period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is continuous during the clinical test.","meaning":"Boolean indicating whether the patient's exposure to antithrombotic agents is continuous during the clinical test."} ;; "the patient needs to continuously take antithrombotic agents during the clinical test"

(declare-const patient_is_exposed_to_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to anticoagulant agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to anticoagulant agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to anticoagulant agents.","meaning":"Boolean indicating whether the patient is currently exposed to anticoagulant agents."} ;; "the patient needs to continuously take anticoagulant agents during the clinical test"
(declare-const patient_is_exposed_to_anticoagulant_now@@continuous_exposure_during_clinical_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is continuously exposed to anticoagulant agents throughout the clinical test period.","when_to_set_to_false":"Set to false if the patient is not continuously exposed to anticoagulant agents throughout the clinical test period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is continuous during the clinical test.","meaning":"Boolean indicating whether the patient's exposure to anticoagulant agents is continuous during the clinical test."} ;; "the patient needs to continuously take anticoagulant agents during the clinical test"

(declare-const patient_is_exposed_to_acetylcholine_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to acetylcholine receptor antagonist agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to acetylcholine receptor antagonist agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to acetylcholine receptor antagonist agents.","meaning":"Boolean indicating whether the patient is currently exposed to acetylcholine receptor antagonist agents."} ;; "the patient needs to continuously take anticholine agents during the clinical test"
(declare-const patient_is_exposed_to_acetylcholine_receptor_antagonist_now@@continuous_exposure_during_clinical_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is continuously exposed to acetylcholine receptor antagonist agents throughout the clinical test period.","when_to_set_to_false":"Set to false if the patient is not continuously exposed to acetylcholine receptor antagonist agents throughout the clinical test period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is continuous during the clinical test.","meaning":"Boolean indicating whether the patient's exposure to acetylcholine receptor antagonist agents is continuous during the clinical test."} ;; "the patient needs to continuously take anticholine agents during the clinical test"

(declare-const patient_is_exposed_to_prostaglandin_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to prostaglandin agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to prostaglandin agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to prostaglandin agents.","meaning":"Boolean indicating whether the patient is currently exposed to prostaglandin agents."} ;; "the patient needs to continuously take prostaglandin agents during the clinical test"
(declare-const patient_is_exposed_to_prostaglandin_agent_now@@continuous_exposure_during_clinical_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is continuously exposed to prostaglandin agents throughout the clinical test period.","when_to_set_to_false":"Set to false if the patient is not continuously exposed to prostaglandin agents throughout the clinical test period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is continuous during the clinical test.","meaning":"Boolean indicating whether the patient's exposure to prostaglandin agents is continuous during the clinical test."} ;; "the patient needs to continuously take prostaglandin agents during the clinical test"

(declare-const patient_is_exposed_to_ulcer_healing_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ulcer healing agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to ulcer healing agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ulcer healing agents.","meaning":"Boolean indicating whether the patient is currently exposed to ulcer healing agents."} ;; "the patient needs to continuously take mucosal protective agents during the clinical test"
(declare-const patient_is_exposed_to_ulcer_healing_agent_now@@continuous_exposure_during_clinical_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is continuously exposed to ulcer healing agents throughout the clinical test period.","when_to_set_to_false":"Set to false if the patient is not continuously exposed to ulcer healing agents throughout the clinical test period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is continuous during the clinical test.","meaning":"Boolean indicating whether the patient's exposure to ulcer healing agents is continuous during the clinical test."} ;; "the patient needs to continuously take mucosal protective agents during the clinical test"

(declare-const patient_is_exposed_to_methotrexate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to methotrexate.","when_to_set_to_false":"Set to false if the patient is not currently exposed to methotrexate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to methotrexate.","meaning":"Boolean indicating whether the patient is currently exposed to methotrexate."} ;; "the patient needs to continuously take methotrexate during the clinical test"
(declare-const patient_is_exposed_to_methotrexate_now@@continuous_exposure_during_clinical_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is continuously exposed to methotrexate throughout the clinical test period.","when_to_set_to_false":"Set to false if the patient is not continuously exposed to methotrexate throughout the clinical test period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is continuous during the clinical test.","meaning":"Boolean indicating whether the patient's exposure to methotrexate is continuous during the clinical test."} ;; "the patient needs to continuously take methotrexate during the clinical test"

(declare-const patient_is_exposed_to_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antidepressant agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to antidepressant agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antidepressant agents.","meaning":"Boolean indicating whether the patient is currently exposed to antidepressant agents."} ;; "the patient needs to continuously take antidepressant agents during the clinical test"
(declare-const patient_is_exposed_to_antidepressant_now@@continuous_exposure_during_clinical_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is continuously exposed to antidepressant agents throughout the clinical test period.","when_to_set_to_false":"Set to false if the patient is not continuously exposed to antidepressant agents throughout the clinical test period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is continuous during the clinical test.","meaning":"Boolean indicating whether the patient's exposure to antidepressant agents is continuous during the clinical test."} ;; "the patient needs to continuously take antidepressant agents during the clinical test"

(declare-const patient_is_exposed_to_iron_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to iron supplement agents.","when_to_set_to_false":"Set to false if the patient is not currently exposed to iron supplement agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to iron supplement agents.","meaning":"Boolean indicating whether the patient is currently exposed to iron supplement agents."} ;; "the patient needs to continuously take iron treatment agents during the clinical test"
(declare-const patient_is_exposed_to_iron_supplement_now@@continuous_exposure_during_clinical_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is continuously exposed to iron supplement agents throughout the clinical test period.","when_to_set_to_false":"Set to false if the patient is not continuously exposed to iron supplement agents throughout the clinical test period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is continuous during the clinical test.","meaning":"Boolean indicating whether the patient's exposure to iron supplement agents is continuous during the clinical test."} ;; "the patient needs to continuously take iron treatment agents during the clinical test"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_antithrombotic_agent_now@@continuous_exposure_during_clinical_test
      patient_is_exposed_to_antithrombotic_agent_now)
    :named REQ8_AUXILIARY0)) ;; "the patient needs to continuously take antithrombotic agents during the clinical test"

(assert
(! (=> patient_is_exposed_to_anticoagulant_now@@continuous_exposure_during_clinical_test
      patient_is_exposed_to_anticoagulant_now)
    :named REQ8_AUXILIARY1)) ;; "the patient needs to continuously take anticoagulant agents during the clinical test"

(assert
(! (=> patient_is_exposed_to_acetylcholine_receptor_antagonist_now@@continuous_exposure_during_clinical_test
      patient_is_exposed_to_acetylcholine_receptor_antagonist_now)
    :named REQ8_AUXILIARY2)) ;; "the patient needs to continuously take anticholine agents during the clinical test"

(assert
(! (=> patient_is_exposed_to_prostaglandin_agent_now@@continuous_exposure_during_clinical_test
      patient_is_exposed_to_prostaglandin_agent_now)
    :named REQ8_AUXILIARY3)) ;; "the patient needs to continuously take prostaglandin agents during the clinical test"

(assert
(! (=> patient_is_exposed_to_ulcer_healing_agent_now@@continuous_exposure_during_clinical_test
      patient_is_exposed_to_ulcer_healing_agent_now)
    :named REQ8_AUXILIARY4)) ;; "the patient needs to continuously take mucosal protective agents during the clinical test"

(assert
(! (=> patient_is_exposed_to_methotrexate_now@@continuous_exposure_during_clinical_test
      patient_is_exposed_to_methotrexate_now)
    :named REQ8_AUXILIARY5)) ;; "the patient needs to continuously take methotrexate during the clinical test"

(assert
(! (=> patient_is_exposed_to_antidepressant_now@@continuous_exposure_during_clinical_test
      patient_is_exposed_to_antidepressant_now)
    :named REQ8_AUXILIARY6)) ;; "the patient needs to continuously take antidepressant agents during the clinical test"

(assert
(! (=> patient_is_exposed_to_iron_supplement_now@@continuous_exposure_during_clinical_test
      patient_is_exposed_to_iron_supplement_now)
    :named REQ8_AUXILIARY7)) ;; "the patient needs to continuously take iron treatment agents during the clinical test"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_exposed_to_antithrombotic_agent_now@@continuous_exposure_during_clinical_test)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient needs to continuously take antithrombotic agents during the clinical test"

(assert
(! (not patient_is_exposed_to_anticoagulant_now@@continuous_exposure_during_clinical_test)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient needs to continuously take anticoagulant agents during the clinical test"

(assert
(! (not patient_is_exposed_to_acetylcholine_receptor_antagonist_now@@continuous_exposure_during_clinical_test)
    :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient needs to continuously take anticholine agents during the clinical test"

(assert
(! (not patient_is_exposed_to_prostaglandin_agent_now@@continuous_exposure_during_clinical_test)
    :named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient needs to continuously take prostaglandin agents during the clinical test"

(assert
(! (not patient_is_exposed_to_ulcer_healing_agent_now@@continuous_exposure_during_clinical_test)
    :named REQ8_COMPONENT4_OTHER_REQUIREMENTS)) ;; "the patient needs to continuously take mucosal protective agents during the clinical test"

(assert
(! (not patient_is_exposed_to_methotrexate_now@@continuous_exposure_during_clinical_test)
    :named REQ8_COMPONENT5_OTHER_REQUIREMENTS)) ;; "the patient needs to continuously take methotrexate during the clinical test"

(assert
(! (not patient_is_exposed_to_antidepressant_now@@continuous_exposure_during_clinical_test)
    :named REQ8_COMPONENT6_OTHER_REQUIREMENTS)) ;; "the patient needs to continuously take antidepressant agents during the clinical test"

(assert
(! (not patient_is_exposed_to_iron_supplement_now@@continuous_exposure_during_clinical_test)
    :named REQ8_COMPONENT7_OTHER_REQUIREMENTS)) ;; "the patient needs to continuously take iron treatment agents during the clinical test"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_clinically_meaningful_laboratory_test_result_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has laboratory test results that are considered clinically meaningful.","when_to_set_to_false":"Set to false if the patient currently does not have laboratory test results that are considered clinically meaningful.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has laboratory test results that are considered clinically meaningful.","meaning":"Boolean indicating whether the patient currently has laboratory test results that are clinically meaningful."} ;; "the patient has clinically meaningful laboratory test results"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_clinically_meaningful_laboratory_test_result_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically meaningful laboratory test results."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis or history of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis or history of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of alcohol abuse.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of alcohol abuse."} ;; "the patient has known alcohol abuse"
(declare-const patient_has_diagnosis_of_drug_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis or history of drug abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis or history of drug abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of drug abuse.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of drug abuse."} ;; "the patient has known drug abuse"
(declare-const patient_has_diagnosis_of_alcohol_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis or history of alcohol dependence at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis or history of alcohol dependence at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of alcohol dependence.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of alcohol dependence."} ;; "the patient has known alcohol dependence"
(declare-const patient_has_diagnosis_of_drug_dependence_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis or history of drug dependence at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis or history of drug dependence at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of drug dependence.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of drug dependence."} ;; "the patient has known drug dependence"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_alcohol_abuse_inthehistory)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known alcohol abuse."
(assert
(! (not patient_has_diagnosis_of_drug_abuse_inthehistory)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known drug abuse."
(assert
(! (not patient_has_diagnosis_of_alcohol_dependence_inthehistory)
    :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known alcohol dependence."
(assert
(! (not patient_has_diagnosis_of_drug_dependence_inthehistory)
    :named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known drug dependence."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_able_to_be_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is biologically able to become pregnant in the future.","when_to_set_to_false":"Set to false if the patient is biologically unable to become pregnant in the future (e.g., due to sex, age, medical history, or procedures).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is able to become pregnant in the future.","meaning":"Boolean value indicating whether the patient is able to become pregnant in the future."} ;; "patient is able to become pregnant in the future"
(declare-const patient_is_planning_to_become_pregnant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to become pregnant.","when_to_set_to_false":"Set to false if the patient is not planning to become pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to become pregnant.","meaning":"Boolean indicating whether the patient is planning to become pregnant."} ;; "patient is planning to become pregnant"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (and patient_is_able_to_be_pregnant_inthefuture
             patient_is_planning_to_become_pregnant))
   :named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is planning to become pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_taken_clinical_test_drug_in_the_past_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken another clinical test drug within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not taken another clinical test drug within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken another clinical test drug within the past 1 month.","meaning":"Boolean indicating whether the patient has taken another clinical test drug within the past 1 month."} ;; "The patient is excluded if the patient has taken another clinical test drug within 1 month."

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past 1 month.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 1 month."} ;; "drug"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Exposure to any drug or medicament within 1 month does not necessarily mean exposure to another clinical test drug, but if the patient has taken another clinical test drug, they must have been exposed to a drug or medicament.
(assert
(! (=> patient_has_taken_clinical_test_drug_in_the_past_1_month
      patient_is_exposed_to_drug_or_medicament_inthepast1months)
:named REQ13_AUXILIARY0)) ;; "The patient has taken another clinical test drug within 1 month" implies "exposed to drug or medicament within 1 month"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_taken_clinical_test_drug_in_the_past_1_month)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken another clinical test drug within 1 month."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_judged_by_investigator_that_participation_in_study_is_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the investigator has judged that participation in the study is difficult for the patient.","when_to_set_to_false":"Set to false if the investigator has judged that participation in the study is not difficult for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator has judged participation in the study as difficult for the patient.","meaning":"Boolean indicating whether the investigator has judged that participation in the study is difficult for the patient."} ;; "The patient is excluded if the patient is judged by the investigator that participation in the study is difficult."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_judged_by_investigator_that_participation_in_study_is_difficult)
:named REQ14_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is judged by the investigator that participation in the study is difficult."
