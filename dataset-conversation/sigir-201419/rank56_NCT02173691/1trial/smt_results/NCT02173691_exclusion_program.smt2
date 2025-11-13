;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD)."}

(declare-const patient_has_finding_of_clinically_significant_disease_other_than_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinically significant disease other than chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have any clinically significant disease other than chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinically significant disease other than chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has any clinically significant disease other than chronic obstructive pulmonary disease."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_clinically_significant_disease_other_than_chronic_obstructive_pulmonary_disease_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant diseases other than chronic obstructive pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_abnormal_urinalysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal urinalysis.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal urinalysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal urinalysis.","meaning":"Boolean indicating whether the patient currently has abnormal urinalysis."} ;; "abnormal baseline urinalysis"
(declare-const patient_has_finding_of_abnormal_urinalysis_now@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal urinalysis finding is present at baseline.","when_to_set_to_false":"Set to false if the abnormal urinalysis finding is not present at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal urinalysis finding is present at baseline.","meaning":"Boolean indicating whether the abnormal urinalysis finding is present at baseline."} ;; "abnormal baseline urinalysis"
(declare-const patient_has_finding_of_blood_chemistry_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal blood chemistry.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal blood chemistry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal blood chemistry.","meaning":"Boolean indicating whether the patient currently has abnormal blood chemistry."} ;; "abnormal baseline blood chemistry"
(declare-const patient_has_finding_of_blood_chemistry_abnormal_now@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal blood chemistry finding is present at baseline.","when_to_set_to_false":"Set to false if the abnormal blood chemistry finding is not present at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal blood chemistry finding is present at baseline.","meaning":"Boolean indicating whether the abnormal blood chemistry finding is present at baseline."} ;; "abnormal baseline blood chemistry"
(declare-const patient_has_finding_of_clinically_relevant_abnormal_baseline_blood_chemistry_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinically relevant abnormal baseline blood chemistry.","when_to_set_to_false":"Set to false if the patient currently does not have clinically relevant abnormal baseline blood chemistry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinically relevant abnormal baseline blood chemistry.","meaning":"Boolean indicating whether the patient currently has clinically relevant abnormal baseline blood chemistry."} ;; "clinically relevant abnormal baseline blood chemistry"
(declare-const patient_has_finding_of_clinically_relevant_abnormal_baseline_blood_chemistry_now@@defines_disease_listed_as_exclusion_criterion Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal baseline blood chemistry defines a disease listed as an exclusion criterion.","when_to_set_to_false":"Set to false if the abnormal baseline blood chemistry does not define a disease listed as an exclusion criterion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal baseline blood chemistry defines a disease listed as an exclusion criterion.","meaning":"Boolean indicating that the abnormal baseline blood chemistry defines a disease listed as an exclusion criterion."} ;; "the abnormality defines a disease listed as an exclusion criterion"
(declare-const patient_has_finding_of_clinically_relevant_abnormal_baseline_haematology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinically relevant abnormal baseline haematology.","when_to_set_to_false":"Set to false if the patient currently does not have clinically relevant abnormal baseline haematology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinically relevant abnormal baseline haematology.","meaning":"Boolean indicating whether the patient currently has clinically relevant abnormal baseline haematology."} ;; "clinically relevant abnormal baseline haematology"
(declare-const patient_has_finding_of_clinically_relevant_abnormal_baseline_haematology_now@@defines_disease_listed_as_exclusion_criterion Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal baseline haematology defines a disease listed as an exclusion criterion.","when_to_set_to_false":"Set to false if the abnormal baseline haematology does not define a disease listed as an exclusion criterion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal baseline haematology defines a disease listed as an exclusion criterion.","meaning":"Boolean indicating that the abnormal baseline haematology defines a disease listed as an exclusion criterion."} ;; "the abnormality defines a disease listed as an exclusion criterion"
(declare-const patient_has_finding_of_clinically_relevant_abnormal_baseline_urinalysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinically relevant abnormal baseline urinalysis.","when_to_set_to_false":"Set to false if the patient currently does not have clinically relevant abnormal baseline urinalysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinically relevant abnormal baseline urinalysis.","meaning":"Boolean indicating whether the patient currently has clinically relevant abnormal baseline urinalysis."} ;; "clinically relevant abnormal baseline urinalysis"
(declare-const patient_has_finding_of_clinically_relevant_abnormal_baseline_urinalysis_now@@defines_disease_listed_as_exclusion_criterion Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal baseline urinalysis defines a disease listed as an exclusion criterion.","when_to_set_to_false":"Set to false if the abnormal baseline urinalysis does not define a disease listed as an exclusion criterion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal baseline urinalysis defines a disease listed as an exclusion criterion.","meaning":"Boolean indicating that the abnormal baseline urinalysis defines a disease listed as an exclusion criterion."} ;; "the abnormality defines a disease listed as an exclusion criterion"
(declare-const patient_has_undergone_hematology_procedure_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a hematology procedure now and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone a hematology procedure now and the outcome is not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a hematology procedure now with abnormal outcome.","meaning":"Boolean indicating whether the patient has undergone a hematology procedure now and the outcome is abnormal."} ;; "haematology"
(declare-const patient_has_undergone_hematology_procedure_now_outcome_is_abnormal@@at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the hematology procedure was performed at baseline.","when_to_set_to_false":"Set to false if the hematology procedure was not performed at baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure was performed at baseline.","meaning":"Boolean indicating whether the hematology procedure was performed at baseline."} ;; "haematology at baseline"
(declare-const patient_has_undergone_hematology_procedure_now_outcome_is_abnormal@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal outcome of the hematology procedure now is clinically relevant.","when_to_set_to_false":"Set to false if the abnormal outcome of the hematology procedure now is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal outcome is clinically relevant.","meaning":"Boolean indicating whether the abnormal outcome of the hematology procedure now is clinically relevant."} ;; "clinically relevant abnormal baseline haematology"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_abnormal_urinalysis_now@@at_baseline
      patient_has_finding_of_abnormal_urinalysis_now)
    :named REQ1_AUXILIARY0)) ;; "abnormal baseline urinalysis"

(assert
(! (=> patient_has_finding_of_blood_chemistry_abnormal_now@@at_baseline
      patient_has_finding_of_blood_chemistry_abnormal_now)
    :named REQ1_AUXILIARY1)) ;; "abnormal baseline blood chemistry"

(assert
(! (=> patient_has_undergone_hematology_procedure_now_outcome_is_abnormal@@at_baseline
      patient_has_undergone_hematology_procedure_now_outcome_is_abnormal)
    :named REQ1_AUXILIARY2)) ;; "haematology at baseline"

(assert
(! (=> patient_has_undergone_hematology_procedure_now_outcome_is_abnormal@@clinically_relevant
      patient_has_undergone_hematology_procedure_now_outcome_is_abnormal)
    :named REQ1_AUXILIARY3)) ;; "clinically relevant abnormal baseline haematology"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: The patient is excluded if (the patient has clinically relevant abnormal baseline haematology AND the abnormality defines a disease listed as an exclusion criterion)
(assert
(! (not (and patient_has_finding_of_clinically_relevant_abnormal_baseline_haematology_now
             patient_has_finding_of_clinically_relevant_abnormal_baseline_haematology_now@@defines_disease_listed_as_exclusion_criterion))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically relevant abnormal baseline haematology AND the abnormality defines a disease listed as an exclusion criterion."

;; Exclusion: The patient is excluded if (the patient has clinically relevant abnormal baseline blood chemistry AND the abnormality defines a disease listed as an exclusion criterion)
(assert
(! (not (and patient_has_finding_of_clinically_relevant_abnormal_baseline_blood_chemistry_now
             patient_has_finding_of_clinically_relevant_abnormal_baseline_blood_chemistry_now@@defines_disease_listed_as_exclusion_criterion))
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically relevant abnormal baseline blood chemistry AND the abnormality defines a disease listed as an exclusion criterion."

;; Exclusion: The patient is excluded if (the patient has clinically relevant abnormal baseline urinalysis AND the abnormality defines a disease listed as an exclusion criterion)
(assert
(! (not (and patient_has_finding_of_clinically_relevant_abnormal_baseline_urinalysis_now
             patient_has_finding_of_clinically_relevant_abnormal_baseline_urinalysis_now@@defines_disease_listed_as_exclusion_criterion))
    :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically relevant abnormal baseline urinalysis AND the abnormality defines a disease listed as an exclusion criterion."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_ast_serum_measurement_value_recorded_now_withunit_international_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum glutamic oxaloacetic transaminase concentration in international units per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum glutamic oxaloacetic transaminase concentration in international units per liter."} ;; "serum glutamic oxaloacetic transaminase concentration > 80 international units per liter"
(declare-const patient_alt_serum_measurement_value_recorded_now_withunit_international_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum glutamic pyruvic transaminase concentration in international units per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum glutamic pyruvic transaminase concentration in international units per liter."} ;; "serum glutamic pyruvic transaminase concentration > 80 international units per liter"
(declare-const patient_bilirubin_concentration_test_strip_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current bilirubin concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current bilirubin concentration in milligrams per deciliter."} ;; "bilirubin concentration > 2.0 milligrams per deciliter"
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current creatinine concentration in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current creatinine concentration in milligrams per deciliter."} ;; "creatinine concentration > 2.0 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_ast_serum_measurement_value_recorded_now_withunit_international_units_per_liter 80))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum glutamic oxaloacetic transaminase concentration > 80 international units per liter."

(assert
(! (not (> patient_alt_serum_measurement_value_recorded_now_withunit_international_units_per_liter 80))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum glutamic pyruvic transaminase concentration > 80 international units per liter."

(assert
(! (not (> patient_bilirubin_concentration_test_strip_measurement_value_recorded_now_withunit_milligrams_per_deciliter 2.0))
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bilirubin concentration > 2.0 milligrams per deciliter."

(assert
(! (not (> patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 2.0))
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine concentration > 2.0 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of myocardial infarction within the past one year.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of myocardial infarction within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of myocardial infarction within the past one year.","meaning":"Boolean indicating whether the patient has had a diagnosis of myocardial infarction within the past one year."} ;; "recent history (within one year or less) of myocardial infarction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthepast1years)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a recent history (within one year or less) of myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have any cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has any cardiac arrhythmia."} ;; "cardiac arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@requires_drug_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac arrhythmia requires drug therapy.","when_to_set_to_false":"Set to false if the patient's current cardiac arrhythmia does not require drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac arrhythmia requires drug therapy.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia requires drug therapy."} ;; "cardiac arrhythmia requiring drug therapy"
(declare-const patient_has_finding_of_heart_failure_inthepast3years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had heart failure in the past three years.","when_to_set_to_false":"Set to false if the patient has not had heart failure in the past three years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had heart failure in the past three years.","meaning":"Boolean indicating whether the patient has had heart failure in the past three years."} ;; "heart failure within the past three years"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@requires_drug_therapy
       patient_has_finding_of_cardiac_arrhythmia_now)
   :named REQ4_AUXILIARY0)) ;; "cardiac arrhythmia requiring drug therapy"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient has any cardiac arrhythmia requiring drug therapy
(assert
(! (not (or patient_has_finding_of_cardiac_arrhythmia_now@@requires_drug_therapy
            patient_has_finding_of_heart_failure_inthepast3years))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has any cardiac arrhythmia requiring drug therapy) OR (the patient has been hospitalised for heart failure within the past three years)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_undergoing_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing oxygen therapy."} ;; "oxygen therapy"
(declare-const patient_is_undergoing_oxygen_therapy_now@@regular_daytime_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current oxygen therapy is used regularly during daytime hours.","when_to_set_to_false":"Set to false if the patient's current oxygen therapy is not used regularly during daytime hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current oxygen therapy is used regularly during daytime hours.","meaning":"Boolean indicating whether the patient's current oxygen therapy is used regularly during daytime hours."} ;; "regular daytime use of oxygen therapy"
(declare-const patient_is_undergoing_oxygen_therapy_now@@unable_to_abstain_for_more_than_one_hour_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to abstain from regular daytime use of oxygen therapy for more than one hour per day.","when_to_set_to_false":"Set to false if the patient is able to abstain from regular daytime use of oxygen therapy for more than one hour per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to abstain from regular daytime use of oxygen therapy for more than one hour per day.","meaning":"Boolean indicating whether the patient is unable to abstain from regular daytime use of oxygen therapy for more than one hour per day."} ;; "unable to abstain from regular daytime use of oxygen therapy for more than one hour per day"
(declare-const patient_oxygen_therapy_regular_daytime_use_duration_per_day_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours per day that the patient uses oxygen therapy regularly during daytime.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours per day the patient uses oxygen therapy regularly during daytime.","meaning":"Numeric value indicating the duration, in hours per day, that the patient uses oxygen therapy regularly during daytime."} ;; "duration, in hours per day, that the patient uses oxygen therapy regularly during daytime"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@regular_daytime_use
      patient_is_undergoing_oxygen_therapy_now)
   :named REQ5_AUXILIARY0)) ;; "regular daytime use of oxygen therapy"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@unable_to_abstain_for_more_than_one_hour_per_day
      patient_is_undergoing_oxygen_therapy_now@@regular_daytime_use)
   :named REQ5_AUXILIARY1)) ;; "unable to abstain from regular daytime use of oxygen therapy for more than one hour per day"

;; If patient is unable to abstain for more than one hour per day, then their regular daytime use duration per day is greater than or equal to 23 hours
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@unable_to_abstain_for_more_than_one_hour_per_day
      (>= patient_oxygen_therapy_regular_daytime_use_duration_per_day_in_hours 23))
   :named REQ5_AUXILIARY2)) ;; "unable to abstain from regular daytime use of oxygen therapy for more than one hour per day" and "duration per day"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_undergoing_oxygen_therapy_now@@unable_to_abstain_for_more_than_one_hour_per_day)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to abstain from regular daytime use of oxygen therapy for more than one hour per day."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_active_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of active tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of active tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of active tuberculosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of active tuberculosis."} ;; "active tuberculosis"
(declare-const patient_has_diagnosis_of_active_tuberculosis_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of active tuberculosis is known (confirmed, not suspected or uncertain).","when_to_set_to_false":"Set to false if the diagnosis of active tuberculosis is not known (i.e., suspected, uncertain, or unconfirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of active tuberculosis is known.","meaning":"Boolean indicating whether the diagnosis of active tuberculosis is known (confirmed, not suspected or uncertain)."} ;; "known active tuberculosis"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_active_tuberculosis_now@@known
      patient_has_diagnosis_of_active_tuberculosis_now)
   :named REQ6_AUXILIARY0)) ;; "known active tuberculosis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_active_tuberculosis_now@@known)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known active tuberculosis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of malignant neoplastic disease (cancer) within the past five years.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of malignant neoplastic disease (cancer) within the past five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of malignant neoplastic disease (cancer) within the past five years.","meaning":"Boolean indicating whether the patient has a diagnosis of malignant neoplastic disease (cancer) within the past five years."} ;; "history of cancer within the last five years"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@only_cancer_is_basal_cell_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the only malignant neoplastic disease (cancer) diagnosis the patient has within the past five years is basal cell carcinoma.","when_to_set_to_false":"Set to false if the patient has any other malignant neoplastic disease (cancer) diagnosis within the past five years, or has multiple cancers including basal cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the only cancer diagnosis within the past five years is basal cell carcinoma.","meaning":"Boolean indicating whether the only malignant neoplastic disease (cancer) diagnosis within the past five years is basal cell carcinoma."} ;; "EXCEPT if the only cancer is basal cell carcinoma"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@only_cancer_is_basal_cell_carcinoma
      patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years)
:named REQ7_AUXILIARY0)) ;; "the only cancer is basal cell carcinoma" implies "history of cancer within the last five years"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have a history of cancer within the last five years, unless the only cancer is basal cell carcinoma
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years
             (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@only_cancer_is_basal_cell_carcinoma)))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cancer within the last five years, EXCEPT if the only cancer is basal cell carcinoma."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_life_threatening_pulmonary_obstruction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of life-threatening pulmonary obstruction documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of life-threatening pulmonary obstruction documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of life-threatening pulmonary obstruction.","meaning":"Boolean indicating whether the patient has ever had life-threatening pulmonary obstruction in their history."} ;; "history of life-threatening pulmonary obstruction"
(declare-const patient_has_finding_of_cystic_fibrosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of cystic fibrosis documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of cystic fibrosis documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of cystic fibrosis.","meaning":"Boolean indicating whether the patient has ever had cystic fibrosis in their history."} ;; "history of cystic fibrosis"
(declare-const patient_has_finding_of_bronchiectasis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of bronchiectasis documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of bronchiectasis documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of bronchiectasis.","meaning":"Boolean indicating whether the patient has ever had bronchiectasis in their history."} ;; "history of bronchiectasis"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_life_threatening_pulmonary_obstruction_inthehistory)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of life-threatening pulmonary obstruction."

(assert
(! (not patient_has_finding_of_cystic_fibrosis_inthehistory)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cystic fibrosis."

(assert
(! (not patient_has_finding_of_bronchiectasis_inthehistory)
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of bronchiectasis."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_undergone_lung_excision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a lung excision (pulmonary resection) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a lung excision (pulmonary resection) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a lung excision (pulmonary resection) in their history.","meaning":"Boolean indicating whether the patient has ever undergone a lung excision (pulmonary resection) at any time in their history."} ;; "pulmonary resection"
(declare-const patient_has_undergone_lung_excision_inthehistory@@performed_with_thoracotomy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lung excision (pulmonary resection) was performed in conjunction with thoracotomy.","when_to_set_to_false":"Set to false if the patient's lung excision (pulmonary resection) was not performed in conjunction with thoracotomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lung excision (pulmonary resection) was performed in conjunction with thoracotomy.","meaning":"Boolean indicating whether the patient's lung excision (pulmonary resection) was performed in conjunction with thoracotomy."} ;; "thoracotomy with pulmonary resection"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_lung_excision_inthehistory@@performed_with_thoracotomy
      patient_has_undergone_lung_excision_inthehistory)
:named REQ9_AUXILIARY0)) ;; "pulmonary resection performed in conjunction with thoracotomy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_undergone_lung_excision_inthehistory@@performed_with_thoracotomy)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone thoracotomy with pulmonary resection."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_upper_respiratory_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an upper respiratory infection at any time during the run-in period.","when_to_set_to_false":"Set to false if the patient has not had an upper respiratory infection during the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an upper respiratory infection during the run-in period.","meaning":"Boolean indicating whether the patient has had an upper respiratory infection during the run-in period."} ;; "upper respiratory infection in the history"
(declare-const patient_has_finding_of_upper_respiratory_infection_inthehistory@@temporalcontext_during_run_in_period Bool) ;; {"when_to_set_to_true":"Set to true if the upper respiratory infection occurred during the run-in period.","when_to_set_to_false":"Set to false if the upper respiratory infection did not occur during the run-in period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the upper respiratory infection occurred during the run-in period.","meaning":"Boolean indicating whether the upper respiratory infection occurred during the run-in period."} ;; "upper respiratory infection during the run-in period"
(declare-const patient_has_finding_of_upper_respiratory_infection_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an upper respiratory infection at any time in the six weeks prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not had an upper respiratory infection in the six weeks prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an upper respiratory infection in the six weeks prior to the screening visit.","meaning":"Boolean indicating whether the patient has had an upper respiratory infection in the six weeks prior to the screening visit."} ;; "upper respiratory infection in the six weeks prior to the screening visit"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_upper_respiratory_infection_inthehistory@@temporalcontext_during_run_in_period
      patient_has_finding_of_upper_respiratory_infection_inthehistory)
:named REQ10_AUXILIARY0)) ;; "upper respiratory infection during the run-in period" implies "upper respiratory infection in the history"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or patient_has_finding_of_upper_respiratory_infection_inthepast6weeks
            patient_has_finding_of_upper_respiratory_infection_inthehistory@@temporalcontext_during_run_in_period))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had any upper respiratory infection in the six weeks prior to the screening visit) OR (the patient has had any upper respiratory infection during the run-in period)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_currently_participating_in_pulmonary_rehabilitation_programme Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a pulmonary rehabilitation programme.","when_to_set_to_false":"Set to false if the patient is not currently participating in a pulmonary rehabilitation programme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a pulmonary rehabilitation programme.","meaning":"Boolean indicating whether the patient is currently participating in a pulmonary rehabilitation programme."} ;; "the patient is currently participating in a pulmonary rehabilitation programme"
