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
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poorly controlled diabetes.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poorly controlled diabetes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of poorly controlled diabetes.","meaning":"Boolean indicating whether the patient currently has poorly controlled diabetes."} ;; "poorly controlled diabetes"

(declare-const patient_has_stable_diabetes_medications_over_last_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had stable diabetes medications over the last one month.","when_to_set_to_false":"Set to false if the patient has not had stable diabetes medications over the last one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had stable diabetes medications over the last one month.","meaning":"Boolean indicating whether the patient has had stable diabetes medications over the last one month."} ;; "the lack of stable diabetes medications over the last one month"

(declare-const patient_has_stable_diabetes_medication_doses_over_last_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had stable diabetes medication doses over the last one month.","when_to_set_to_false":"Set to false if the patient has not had stable diabetes medication doses over the last one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had stable diabetes medication doses over the last one month.","meaning":"Boolean indicating whether the patient has had stable diabetes medication doses over the last one month."} ;; "the lack of stable diabetes medication doses over the last one month"

(declare-const patient_has_finding_of_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of diabetes mellitus in their history.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of diabetes mellitus in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had the clinical finding of diabetes mellitus in their history.","meaning":"Boolean indicating whether the patient has ever had diabetes mellitus in their history."} ;; "history of diabetes"

(declare-const patient_history_of_diabetes_duration_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has had diabetes, if known.","when_to_set_to_null":"Set to null if the duration in years of the patient's history of diabetes is unknown or cannot be determined.","meaning":"Numeric value indicating the duration in years of the patient's history of diabetes."} ;; "history of diabetes for greater than ten years"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: poorly controlled diabetes as indicated by (the lack of stable diabetes medications AND the lack of stable diabetes medication doses over the last one month)
(assert
(! (= patient_has_finding_of_diabetic_poor_control_now
     (and (not patient_has_stable_diabetes_medications_over_last_1_month)
          (not patient_has_stable_diabetes_medication_doses_over_last_1_month)))
:named REQ1_AUXILIARY0)) ;; "poorly controlled diabetes as indicated by (the lack of stable diabetes medications AND the lack of stable diabetes medication doses over the last one month)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient has poorly controlled diabetes as defined above
(assert
(! (not patient_has_finding_of_diabetic_poor_control_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poorly controlled diabetes as indicated by (the lack of stable diabetes medications AND the lack of stable diabetes medication doses over the last one month)."

;; Exclusion: patient has a history of diabetes for greater than ten years
(assert
(! (not (and patient_has_finding_of_diabetes_mellitus_inthehistory
             (> patient_history_of_diabetes_duration_years 10)))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of diabetes for greater than ten years."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_weight_decreased_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had weight loss at any time in the past.","when_to_set_to_false":"Set to false if the patient has not had weight loss at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had weight loss at any time in the past.","meaning":"Boolean indicating whether the patient has had weight loss at any time in the past."} ;; "weight loss"
(declare-const patient_has_finding_of_weight_decreased_inthehistory@@temporalcontext_between_baseline_and_study_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's weight loss occurred between baseline and the study procedure.","when_to_set_to_false":"Set to false if the patient's weight loss did not occur between baseline and the study procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's weight loss occurred between baseline and the study procedure.","meaning":"Boolean indicating whether the patient's weight loss occurred between baseline and the study procedure."} ;; "weight loss between baseline and the study procedure"
(declare-const patient_has_finding_of_weight_decreased_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had weight loss within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had weight loss within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had weight loss within the past 3 months.","meaning":"Boolean indicating whether the patient has had weight loss within the past 3 months."} ;; "weight loss in the last three months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_weight_decreased_inthehistory@@temporalcontext_between_baseline_and_study_procedure
       patient_has_finding_of_weight_decreased_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "weight loss between baseline and the study procedure" implies "weight loss at any time in the past"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_weight_decreased_inthepast3months
            patient_has_finding_of_weight_decreased_inthehistory@@temporalcontext_between_baseline_and_study_procedure))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has had significant weight loss in the last three months) OR (the patient has had significant weight loss between baseline and the study procedure))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_eating_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of eating disorders at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented history of eating disorders.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of eating disorders.","meaning":"Boolean indicating whether the patient has ever had a documented history of eating disorders."} ;; "the patient has a history of eating disorders"
(declare-const patient_has_diagnosis_of_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with eating disorders.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with eating disorders.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with eating disorders.","meaning":"Boolean indicating whether the patient is currently diagnosed with eating disorders."} ;; "the patient is diagnosed with eating disorders"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_eating_disorder_inthehistory
            patient_has_diagnosis_of_eating_disorder_now))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of eating disorders) OR (the patient is diagnosed with eating disorders)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
;; "the patient has a history of peptic ulcer"
;; Already declared: (declare-const patient_has_diagnosis_of_peptic_ulcer_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with peptic ulcer (gastro-duodenal ulcer disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with peptic ulcer (gastro-duodenal ulcer disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with peptic ulcer (gastro-duodenal ulcer disease) at any time in the past.","meaning":"Boolean indicating whether the patient has ever been diagnosed with peptic ulcer (gastro-duodenal ulcer disease) at any time in the past."}

(declare-const patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of Helicobacter pylori infection (e.g., by positive test).","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of Helicobacter pylori infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of Helicobacter pylori infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Helicobacter pylori infection."} ;; "the patient tests positive for Helicobacter pylori infection"

(declare-const patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_now@@confirmed_by_positive_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of Helicobacter pylori infection is confirmed by a positive test.","when_to_set_to_false":"Set to false if the patient's current diagnosis of Helicobacter pylori infection is not confirmed by a positive test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is confirmed by a positive test.","meaning":"Boolean indicating whether the patient's current diagnosis of Helicobacter pylori infection is confirmed by a positive test."} ;; "the patient tests positive for Helicobacter pylori infection"

(declare-const patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of Helicobacter pylori infection at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of Helicobacter pylori infection in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of Helicobacter pylori infection in the past.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of Helicobacter pylori infection in the past."} ;; "Helicobacter pylori infection in the history"

(declare-const patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_inthehistory@@not_treated_before_the_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of Helicobacter pylori infection in the past and this infection has not been treated before the procedure.","when_to_set_to_false":"Set to false if the patient has ever had a diagnosis of Helicobacter pylori infection in the past and this infection has been treated before the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection has been treated before the procedure.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of Helicobacter pylori infection in the past and this infection has not been treated before the procedure."} ;; "the patient has NOT been treated for Helicobacter pylori infection before the procedure"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_inthehistory@@not_treated_before_the_procedure
       patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_inthehistory)
:named REQ4_AUXILIARY0)) ;; "the patient has NOT been treated for Helicobacter pylori infection before the procedure"

;; Positive test confirmation implies current diagnosis
(assert
(! (=> patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_now@@confirmed_by_positive_test
       patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_now)
:named REQ4_AUXILIARY1)) ;; "the patient tests positive for Helicobacter pylori infection"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_diagnosis_of_peptic_ulcer_inthehistory
             patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_now@@confirmed_by_positive_test
             patient_has_diagnosis_of_infection_caused_by_helicobacter_pylori_inthehistory@@not_treated_before_the_procedure))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of peptic ulcer) AND (the patient tests positive for Helicobacter pylori infection) AND (the patient has NOT been treated for Helicobacter pylori infection before the procedure))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_symptomatic_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of symptomatic congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of symptomatic congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptomatic congestive heart failure.","meaning":"Boolean indicating whether the patient currently has symptomatic congestive heart failure."} ;; "symptomatic congestive heart failure"

(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} ;; "cardiac arrhythmia"

(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} ;; "coronary artery disease"

(declare-const patient_has_finding_of_coronary_arteriosclerosis_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coronary artery disease and the disease is unstable.","when_to_set_to_false":"Set to false if the patient currently has coronary artery disease and the disease is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary artery disease is unstable.","meaning":"Boolean indicating whether the patient's coronary artery disease is unstable."} ;; "unstable coronary artery disease"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_coronary_arteriosclerosis_now@@unstable
      patient_has_finding_of_coronary_arteriosclerosis_now)
:named REQ5_AUXILIARY0)) ;; "unstable coronary artery disease""

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have symptomatic congestive heart failure
(assert
(! (not patient_has_finding_of_symptomatic_congestive_heart_failure_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptomatic congestive heart failure."

;; Exclusion: patient must NOT have cardiac arrhythmia
(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiac arrhythmia."

;; Exclusion: patient must NOT have unstable coronary artery disease
(assert
(! (not patient_has_finding_of_coronary_arteriosclerosis_now@@unstable)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable coronary artery disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_disorder_of_respiratory_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of the respiratory system (respiratory disease) at any time prior to study entry.","when_to_set_to_false":"Set to false if the patient has never had a disorder of the respiratory system (respiratory disease) prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of the respiratory system (respiratory disease) prior to study entry.","meaning":"Boolean indicating whether the patient has ever had a disorder of the respiratory system (respiratory disease) in their history."} ;; "respiratory disease"
(declare-const patient_has_finding_of_chronic_obstructive_pulmonary_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had chronic obstructive pulmonary disease (COPD) at any time prior to study entry.","when_to_set_to_false":"Set to false if the patient has never had chronic obstructive pulmonary disease (COPD) prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chronic obstructive pulmonary disease (COPD) prior to study entry.","meaning":"Boolean indicating whether the patient has ever had chronic obstructive pulmonary disease (COPD) in their history."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had pneumonia at any time prior to study entry.","when_to_set_to_false":"Set to false if the patient has never had pneumonia prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had pneumonia prior to study entry.","meaning":"Boolean indicating whether the patient has ever had pneumonia in their history."} ;; "pneumonia"
(declare-const patient_has_finding_of_respiratory_cancer_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had respiratory cancer (e.g., lung cancer) at any time prior to study entry.","when_to_set_to_false":"Set to false if the patient has never had respiratory cancer (e.g., lung cancer) prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had respiratory cancer (e.g., lung cancer) prior to study entry.","meaning":"Boolean indicating whether the patient has ever had respiratory cancer (e.g., lung cancer) in their history."} ;; "respiratory cancer"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_chronic_obstructive_pulmonary_disease_inthehistory
           patient_has_finding_of_pneumonia_inthehistory
           patient_has_finding_of_respiratory_cancer_inthehistory)
       patient_has_finding_of_disorder_of_respiratory_system_inthehistory)
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (chronic obstructive pulmonary disease, pneumonia, respiratory cancer)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_disorder_of_respiratory_system_inthehistory)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pre-existing respiratory disease with non-exhaustive examples (chronic obstructive pulmonary disease, pneumonia, respiratory cancer)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_disorder_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disorder of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disorder of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disorder of the esophagus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disorder of the esophagus."} ;; "esophageal disease"
(declare-const patient_has_diagnosis_of_disorder_of_esophagus_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of a disorder of the esophagus is considered significant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of a disorder of the esophagus is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of a disorder of the esophagus is significant.","meaning":"Boolean indicating whether the patient's current diagnosis of a disorder of the esophagus is significant."} ;; "significant esophageal disease"
(declare-const patient_has_diagnosis_of_zenkers_diverticulum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Zenker's diverticulum.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Zenker's diverticulum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Zenker's diverticulum.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Zenker's diverticulum."} ;; "Zenker's diverticulum"
(declare-const patient_has_diagnosis_of_reflux_esophagitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of reflux esophagitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of reflux esophagitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of reflux esophagitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of reflux esophagitis."} ;; "reflux esophagitis"
(declare-const patient_has_diagnosis_of_reflux_esophagitis_now@@grade_three_or_grade_four Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current reflux esophagitis is classified as grade three or grade four.","when_to_set_to_false":"Set to false if the patient's current reflux esophagitis is not classified as grade three or grade four.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current reflux esophagitis is classified as grade three or grade four.","meaning":"Boolean indicating whether the patient's current reflux esophagitis is classified as grade three or grade four."} ;; "grade three or grade four reflux esophagitis"
(declare-const patient_has_diagnosis_of_esophageal_stricture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of esophageal stricture.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of esophageal stricture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of esophageal stricture.","meaning":"Boolean indicating whether the patient currently has a diagnosis of esophageal stricture."} ;; "esophageal stricture"
(declare-const patient_has_diagnosis_of_barretts_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Barrett's esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Barrett's esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Barrett's esophagus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Barrett's esophagus."} ;; "Barrett's esophagus"
(declare-const patient_has_diagnosis_of_esophageal_cancer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of esophageal cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of esophageal cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of esophageal cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of esophageal cancer."} ;; "esophageal cancer"
(declare-const patient_has_diagnosis_of_esophageal_diverticulum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of esophageal diverticulum.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of esophageal diverticulum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of esophageal diverticulum.","meaning":"Boolean indicating whether the patient currently has a diagnosis of esophageal diverticulum."} ;; "esophageal diverticulum"
(declare-const patient_has_symptom_of_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the symptom of dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the symptom of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the symptom of dysphagia.","meaning":"Boolean indicating whether the patient currently has the symptom of dysphagia."} ;; "dysphagia"
(declare-const patient_has_diagnosis_of_achalasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of achalasia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of achalasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of achalasia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of achalasia."} ;; "achalasia"
(declare-const patient_has_symptom_of_esophageal_dysmotility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of esophageal dysmotility.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of esophageal dysmotility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of esophageal dysmotility.","meaning":"Boolean indicating whether the patient currently has symptoms of esophageal dysmotility."} ;; "symptoms of esophageal dysmotility"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply significant esophageal disease
(assert
(! (=> (or patient_has_diagnosis_of_zenkers_diverticulum_now
           patient_has_diagnosis_of_reflux_esophagitis_now@@grade_three_or_grade_four
           patient_has_diagnosis_of_esophageal_stricture_now
           patient_has_diagnosis_of_barretts_esophagus_now
           patient_has_diagnosis_of_esophageal_cancer_now
           patient_has_diagnosis_of_esophageal_diverticulum_now
           patient_has_symptom_of_dysphagia_now
           patient_has_diagnosis_of_achalasia_now
           patient_has_symptom_of_esophageal_dysmotility_now)
        patient_has_diagnosis_of_disorder_of_esophagus_now@@is_significant)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (Zenker's diverticulum, grade three or grade four reflux esophagitis, esophageal stricture, Barrett's esophagus, esophageal cancer, esophageal diverticulum, dysphagia, achalasia, symptoms of esophageal dysmotility)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_esophagus_now@@is_significant
       patient_has_diagnosis_of_disorder_of_esophagus_now)
:named REQ7_AUXILIARY1)) ;; "significant esophageal disease" implies "esophageal disease"

;; Qualifier variable for reflux esophagitis implies stem variable
(assert
(! (=> patient_has_diagnosis_of_reflux_esophagitis_now@@grade_three_or_grade_four
       patient_has_diagnosis_of_reflux_esophagitis_now)
:named REQ7_AUXILIARY2)) ;; "grade three or grade four reflux esophagitis" implies "reflux esophagitis"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_esophagus_now@@is_significant)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant esophageal disease with non-exhaustive examples (Zenker's diverticulum, grade three or grade four reflux esophagitis, esophageal stricture, Barrett's esophagus, esophageal cancer, esophageal diverticulum, dysphagia, achalasia, symptoms of esophageal dysmotility)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_esophagogastroduodenoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing or has undergone an esophagogastroduodenoscopy.","when_to_set_to_false":"Set to false if the patient has not undergone and is not currently undergoing an esophagogastroduodenoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone or is undergoing an esophagogastroduodenoscopy.","meaning":"Boolean indicating whether the patient is currently undergoing or has undergone an esophagogastroduodenoscopy."} ;; "esophagogastroduodenoscopy"

(declare-const patient_is_exposed_to_human_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human tissue present.","when_to_set_to_false":"Set to false if the patient does not currently have human tissue present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human tissue present.","meaning":"Boolean indicating whether the patient currently has human tissue present."} ;; "tissue"

(declare-const patient_is_exposed_to_human_tissue_now@@heavily_scarred Bool) ;; {"when_to_set_to_true":"Set to true if the human tissue present is heavily scarred.","when_to_set_to_false":"Set to false if the human tissue present is not heavily scarred.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the human tissue is heavily scarred.","meaning":"Boolean indicating whether the human tissue present is heavily scarred."} ;; "heavily scarred tissue"

(declare-const patient_is_exposed_to_human_tissue_now@@located_in_areas_of_stomach_where_plications_are_to_be_placed Bool) ;; {"when_to_set_to_true":"Set to true if the human tissue present is located in areas of the stomach where plications are to be placed.","when_to_set_to_false":"Set to false if the human tissue present is not located in those areas.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the human tissue is located in those areas.","meaning":"Boolean indicating whether the human tissue present is located in areas of the stomach where plications are to be placed."} ;; "in areas of the stomach where plications are to be placed"

(declare-const patient_is_exposed_to_human_tissue_now@@malignant Bool) ;; {"when_to_set_to_true":"Set to true if the human tissue present is malignant.","when_to_set_to_false":"Set to false if the human tissue present is not malignant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the human tissue is malignant.","meaning":"Boolean indicating whether the human tissue present is malignant."} ;; "malignant tissue"

(declare-const patient_is_exposed_to_human_tissue_now@@poor_quality Bool) ;; {"when_to_set_to_true":"Set to true if the human tissue present is poor quality.","when_to_set_to_false":"Set to false if the human tissue present is not poor quality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the human tissue is poor quality.","meaning":"Boolean indicating whether the human tissue present is poor quality."} ;; "poor quality tissue"

(declare-const patient_is_exposed_to_human_tissue_now@@friable Bool) ;; {"when_to_set_to_true":"Set to true if the human tissue present is friable.","when_to_set_to_false":"Set to false if the human tissue present is not friable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the human tissue is friable.","meaning":"Boolean indicating whether the human tissue present is friable."} ;; "friable tissue"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_human_tissue_now@@heavily_scarred
      patient_is_exposed_to_human_tissue_now)
:named REQ8_AUXILIARY0)) ;; "heavily scarred tissue"

(assert
(! (=> patient_is_exposed_to_human_tissue_now@@malignant
      patient_is_exposed_to_human_tissue_now)
:named REQ8_AUXILIARY1)) ;; "malignant tissue"

(assert
(! (=> patient_is_exposed_to_human_tissue_now@@poor_quality
      patient_is_exposed_to_human_tissue_now)
:named REQ8_AUXILIARY2)) ;; "poor quality tissue"

(assert
(! (=> patient_is_exposed_to_human_tissue_now@@friable
      patient_is_exposed_to_human_tissue_now)
:named REQ8_AUXILIARY3)) ;; "friable tissue"

(assert
(! (=> patient_is_exposed_to_human_tissue_now@@located_in_areas_of_stomach_where_plications_are_to_be_placed
      patient_is_exposed_to_human_tissue_now)
:named REQ8_AUXILIARY4)) ;; "in areas of the stomach where plications are to be placed"

;; ===================== Constraint Assertions (REQ 8) =====================
;; 1. Heavily scarred tissue in areas of the stomach where plications are to be placed
(assert
(! (not (and patient_has_undergone_esophagogastroduodenoscopy_now
             patient_is_exposed_to_human_tissue_now@@heavily_scarred
             patient_is_exposed_to_human_tissue_now@@located_in_areas_of_stomach_where_plications_are_to_be_placed))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "heavily scarred tissue in areas of the stomach where plications are to be placed"

;; 2. Malignant tissue in areas of the stomach where plications are to be placed
(assert
(! (not (and patient_has_undergone_esophagogastroduodenoscopy_now
             patient_is_exposed_to_human_tissue_now@@malignant
             patient_is_exposed_to_human_tissue_now@@located_in_areas_of_stomach_where_plications_are_to_be_placed))
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "malignant tissue in areas of the stomach where plications are to be placed"

;; 3. Poor quality tissue in areas of the stomach where plications are to be placed
(assert
(! (not (and patient_has_undergone_esophagogastroduodenoscopy_now
             patient_is_exposed_to_human_tissue_now@@poor_quality
             patient_is_exposed_to_human_tissue_now@@located_in_areas_of_stomach_where_plications_are_to_be_placed))
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "poor quality tissue in areas of the stomach where plications are to be placed"

;; 4. Friable tissue in areas of the stomach where plications are to be placed
(assert
(! (not (and patient_has_undergone_esophagogastroduodenoscopy_now
             patient_is_exposed_to_human_tissue_now@@friable
             patient_is_exposed_to_human_tissue_now@@located_in_areas_of_stomach_where_plications_are_to_be_placed))
:named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "friable tissue in areas of the stomach where plications are to be placed"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "the patient has renal insufficiency"
(declare-const patient_has_finding_of_hepatic_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic insufficiency.","meaning":"Boolean indicating whether the patient currently has hepatic insufficiency."} ;; "the patient has hepatic insufficiency"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_finding_of_renal_insufficiency_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal insufficiency."

(assert
  (! (not patient_has_finding_of_hepatic_insufficiency_now)
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_disorder_of_thyroid_gland_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of thyroid gland (thyroid disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of thyroid gland (thyroid disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of thyroid gland (thyroid disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of thyroid gland (thyroid disease)."} ;; "thyroid disease"
(declare-const patient_has_diagnosis_of_disorder_of_thyroid_gland_now@@not_controlled_with_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of thyroid gland (thyroid disease) and the disease is NOT controlled with medication.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of disorder of thyroid gland (thyroid disease) and the disease IS controlled with medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thyroid disease is controlled with medication.","meaning":"Boolean indicating whether the patient's current thyroid disease is NOT controlled with medication."} ;; "thyroid disease is NOT controlled with medication"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_thyroid_gland_now@@not_controlled_with_medication
      patient_has_diagnosis_of_disorder_of_thyroid_gland_now)
   :named REQ10_AUXILIARY0)) ;; "thyroid disease is NOT controlled with medication" implies "thyroid disease"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_thyroid_gland_now@@not_controlled_with_medication)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (thyroid disease AND thyroid disease is NOT controlled with medication)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_stricture_of_intestine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding or diagnosis of intestinal stricture at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a finding or diagnosis of intestinal stricture at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding or diagnosis of intestinal stricture.","meaning":"Boolean indicating whether the patient has ever had a finding or diagnosis of intestinal stricture in their medical history."} ;; "the patient has a history of intestinal strictures"

(declare-const patient_has_finding_of_adhesion_of_intestine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding or diagnosis of intestinal adhesion at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a finding or diagnosis of intestinal adhesion at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding or diagnosis of intestinal adhesion.","meaning":"Boolean indicating whether the patient has ever had a finding or diagnosis of intestinal adhesion in their medical history."} ;; "the patient has a history of intestinal adhesions"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_stricture_of_intestine_inthehistory)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intestinal strictures."

(assert
(! (not patient_has_finding_of_adhesion_of_intestine_inthehistory)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intestinal adhesions."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic infection (sepsis).","when_to_set_to_false":"Set to false if the patient currently does not have a systemic infection (sepsis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a systemic infection (sepsis).","meaning":"Boolean indicating whether the patient currently has a systemic infection (sepsis)."} ;; "systemic infection"

(declare-const patient_has_finding_of_sepsis_now@@temporalcontext_at_the_time_of_plication_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a systemic infection (sepsis) at the time of the plication procedure.","when_to_set_to_false":"Set to false if the patient does not have a systemic infection (sepsis) at the time of the plication procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a systemic infection (sepsis) at the time of the plication procedure.","meaning":"Boolean indicating whether the patient has a systemic infection (sepsis) at the time of the plication procedure."} ;; "systemic infection in the body at the time of the plication procedure"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_sepsis_now@@temporalcontext_at_the_time_of_plication_procedure
      patient_has_finding_of_sepsis_now)
:named REQ12_AUXILIARY0)) ;; "systemic infection in the body at the time of the plication procedure"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_sepsis_now@@temporalcontext_at_the_time_of_plication_procedure)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systemic infection in the body at the time of the plication procedure."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient is currently pregnant, such as a positive urine or blood pregnancy test prior to the procedure.","when_to_set_to_false":"Set to false if there is evidence that the patient is not currently pregnant, such as a negative pregnancy test or clinical assessment.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_has_positive_urine_pregnancy_test_prior_to_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented positive urine pregnancy test result that occurred prior to the procedure.","when_to_set_to_false":"Set to false if the patient has a documented negative urine pregnancy test result prior to the procedure, or no positive result is documented prior to the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a positive urine pregnancy test prior to the procedure.","meaning":"Boolean indicating whether the patient has a positive urine pregnancy test result prior to the procedure."} ;; "positive urine pregnancy test prior to the procedure"
(declare-const patient_has_positive_blood_pregnancy_test_prior_to_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented positive blood pregnancy test result that occurred prior to the procedure.","when_to_set_to_false":"Set to false if the patient has a documented negative blood pregnancy test result prior to the procedure, or no positive result is documented prior to the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a positive blood pregnancy test prior to the procedure.","meaning":"Boolean indicating whether the patient has a positive blood pregnancy test result prior to the procedure."} ;; "positive blood pregnancy test prior to the procedure"
(declare-const patient_is_suspected_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is clinical suspicion or documentation that the patient may currently be pregnant.","when_to_set_to_false":"Set to false if there is no clinical suspicion or documentation that the patient may currently be pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to be pregnant.","meaning":"Boolean indicating whether the patient is currently suspected to be pregnant."} ;; "the patient is suspected to be pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently producing breast milk (lactating).","when_to_set_to_false":"Set to false if the patient is not currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (e.g., premenopausal and not surgically sterilized).","when_to_set_to_false":"Set to false if the patient does not have childbearing potential (e.g., postmenopausal, surgically sterilized).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is of childbearing potential"
(declare-const patient_refuses_to_use_adequate_contraception_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient refuses to use adequate contraception during the study period.","when_to_set_to_false":"Set to false if the patient agrees to use adequate contraception during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses to use adequate contraception during the study period.","meaning":"Boolean indicating whether the patient refuses to use adequate contraception during the study period."} ;; "the patient refuses to use adequate contraception during the study"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception.","when_to_set_to_false":"Set to false if the patient is currently not using contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using contraception.","meaning":"Boolean indicating whether the patient is currently using contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@adequate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and the contraception is considered adequate.","when_to_set_to_false":"Set to false if the patient is currently using contraception but it is not considered adequate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception is adequate.","meaning":"Boolean indicating whether the patient is currently using adequate contraception."} ;; "adequate contraception"
(declare-const patient_has_finding_of_contraception_now@@used_during_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and will continue to use it throughout the study period.","when_to_set_to_false":"Set to false if the patient is currently using contraception but will not use it throughout the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception will be used throughout the study period.","meaning":"Boolean indicating whether the patient is currently using contraception and will use it during the study."} ;; "contraception used during the study"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Definition: pregnancy is defined as a positive urine pregnancy test prior to the procedure OR a positive blood pregnancy test prior to the procedure
(assert
(! (= patient_is_pregnant_now
(or patient_has_positive_urine_pregnancy_test_prior_to_procedure
    patient_has_positive_blood_pregnancy_test_prior_to_procedure))
:named REQ13_AUXILIARY0)) ;; "pregnancy is defined as a positive urine pregnancy test prior to the procedure OR a positive blood pregnancy test prior to the procedure"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_contraception_now@@adequate
       patient_has_finding_of_contraception_now)
:named REQ13_AUXILIARY1)) ;; "adequate contraception"

(assert
(! (=> patient_has_finding_of_contraception_now@@used_during_the_study
       patient_has_finding_of_contraception_now)
:named REQ13_AUXILIARY2)) ;; "contraception used during the study"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient is female AND (pregnant OR suspected to be pregnant OR lactating OR (childbearing potential AND refuses contraception))
(assert
(! (not (and patient_sex_is_female_now
             (or patient_is_pregnant_now
                 patient_is_suspected_to_be_pregnant_now
                 patient_is_lactating_now
                 (and patient_has_childbearing_potential_now
                      patient_refuses_to_use_adequate_contraception_during_study))))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is female AND ((the patient is pregnant (pregnancy is defined as a positive urine pregnancy test prior to the procedure OR a positive blood pregnancy test prior to the procedure)) OR (the patient is suspected to be pregnant) OR (the patient is lactating) OR (the patient is of childbearing potential AND the patient refuses to use adequate contraception during the study)))."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_oral_contraception_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected or plans to start oral contraception (birth control pills) at any time in the future.","when_to_set_to_false":"Set to false if the patient is not expected and does not plan to start oral contraception (birth control pills) in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected or plans to start oral contraception (birth control pills) in the future.","meaning":"Boolean indicating whether the patient is expected or plans to start oral contraception (birth control pills) in the future."} ;; "the patient plans to start taking birth control pills during the study"

(declare-const patient_has_finding_of_oral_contraception_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever started oral contraception (birth control pills) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never started oral contraception (birth control pills) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever started oral contraception (birth control pills) in the past.","meaning":"Boolean indicating whether the patient has ever started oral contraception (birth control pills) in the past."} ;; "the patient started birth control pills less than three months before enrollment"

(declare-const patient_started_oral_contraception_months_before_enrollment_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months before enrollment that the patient started taking oral contraception (birth control pills).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient started taking oral contraception (birth control pills) before enrollment.","meaning":"Numeric value representing the number of months before enrollment that the patient started taking oral contraception (birth control pills)."} ;; "the patient started birth control pills less than three months before enrollment"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion if patient is female AND started birth control pills less than three months before enrollment
(assert
(! (not (and patient_sex_is_female_now
             (and patient_has_finding_of_oral_contraception_inthehistory
                  (< patient_started_oral_contraception_months_before_enrollment_value_recorded_in_months 3))))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female AND the patient started birth control pills less than three months before enrollment."

;; Exclusion if patient is female AND plans to start taking birth control pills during the study
(assert
(! (not (and patient_sex_is_female_now
             patient_has_finding_of_oral_contraception_inthefuture))
:named REQ14_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is female AND the patient plans to start taking birth control pills during the study."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a bariatric operative procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bariatric operative procedure.","meaning":"Boolean indicating whether the patient has ever undergone a bariatric operative procedure."} ;; "the patient has had previous bariatric surgery"
(declare-const patient_has_undergone_operation_on_stomach_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an operative procedure on the stomach at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an operative procedure on the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an operative procedure on the stomach.","meaning":"Boolean indicating whether the patient has ever undergone an operative procedure on the stomach."} ;; "the patient has had previous gastric surgery"
(declare-const patient_has_undergone_operation_on_esophagus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an operative procedure on the esophagus at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an operative procedure on the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an operative procedure on the esophagus.","meaning":"Boolean indicating whether the patient has ever undergone an operative procedure on the esophagus."} ;; "the patient has had previous esophageal surgery"
(declare-const patient_has_finding_of_intestinal_obstruction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of intestinal obstruction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of intestinal obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of intestinal obstruction.","meaning":"Boolean indicating whether the patient has ever had a finding of intestinal obstruction."} ;; "the patient has had intestinal obstruction"
(declare-const patient_has_finding_of_portal_hypertensive_gastropathy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of portal hypertensive gastropathy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of portal hypertensive gastropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of portal hypertensive gastropathy.","meaning":"Boolean indicating whether the patient has ever had a finding of portal hypertensive gastropathy."} ;; "the patient has had portal gastropathy"
(declare-const patient_has_finding_of_neoplasm_of_gastrointestinal_tract_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of neoplasm of the gastrointestinal tract at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of neoplasm of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of neoplasm of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient has ever had a finding of neoplasm of the gastrointestinal tract."} ;; "the patient has had gastrointestinal tumors"
(declare-const patient_has_finding_of_esophageal_varices_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of esophageal varices at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of esophageal varices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of esophageal varices.","meaning":"Boolean indicating whether the patient has ever had a finding of esophageal varices."} ;; "the patient has had esophageal varices"
(declare-const patient_has_finding_of_gastric_varices_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of gastric varices at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of gastric varices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of gastric varices.","meaning":"Boolean indicating whether the patient has ever had a finding of gastric varices."} ;; "the patient has had gastric varices"
(declare-const patient_has_finding_of_gastroparesis_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of gastroparesis syndrome at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of gastroparesis syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of gastroparesis syndrome.","meaning":"Boolean indicating whether the patient has ever had a finding of gastroparesis syndrome."} ;; "the patient has had gastroparesis"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_undergone_bariatric_operative_procedure_inthehistory)
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous bariatric surgery."

(assert
(! (not patient_has_undergone_operation_on_stomach_inthehistory)
    :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous gastric surgery."

(assert
(! (not patient_has_undergone_operation_on_esophagus_inthehistory)
    :named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous esophageal surgery."

(assert
(! (not patient_has_finding_of_intestinal_obstruction_inthehistory)
    :named REQ15_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had intestinal obstruction."

(assert
(! (not patient_has_finding_of_portal_hypertensive_gastropathy_inthehistory)
    :named REQ15_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had portal gastropathy."

(assert
(! (not patient_has_finding_of_neoplasm_of_gastrointestinal_tract_inthehistory)
    :named REQ15_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had gastrointestinal tumors."

(assert
(! (not patient_has_finding_of_esophageal_varices_inthehistory)
    :named REQ15_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had esophageal varices."

(assert
(! (not patient_has_finding_of_gastric_varices_inthehistory)
    :named REQ15_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had gastric varices."

(assert
(! (not patient_has_finding_of_gastroparesis_syndrome_inthehistory)
    :named REQ15_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had gastroparesis."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy).","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder (coagulopathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder (coagulopathy).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (coagulopathy)."} ;; "coagulopathy"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy) and the disorder is severe.","when_to_set_to_false":"Set to false if the patient currently has a blood coagulation disorder (coagulopathy) but the disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood coagulation disorder (coagulopathy) is severe.","meaning":"Boolean indicating whether the patient currently has a severe blood coagulation disorder (coagulopathy)."} ;; "severe coagulopathy"
(declare-const patient_is_taking_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking anticoagulants.","when_to_set_to_false":"Set to false if the patient is currently not taking anticoagulants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking anticoagulants.","meaning":"Boolean indicating whether the patient is currently taking anticoagulants."} ;; "anticoagulants"
(declare-const patient_is_taking_coumadin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking coumadin.","when_to_set_to_false":"Set to false if the patient is currently not taking coumadin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking coumadin.","meaning":"Boolean indicating whether the patient is currently taking coumadin."} ;; "coumadin"
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking medications.","when_to_set_to_false":"Set to false if the patient is currently not taking medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking medications.","meaning":"Boolean indicating whether the patient is currently taking medications."} ;; "medications"
(declare-const patient_is_taking_drug_or_medicament_now@@impede_coagulation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking medications and those medications impede coagulation.","when_to_set_to_false":"Set to false if the patient is currently taking medications but those medications do not impede coagulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medications impede coagulation.","meaning":"Boolean indicating whether the patient is currently taking medications that impede coagulation."} ;; "medications which impede coagulation"
(declare-const patient_is_taking_drug_or_medicament_now@@impede_platelet_aggregation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking medications and those medications impede platelet aggregation.","when_to_set_to_false":"Set to false if the patient is currently taking medications but those medications do not impede platelet aggregation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medications impede platelet aggregation.","meaning":"Boolean indicating whether the patient is currently taking medications that impede platelet aggregation."} ;; "medications which impede platelet aggregation"
(declare-const patient_is_taking_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking heparin.","when_to_set_to_false":"Set to false if the patient is currently not taking heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking heparin.","meaning":"Boolean indicating whether the patient is currently taking heparin."} ;; "heparin"
(declare-const patient_is_taking_other_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking other anticoagulants (excluding heparin, warfarin, and coumadin).","when_to_set_to_false":"Set to false if the patient is currently not taking other anticoagulants (excluding heparin, warfarin, and coumadin).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking other anticoagulants (excluding heparin, warfarin, and coumadin).","meaning":"Boolean indicating whether the patient is currently taking other anticoagulants (excluding heparin, warfarin, and coumadin)."} ;; "other anticoagulants"
(declare-const patient_is_taking_warfarin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking warfarin.","when_to_set_to_false":"Set to false if the patient is currently not taking warfarin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking warfarin.","meaning":"Boolean indicating whether the patient is currently taking warfarin."} ;; "warfarin"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count."} ;; "platelet count"
(declare-const patient_prothrombin_time_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's prothrombin time in seconds is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current prothrombin time in seconds."} ;; "prothrombin time"
(declare-const prothrombin_time_control_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured value if the control prothrombin time in seconds is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the control prothrombin time in seconds, measured at the same time as the patient's prothrombin time."} ;; "control prothrombin time"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Definition: severe coagulopathy is prothrombin time > 3 seconds over control OR platelet count < 100,000
(assert
(! (= patient_has_finding_of_blood_coagulation_disorder_now@@severe
(or
  (> (- patient_prothrombin_time_value_recorded_now_withunit_seconds prothrombin_time_control_value_recorded_now_withunit_seconds) 3)
  (< patient_platelet_count_finding_value_recorded_now_withunit_count 100000)
))
:named REQ16_AUXILIARY0)) ;; "severe coagulopathy is defined as prothrombin time greater than three seconds over control OR platelet count less than one hundred thousand"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@severe
      patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ16_AUXILIARY1)) ;; "severe coagulopathy" implies "coagulopathy"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@impede_coagulation
      patient_is_taking_drug_or_medicament_now)
:named REQ16_AUXILIARY2)) ;; "medications which impede coagulation" implies "medications"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@impede_platelet_aggregation
      patient_is_taking_drug_or_medicament_now)
:named REQ16_AUXILIARY3)) ;; "medications which impede platelet aggregation" implies "medications"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: patient must NOT satisfy any exclusion component
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now@@severe)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe coagulopathy (severe coagulopathy is defined as prothrombin time greater than three seconds over control OR platelet count less than one hundred thousand)."

(assert
(! (not patient_is_taking_heparin_now)
:named REQ16_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is presently taking heparin."

(assert
(! (not patient_is_taking_coumadin_now)
:named REQ16_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is presently taking coumadin."

(assert
(! (not patient_is_taking_warfarin_now)
:named REQ16_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is presently taking warfarin."

(assert
(! (not patient_is_taking_other_anticoagulant_now)
:named REQ16_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is presently taking other anticoagulants."

(assert
(! (not patient_is_taking_drug_or_medicament_now@@impede_coagulation)
:named REQ16_COMPONENT5_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is presently taking other medications which impede coagulation."

(assert
(! (not patient_is_taking_drug_or_medicament_now@@impede_platelet_aggregation)
:named REQ16_COMPONENT6_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is presently taking medications which impede platelet aggregation."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_chronic_upper_gastrointestinal_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic upper gastrointestinal hemorrhage.","when_to_set_to_false":"Set to false if the patient currently does not have chronic upper gastrointestinal hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic upper gastrointestinal hemorrhage.","meaning":"Boolean indicating whether the patient currently has chronic upper gastrointestinal hemorrhage."} ;; "chronic upper gastrointestinal bleeding conditions"
(declare-const patient_has_finding_of_acute_upper_gastrointestinal_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute upper gastrointestinal hemorrhage.","when_to_set_to_false":"Set to false if the patient currently does not have acute upper gastrointestinal hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute upper gastrointestinal hemorrhage.","meaning":"Boolean indicating whether the patient currently has acute upper gastrointestinal hemorrhage."} ;; "acute upper gastrointestinal bleeding conditions"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_chronic_upper_gastrointestinal_hemorrhage_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic upper gastrointestinal bleeding conditions."

(assert
(! (not patient_has_finding_of_acute_upper_gastrointestinal_hemorrhage_now)
:named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute upper gastrointestinal bleeding conditions."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_is_taking_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking aspirin.","when_to_set_to_false":"Set to false if the patient is not currently taking aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking aspirin.","meaning":"Boolean indicating whether the patient is currently taking aspirin."} ;; "aspirin"
(declare-const patient_is_taking_aspirin_now@@unable_to_discontinue_for_periprocedural_window Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to discontinue aspirin for at least fourteen days prior to a plication procedure and for fourteen days after the procedure.","when_to_set_to_false":"Set to false if the patient is able to discontinue aspirin for at least fourteen days prior to a plication procedure and for fourteen days after the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to discontinue aspirin for the required peri-procedural window.","meaning":"Boolean indicating whether the patient is unable to discontinue aspirin for the required peri-procedural window (at least 14 days before and after plication procedure)."} ;; "unable to discontinue use of aspirin at least fourteen days prior to a plication procedure and continuing for fourteen days post-procedure"
(declare-const patient_is_taking_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking non-steroidal anti-inflammatory agents.","when_to_set_to_false":"Set to false if the patient is not currently taking non-steroidal anti-inflammatory agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking non-steroidal anti-inflammatory agents.","meaning":"Boolean indicating whether the patient is currently taking non-steroidal anti-inflammatory agents."} ;; "non-steroidal anti-inflammatory agents"
(declare-const patient_is_taking_non_steroidal_anti_inflammatory_agent_now@@unable_to_discontinue_for_periprocedural_window Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to discontinue non-steroidal anti-inflammatory agents for at least fourteen days prior to a plication procedure and for fourteen days after the procedure.","when_to_set_to_false":"Set to false if the patient is able to discontinue non-steroidal anti-inflammatory agents for at least fourteen days prior to a plication procedure and for fourteen days after the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to discontinue non-steroidal anti-inflammatory agents for the required peri-procedural window.","meaning":"Boolean indicating whether the patient is unable to discontinue non-steroidal anti-inflammatory agents for the required peri-procedural window (at least 14 days before and after plication procedure)."} ;; "unable to discontinue use of non-steroidal anti-inflammatory agents at least fourteen days prior to a plication procedure and continuing for fourteen days post-procedure"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies corresponding stem variable for aspirin
(assert
(! (=> patient_is_taking_aspirin_now@@unable_to_discontinue_for_periprocedural_window
      patient_is_taking_aspirin_now)
:named REQ18_AUXILIARY0)) ;; "unable to discontinue use of aspirin at least fourteen days prior to a plication procedure and continuing for fourteen days post-procedure"

;; Qualifier variable implies corresponding stem variable for NSAIDs
(assert
(! (=> patient_is_taking_non_steroidal_anti_inflammatory_agent_now@@unable_to_discontinue_for_periprocedural_window
      patient_is_taking_non_steroidal_anti_inflammatory_agent_now)
:named REQ18_AUXILIARY1)) ;; "unable to discontinue use of non-steroidal anti-inflammatory agents at least fourteen days prior to a plication procedure and continuing for fourteen days post-procedure"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (or patient_is_taking_aspirin_now@@unable_to_discontinue_for_periprocedural_window
            patient_is_taking_non_steroidal_anti_inflammatory_agent_now@@unable_to_discontinue_for_periprocedural_window))
:named REQ18_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is unable to discontinue use of aspirin at least fourteen days prior to a plication procedure and continuing for fourteen days post-procedure) OR (the patient is unable to discontinue use of non-steroidal anti-inflammatory agents at least fourteen days prior to a plication procedure and continuing for fourteen days post-procedure)."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_is_undergoing_administration_of_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of steroid.","when_to_set_to_false":"Set to false if the patient is currently not undergoing administration of steroid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of steroid.","meaning":"Boolean indicating whether the patient is currently undergoing administration of steroid."} ;; "steroid therapy"
(declare-const patient_is_undergoing_administration_of_steroid_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of steroid and the therapy is chronic.","when_to_set_to_false":"Set to false if the patient is currently undergoing administration of steroid but the therapy is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the steroid therapy is chronic.","meaning":"Boolean indicating whether the patient's current administration of steroid is chronic."} ;; "chronic steroid therapy"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_administration_of_steroid_now@@chronic
      patient_is_undergoing_administration_of_steroid_now)
   :named REQ19_AUXILIARY0)) ;; "chronic steroid therapy" implies "steroid therapy"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_is_undergoing_administration_of_steroid_now@@chronic)
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing chronic steroid therapy."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunosuppressive therapy at the time of assessment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing immunosuppressive therapy at the time of assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive therapy."} ;; "immunosuppressive therapy"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_is_undergoing_immunosuppressive_therapy_now)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing immunosuppressive therapy."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_can_discontinue_prescription_weight_loss_medications_for_at_least_30_days_prior_to_procedure_and_during_trial_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient can discontinue prescription weight loss medications for at least thirty days prior to the procedure and during the trial period.","when_to_set_to_false":"Set to false if the patient cannot discontinue prescription weight loss medications for at least thirty days prior to the procedure and during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can discontinue prescription weight loss medications for at least thirty days prior to the procedure and during the trial period.","meaning":"Boolean indicating whether the patient can discontinue prescription weight loss medications for at least thirty days prior to the procedure and during the trial period."} ;; "cannot discontinue prescription weight loss medications for at least thirty days prior to the procedure as well as during the trial period"
(declare-const patient_can_discontinue_over_the_counter_weight_loss_medications_for_at_least_30_days_prior_to_procedure_and_during_trial_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient can discontinue over the counter weight loss medications for at least thirty days prior to the procedure and during the trial period.","when_to_set_to_false":"Set to false if the patient cannot discontinue over the counter weight loss medications for at least thirty days prior to the procedure and during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can discontinue over the counter weight loss medications for at least thirty days prior to the procedure and during the trial period.","meaning":"Boolean indicating whether the patient can discontinue over the counter weight loss medications for at least thirty days prior to the procedure and during the trial period."} ;; "cannot discontinue over the counter weight loss medications for at least thirty days prior to the procedure as well as during the trial period"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not (or (not patient_can_discontinue_prescription_weight_loss_medications_for_at_least_30_days_prior_to_procedure_and_during_trial_period)
            (not patient_can_discontinue_over_the_counter_weight_loss_medications_for_at_least_30_days_prior_to_procedure_and_during_trial_period)))
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient cannot discontinue EITHER prescription weight loss medications OR over the counter weight loss medications for at least thirty days prior to the procedure as well as during the trial period."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const medication_start_time_months_ago Real) ;; {"when_to_set_to_value":"Set to the number of months ago the medication was started.","when_to_set_to_null":"Set to null if the start time of the medication is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of months ago a medication was started."} ;; "started medications within the last three months"
(declare-const medication_start_time_months_ago@@medication_is_known_to_cause_weight_gain Real) ;; {"when_to_set_to_value":"Set to the number of months ago the medication was started if the medication is known to cause weight gain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication is known to cause weight gain or when it was started.","meaning":"Numeric value indicating the number of months ago a medication known to cause weight gain was started."} ;; "medications that are known to cause weight gain"
(declare-const patient_has_started_medication_known_to_cause_weight_gain_within_last_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has started any medication known to cause weight gain within the last 3 months.","when_to_set_to_false":"Set to false if the patient has not started any medication known to cause weight gain within the last 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has started any medication known to cause weight gain within the last 3 months.","meaning":"Boolean indicating whether the patient has started any medication known to cause weight gain within the last 3 months."} ;; "started medications within the last three months that are known to cause weight gain"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Definition: patient_has_started_medication_known_to_cause_weight_gain_within_last_3_months is true iff there exists a medication known to cause weight gain started within the last 3 months
(assert
(! (= patient_has_started_medication_known_to_cause_weight_gain_within_last_3_months
    (exists ((m_start Real))
      (and (= m_start medication_start_time_months_ago@@medication_is_known_to_cause_weight_gain)
           (<= m_start 3))))
:named REQ22_AUXILIARY0)) ;; "has started medications within the last three months that are known to cause weight gain"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_started_medication_known_to_cause_weight_gain_within_last_3_months)
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has started medications within the last three months that are known to cause weight gain."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac pacemaker.","meaning":"Boolean indicating whether the patient currently has a cardiac pacemaker."} ;; "the patient has a cardiac pacemaker"
(declare-const patient_has_electronic_implantable_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another electronic implantable device (other than a cardiac pacemaker).","when_to_set_to_false":"Set to false if the patient currently does not have another electronic implantable device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another electronic implantable device.","meaning":"Boolean indicating whether the patient currently has another electronic implantable device."} ;; "the patient has another electronic implantable device"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_has_cardiac_pacemaker_now)
:named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cardiac pacemaker."

(assert
(! (not patient_has_electronic_implantable_device_now)
:named REQ23_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another electronic implantable device."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_hiatal_hernia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hiatal hernia.","when_to_set_to_false":"Set to false if the patient currently does not have a hiatal hernia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hiatal hernia.","meaning":"Boolean indicating whether the patient currently has a hiatal hernia."} ;; "the patient has a hiatal hernia"

(declare-const patient_hiatal_hernia_value_recorded_now_withunit_centimeter Real) ;; {"when_to_set_to_value":"Set to the measured size in centimeters if a hiatal hernia is present and its size is recorded now.","when_to_set_to_null":"Set to null if no hiatal hernia is present, or if present but no size is recorded now, or if the value is indeterminate.","meaning":"Numeric value (in centimeters) representing the size of the patient's hiatal hernia as recorded now."} ;; "hiatal hernia with size greater than two centimeters"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not (and patient_has_hiatal_hernia_now
             (> patient_hiatal_hernia_value_recorded_now_withunit_centimeter 2)))
   :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a hiatal hernia with size greater than two centimeters."
