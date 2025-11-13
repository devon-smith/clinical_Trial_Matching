;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hypertension.","meaning":"Boolean indicating whether the patient currently has secondary hypertension."} ;; "secondary hypertension"
(declare-const patient_has_finding_of_malignant_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant hypertension.","meaning":"Boolean indicating whether the patient currently has malignant hypertension."} ;; "malignant hypertension"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_secondary_hypertension_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension."

(assert
  (! (not patient_has_finding_of_malignant_hypertension_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever been diagnosed with cerebrovascular accident (stroke) at any time in their history."} ;; "history of cerebrovascular accident"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction at any time in their history."} ;; "history of myocardial infarction"

(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of myocardial infarction and the event occurred within 6 months before registration.","when_to_set_to_false":"Set to false if the patient has a history of myocardial infarction but the event did not occur within 6 months before registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction occurred within 6 months before registration.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred within 6 months before registration."} ;; "history of myocardial infarction within 6 months before registration"

(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with transient cerebral ischemia (transient ischemic attack) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with transient cerebral ischemia (transient ischemic attack) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with transient cerebral ischemia (transient ischemic attack).","meaning":"Boolean indicating whether the patient has ever been diagnosed with transient cerebral ischemia (transient ischemic attack) at any time in their history."} ;; "transient ischemic attack"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory
      patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (transient ischemic attack)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_registration
      patient_has_diagnosis_of_myocardial_infarction_inthehistory)
:named REQ1_AUXILIARY1)) ;; "history of myocardial infarction within 6 months before registration"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have a history of cerebrovascular accident (including TIA)
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebrovascular accident with non-exhaustive examples (transient ischemic attack)."

;; Exclusion: patient must NOT have a history of myocardial infarction within 6 months before registration
(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_registration)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction within 6 months before registration."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention in the past."} ;; "percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within6months_before_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's percutaneous coronary intervention occurred within 6 months before registration.","when_to_set_to_false":"Set to false if the patient's percutaneous coronary intervention did not occur within 6 months before registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention occurred within 6 months before registration.","meaning":"Boolean indicating whether the percutaneous coronary intervention occurred within 6 months before registration."} ;; "percutaneous coronary intervention within 6 months before registration"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass grafting at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass grafting in the past."} ;; "coronary artery bypass grafting"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months_before_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery bypass grafting occurred within 6 months before registration.","when_to_set_to_false":"Set to false if the patient's coronary artery bypass grafting did not occur within 6 months before registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery bypass grafting occurred within 6 months before registration.","meaning":"Boolean indicating whether the coronary artery bypass grafting occurred within 6 months before registration."} ;; "coronary artery bypass grafting within 6 months before registration"
(declare-const patient_will_undergo_percutaneous_coronary_intervention_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a percutaneous coronary intervention scheduled in the future.","when_to_set_to_false":"Set to false if the patient does not have a percutaneous coronary intervention scheduled in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a percutaneous coronary intervention scheduled in the future.","meaning":"Boolean indicating whether the patient has a percutaneous coronary intervention scheduled in the future."} ;; "percutaneous coronary intervention scheduled"
(declare-const patient_will_undergo_coronary_artery_bypass_graft_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a coronary artery bypass grafting scheduled in the future.","when_to_set_to_false":"Set to false if the patient does not have a coronary artery bypass grafting scheduled in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a coronary artery bypass grafting scheduled in the future.","meaning":"Boolean indicating whether the patient has a coronary artery bypass grafting scheduled in the future."} ;; "coronary artery bypass grafting scheduled"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within6months_before_registration
      patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
    :named REQ2_AUXILIARY0)) ;; "percutaneous coronary intervention within 6 months before registration"

(assert
(! (=> patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months_before_registration
      patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
    :named REQ2_AUXILIARY1)) ;; "coronary artery bypass grafting within 6 months before registration"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@temporalcontext_within6months_before_registration
            patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months_before_registration
            patient_will_undergo_percutaneous_coronary_intervention_inthefuture
            patient_will_undergo_coronary_artery_bypass_graft_inthefuture))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had percutaneous coronary intervention within 6 months before registration) OR (the patient has had coronary artery bypass grafting done within 6 months before registration) OR (the patient has percutaneous coronary intervention scheduled) OR (the patient has coronary artery bypass grafting scheduled)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been hospitalized for angina pectoris at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been hospitalized for angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been hospitalized for angina pectoris.","meaning":"Boolean indicating whether the patient has ever been hospitalized for angina pectoris in their history."} ;; "history of hospitalization for angina pectoris"

