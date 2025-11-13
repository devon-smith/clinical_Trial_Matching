;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 40 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 40 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_written_informed_consent_obtained Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been obtained from the patient.","when_to_set_to_false":"Set to false if written informed consent has not been obtained from the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been obtained from the patient.","meaning":"Boolean indicating whether written informed consent has been obtained from the patient."} // "To be included, the patient must have written informed consent obtained."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_written_informed_consent_obtained
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have written informed consent obtained."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute exacerbation of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have an acute exacerbation of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute exacerbation of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has an acute exacerbation of chronic obstructive pulmonary disease."} // "an acute exacerbation of chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@defined_according_to_global_initiative_for_chronic_obstructive_lung_disease_guideline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute exacerbation of chronic obstructive pulmonary disease is defined according to the Global Initiative for Chronic Obstructive Lung Disease guideline.","when_to_set_to_false":"Set to false if the patient's acute exacerbation of chronic obstructive pulmonary disease is not defined according to the Global Initiative for Chronic Obstructive Lung Disease guideline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation is defined according to the Global Initiative for Chronic Obstructive Lung Disease guideline.","meaning":"Boolean indicating whether the acute exacerbation of chronic obstructive pulmonary disease is defined according to the Global Initiative for Chronic Obstructive Lung Disease guideline."} // "according to the Global Initiative for Chronic Obstructive Lung Disease guideline"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@beyond_normal_day_to_day_variations Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute exacerbation of chronic obstructive pulmonary disease is beyond normal day-to-day variations.","when_to_set_to_false":"Set to false if the patient's acute exacerbation of chronic obstructive pulmonary disease is not beyond normal day-to-day variations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation is beyond normal day-to-day variations.","meaning":"Boolean indicating whether the acute exacerbation of chronic obstructive pulmonary disease is beyond normal day-to-day variations."} // "beyond normal day-to-day variations"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@acute_in_onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute exacerbation of chronic obstructive pulmonary disease is acute in onset.","when_to_set_to_false":"Set to false if the patient's current acute exacerbation of chronic obstructive pulmonary disease is not acute in onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation is acute in onset.","meaning":"Boolean indicating whether the patient's current acute exacerbation of chronic obstructive pulmonary disease is acute in onset."} // "acute in onset"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@may_warrant_change_in_regular_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute exacerbation of chronic obstructive pulmonary disease may warrant a change in regular medication.","when_to_set_to_false":"Set to false if the patient's current acute exacerbation of chronic obstructive pulmonary disease does not warrant a change in regular medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation may warrant a change in regular medication.","meaning":"Boolean indicating whether the patient's current acute exacerbation of chronic obstructive pulmonary disease may warrant a change in regular medication."} // "may warrant a change in regular medication"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnoea.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnoea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnoea.","meaning":"Boolean indicating whether the patient currently has dyspnoea."} // "dyspnoea"
(declare-const patient_has_finding_of_dyspnea_now@@change_from_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dyspnoea represents a change from their baseline.","when_to_set_to_false":"Set to false if the patient's current dyspnoea does not represent a change from their baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current dyspnoea is a change from baseline.","meaning":"Boolean indicating whether the patient's current dyspnoea is a change from baseline."} // "a change in the patient's baseline dyspnoea"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} // "cough"
(declare-const patient_has_finding_of_cough_now@@change_from_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cough represents a change from their baseline.","when_to_set_to_false":"Set to false if the patient's current cough does not represent a change from their baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current cough is a change from baseline.","meaning":"Boolean indicating whether the patient's current cough is a change from baseline."} // "a change in the patient's baseline cough"
(declare-const patient_is_exposed_to_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently producing sputum.","when_to_set_to_false":"Set to false if the patient is currently not producing sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently producing sputum.","meaning":"Boolean indicating whether the patient is currently producing sputum."} // "sputum"
(declare-const patient_is_exposed_to_sputum_now@@change_from_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sputum production represents a change from their baseline.","when_to_set_to_false":"Set to false if the patient's current sputum production does not represent a change from their baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current sputum production is a change from baseline.","meaning":"Boolean indicating whether the patient's current sputum production is a change from baseline."} // "a change in the patient's baseline sputum"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@defined_according_to_global_initiative_for_chronic_obstructive_lung_disease_guideline
         patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now)
     :named REQ2_AUXILIARY0)) ;; "defined according to the Global Initiative for Chronic Obstructive Lung Disease guideline"

(assert
  (! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@beyond_normal_day_to_day_variations
         patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now)
     :named REQ2_AUXILIARY1)) ;; "beyond normal day-to-day variations"

