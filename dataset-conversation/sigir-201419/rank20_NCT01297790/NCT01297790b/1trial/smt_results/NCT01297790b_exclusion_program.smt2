;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_symptoms_of_upper_respiratory_infection_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms of upper respiratory tract infection that occurred within the past 6 weeks.","when_to_set_to_false":"Set to false if the patient has not had symptoms of upper respiratory tract infection within the past 6 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had symptoms of upper respiratory tract infection within the past 6 weeks.","meaning":"Boolean indicating whether the patient has symptoms of upper respiratory tract infection within the past 6 weeks."} ;; "upper respiratory tract infection within the last six weeks"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_symptoms_of_upper_respiratory_infection_inthepast6weeks)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of upper respiratory tract infection within the last six weeks."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a pharmaceutical or biologic product (drug) within the past four weeks.","when_to_set_to_false":"Set to false if the patient has not taken any pharmaceutical or biologic product (drug) within the past four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a pharmaceutical or biologic product (drug) within the past four weeks.","meaning":"Boolean indicating whether the patient has taken a pharmaceutical or biologic product (drug) within the past four weeks."} ;; "drug"
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks@@investigational_and_used_in_another_clinical_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a pharmaceutical or biologic product (drug) within the past four weeks, and the drug was investigational and used in another clinical trial.","when_to_set_to_false":"Set to false if the patient has taken a pharmaceutical or biologic product (drug) within the past four weeks, but the drug was not investigational or not used in another clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug was investigational and used in another clinical trial.","meaning":"Boolean indicating whether the drug taken within the past four weeks was investigational and used in another clinical trial."} ;; "investigational drug within the last four weeks"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks@@investigational_and_used_in_another_clinical_trial
      patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks)
:named REQ1_AUXILIARY0)) ;; "the drug was investigational and used in another clinical trial"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_taken_pharmaceutical_biologic_product_inthepast4weeks@@investigational_and_used_in_another_clinical_trial)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in another clinical trial of an investigational drug within the last four weeks."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking angiotensin-converting enzyme inhibitor medication.","when_to_set_to_false":"Set to false if the patient is currently not taking angiotensin-converting enzyme inhibitor medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking angiotensin-converting enzyme inhibitor medication.","meaning":"Boolean indicating whether the patient is currently taking angiotensin-converting enzyme inhibitor medication."} ;; "angiotensin-converting enzyme inhibitor medication"
(declare-const patient_is_taking_codeine_phosphate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking codeine phosphate medication.","when_to_set_to_false":"Set to false if the patient is currently not taking codeine phosphate medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking codeine phosphate medication.","meaning":"Boolean indicating whether the patient is currently taking codeine phosphate medication."} ;; "codeine phosphate medication"
(declare-const patient_is_taking_morphine_sulfate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking morphine sulphate medication.","when_to_set_to_false":"Set to false if the patient is currently not taking morphine sulphate medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking morphine sulphate medication.","meaning":"Boolean indicating whether the patient is currently taking morphine sulphate medication."} ;; "morphine sulphate medication"
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "medication"
(declare-const patient_is_taking_drug_or_medicament_now@@likely_to_alter_cough_reflex_sensitivity Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a drug or medicament that is likely to alter cough reflex sensitivity.","when_to_set_to_false":"Set to false if the patient is currently taking a drug or medicament that is not likely to alter cough reflex sensitivity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament being taken is likely to alter cough reflex sensitivity.","meaning":"Boolean indicating whether the drug or medicament being taken is likely to alter cough reflex sensitivity."} ;; "medication likely to alter cough reflex sensitivity"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_taking_angiotensin_converting_enzyme_inhibitor_now
           patient_is_taking_codeine_phosphate_now
           patient_is_taking_morphine_sulfate_now)
       patient_is_taking_drug_or_medicament_now@@likely_to_alter_cough_reflex_sensitivity)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((uses angiotensin-converting enzyme inhibitor medication) OR (uses codeine phosphate medication) OR (uses morphine sulphate medication))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@likely_to_alter_cough_reflex_sensitivity
       patient_is_taking_drug_or_medicament_now)
   :named REQ2_AUXILIARY1)) ;; "medication likely to alter cough reflex sensitivity" implies "medication"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@likely_to_alter_cough_reflex_sensitivity)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses medication likely to alter cough reflex sensitivity with non-exhaustive examples ((uses angiotensin-converting enzyme inhibitor medication) OR (uses codeine phosphate medication) OR (uses morphine sulphate medication))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_litre Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of forced expiratory volume in one second (FEV1) in litres is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current forced expiratory volume in one second (FEV1), measured in litres."} ;; "forced expiratory volume in one second < 1 litre"