(declare-const patient_has_completed_pulmonary_rehabilitation_programme_in_the_6_weeks_prior_to_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed a pulmonary rehabilitation programme in the six weeks prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not completed a pulmonary rehabilitation programme in the six weeks prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed a pulmonary rehabilitation programme in the six weeks prior to the screening visit.","meaning":"Boolean indicating whether the patient has completed a pulmonary rehabilitation programme in the six weeks prior to the screening visit."} ;; "the patient has completed a pulmonary rehabilitation programme in the six weeks prior to the screening visit"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_currently_participating_in_pulmonary_rehabilitation_programme)
:named REQ11_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is currently participating in a pulmonary rehabilitation programme"

(assert
(! (not patient_has_completed_pulmonary_rehabilitation_programme_in_the_6_weeks_prior_to_screening_visit)
:named REQ11_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has completed a pulmonary rehabilitation programme in the six weeks prior to the screening visit"

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_hypersensitivity_to_acetylcholine_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to any acetylcholine receptor antagonist containing product (anticholinergic drugs).","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to any acetylcholine receptor antagonist containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to any acetylcholine receptor antagonist containing product.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to any acetylcholine receptor antagonist containing product."} ;; "the patient has known hypersensitivity to anticholinergic drugs"

(declare-const patient_has_finding_of_allergy_to_salmeterol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to salmeterol (hypersensitivity).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to salmeterol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to salmeterol.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy to salmeterol."} ;; "the patient has known hypersensitivity to salmeterol"

(declare-const patient_has_hypersensitivity_to_any_component_of_capsule_delivery_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has known hypersensitivity to any of the components of the lactose powder capsule delivery system.","when_to_set_to_false":"Set to false if the patient currently does not have known hypersensitivity to any of the components of the lactose powder capsule delivery system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has known hypersensitivity to any of the components of the lactose powder capsule delivery system.","meaning":"Boolean indicating whether the patient currently has known hypersensitivity to any of the components of the lactose powder capsule delivery system."} ;; "the patient has known hypersensitivity to any of the components of the lactose powder capsule delivery system"

(declare-const patient_has_hypersensitivity_to_any_component_of_metered_dose_inhaler_delivery_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has known hypersensitivity to any of the components of the metered dose inhaler delivery system.","when_to_set_to_false":"Set to false if the patient currently does not have known hypersensitivity to any of the components of the metered dose inhaler delivery system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has known hypersensitivity to any of the components of the metered dose inhaler delivery system.","meaning":"Boolean indicating whether the patient currently has known hypersensitivity to any of the components of the metered dose inhaler delivery system."} ;; "the patient has known hypersensitivity to any of the components of the metered dose inhaler delivery system"

(declare-const patient_has_hypersensitivity_to_lactose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to lactose.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to lactose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to lactose.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to lactose."} ;; "hypersensitivity to lactose"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_hypersensitivity_to_acetylcholine_receptor_antagonist_containing_product_now)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to anticholinergic drugs."

(assert
(! (not patient_has_finding_of_allergy_to_salmeterol_now)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to salmeterol."

(assert
(! (not patient_has_hypersensitivity_to_any_component_of_capsule_delivery_system_now)
    :named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to any of the components of the lactose powder capsule delivery system."

(assert
(! (not patient_has_hypersensitivity_to_any_component_of_metered_dose_inhaler_delivery_system_now)
    :named REQ12_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to any of the components of the metered dose inhaler delivery system."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_benign_prostatic_hyperplasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of benign prostatic hyperplasia (prostatic hypertrophy).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of benign prostatic hyperplasia (prostatic hypertrophy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has benign prostatic hyperplasia (prostatic hypertrophy).","meaning":"Boolean indicating whether the patient currently has benign prostatic hyperplasia (prostatic hypertrophy)."} ;; "prostatic hypertrophy"
(declare-const patient_has_finding_of_benign_prostatic_hyperplasia_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has benign prostatic hyperplasia (prostatic hypertrophy) and the finding is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has benign prostatic hyperplasia (prostatic hypertrophy) but the finding is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the benign prostatic hyperplasia (prostatic hypertrophy) is symptomatic.","meaning":"Boolean indicating whether the patient's benign prostatic hyperplasia (prostatic hypertrophy) is symptomatic."} ;; "symptomatic prostatic hypertrophy"
(declare-const patient_has_finding_of_bladder_neck_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bladder neck obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bladder neck obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bladder neck obstruction.","meaning":"Boolean indicating whether the patient currently has bladder neck obstruction."} ;; "bladder neck obstruction"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_benign_prostatic_hyperplasia_now@@symptomatic
      patient_has_finding_of_benign_prostatic_hyperplasia_now)
    :named REQ13_AUXILIARY0)) ;; "symptomatic prostatic hypertrophy" implies "prostatic hypertrophy"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_benign_prostatic_hyperplasia_now@@symptomatic)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known symptomatic prostatic hypertrophy."

(assert
(! (not patient_has_finding_of_bladder_neck_obstruction_now)
    :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known bladder neck obstruction."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_angle_closure_glaucoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of angle closure glaucoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of angle closure glaucoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of angle closure glaucoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of angle closure glaucoma."} ;; "narrow-angle glaucoma"
(declare-const patient_has_diagnosis_of_narrow_angle_glaucoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of narrow-angle glaucoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of narrow-angle glaucoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of narrow-angle glaucoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of narrow-angle glaucoma."} ;; "narrow-angle glaucoma"
(declare-const patient_has_known_diagnosis_of_narrow_angle_glaucoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known diagnosis of narrow-angle glaucoma.","when_to_set_to_false":"Set to false if the patient currently does not have a known diagnosis of narrow-angle glaucoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known diagnosis of narrow-angle glaucoma.","meaning":"Boolean indicating whether the patient currently has a known diagnosis of narrow-angle glaucoma."} ;; "known narrow-angle glaucoma"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; "known narrow-angle glaucoma" implies "narrow-angle glaucoma"
(assert
(! (=> patient_has_known_diagnosis_of_narrow_angle_glaucoma_now
      patient_has_diagnosis_of_narrow_angle_glaucoma_now)
    :named REQ14_AUXILIARY0)) ;; "known narrow-angle glaucoma"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_known_diagnosis_of_narrow_angle_glaucoma_now)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known narrow-angle glaucoma."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_taking_cromolyn_sodium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with cromolyn sodium.","when_to_set_to_false":"Set to false if the patient is currently not being treated with cromolyn sodium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with cromolyn sodium.","meaning":"Boolean indicating whether the patient is currently being treated with cromolyn sodium."} ;; "the patient is currently being treated with cromolyn sodium"
(declare-const patient_is_taking_nedocromil_sodium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with nedocromil sodium.","when_to_set_to_false":"Set to false if the patient is currently not being treated with nedocromil sodium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with nedocromil sodium.","meaning":"Boolean indicating whether the patient is currently being treated with nedocromil sodium."} ;; "the patient is currently being treated with nedocromil sodium"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_is_taking_cromolyn_sodium_now)
:named REQ15_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently being treated with cromolyn sodium."
(assert
(! (not patient_is_taking_nedocromil_sodium_now)
:named REQ15_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently being treated with nedocromil sodium."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_taking_histamine_h1_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with a histamine H1 receptor antagonist containing product (antihistamine medication).","when_to_set_to_false":"Set to false if the patient is currently not being treated with a histamine H1 receptor antagonist containing product (antihistamine medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with a histamine H1 receptor antagonist containing product (antihistamine medication).","meaning":"Boolean indicating whether the patient is currently taking a histamine H1 receptor antagonist containing product (antihistamine medication)."}

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_is_taking_histamine_h1_receptor_antagonist_containing_product_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently being treated with antihistamine medication (H1 receptor antagonist medication)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_taking_oral_corticosteroid_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking oral corticosteroid medication.","when_to_set_to_false":"Set to false if the patient is not currently taking oral corticosteroid medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking oral corticosteroid medication.","meaning":"Boolean indicating whether the patient is currently taking oral corticosteroid medication."} ;; "the patient is taking oral corticosteroid medication"

(declare-const patient_is_taking_oral_corticosteroid_medication_now@@at_unstable_dose_less_than_six_weeks_on_stable_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking oral corticosteroid medication at unstable doses, defined as less than six weeks on a stable dose.","when_to_set_to_false":"Set to false if the patient is currently taking oral corticosteroid medication at stable doses, defined as six weeks or more on a stable dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking oral corticosteroid medication at unstable doses (less than six weeks on a stable dose).","meaning":"Boolean indicating whether the patient is currently taking oral corticosteroid medication at unstable doses (less than six weeks on a stable dose)."} ;; "at unstable doses (less than six weeks on a stable dose)"

(declare-const patient_prednisolone_value_recorded_now_withunit_milligrams_per_day Real) ;; {"when_to_set_to_value":"Set to the current daily dose (in milligrams per day) of oral corticosteroid medication, expressed as prednisolone equivalent, if the patient is currently taking such medication.","when_to_set_to_null":"Set to null if the patient is not currently taking oral corticosteroid medication, or if the dose (as prednisolone equivalent) is unknown or cannot be determined.","meaning":"Numeric value representing the patient's current daily dose of oral corticosteroid medication, expressed as prednisolone equivalent in milligrams per day."} ;; "doses in excess of the equivalent of 10 milligrams of prednisolone per day"

(declare-const patient_prednisolone_value_recorded_now_withunit_milligrams_every_other_day Real) ;; {"when_to_set_to_value":"Set to the current alternate-day dose (in milligrams every other day) of oral corticosteroid medication, expressed as prednisolone equivalent, if the patient is currently taking such medication on an every-other-day schedule.","when_to_set_to_null":"Set to null if the patient is not currently taking oral corticosteroid medication on an every-other-day schedule, or if the dose (as prednisolone equivalent) is unknown or cannot be determined.","meaning":"Numeric value representing the patient's current alternate-day dose of oral corticosteroid medication, expressed as prednisolone equivalent in milligrams every other day."} ;; "doses in excess of the equivalent of 20 milligrams of prednisolone every other day"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_taking_oral_corticosteroid_medication_now@@at_unstable_dose_less_than_six_weeks_on_stable_dose
      patient_is_taking_oral_corticosteroid_medication_now)
   :named REQ17_AUXILIARY0)) ;; "the patient is taking oral corticosteroid medication at unstable doses (less than six weeks on a stable dose)"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Exclusion: unstable dose (less than six weeks on a stable dose)
(assert
(! (not (or (and patient_is_taking_oral_corticosteroid_medication_now
                 patient_is_taking_oral_corticosteroid_medication_now@@at_unstable_dose_less_than_six_weeks_on_stable_dose)))
   :named REQ17_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is taking oral corticosteroid medication at unstable doses (less than six weeks on a stable dose)"

;; Exclusion: dose in excess of 10 mg prednisolone per day
(assert
(! (not (and patient_is_taking_oral_corticosteroid_medication_now
             (> patient_prednisolone_value_recorded_now_withunit_milligrams_per_day 10)))
   :named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is taking oral corticosteroid medication at doses in excess of the equivalent of 10 milligrams of prednisolone per day"

;; Exclusion: dose in excess of 20 mg prednisolone every other day
(assert
(! (not (and patient_is_taking_oral_corticosteroid_medication_now
             (> patient_prednisolone_value_recorded_now_withunit_milligrams_every_other_day 20)))
   :named REQ17_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is taking oral corticosteroid medication at doses in excess of the equivalent of 20 milligrams of prednisolone every other day"

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta-blocker medication).","when_to_set_to_false":"Set to false if the patient is currently not taking a beta-adrenergic receptor antagonist containing product (beta-blocker medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta-blocker medication).","meaning":"Boolean indicating whether the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta-blocker medication)."} ;; "beta-blocker medication"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now)
    :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using beta-blocker medication."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_is_taking_monoamine_oxidase_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with (i.e., is currently taking) a monoamine oxidase inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is not currently being treated with a monoamine oxidase inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with a monoamine oxidase inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking a monoamine oxidase inhibitor containing product."} ;; "the patient is currently being treated with monoamine oxidase inhibitor medication"
(declare-const patient_is_exposed_to_tricyclic_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with (i.e., is currently exposed to) a tricyclic antidepressant.","when_to_set_to_false":"Set to false if the patient is not currently being treated with a tricyclic antidepressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with a tricyclic antidepressant.","meaning":"Boolean indicating whether the patient is currently exposed to a tricyclic antidepressant."} ;; "the patient is currently being treated with tricyclic antidepressant medication"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not (or patient_is_taking_monoamine_oxidase_inhibitor_containing_product_now
            patient_is_exposed_to_tricyclic_antidepressant_now))
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is currently being treated with monoamine oxidase inhibitor medication) OR (the patient is currently being treated with tricyclic antidepressant medication)."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's current childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a woman of childbearing potential"
(declare-const patient_is_using_medically_approved_means_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a medically approved means of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using a medically approved means of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a medically approved means of contraception.","meaning":"Boolean indicating whether the patient is currently using a medically approved means of contraception."} ;; "using a medically approved means of contraception"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ20_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."

(assert
(! (not (and patient_has_childbearing_potential_now
             (not patient_is_using_medically_approved_means_of_contraception_now)))
:named REQ20_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a woman of childbearing potential AND the patient is NOT using a medically approved means of contraception."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with asthma at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with asthma at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with asthma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of asthma in their medical history."} ;; "the patient has a history of asthma"
(declare-const patient_has_diagnosis_of_allergic_rhinitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with allergic rhinitis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with allergic rhinitis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with allergic rhinitis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of allergic rhinitis in their medical history."} ;; "the patient has a history of allergic rhinitis"
(declare-const patient_has_diagnosis_of_atopy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with atopy at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with atopy at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with atopy.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of atopy in their medical history."} ;; "the patient has a history of atopy"
(declare-const total_blood_eosinophil_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's total blood eosinophil count measured at the current time, in units of per cubic millimeter.","when_to_set_to_null":"Set to null if the patient's total blood eosinophil count at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's total blood eosinophil count measured at the current time, in units of per cubic millimeter."} ;; "the patient has a total blood eosinophil count > 600 per cubic millimeter"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
  (! (not patient_has_diagnosis_of_asthma_inthehistory)
     :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of asthma."

(assert
  (! (not patient_has_diagnosis_of_allergic_rhinitis_inthehistory)
     :named REQ21_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergic rhinitis."

(assert
  (! (not patient_has_diagnosis_of_atopy_inthehistory)
     :named REQ21_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of atopy."

(assert
  (! (not (> total_blood_eosinophil_count_value_recorded_now_withunit_per_cubic_millimeter 600))
     :named REQ21_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a total blood eosinophil count > 600 per cubic millimeter."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse."} ;; "the patient has a history of significant alcohol abuse"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alcohol abuse is significant.","when_to_set_to_false":"Set to false if the patient's history of alcohol abuse is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of alcohol abuse is significant.","meaning":"Boolean indicating whether the patient's history of alcohol abuse is significant."} ;; "the patient has a history of significant alcohol abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol abuse.","meaning":"Boolean indicating whether the patient currently has alcohol abuse."} ;; "the patient has active significant alcohol abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current alcohol abuse is active.","when_to_set_to_false":"Set to false if the patient's current alcohol abuse is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current alcohol abuse is active.","meaning":"Boolean indicating whether the patient's current alcohol abuse is active."} ;; "the patient has active significant alcohol abuse"
(declare-const patient_has_finding_of_alcohol_abuse_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current alcohol abuse is significant.","when_to_set_to_false":"Set to false if the patient's current alcohol abuse is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current alcohol abuse is significant.","meaning":"Boolean indicating whether the patient's current alcohol abuse is significant."} ;; "the patient has active significant alcohol abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug abuse.","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse.","meaning":"Boolean indicating whether the patient has a history of drug abuse."} ;; "the patient has a history of significant drug abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of drug abuse is significant.","when_to_set_to_false":"Set to false if the patient's history of drug abuse is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of drug abuse is significant.","meaning":"Boolean indicating whether the patient's history of drug abuse is significant."} ;; "the patient has a history of significant drug abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has drug abuse.","meaning":"Boolean indicating whether the patient currently has drug abuse."} ;; "the patient has active significant drug abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current drug abuse is active.","when_to_set_to_false":"Set to false if the patient's current drug abuse is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current drug abuse is active.","meaning":"Boolean indicating whether the patient's current drug abuse is active."} ;; "the patient has active significant drug abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current drug abuse is significant.","when_to_set_to_false":"Set to false if the patient's current drug abuse is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current drug abuse is significant.","meaning":"Boolean indicating whether the patient's current drug abuse is significant."} ;; "the patient has active significant drug abuse"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthehistory@@significant
       patient_has_finding_of_alcohol_abuse_inthehistory)
    :named REQ22_AUXILIARY0)) ;; "the patient has a history of significant alcohol abuse"

(assert
(! (=> patient_has_finding_of_alcohol_abuse_now@@active
       patient_has_finding_of_alcohol_abuse_now)
    :named REQ22_AUXILIARY1)) ;; "the patient has active significant alcohol abuse"

(assert
(! (=> patient_has_finding_of_alcohol_abuse_now@@significant
       patient_has_finding_of_alcohol_abuse_now)
    :named REQ22_AUXILIARY2)) ;; "the patient has active significant alcohol abuse"

(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory@@significant
       patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory)
    :named REQ22_AUXILIARY3)) ;; "the patient has a history of significant drug abuse"

(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@active
       patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
    :named REQ22_AUXILIARY4)) ;; "the patient has active significant drug abuse"

(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@significant
       patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
    :named REQ22_AUXILIARY5)) ;; "the patient has active significant drug abuse"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory@@significant)
    :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of significant alcohol abuse"

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory@@significant)
    :named REQ22_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of significant drug abuse"

(assert
(! (not (and patient_has_finding_of_alcohol_abuse_now@@active
             patient_has_finding_of_alcohol_abuse_now@@significant))
    :named REQ22_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has active significant alcohol abuse"

(assert
(! (not (and patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@active
             patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now@@significant))
    :named REQ22_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has active significant drug abuse"

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "drug"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to is investigational.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to is investigational."} ;; "investigational drug"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@is_concomitant_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to the drug or medicament is concomitant with other treatments or exposures.","when_to_set_to_false":"Set to false if the patient's current exposure to the drug or medicament is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use is concomitant.","meaning":"Boolean indicating whether the patient's current exposure to the drug or medicament is concomitant."} ;; "concomitant use"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any drug or medicament in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any drug or medicament in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any drug or medicament in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to any drug or medicament in the past."} ;; "drug"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to in the past is investigational.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to in the past is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament the patient was exposed to in the past is investigational."} ;; "investigational drug"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_greater_of_one_month_or_six_half_lives_prior_to_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's past exposure to an investigational drug or medicament occurred within the greater of one month or six half-lives prior to the screening visit.","when_to_set_to_false":"Set to false if the patient's past exposure to an investigational drug or medicament did not occur within this window.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within this window.","meaning":"Boolean indicating whether the patient's past exposure to an investigational drug or medicament occurred within the greater of one month or six half-lives prior to the screening visit."} ;; "recent use of an investigational drug within the greater of (one month OR six half lives) prior to the screening visit"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@is_investigational
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ23_AUXILIARY0)) ;; "the drug or medicament the patient is currently exposed to is investigational"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@is_concomitant_use
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ23_AUXILIARY1)) ;; "the patient's current exposure to the drug or medicament is concomitant"

(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_now@@is_investigational
            patient_is_exposed_to_drug_or_medicament_now@@is_concomitant_use)
      (and patient_is_exposed_to_drug_or_medicament_now@@is_investigational
           patient_is_exposed_to_drug_or_medicament_now@@is_concomitant_use))
    :named REQ23_AUXILIARY2)) ;; "concomitant use of an investigational drug"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@is_investigational
      patient_is_exposed_to_drug_or_medicament_inthehistory)
    :named REQ23_AUXILIARY3)) ;; "the drug or medicament the patient was exposed to in the past is investigational"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_greater_of_one_month_or_six_half_lives_prior_to_screening_visit
      patient_is_exposed_to_drug_or_medicament_inthehistory@@is_investigational)
    :named REQ23_AUXILIARY4)) ;; "past exposure to an investigational drug or medicament occurred within the greater of one month or six half-lives prior to the screening visit"

;; ===================== Constraint Assertions (REQ 23) =====================
;; Exclusion 1: Concomitant use of an investigational drug
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_now@@is_investigational
             patient_is_exposed_to_drug_or_medicament_now@@is_concomitant_use))
    :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has concomitant use of an investigational drug"

;; Exclusion 2: Recent use of an investigational drug within the greater of (one month OR six half lives) prior to the screening visit
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthehistory@@temporalcontext_within_greater_of_one_month_or_six_half_lives_prior_to_screening_visit)
    :named REQ23_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has recent use of an investigational drug within the greater of (one month OR six half lives) prior to the screening visit"

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_undergone_respiratory_care_management_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone respiratory care management (change in pulmonary therapeutic plan) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone respiratory care management (change in pulmonary therapeutic plan) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone respiratory care management (change in pulmonary therapeutic plan) in the past.","meaning":"Boolean indicating whether the patient has ever undergone respiratory care management (change in pulmonary therapeutic plan) in the past."} ;; "pulmonary therapeutic plan"
(declare-const patient_has_undergone_respiratory_care_management_inthehistory@@temporalcontext_within6weeks_before_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone respiratory care management (change in pulmonary therapeutic plan) within the six weeks prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not undergone respiratory care management (change in pulmonary therapeutic plan) within the six weeks prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone respiratory care management (change in pulmonary therapeutic plan) within the six weeks prior to the screening visit.","meaning":"Boolean indicating whether the patient has undergone respiratory care management (change in pulmonary therapeutic plan) within the six weeks prior to the screening visit."} ;; "changes in the pulmonary therapeutic plan within the six weeks prior to the screening visit"

;; ===================== Auxiliary Assertions (REQ 24) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_respiratory_care_management_inthehistory@@temporalcontext_within6weeks_before_screening_visit
      patient_has_undergone_respiratory_care_management_inthehistory)
:named REQ24_AUXILIARY0)) ;; "changes in the pulmonary therapeutic plan within the six weeks prior to the screening visit"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_has_undergone_respiratory_care_management_inthehistory@@temporalcontext_within6weeks_before_screening_visit)
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had changes in the pulmonary therapeutic plan within the six weeks prior to the screening visit."