(assert
  (! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@acute_in_onset
         patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now)
     :named REQ2_AUXILIARY2)) ;; "acute in onset"

(assert
  (! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@may_warrant_change_in_regular_medication
         patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now)
     :named REQ2_AUXILIARY3)) ;; "may warrant a change in regular medication"

(assert
  (! (=> patient_has_finding_of_dyspnea_now@@change_from_baseline
         patient_has_finding_of_dyspnea_now)
     :named REQ2_AUXILIARY4)) ;; "a change in the patient's baseline dyspnoea"

(assert
  (! (=> patient_has_finding_of_cough_now@@change_from_baseline
         patient_has_finding_of_cough_now)
     :named REQ2_AUXILIARY5)) ;; "a change in the patient's baseline cough"

(assert
  (! (=> patient_is_exposed_to_sputum_now@@change_from_baseline
         patient_is_exposed_to_sputum_now)
     :named REQ2_AUXILIARY6)) ;; "a change in the patient's baseline sputum"

;; Definition of the acute exacerbation event according to the requirement
(assert
  (! (= patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@defined_according_to_global_initiative_for_chronic_obstructive_lung_disease_guideline
        (and
          (or patient_has_finding_of_dyspnea_now@@change_from_baseline
              patient_has_finding_of_cough_now@@change_from_baseline
              patient_is_exposed_to_sputum_now@@change_from_baseline)
          patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@beyond_normal_day_to_day_variations
          patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@acute_in_onset
          patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@may_warrant_change_in_regular_medication
          patient_has_diagnosis_of_chronic_obstructive_lung_disease_now))
     :named REQ2_AUXILIARY7)) ;; "defined as an event ... characterized by (a change in the patient's baseline dyspnoea OR ... cough OR ... sputum) that is (beyond normal day-to-day variations) AND (acute in onset) AND (may warrant a change in regular medication) in a patient with underlying chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now
          patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@defined_according_to_global_initiative_for_chronic_obstructive_lung_disease_guideline)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an acute exacerbation of chronic obstructive pulmonary disease according to the Global Initiative for Chronic Obstructive Lung Disease guideline (defined as ...)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_dyspnea_at_rest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea at rest.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea at rest.","meaning":"Boolean indicating whether the patient currently has dyspnea at rest."} // "resting dyspnoea"