(declare-const patient_has_finding_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been hospitalized for heart failure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been hospitalized for heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been hospitalized for heart failure.","meaning":"Boolean indicating whether the patient has ever been hospitalized for heart failure in their history."} ;; "history of hospitalization for heart failure"

(declare-const patient_has_finding_of_heart_failure_inthehistory@@temporalcontext_within6months_before_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hospitalization for heart failure occurred within 6 months before registration.","when_to_set_to_false":"Set to false if the patient's hospitalization for heart failure did not occur within 6 months before registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hospitalization for heart failure occurred within 6 months before registration.","meaning":"Boolean indicating whether the patient's hospitalization for heart failure occurred within 6 months before registration."} ;; "history of hospitalization for heart failure within 6 months before registration"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_inthehistory@@temporalcontext_within6months_before_registration
      patient_has_finding_of_heart_failure_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "history of hospitalization for heart failure within 6 months before registration" implies "history of hospitalization for heart failure"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_angina_pectoris_inthehistory)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hospitalization for angina pectoris."

(assert
(! (not patient_has_finding_of_heart_failure_inthehistory@@temporalcontext_within6months_before_registration)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hospitalization for heart failure within 6 months before registration."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@severe_nyha_class_iii_or_higher Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure and the severity is New York Heart Association functional class III or more severe.","when_to_set_to_false":"Set to false if the patient currently has heart failure but the severity is less than NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure is NYHA class III or more severe.","meaning":"Boolean indicating whether the patient's heart failure is severe, defined as NYHA class III or higher."} ;; "severe heart failure (New York Heart Association functional class III or more severe)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_now@@severe_nyha_class_iii_or_higher
      patient_has_finding_of_heart_failure_now)
   :named REQ4_AUXILIARY0)) ;; "severe heart failure (New York Heart Association functional class III or more severe)" implies "heart failure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@severe_nyha_class_iii_or_higher)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe heart failure (New York Heart Association functional class III or more severe)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_complication_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complications of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have complications of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complications of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has complications of atrial fibrillation."} ;; "the patient has complications of atrial fibrillation"
