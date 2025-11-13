;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_female_now
         patient_sex_is_male_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age 18 and older"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age 18 and older."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_gastroesophageal_reflux_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastroesophageal reflux disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gastroesophageal reflux disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gastroesophageal reflux disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastroesophageal reflux disease."} // "gastroesophageal reflux disease"
(declare-const patient_has_finding_of_esophagitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of esophagitis.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of esophagitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of esophagitis.","meaning":"Boolean indicating whether the patient currently has a finding of esophagitis."} // "persistent esophagitis"
(declare-const patient_has_finding_of_esophagitis_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's esophagitis is persistent.","when_to_set_to_false":"Set to false if the patient's esophagitis is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's esophagitis is persistent.","meaning":"Boolean indicating whether the patient's esophagitis is persistent."} // "persistent esophagitis"
(declare-const patient_has_finding_of_heartburn_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of heartburn.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of heartburn.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of heartburn.","meaning":"Boolean indicating whether the patient currently has a finding of heartburn."} // "heartburn"
(declare-const patient_has_finding_of_upper_airway_signs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has upper airway signs.","when_to_set_to_false":"Set to false if the patient currently does not have upper airway signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has upper airway signs.","meaning":"Boolean indicating whether the patient currently has upper airway signs."} // "upper airway signs or symptoms"
(declare-const patient_has_finding_of_respiratory_symptoms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory symptoms.","meaning":"Boolean indicating whether the patient currently has respiratory symptoms."} // "respiratory symptoms"
(declare-const patient_has_finding_of_manifestations_secondary_to_gastroesophageal_reflux_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms or manifestations that are secondary to gastroesophageal reflux disease.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms or manifestations that are secondary to gastroesophageal reflux disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms or manifestations that are secondary to gastroesophageal reflux disease.","meaning":"Boolean indicating whether the patient currently has symptoms or manifestations that are secondary to gastroesophageal reflux disease."} // "symptoms or manifestations secondary to gastroesophageal reflux disease"
(declare-const patient_has_diagnosis_of_gastrointestinal_motility_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastrointestinal motility disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gastrointestinal motility disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gastrointestinal motility disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastrointestinal motility disorder."} // "gastrointestinal motility disorder"
(declare-const patient_has_finding_of_nausea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of nausea.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of nausea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of nausea.","meaning":"Boolean indicating whether the patient currently has a finding of nausea."} // "nausea"
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of vomiting.","meaning":"Boolean indicating whether the patient currently has a finding of vomiting."} // "vomiting"
(declare-const patient_has_finding_of_dyspepsia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of dyspepsia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of dyspepsia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of dyspepsia.","meaning":"Boolean indicating whether the patient currently has a finding of dyspepsia."} // "dyspepsia"
(declare-const patient_has_finding_of_dyspepsia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dyspepsia is severe.","when_to_set_to_false":"Set to false if the patient's dyspepsia is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dyspepsia is severe.","meaning":"Boolean indicating whether the patient's dyspepsia is severe."} // "severe dyspepsia"
(declare-const patient_has_finding_of_chronic_constipation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of chronic constipation.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of chronic constipation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of chronic constipation.","meaning":"Boolean indicating whether the patient currently has a finding of chronic constipation."} // "chronic constipation"
(declare-const patient_has_finding_of_chronic_constipation_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic constipation is severe.","when_to_set_to_false":"Set to false if the patient's chronic constipation is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic constipation is severe.","meaning":"Boolean indicating whether the patient's chronic constipation is severe."} // "severe chronic constipation"
(declare-const patient_has_finding_of_chronic_constipation_now@@refractory_to_standard_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic constipation is refractory to standard therapy.","when_to_set_to_false":"Set to false if the patient's chronic constipation is not refractory to standard therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic constipation is refractory to standard therapy.","meaning":"Boolean indicating whether the patient's chronic constipation is refractory to standard therapy."} // "chronic constipation that is refractory to standard therapy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_esophagitis_now@@persistent
         patient_has_finding_of_esophagitis_now)
     :named REQ2_AUXILIARY0)) ;; "persistent esophagitis" implies "esophagitis"

(assert
  (! (=> patient_has_finding_of_dyspepsia_now@@severe
         patient_has_finding_of_dyspepsia_now)
     :named REQ2_AUXILIARY1)) ;; "severe dyspepsia" implies "dyspepsia"

(assert
  (! (=> patient_has_finding_of_chronic_constipation_now@@severe
         patient_has_finding_of_chronic_constipation_now)
     :named REQ2_AUXILIARY2)) ;; "severe chronic constipation" implies "chronic constipation"

(assert
  (! (=> patient_has_finding_of_chronic_constipation_now@@refractory_to_standard_therapy
         patient_has_finding_of_chronic_constipation_now)
     :named REQ2_AUXILIARY3)) ;; "chronic constipation that is refractory to standard therapy" implies "chronic constipation"

;; Non-exhaustive examples for "manifestations secondary to GERD"
(assert
  (! (=> (or patient_has_finding_of_esophagitis_now@@persistent
             patient_has_finding_of_heartburn_now
             patient_has_finding_of_upper_airway_signs_now
             patient_has_finding_of_respiratory_symptoms_now)
         patient_has_finding_of_manifestations_secondary_to_gastroesophageal_reflux_disease_now)
     :named REQ2_AUXILIARY4)) ;; "for example, persistent esophagitis, heartburn, upper airway signs or symptoms or respiratory symptoms" are non-exhaustive examples of manifestations secondary to GERD

;; "manifestations secondary to GERD" requires GERD diagnosis
(assert
  (! (=> patient_has_finding_of_manifestations_secondary_to_gastroesophageal_reflux_disease_now
         patient_has_diagnosis_of_gastroesophageal_reflux_disease_now)
     :named REQ2_AUXILIARY5)) ;; "manifestations secondary to GERD" only if GERD diagnosis present

;; "severe chronic constipation that is refractory to standard therapy" definition
(assert
  (! (= patient_has_finding_of_chronic_constipation_now@@severe
        (and patient_has_finding_of_chronic_constipation_now
             patient_has_finding_of_chronic_constipation_now@@severe))
     :named REQ2_AUXILIARY6)) ;; "severe chronic constipation" is both chronic constipation and severe

(assert
  (! (= patient_has_finding_of_chronic_constipation_now@@refractory_to_standard_therapy
        (and patient_has_finding_of_chronic_constipation_now
             patient_has_finding_of_chronic_constipation_now@@refractory_to_standard_therapy))
     :named REQ2_AUXILIARY7)) ;; "chronic constipation that is refractory to standard therapy" is both chronic constipation and refractory

;; "severe chronic constipation that is refractory to standard therapy" is both severe and refractory
(define-fun patient_has_finding_of_severe_chronic_constipation_refractory_to_standard_therapy_now () Bool
  (and patient_has_finding_of_chronic_constipation_now@@severe
       patient_has_finding_of_chronic_constipation_now@@refractory_to_standard_therapy)) ;; "severe chronic constipation that is refractory to standard therapy"

;; "severe dyspepsia" is just the severe qualifier
(define-fun patient_has_finding_of_severe_dyspepsia_now () Bool
  patient_has_finding_of_dyspepsia_now@@severe) ;; "severe dyspepsia"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Inclusion: must have either (manifestations secondary to GERD) or (GI motility disorder such as nausea, vomiting, severe dyspepsia, or severe chronic constipation that is refractory to standard therapy)
(assert
  (! (or
        patient_has_finding_of_manifestations_secondary_to_gastroesophageal_reflux_disease_now
        patient_has_diagnosis_of_gastrointestinal_motility_disorder_now
        patient_has_finding_of_nausea_now
        patient_has_finding_of_vomiting_now
        patient_has_finding_of_severe_dyspepsia_now
        patient_has_finding_of_severe_chronic_constipation_refractory_to_standard_therapy_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have symptoms or manifestations secondary to gastroesophageal reflux disease (for example, persistent esophagitis, heartburn, upper airway signs or symptoms or respiratory symptoms), or must have gastrointestinal motility disorder such as nausea, vomiting, severe dyspepsia or severe chronic constipation that is refractory to standard therapy."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_comprehensive_evaluation_to_eliminate_other_causes_of_symptoms_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a comprehensive evaluation in the past, and the evaluation was performed to eliminate other causes of the patient's symptoms.","when_to_set_to_false":"Set to false if the patient has not undergone such a comprehensive evaluation in the past, or if the evaluation was not performed to eliminate other causes of the patient's symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a comprehensive evaluation in the past to eliminate other causes of the patient's symptoms.","meaning":"Boolean indicating whether the patient has undergone a comprehensive evaluation in the history, specifically performed to eliminate other causes of the patient's symptoms."} // "To be included, the patient must have had a comprehensive evaluation to eliminate other causes of the symptoms of the patient."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_undergone_comprehensive_evaluation_to_eliminate_other_causes_of_symptoms_in_the_history
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had a comprehensive evaluation to eliminate other causes of the symptoms of the patient."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_signed_informed_consent_for_domperidone_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent specifically for the administration of domperidone.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent specifically for the administration of domperidone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent specifically for the administration of domperidone.","meaning":"Boolean indicating whether the patient has signed an informed consent specifically for the administration of domperidone."} // "To be included, the patient must have signed informed consent for the administration of domperidone..."
(declare-const patient_has_signed_informed_consent_for_domperidone_administration@@informed_of_potential_adverse_events Bool) ;; {"when_to_set_to_true":"Set to true if the signed informed consent for domperidone administration includes information about all specified potential adverse events.","when_to_set_to_false":"Set to false if the signed informed consent for domperidone administration does not include information about all specified potential adverse events.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the signed informed consent for domperidone administration includes information about all specified potential adverse events.","meaning":"Boolean indicating whether the signed informed consent for domperidone administration includes information about all specified potential adverse events."} // "that informs the patient of potential adverse event including increased prolactin level, extrapyramidal side effect, breast change, and cardiac arrhythmia including QT prolongation and death."
(declare-const patient_has_finding_of_increased_prolactin_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased prolactin level.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased prolactin level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased prolactin level.","meaning":"Boolean indicating whether the patient currently has increased prolactin level."} // "increased prolactin level"
(declare-const patient_has_finding_of_extrapyramidal_side_effect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of extrapyramidal side effect.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of extrapyramidal side effect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has extrapyramidal side effect.","meaning":"Boolean indicating whether the patient currently has extrapyramidal side effect."} // "extrapyramidal side effect"
(declare-const patient_has_finding_of_breast_changes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of breast changes.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of breast changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has breast changes.","meaning":"Boolean indicating whether the patient currently has breast changes."} // "breast change"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} // "cardiac arrhythmia"
(declare-const patient_has_finding_of_prolonged_qt_interval_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of prolonged QT interval.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of prolonged QT interval.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has prolonged QT interval.","meaning":"Boolean indicating whether the patient currently has prolonged QT interval."} // "QT prolongation"
(declare-const patient_has_finding_of_dead_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently dead.","when_to_set_to_false":"Set to false if the patient is currently alive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently dead.","meaning":"Boolean indicating whether the patient is currently dead."} // "death"
(declare-const patient_is_exposed_to_domperidone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to domperidone.","when_to_set_to_false":"Set to false if the patient is currently not exposed to domperidone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to domperidone.","meaning":"Boolean indicating whether the patient is currently exposed to domperidone."} // "domperidone"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_signed_informed_consent_for_domperidone_administration@@informed_of_potential_adverse_events
        patient_has_signed_informed_consent_for_domperidone_administration)
     :named REQ4_AUXILIARY0)) ;; "signed informed consent for domperidone administration that informs the patient of potential adverse event..."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_has_signed_informed_consent_for_domperidone_administration
          patient_has_signed_informed_consent_for_domperidone_administration@@informed_of_potential_adverse_events)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed informed consent for the administration of domperidone that informs the patient of potential adverse event including increased prolactin level, extrapyramidal side effect, breast change, and cardiac arrhythmia including QT prolongation and death."

(declare-const patient_has_signed_informed_consent_for_domperidone_administration@@informed_of_potential_adverse_events Bool) ;; {"when_to_set_to_true":"Set to true if the signed informed consent for domperidone administration includes information about all specified potential adverse events.","when_to_set_to_false":"Set to false if the signed informed consent for domperidone administration does not include information about all specified potential adverse events.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the signed informed consent for domperidone administration includes information about all specified potential adverse events.","meaning":"Boolean indicating whether the signed informed consent for domperidone administration includes information about all specified potential adverse events."} // "To be included, the patient must have been informed that there is a potential for increased risk of adverse event with the drug listed in the domperidone protocol addendum."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_signed_informed_consent_for_domperidone_administration@@informed_of_potential_adverse_events
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have been informed that there is a potential for increased risk of adverse event with the drug listed in the domperidone protocol addendum."