(declare-const patient_has_finding_of_dyspnea_at_rest_now@@marked_increase_in_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dyspnea at rest represents a marked increase in symptoms.","when_to_set_to_false":"Set to false if the patient's dyspnea at rest does not represent a marked increase in symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dyspnea at rest represents a marked increase in symptoms.","meaning":"Boolean indicating whether the patient's dyspnea at rest is a marked increase in symptoms."} // "marked increase in symptoms (resting dyspnoea)"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic obstructive lung disease is severe.","when_to_set_to_false":"Set to false if the patient's chronic obstructive lung disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic obstructive lung disease is severe.","meaning":"Boolean indicating whether the patient's chronic obstructive lung disease is severe."} // "severe underlying chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@underlying Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic obstructive lung disease is underlying.","when_to_set_to_false":"Set to false if the patient's chronic obstructive lung disease is not underlying.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic obstructive lung disease is underlying.","meaning":"Boolean indicating whether the patient's chronic obstructive lung disease is underlying."} // "underlying chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_cyanosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cyanosis.","when_to_set_to_false":"Set to false if the patient currently does not have cyanosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cyanosis.","meaning":"Boolean indicating whether the patient currently has cyanosis."} // "cyanosis"
(declare-const patient_has_finding_of_cyanosis_now@@onset_of_new_physical_sign Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cyanosis represents the onset of a new physical sign.","when_to_set_to_false":"Set to false if the patient's cyanosis does not represent the onset of a new physical sign.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cyanosis represents the onset of a new physical sign.","meaning":"Boolean indicating whether the patient's cyanosis is the onset of a new physical sign."} // "onset of new physical signs (cyanosis)"
(declare-const patient_has_finding_of_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has edema.","when_to_set_to_false":"Set to false if the patient currently does not have edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has edema.","meaning":"Boolean indicating whether the patient currently has edema."} // "edema"
(declare-const patient_has_finding_of_edema_now@@onset_of_new_physical_sign Bool) ;; {"when_to_set_to_true":"Set to true if the patient's edema represents the onset of a new physical sign.","when_to_set_to_false":"Set to false if the patient's edema does not represent the onset of a new physical sign.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the edema represents the onset of a new physical sign.","meaning":"Boolean indicating whether the patient's edema is the onset of a new physical sign."} // "onset of new physical signs (edema)"
(declare-const patient_has_failure_to_respond_to_initial_medical_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has failed to respond to initial medical management.","when_to_set_to_false":"Set to false if the patient currently has not failed to respond to initial medical management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has failed to respond to initial medical management.","meaning":"Boolean indicating whether the patient currently has failure to respond to initial medical management."} // "failure to respond to initial medical management"
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has comorbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have comorbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has comorbid conditions.","meaning":"Boolean indicating whether the patient currently has comorbid conditions."} // "comorbidities"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's comorbid conditions are significant.","when_to_set_to_false":"Set to false if the patient's comorbid conditions are not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid conditions are significant.","meaning":"Boolean indicating whether the patient's comorbid conditions are significant."} // "significant comorbidities"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@frequent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute exacerbations of chronic obstructive airways disease are frequent.","when_to_set_to_false":"Set to false if the patient's acute exacerbations of chronic obstructive airways disease are not frequent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbations are frequent.","meaning":"Boolean indicating whether the patient's acute exacerbations of chronic obstructive airways disease are frequent."} // "frequent acute exacerbations of chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arrhythmia.","meaning":"Boolean indicating whether the patient currently has arrhythmia."} // "arrhythmias"
(declare-const patient_has_finding_of_arrhythmia_now@@newly_occurring Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current arrhythmia is newly occurring.","when_to_set_to_false":"Set to false if the patient's current arrhythmia is not newly occurring.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current arrhythmia is newly occurring.","meaning":"Boolean indicating whether the patient's current arrhythmia is newly occurring."} // "newly occurring arrhythmias"
(declare-const patients_uncertain_diagnosis_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal diagnostic uncertainty.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal diagnostic uncertainty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal diagnostic uncertainty.","meaning":"Boolean indicating whether the patient currently has abnormal diagnostic uncertainty."} // "diagnostic uncertainty"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_dyspnea_at_rest_now@@marked_increase_in_symptoms
         patient_has_finding_of_dyspnea_at_rest_now)
     :named REQ3_AUXILIARY0)) ;; "marked increase in symptoms (resting dyspnoea)"

(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@severe
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ3_AUXILIARY1)) ;; "severe underlying chronic obstructive pulmonary disease"

(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@underlying
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ3_AUXILIARY2)) ;; "underlying chronic obstructive pulmonary disease"

(assert
  (! (=> patient_has_finding_of_cyanosis_now@@onset_of_new_physical_sign
         patient_has_finding_of_cyanosis_now)
     :named REQ3_AUXILIARY3)) ;; "onset of new physical signs (cyanosis)"

(assert
  (! (=> patient_has_finding_of_edema_now@@onset_of_new_physical_sign
         patient_has_finding_of_edema_now)
     :named REQ3_AUXILIARY4)) ;; "onset of new physical signs (edema)"

(assert
  (! (=> patient_has_finding_of_co_morbid_conditions_now@@significant
         patient_has_finding_of_co_morbid_conditions_now)
     :named REQ3_AUXILIARY5)) ;; "significant comorbidities"

(assert
  (! (=> patient_has_finding_of_arrhythmia_now@@newly_occurring
         patient_has_finding_of_arrhythmia_now)
     :named REQ3_AUXILIARY6)) ;; "newly occurring arrhythmias"

;; Non-exhaustive examples imply umbrella subclass for "onset of new physical signs"
(assert
  (! (=> (or patient_has_finding_of_cyanosis_now@@onset_of_new_physical_sign
             patient_has_finding_of_edema_now@@onset_of_new_physical_sign)
         (or patient_has_finding_of_cyanosis_now@@onset_of_new_physical_sign
             patient_has_finding_of_edema_now@@onset_of_new_physical_sign))
     :named REQ3_AUXILIARY7)) ;; "onset of new physical signs (with non-exhaustive examples (cyanosis, edema))"

