;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_peptic_ulcer_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with peptic ulcer (gastro-duodenal ulcer disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with peptic ulcer (gastro-duodenal ulcer disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with peptic ulcer (gastro-duodenal ulcer disease) at any time in the past.","meaning":"Boolean indicating whether the patient has ever been diagnosed with peptic ulcer (gastro-duodenal ulcer disease) at any time in the past."} ;; "the patient has a history of gastro-duodenal ulcer disease"

(declare-const patient_has_clinical_signs_of_peptic_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of peptic ulcer (gastro-duodenal ulcer disease).","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of peptic ulcer (gastro-duodenal ulcer disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of peptic ulcer (gastro-duodenal ulcer disease).","meaning":"Boolean indicating whether the patient currently has clinical signs of peptic ulcer (gastro-duodenal ulcer disease)."} ;; "the patient has signs of gastro-duodenal ulcer disease"

(declare-const patient_has_symptoms_of_peptic_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of peptic ulcer (gastro-duodenal ulcer disease).","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of peptic ulcer (gastro-duodenal ulcer disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of peptic ulcer (gastro-duodenal ulcer disease).","meaning":"Boolean indicating whether the patient currently has symptoms of peptic ulcer (gastro-duodenal ulcer disease)."} ;; "the patient has symptoms of gastro-duodenal ulcer disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_peptic_ulcer_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of gastro-duodenal ulcer disease."

(assert
(! (not patient_has_clinical_signs_of_peptic_ulcer_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of gastro-duodenal ulcer disease."

(assert
(! (not patient_has_symptoms_of_peptic_ulcer_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of gastro-duodenal ulcer disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poorly controlled diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poorly controlled diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has poorly controlled diabetes mellitus."} ;; "poorly controlled diabetes mellitus"

(declare-const patient_has_finding_of_diabetes_mellitus_now@@not_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus and the diabetes mellitus is not stable.","when_to_set_to_false":"Set to false if the patient currently has diabetes mellitus and the diabetes mellitus is stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diabetes mellitus is stable.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus and the diabetes mellitus is not stable."} ;; "the patient does NOT have stable diabetes mellitus medications"

(declare-const patient_has_finding_of_diabetes_mellitus_now@@medication_doses_not_stable_over_last_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus and the medication doses for diabetes mellitus have not been stable over the last month.","when_to_set_to_false":"Set to false if the patient currently has diabetes mellitus and the medication doses for diabetes mellitus have been stable over the last month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication doses for diabetes mellitus have been stable over the last month.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus and the medication doses for diabetes mellitus have not been stable over the last month."} ;; "the patient does NOT have stable diabetes mellitus medication doses over the last month"

(declare-const patient_has_finding_of_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of diabetes mellitus at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of diabetes mellitus at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had diabetes mellitus.","meaning":"Boolean indicating whether the patient has ever had diabetes mellitus at any time in the past."} ;; "history of diabetes mellitus"

(declare-const patient_diabetes_mellitus_duration_value_recorded_inthehistory_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has had diabetes mellitus, as documented in the medical history.","when_to_set_to_null":"Set to null if the duration in years of diabetes mellitus history is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration in years that the patient has had a history of diabetes mellitus, as recorded in the medical history."} ;; "history of diabetes mellitus for greater than ten years"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: poorly controlled diabetes mellitus as indicated by (the patient does NOT have stable diabetes mellitus medications OR the patient does NOT have stable diabetes mellitus medication doses over the last month)
(assert
(! (= patient_has_finding_of_diabetic_poor_control_now
     (or patient_has_finding_of_diabetes_mellitus_now@@not_stable
         patient_has_finding_of_diabetes_mellitus_now@@medication_doses_not_stable_over_last_month))
   :named REQ1_AUXILIARY0)) ;; "poorly controlled diabetes mellitus as indicated by (the patient does NOT have stable diabetes mellitus medications OR the patient does NOT have stable diabetes mellitus medication doses over the last month)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: The patient is excluded if (the patient has poorly controlled diabetes mellitus) OR (the patient has a history of diabetes mellitus for greater than ten years)
(assert
(! (not (or patient_has_finding_of_diabetic_poor_control_now
            (and patient_has_finding_of_diabetes_mellitus_inthehistory
                 (> patient_diabetes_mellitus_duration_value_recorded_inthehistory_in_years 10))))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has poorly controlled diabetes mellitus as indicated by (the patient does NOT have stable diabetes mellitus medications OR the patient does NOT have stable diabetes mellitus medication doses over the last month)) OR (the patient has a history of diabetes mellitus for greater than ten years)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_weight_decreased_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had weight decreased (weight loss) within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had weight decreased (weight loss) within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had weight decreased (weight loss) within the past 3 months.","meaning":"Boolean indicating whether the patient has had weight decreased (weight loss) within the past 3 months."} ;; "the patient has had significant weight loss in the last three months"

(declare-const patient_has_finding_of_weight_decreased_inthehistory@@temporalcontext_between_baseline_and_study_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's weight loss occurred between baseline and the study procedure.","when_to_set_to_false":"Set to false if the patient's weight loss did not occur between baseline and the study procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's weight loss occurred between baseline and the study procedure.","meaning":"Boolean indicating whether the patient's weight loss occurred between baseline and the study procedure."} ;; "the patient has had significant weight loss between baseline and the study procedure"

(declare-const patient_has_finding_of_weight_decreased_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had weight decreased (weight loss) at any time in the patient's history.","when_to_set_to_false":"Set to false if the patient has not had weight decreased (weight loss) at any time in the patient's history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had weight decreased (weight loss) at any time in the patient's history.","meaning":"Boolean indicating whether the patient has had weight decreased (weight loss) at any time in the patient's history."} ;; "weight loss"

(declare-const patient_weight_loss_amount_in_past_3_months_in_kg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's weight loss in kilograms over the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how much weight the patient has lost in the past 3 months.","meaning":"Numeric value representing the patient's weight loss in kilograms in the past 3 months."} ;; "amount of weight loss in the past 3 months"

(declare-const patient_weight_loss_amount_between_baseline_and_study_procedure_in_kg Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's weight loss in kilograms between baseline and the study procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how much weight the patient has lost between baseline and the study procedure.","meaning":"Numeric value representing the patient's weight loss in kilograms between baseline and the study procedure."} ;; "amount of weight loss between baseline and the study procedure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_weight_decreased_inthehistory@@temporalcontext_between_baseline_and_study_procedure
      patient_has_finding_of_weight_decreased_inthehistory)
:named REQ2_AUXILIARY0)) ;; "weight loss between baseline and the study procedure" implies "weight loss in history"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_weight_decreased_inthepast3months
            patient_has_finding_of_weight_decreased_inthehistory@@temporalcontext_between_baseline_and_study_procedure))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had significant weight loss in the last three months) OR (the patient has had significant weight loss between baseline and the study procedure)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_eating_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of eating disorder at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented history of eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of eating disorder.","meaning":"Boolean indicating whether the patient has ever had a history of eating disorder."} ;; "the patient has a history of eating disorder"
(declare-const patient_has_diagnosis_of_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with eating disorder.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with eating disorder.","meaning":"Boolean indicating whether the patient is currently diagnosed with eating disorder."} ;; "the patient is diagnosed with eating disorder"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_eating_disorder_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of eating disorder."

(assert
(! (not patient_has_diagnosis_of_eating_disorder_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with eating disorder."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_now@@confirmed_by_positive_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of Helicobacter pylori infection is confirmed by a positive test result.","when_to_set_to_false":"Set to false if the patient's diagnosis of Helicobacter pylori infection is not confirmed by a positive test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is confirmed by a positive test result.","meaning":"Boolean indicating whether the patient's diagnosis of Helicobacter pylori infection is confirmed by a positive test result."} ;; "the patient tests positive for Helicobacter pylori infection"

(declare-const patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_inthehistory@@not_treated_before_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of Helicobacter pylori infection in their history and has not been treated for this infection before the procedure.","when_to_set_to_false":"Set to false if the patient has ever had a diagnosis of Helicobacter pylori infection in their history and has been treated for this infection before the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been treated for this infection before the procedure.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of Helicobacter pylori infection in their history and has not been treated for this infection before the procedure."} ;; "the patient has NOT been treated for Helicobacter pylori infection before the procedure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_diagnosis_of_peptic_ulcer_inthehistory
             patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_now@@confirmed_by_positive_test
             patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_inthehistory@@not_treated_before_procedure))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of peptic ulcer) AND (the patient tests positive for Helicobacter pylori infection) AND (the patient has NOT been treated for Helicobacter pylori infection before the procedure))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_symptomatic_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of symptomatic congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of symptomatic congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of symptomatic congestive heart failure.","meaning":"Boolean indicating whether the patient currently has symptomatic congestive heart failure."} ;; "the patient has symptomatic congestive heart failure"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} ;; "the patient has cardiac arrhythmia"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} ;; "the patient has coronary artery disease"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coronary artery disease and the disease is unstable.","when_to_set_to_false":"Set to false if the patient currently has coronary artery disease and the disease is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current coronary artery disease is unstable.","meaning":"Boolean indicating whether the patient's current coronary artery disease is unstable."} ;; "the patient has unstable coronary artery disease"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for unstable coronary artery disease implies the stem variable
(assert
(! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@unstable
       patient_has_finding_of_coronary_arteriosclerosis_now)
    :named REQ5_AUXILIARY0)) ;; "the patient has unstable coronary artery disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_symptomatic_congestive_heart_failure_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has symptomatic congestive heart failure"

(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_now)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has cardiac arrhythmia"

(assert
(! (not patient_has_finding_of_coronary_arteriosclerosis_now@@unstable)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has unstable coronary artery disease"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_pre_existing_respiratory_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any pre-existing respiratory disease, regardless of specific type.","when_to_set_to_false":"Set to false if the patient currently does not have any pre-existing respiratory disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any pre-existing respiratory disease.","meaning":"Boolean indicating whether the patient currently has a pre-existing respiratory disease of any type."} ;; "pre-existing respiratory disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive lung disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive lung disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive lung disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive lung disease."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pneumonia."} ;; "pneumonia"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} ;; "cancer"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive example: chronic obstructive pulmonary disease is an example of pre-existing respiratory disease
(assert
(! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now
      patient_has_pre_existing_respiratory_disease_now)
    :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (chronic obstructive pulmonary disease)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have pre-existing respiratory disease
(assert
(! (not patient_has_pre_existing_respiratory_disease_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pre-existing respiratory disease..."

;; Exclusion: patient must NOT have pneumonia
(assert
(! (not patient_has_diagnosis_of_pneumonia_now)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumonia."

;; Exclusion: patient must NOT have cancer
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cancer."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_disorder_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the esophagus.","meaning":"Boolean indicating whether the patient currently has a disorder of the esophagus."} ;; "esophageal disease"

(declare-const patient_has_finding_of_disorder_of_esophagus_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the esophagus is significant.","when_to_set_to_false":"Set to false if the patient's disorder of the esophagus is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder of the esophagus is significant.","meaning":"Boolean indicating whether the patient's disorder of the esophagus is significant."} ;; "significant esophageal disease"

(declare-const patient_has_finding_of_zenker_s_diverticulum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Zenker's diverticulum.","when_to_set_to_false":"Set to false if the patient currently does not have Zenker's diverticulum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Zenker's diverticulum.","meaning":"Boolean indicating whether the patient currently has Zenker's diverticulum."} ;; "Zenker's diverticulum"

(declare-const patient_has_finding_of_gastro_esophageal_reflux_disease_with_esophagitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastro-esophageal reflux disease with esophagitis.","when_to_set_to_false":"Set to false if the patient currently does not have gastro-esophageal reflux disease with esophagitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastro-esophageal reflux disease with esophagitis.","meaning":"Boolean indicating whether the patient currently has gastro-esophageal reflux disease with esophagitis."} ;; "reflux esophagitis"

(declare-const patient_has_finding_of_gastro_esophageal_reflux_disease_with_esophagitis_now@@grade_three Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastro-esophageal reflux disease with esophagitis is grade three.","when_to_set_to_false":"Set to false if the patient's gastro-esophageal reflux disease with esophagitis is not grade three.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's gastro-esophageal reflux disease with esophagitis is grade three.","meaning":"Boolean indicating whether the patient's gastro-esophageal reflux disease with esophagitis is grade three."} ;; "grade three reflux esophagitis"

(declare-const patient_has_finding_of_gastro_esophageal_reflux_disease_with_esophagitis_now@@grade_four Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastro-esophageal reflux disease with esophagitis is grade four.","when_to_set_to_false":"Set to false if the patient's gastro-esophageal reflux disease with esophagitis is not grade four.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's gastro-esophageal reflux disease with esophagitis is grade four.","meaning":"Boolean indicating whether the patient's gastro-esophageal reflux disease with esophagitis is grade four."} ;; "grade four reflux esophagitis"

(declare-const patient_has_finding_of_stricture_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a stricture of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a stricture of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a stricture of the esophagus.","meaning":"Boolean indicating whether the patient currently has a stricture of the esophagus."} ;; "esophageal stricture"

(declare-const patient_has_finding_of_barrett_s_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Barrett's esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have Barrett's esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Barrett's esophagus.","meaning":"Boolean indicating whether the patient currently has Barrett's esophagus."} ;; "Barrett's esophagus"

(declare-const patient_has_finding_of_malignant_tumor_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of the esophagus.","meaning":"Boolean indicating whether the patient currently has a malignant tumor of the esophagus."} ;; "esophageal cancer"

(declare-const patient_has_finding_of_esophageal_diverticulum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an esophageal diverticulum.","when_to_set_to_false":"Set to false if the patient currently does not have an esophageal diverticulum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an esophageal diverticulum.","meaning":"Boolean indicating whether the patient currently has an esophageal diverticulum."} ;; "esophageal diverticulum"

(declare-const patient_has_finding_of_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dysphagia.","meaning":"Boolean indicating whether the patient currently has dysphagia."} ;; "dysphagia"

(declare-const patient_has_finding_of_achalasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has achalasia.","when_to_set_to_false":"Set to false if the patient currently does not have achalasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has achalasia.","meaning":"Boolean indicating whether the patient currently has achalasia."} ;; "achalasia"

(declare-const patient_has_symptoms_of_esophageal_dysmotility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of esophageal dysmotility.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of esophageal dysmotility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of esophageal dysmotility.","meaning":"Boolean indicating whether the patient currently has symptoms of esophageal dysmotility."} ;; "symptoms of esophageal dysmotility"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive example: Zenker's diverticulum implies significant esophageal disease
(assert
(! (=> patient_has_finding_of_zenker_s_diverticulum_now
       patient_has_finding_of_disorder_of_esophagus_now@@significant)
   :named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (Zenker's diverticulum)"

;; Qualifier variable implies stem variable: significant esophageal disease implies esophageal disease
(assert
(! (=> patient_has_finding_of_disorder_of_esophagus_now@@significant
       patient_has_finding_of_disorder_of_esophagus_now)
   :named REQ7_AUXILIARY1)) ;; "significant esophageal disease"

;; Qualifier variable implies stem variable: grade three reflux esophagitis implies reflux esophagitis
(assert
(! (=> patient_has_finding_of_gastro_esophageal_reflux_disease_with_esophagitis_now@@grade_three
       patient_has_finding_of_gastro_esophageal_reflux_disease_with_esophagitis_now)
   :named REQ7_AUXILIARY2)) ;; "grade three reflux esophagitis"

;; Qualifier variable implies stem variable: grade four reflux esophagitis implies reflux esophagitis
(assert
(! (=> patient_has_finding_of_gastro_esophageal_reflux_disease_with_esophagitis_now@@grade_four
       patient_has_finding_of_gastro_esophageal_reflux_disease_with_esophagitis_now)
   :named REQ7_AUXILIARY3)) ;; "grade four reflux esophagitis"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_disorder_of_esophagus_now@@significant)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant esophageal disease with non-exhaustive examples (Zenker's diverticulum)."

(assert
(! (not patient_has_finding_of_gastro_esophageal_reflux_disease_with_esophagitis_now@@grade_three)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has grade three reflux esophagitis."

(assert
(! (not patient_has_finding_of_gastro_esophageal_reflux_disease_with_esophagitis_now@@grade_four)
   :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has grade four reflux esophagitis."

(assert
(! (not patient_has_finding_of_stricture_of_esophagus_now)
   :named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has esophageal stricture."

(assert
(! (not patient_has_finding_of_barrett_s_esophagus_now)
   :named REQ7_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Barrett's esophagus."

(assert
(! (not patient_has_finding_of_malignant_tumor_of_esophagus_now)
   :named REQ7_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has esophageal cancer."

(assert
(! (not patient_has_finding_of_esophageal_diverticulum_now)
   :named REQ7_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has esophageal diverticulum."

(assert
(! (not patient_has_finding_of_dysphagia_now)
   :named REQ7_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dysphagia."

(assert
(! (not patient_has_finding_of_achalasia_now)
   :named REQ7_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has achalasia."

(assert
(! (not patient_has_symptoms_of_esophageal_dysmotility_now)
   :named REQ7_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of esophageal dysmotility."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_heavily_scarred_tissue_in_areas_of_stomach_where_plications_are_to_be_placed_observed_during_esophagogastroduodenoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is observed during esophagogastroduodenoscopy to have heavily scarred tissue in areas of the stomach where plications are to be placed.","when_to_set_to_false":"Set to false if the patient is observed during esophagogastroduodenoscopy and does not have heavily scarred tissue in areas of the stomach where plications are to be placed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is observed during esophagogastroduodenoscopy to have heavily scarred tissue in areas of the stomach where plications are to be placed.","meaning":"Boolean indicating whether the patient is observed during esophagogastroduodenoscopy to have heavily scarred tissue in areas of the stomach where plications are to be placed."} ;; "the patient is observed during esophagogastroduodenoscopy to have heavily scarred tissue in areas of the stomach where plications are to be placed."
(declare-const patient_has_malignant_tissue_in_areas_of_stomach_where_plications_are_to_be_placed_observed_during_esophagogastroduodenoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is observed during esophagogastroduodenoscopy to have malignant tissue in areas of the stomach where plications are to be placed.","when_to_set_to_false":"Set to false if the patient is observed during esophagogastroduodenoscopy and does not have malignant tissue in areas of the stomach where plications are to be placed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is observed during esophagogastroduodenoscopy to have malignant tissue in areas of the stomach where plications are to be placed.","meaning":"Boolean indicating whether the patient is observed during esophagogastroduodenoscopy to have malignant tissue in areas of the stomach where plications are to be placed."} ;; "the patient is observed during esophagogastroduodenoscopy to have malignant tissue in areas of the stomach where plications are to be placed."
(declare-const patient_has_poor_quality_tissue_in_areas_of_stomach_where_plications_are_to_be_placed_observed_during_esophagogastroduodenoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is observed during esophagogastroduodenoscopy to have poor quality tissue in areas of the stomach where plications are to be placed.","when_to_set_to_false":"Set to false if the patient is observed during esophagogastroduodenoscopy and does not have poor quality tissue in areas of the stomach where plications are to be placed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is observed during esophagogastroduodenoscopy to have poor quality tissue in areas of the stomach where plications are to be placed.","meaning":"Boolean indicating whether the patient is observed during esophagogastroduodenoscopy to have poor quality tissue in areas of the stomach where plications are to be placed."} ;; "the patient is observed during esophagogastroduodenoscopy to have poor quality tissue in areas of the stomach where plications are to be placed."
(declare-const patient_has_friable_tissue_in_areas_of_stomach_where_plications_are_to_be_placed_observed_during_esophagogastroduodenoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is observed during esophagogastroduodenoscopy to have friable tissue in areas of the stomach where plications are to be placed.","when_to_set_to_false":"Set to false if the patient is observed during esophagogastroduodenoscopy and does not have friable tissue in areas of the stomach where plications are to be placed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is observed during esophagogastroduodenoscopy to have friable tissue in areas of the stomach where plications are to be placed.","meaning":"Boolean indicating whether the patient is observed during esophagogastroduodenoscopy to have friable tissue in areas of the stomach where plications are to be placed."} ;; "the patient is observed during esophagogastroduodenoscopy to have friable tissue in areas of the stomach where plications are to be placed."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_heavily_scarred_tissue_in_areas_of_stomach_where_plications_are_to_be_placed_observed_during_esophagogastroduodenoscopy)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is observed during esophagogastroduodenoscopy to have heavily scarred tissue in areas of the stomach where plications are to be placed."

(assert
  (! (not patient_has_malignant_tissue_in_areas_of_stomach_where_plications_are_to_be_placed_observed_during_esophagogastroduodenoscopy)
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is observed during esophagogastroduodenoscopy to have malignant tissue in areas of the stomach where plications are to be placed."

(assert
  (! (not patient_has_poor_quality_tissue_in_areas_of_stomach_where_plications_are_to_be_placed_observed_during_esophagogastroduodenoscopy)
     :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is observed during esophagogastroduodenoscopy to have poor quality tissue in areas of the stomach where plications are to be placed."

(assert
  (! (not patient_has_friable_tissue_in_areas_of_stomach_where_plications_are_to_be_placed_observed_during_esophagogastroduodenoscopy)
     :named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is observed during esophagogastroduodenoscopy to have friable tissue in areas of the stomach where plications are to be placed."