(declare-const patient_has_diagnosis_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of respiratory system.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of respiratory system.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of respiratory system."} ;; "respiratory disease"
(declare-const patient_has_diagnosis_of_disorder_of_respiratory_system_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of respiratory system and the disorder is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of disorder of respiratory system but the disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of respiratory system is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of respiratory system and the disorder is severe."} ;; "severe respiratory disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive example: FEV1 < 1 litre implies severe respiratory disease
(assert
(! (=> (< patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_litre 1)
       patient_has_diagnosis_of_disorder_of_respiratory_system_now@@severity_severe)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((forced expiratory volume in one second < 1 litre))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_respiratory_system_now@@severity_severe
       patient_has_diagnosis_of_disorder_of_respiratory_system_now)
   :named REQ3_AUXILIARY1)) ;; "severe respiratory disease" implies "respiratory disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_respiratory_system_now@@severity_severe)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe respiratory disease with non-exhaustive examples ((forced expiratory volume in one second < 1 litre))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any co-morbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have any co-morbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any co-morbid conditions.","meaning":"Boolean indicating whether the patient currently has any co-morbid conditions."} ;; "medical co-morbidities"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's co-morbid conditions are significant.","when_to_set_to_false":"Set to false if the patient's co-morbid conditions are not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's co-morbid conditions are significant.","meaning":"Boolean indicating whether the patient's co-morbid conditions are significant."} ;; "significant medical co-morbidities"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@likely_to_affect_ability_to_participate_in_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's co-morbid conditions are likely to affect the ability to participate in the trial.","when_to_set_to_false":"Set to false if the patient's co-morbid conditions are not likely to affect the ability to participate in the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's co-morbid conditions are likely to affect the ability to participate in the trial.","meaning":"Boolean indicating whether the patient's co-morbid conditions are likely to affect the ability to participate in the trial."} ;; "likely to affect ability to participate in the trial"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@likely_to_affect_cough_reflex_sensitivity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's co-morbid conditions are likely to affect cough reflex sensitivity.","when_to_set_to_false":"Set to false if the patient's co-morbid conditions are not likely to affect cough reflex sensitivity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's co-morbid conditions are likely to affect cough reflex sensitivity.","meaning":"Boolean indicating whether the patient's co-morbid conditions are likely to affect cough reflex sensitivity."} ;; "likely to affect cough reflex sensitivity"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cerebrovascular accident (stroke).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient currently has a diagnosis of cerebrovascular accident (stroke)."} ;; "stroke"
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease."} ;; "Parkinson's disease"
(declare-const patient_has_diagnosis_of_multiple_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of multiple sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of multiple sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of multiple sclerosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of multiple sclerosis."} ;; "multiple sclerosis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply the umbrella term (likely to affect cough reflex sensitivity)
(assert
(! (=> (or patient_has_diagnosis_of_diabetes_mellitus_now
          patient_has_diagnosis_of_cerebrovascular_accident_now
          patient_has_diagnosis_of_parkinson_s_disease_now
          patient_has_diagnosis_of_multiple_sclerosis_now)
     patient_has_finding_of_co_morbid_conditions_now@@likely_to_affect_cough_reflex_sensitivity)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples ((diabetes mellitus) OR (stroke) OR (Parkinson's disease) OR (multiple sclerosis))."

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@is_significant
       patient_has_finding_of_co_morbid_conditions_now)
:named REQ4_AUXILIARY1)) ;; "significant medical co-morbidities"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@likely_to_affect_ability_to_participate_in_trial
       patient_has_finding_of_co_morbid_conditions_now)
:named REQ4_AUXILIARY2)) ;; "likely to affect ability to participate in the trial"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@likely_to_affect_cough_reflex_sensitivity
       patient_has_finding_of_co_morbid_conditions_now)
:named REQ4_AUXILIARY3)) ;; "likely to affect cough reflex sensitivity"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have significant co-morbidities likely to affect ability to participate in the trial OR likely to affect cough reflex sensitivity
(assert
(! (not (or (and patient_has_finding_of_co_morbid_conditions_now@@is_significant
                 patient_has_finding_of_co_morbid_conditions_now@@likely_to_affect_ability_to_participate_in_trial)
            patient_has_finding_of_co_morbid_conditions_now@@likely_to_affect_cough_reflex_sensitivity))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "significant medical co-morbidities likely to affect ability to participate in the trial OR likely to affect cough reflex sensitivity with non-exhaustive examples ((diabetes mellitus) OR (stroke) OR (Parkinson's disease) OR (multiple sclerosis))."