;; ===================== Constraint Assertions (REQ 3) =====================
;; At least one of the following must be true for hospital admission criteria (Global Initiative for Chronic Obstructive Lung Disease)
(assert
  (! (or
        patient_has_finding_of_dyspnea_at_rest_now@@marked_increase_in_symptoms
        patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@severe
        (or patient_has_finding_of_cyanosis_now@@onset_of_new_physical_sign
            patient_has_finding_of_edema_now@@onset_of_new_physical_sign)
        patient_has_failure_to_respond_to_initial_medical_management_now
        patient_has_finding_of_co_morbid_conditions_now@@significant
        patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_now@@frequent
        patient_has_finding_of_arrhythmia_now@@newly_occurring
        patients_uncertain_diagnosis_is_abnormal_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "criteria for hospital admission according to the Global Initiative for Chronic Obstructive Lung Disease: at least one of the following..."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_cigarette_pack_years_value_recorded_now_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the measured or reported value of the patient's total smoking history in pack years, recorded now.","when_to_set_to_null":"Set to null if no such value is available or cannot be determined.","meaning":"Numeric value representing the patient's total smoking history in pack years, recorded now."} // "have a minimum smoking history of 10 pack years"
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a former smoker (has a history of smoking but is not a current smoker).","when_to_set_to_false":"Set to false if the patient is not currently classified as a former smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a former smoker.","meaning":"Boolean indicating whether the patient is currently a former smoker."} // "a former smoker"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a smoker.","when_to_set_to_false":"Set to false if the patient is not currently classified as a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "a current smoker"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: (a former smoker OR a current smoker) AND (minimum smoking history of 10 pack years)
(assert
  (! (and (or patient_has_finding_of_ex_smoker_now
              patient_has_finding_of_smoker_now) ;; "a former smoker OR a current smoker"
          (>= patient_cigarette_pack_years_value_recorded_now_withunit_pack_years 10.0)) ;; "minimum smoking history of 10 pack years"
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_capable_of_ingesting_oral_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of ingesting oral medication.","when_to_set_to_false":"Set to false if the patient is currently not capable of ingesting oral medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of ingesting oral medication.","meaning":"Boolean indicating whether the patient is currently capable of ingesting oral medication."} // "the patient must be capable of ingesting oral medication"

(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to a drug or medicament."} // "medication"

(declare-const patient_is_exposed_to_drug_or_medicament_now@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament and the drug or medicament is administered orally.","when_to_set_to_false":"Set to false if the patient is currently exposed to a drug or medicament but it is not administered orally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is administered orally.","meaning":"Boolean indicating whether the patient is currently exposed to a drug or medicament and the drug or medicament is administered orally."} // "medication administered orally"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_drug_or_medicament_now@@administered_orally
         patient_is_exposed_to_drug_or_medicament_now)
     :named REQ5_AUXILIARY0)) ;; "medication administered orally" implies "medication"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_capable_of_ingesting_oral_medication_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be capable of ingesting oral medication"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_able_to_complete_questionnaires_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete questionnaires.","when_to_set_to_false":"Set to false if the patient is currently not able to complete questionnaires.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to complete questionnaires.","meaning":"Boolean indicating whether the patient is currently able to complete questionnaires."} // "able to complete questionnaires"
(declare-const patient_is_able_to_perform_lung_function_tests_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to perform lung function tests.","when_to_set_to_false":"Set to false if the patient is currently not able to perform lung function tests.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to perform lung function tests.","meaning":"Boolean indicating whether the patient is currently able to perform lung function tests."} // "able to perform lung function tests"
(declare-const patient_is_mentally_capable_of_participating_in_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently mentally capable of participating in the study.","when_to_set_to_false":"Set to false if the patient is currently not mentally capable of participating in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently mentally capable of participating in the study.","meaning":"Boolean indicating whether the patient is currently mentally capable of participating in the study."} // "mentally capable of participating in the study"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition in the requirement: mental capability is defined as able to complete questionnaires AND able to perform lung function tests
(assert
  (! (= patient_is_mentally_capable_of_participating_in_study_now
        (and patient_is_able_to_complete_questionnaires_now
             patient_is_able_to_perform_lung_function_tests_now))
     :named REQ6_AUXILIARY0)) ;; "mentally capable of participating in the study (able to complete questionnaires AND able to perform lung function tests)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_mentally_capable_of_participating_in_study_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be mentally capable of participating in the study (able to complete questionnaires AND able to perform lung function tests)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_life_expectancy_value_recorded_now_in_days Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's life expectancy in days, as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's life expectancy in days is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value for the patient's life expectancy in days, recorded now."} // "life expectancy of ≥ 30 days"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (>= patient_life_expectancy_value_recorded_now_in_days 30.0)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a life expectancy of ≥ 30 days."