(declare-const patient_has_complication_of_atrial_flutter_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complications of atrial flutter.","when_to_set_to_false":"Set to false if the patient currently does not have complications of atrial flutter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complications of atrial flutter.","meaning":"Boolean indicating whether the patient currently has complications of atrial flutter."} ;; "the patient has complications of atrial flutter"
(declare-const patient_has_complication_of_severe_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complications of severe arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have complications of severe arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complications of severe arrhythmia.","meaning":"Boolean indicating whether the patient currently has complications of severe arrhythmia."} ;; "the patient has complications of severe arrhythmia"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_complication_of_atrial_fibrillation_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complications of atrial fibrillation."

(assert
(! (not patient_has_complication_of_atrial_flutter_now)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complications of atrial flutter."

(assert
(! (not patient_has_complication_of_severe_arrhythmia_now)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complications of severe arrhythmia."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal liver function.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal liver function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function.","meaning":"Boolean indicating whether the patient currently has abnormal liver function."} ;; "hepatic dysfunction"
(declare-const patient_has_finding_of_abnormal_liver_function_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal liver function is severe.","when_to_set_to_false":"Set to false if the patient's abnormal liver function is not severe.","when_to_set_to_null":"Set to null if severity of the patient's abnormal liver function is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's abnormal liver function is severe."} ;; "severe hepatic dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal impairment is severe.","when_to_set_to_false":"Set to false if the patient's renal impairment is not severe.","when_to_set_to_null":"Set to null if severity of the patient's renal impairment is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's renal impairment is severe."} ;; "severe renal dysfunction"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis.","when_to_set_to_false":"Set to false if the patient is currently not undergoing dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis."} ;; "dialysis"
(declare-const serum_creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the patient's serum creatinine value (in mg/dL) recorded at the current time.","when_to_set_to_null":"Set to null if the patient's serum creatinine value at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's serum creatinine (mg/dL) at the current time."} ;; "serum creatinine ≥ 2.0 mg/dL"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for hepatic dysfunction
(assert
(! (=> patient_has_finding_of_abnormal_liver_function_now@@severe
      patient_has_finding_of_abnormal_liver_function_now)
    :named REQ6_AUXILIARY0)) ;; "severe hepatic dysfunction"

;; Qualifier variable implies corresponding stem variable for renal impairment
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severe
      patient_has_finding_of_renal_impairment_now)
    :named REQ6_AUXILIARY1)) ;; "severe renal dysfunction"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: severe hepatic dysfunction
(assert
(! (not patient_has_finding_of_abnormal_liver_function_now@@severe)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic dysfunction."

;; Exclusion: severe renal dysfunction
(assert
(! (not patient_has_finding_of_renal_impairment_now@@severe)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal dysfunction."

;; Exclusion: currently being treated with dialysis
(assert
(! (not patient_is_undergoing_dialysis_procedure_now)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently being treated with dialysis."

;; Exclusion: renal dysfunction with serum creatinine ≥ 2.0 mg/dL
(assert
(! (not (and patient_has_finding_of_renal_impairment_now
             (>= serum_creatinine_value_recorded_now_withunit_mg_per_dl 2.0)))
    :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal dysfunction with serum creatinine ≥ 2.0 mg/dL."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any co-morbid condition (concurrent disease), including but not limited to coronary disease, calcium channel blocker use, or diuretic use.","when_to_set_to_false":"Set to false if the patient currently does not have any co-morbid condition (concurrent disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any co-morbid condition.","meaning":"Boolean indicating whether the patient currently has any co-morbid condition (concurrent disease)."} ;; "concurrent disease"
(declare-const patient_is_exposed_to_calcium_channel_blocker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to calcium channel blockers.","when_to_set_to_false":"Set to false if the patient is currently not exposed to calcium channel blockers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to calcium channel blockers.","meaning":"Boolean indicating whether the patient is currently exposed to calcium channel blockers."} ;; "calcium channel blockers"
(declare-const patient_is_exposed_to_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to diuretics.","when_to_set_to_false":"Set to false if the patient is currently not exposed to diuretics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to diuretics.","meaning":"Boolean indicating whether the patient is currently exposed to diuretics."} ;; "diuretics"
(declare-const patient_is_not_appropriate_for_change_to_study_drugs_from_current_therapy_for_concurrent_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently not appropriate for change to the study drugs from current therapy due to any concurrent disease (including but not limited to coronary disease, calcium channel blocker use, or diuretic use).","when_to_set_to_false":"Set to false if the patient is currently appropriate for change to the study drugs from current therapy regardless of concurrent disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is appropriate for change to the study drugs from current therapy due to concurrent disease.","meaning":"Boolean indicating whether the patient is currently not appropriate for change to the study drugs from current therapy due to concurrent disease (such as coronary disease, calcium channel blocker use, or diuretic use)."} ;; "not appropriate for change to the study drugs from current therapy for concurrent disease"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_co_morbid_conditions_now
          patient_is_exposed_to_calcium_channel_blocker_now
          patient_is_exposed_to_diuretic_now)
    patient_is_not_appropriate_for_change_to_study_drugs_from_current_therapy_for_concurrent_disease_now)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (coronary disease, calcium channel blockers, diuretics)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_not_appropriate_for_change_to_study_drugs_from_current_therapy_for_concurrent_disease_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is not appropriate for change to the study drugs from current therapy for concurrent disease with non-exhaustive examples (coronary disease, calcium channel blockers, diuretics)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_history_of_serious_side_effect_from_study_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of serious side effect caused by any study drug at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of serious side effect caused by any study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of serious side effect caused by any study drug.","meaning":"Boolean indicating whether the patient has a history of serious side effect caused by study drugs."} ;; "history of serious side effect from study drugs"

(declare-const patient_has_history_of_serious_side_effect_from_study_drugs@@limited_to_at1_subtype_angiotensin_ii_receptor_antagonist_calcium_channel_blocker_diuretic Bool) ;; {"when_to_set_to_true":"Set to true if the serious side effect is specifically caused by AT1 subtype angiotensin II receptor antagonist, calcium channel blocker, or diuretic.","when_to_set_to_false":"Set to false if the serious side effect is not specifically caused by AT1 subtype angiotensin II receptor antagonist, calcium channel blocker, or diuretic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the serious side effect is specifically caused by AT1 subtype angiotensin II receptor antagonist, calcium channel blocker, or diuretic.","meaning":"Boolean indicating whether the serious side effect is limited to the exhaustive subcategories: AT1 subtype angiotensin II receptor antagonist, calcium channel blocker, or diuretic."} ;; "history of serious side effect from study drugs limited to AT1 subtype angiotensin II receptor antagonist, calcium channel blocker, diuretic"

(declare-const patient_has_hypersensitivity_to_angiotensin_ii_receptor_antagonist_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to angiotensin II receptor antagonist-containing products at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to angiotensin II receptor antagonist-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to angiotensin II receptor antagonist-containing products.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to angiotensin II receptor antagonist-containing products."} ;; "history of hypersensitivity to angiotensin II receptor antagonist-containing products"

(declare-const patient_has_hypersensitivity_to_angiotensin_ii_receptor_antagonist_containing_product_inthehistory@@at1_subtype_only Bool) ;; {"when_to_set_to_true":"Set to true if the hypersensitivity is specifically to AT1 subtype angiotensin II receptor antagonist-containing products.","when_to_set_to_false":"Set to false if the hypersensitivity is not specifically to AT1 subtype angiotensin II receptor antagonist-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is specific to AT1 subtype.","meaning":"Boolean indicating whether the hypersensitivity is specific to AT1 subtype angiotensin II receptor antagonist-containing products."} ;; "history of hypersensitivity to AT1 subtype angiotensin II receptor antagonist-containing products"

(declare-const patient_has_hypersensitivity_to_calcium_channel_blocker_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to calcium channel blocker substances at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to calcium channel blocker substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to calcium channel blocker substances.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to calcium channel blocker substances."} ;; "history of hypersensitivity to calcium channel blocker"

(declare-const patient_has_hypersensitivity_to_diuretic_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to diuretic substances at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to diuretic substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to diuretic substances.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to diuretic substances."} ;; "history of hypersensitivity to diuretic"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
(! (= patient_has_history_of_serious_side_effect_from_study_drugs@@limited_to_at1_subtype_angiotensin_ii_receptor_antagonist_calcium_channel_blocker_diuretic
(or patient_has_hypersensitivity_to_angiotensin_ii_receptor_antagonist_containing_product_inthehistory@@at1_subtype_only
    patient_has_hypersensitivity_to_calcium_channel_blocker_inthehistory
    patient_has_hypersensitivity_to_diuretic_inthehistory))
:named REQ8_AUXILIARY0)) ;; "with exhaustive subcategories (AT1 subtype angiotensin II receptor antagonist, calcium channel blocker, diuretic)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_history_of_serious_side_effect_from_study_drugs@@limited_to_at1_subtype_angiotensin_ii_receptor_antagonist_calcium_channel_blocker_diuretic
      patient_has_history_of_serious_side_effect_from_study_drugs)
:named REQ8_AUXILIARY1)) ;; "history of serious side effect from study drugs limited to AT1 subtype angiotensin II receptor antagonist, calcium channel blocker, diuretic"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_hypersensitivity_to_angiotensin_ii_receptor_antagonist_containing_product_inthehistory@@at1_subtype_only
      patient_has_hypersensitivity_to_angiotensin_ii_receptor_antagonist_containing_product_inthehistory)
:named REQ8_AUXILIARY2)) ;; "history of hypersensitivity to AT1 subtype angiotensin II receptor antagonist-containing products"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_history_of_serious_side_effect_from_study_drugs@@limited_to_at1_subtype_angiotensin_ii_receptor_antagonist_calcium_channel_blocker_diuretic)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of serious side effect from study drugs with exhaustive subcategories (AT1 subtype angiotensin II receptor antagonist, calcium channel blocker, diuretic))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_life_threatening_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a life threatening condition (including but not limited to malignant tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a life threatening condition (including but not limited to malignant tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a life threatening condition (including but not limited to malignant tumor).","meaning":"Boolean indicating whether the patient currently has a life threatening condition (including but not limited to malignant tumor) now."} ;; "life threatening condition (including but not limited to malignant tumor)"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignant tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignant tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignant tumor).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignant tumor) now."} ;; "malignant tumor"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive example: malignant tumor implies life threatening condition
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now
       patient_has_life_threatening_condition_now)
   :named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (malignant tumor)."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_life_threatening_condition_now)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life threatening condition with non-exhaustive examples (malignant tumor)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_judged_by_study_physician_to_not_be_suited_to_be_study_subject Bool) ;; {"when_to_set_to_true":"Set to true if a study physician has judged that the patient is NOT suited to be a study subject.","when_to_set_to_false":"Set to false if a study physician has judged that the patient IS suited to be a study subject.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a study physician has judged the patient's suitability as a study subject.","meaning":"Boolean indicating whether the patient is judged by a study physician to NOT be suited to be a study subject."} ;; "the patient is judged by a study physician to NOT be suited to be a study subject"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_judged_by_study_physician_to_not_be_suited_to_be_study_subject)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is judged by a study physician to NOT be suited to be a study subject."
