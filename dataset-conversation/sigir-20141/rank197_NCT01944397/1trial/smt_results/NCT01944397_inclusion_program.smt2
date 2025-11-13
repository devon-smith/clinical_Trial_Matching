;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_atrial_fibrillation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a coded diagnosis of atrial fibrillation documented in the primary care record at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a coded diagnosis of atrial fibrillation documented in the primary care record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a coded diagnosis of atrial fibrillation in the primary care record.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of atrial fibrillation recorded in their medical history."} ;; "To be included, the patient must ((have a coded diagnosis for atrial fibrillation in the primary care record) OR (have a coded diagnosis for atrial fibrillation in the secondary care record))."
(declare-const patient_has_diagnosis_of_atrial_fibrillation_inthehistory@@documented_in_primary_care_record Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of atrial fibrillation is documented in the primary care record.","when_to_set_to_false":"Set to false if the diagnosis of atrial fibrillation is not documented in the primary care record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of atrial fibrillation is documented in the primary care record.","meaning":"Boolean indicating whether the diagnosis of atrial fibrillation is documented in the primary care record."} ;; "have a coded diagnosis for atrial fibrillation in the primary care record"
(declare-const patient_has_diagnosis_of_atrial_fibrillation_inthehistory@@documented_in_secondary_care_record Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of atrial fibrillation is documented in the secondary care record.","when_to_set_to_false":"Set to false if the diagnosis of atrial fibrillation is not documented in the secondary care record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of atrial fibrillation is documented in the secondary care record.","meaning":"Boolean indicating whether the diagnosis of atrial fibrillation is documented in the secondary care record."} ;; "have a coded diagnosis for atrial fibrillation in the secondary care record"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_atrial_fibrillation_inthehistory@@documented_in_primary_care_record
         patient_has_diagnosis_of_atrial_fibrillation_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "have a coded diagnosis for atrial fibrillation in the primary care record"

(assert
  (! (=> patient_has_diagnosis_of_atrial_fibrillation_inthehistory@@documented_in_secondary_care_record
         patient_has_diagnosis_of_atrial_fibrillation_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "have a coded diagnosis for atrial fibrillation in the secondary care record"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must ((have a coded diagnosis for atrial fibrillation in the primary care record) OR (have a coded diagnosis for atrial fibrillation in the secondary care record)).
(assert
  (! (or patient_has_diagnosis_of_atrial_fibrillation_inthehistory@@documented_in_primary_care_record
         patient_has_diagnosis_of_atrial_fibrillation_inthehistory@@documented_in_secondary_care_record)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have a coded diagnosis for atrial fibrillation in the primary care record) OR (have a coded diagnosis for atrial fibrillation in the secondary care record))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_in_general_practice_research_database_practice Bool) ;; {"when_to_set_to_true":"Set to true if the patient is in a General Practice Research Database practice.","when_to_set_to_false":"Set to false if the patient is not in a General Practice Research Database practice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is in a General Practice Research Database practice.","meaning":"Boolean indicating whether the patient is in a General Practice Research Database practice."} ;; "the patient must be in a General Practice Research Database practice"
(declare-const patient_is_in_general_practice_research_database_practice@@deemed_up_to_standard_by_general_practice_research_database_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the General Practice Research Database practice is deemed up to standard by General Practice Research Database criteria.","when_to_set_to_false":"Set to false if the General Practice Research Database practice is not deemed up to standard by General Practice Research Database criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the General Practice Research Database practice is deemed up to standard by General Practice Research Database criteria.","meaning":"Boolean indicating whether the General Practice Research Database practice is deemed up to standard by General Practice Research Database criteria."} ;; "which is deemed up to standard by General Practice Research Database criteria"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_is_in_general_practice_research_database_practice@@deemed_up_to_standard_by_general_practice_research_database_criteria
         patient_is_in_general_practice_research_database_practice)
     :named REQ1_AUXILIARY0)) ;; "the patient is in a General Practice Research Database practice (which is deemed up to standard by General Practice Research Database criteria)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_in_general_practice_research_database_practice@@deemed_up_to_standard_by_general_practice_research_database_criteria
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be in a General Practice Research Database practice (which is deemed up to standard by General Practice Research Database criteria)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_record_data_coverage_value_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years of data coverage present in the patient record.","when_to_set_to_null":"Set to null if the duration of data coverage in the patient record is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the total duration of data coverage in the patient record, measured in years."} ;; "the patient record must contain at least one year of data"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient record must be deemed acceptable by General Practice Research Database criteria.
(assert
  (! patient_is_in_general_practice_research_database_practice@@deemed_up_to_standard_by_general_practice_research_database_criteria
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient record must be deemed acceptable by General Practice Research Database criteria"

;; Component 1: The patient record must contain at least one year of data.
(assert
  (! (>= patient_record_data_coverage_value_in_years 1.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient record must contain at least one year of data"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_in_hospital_episode_statistics_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years as recorded in Hospital Episode Statistics if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years as recorded in Hospital Episode Statistics is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years as recorded in Hospital Episode Statistics."} ;; "the age of the patient as recorded in Hospital Episode Statistics"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years as recorded in the General Practice Research Database if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years as recorded in the General Practice Research Database is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years as recorded in the General Practice Research Database."} ;; "the age of the patient as recorded in the General Practice Research Database"
(declare-const patient_sex_is_female_in_hospital_episode_statistics Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is female as recorded in Hospital Episode Statistics.","when_to_set_to_false":"Set to false if the patient's sex is not female as recorded in Hospital Episode Statistics.","when_to_set_to_null":"Set to null if the patient's sex as recorded in Hospital Episode Statistics is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female as recorded in Hospital Episode Statistics."} ;; "the sex of the patient as recorded in Hospital Episode Statistics"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is female as recorded in the General Practice Research Database.","when_to_set_to_false":"Set to false if the patient's sex is not female as recorded in the General Practice Research Database.","when_to_set_to_null":"Set to null if the patient's sex as recorded in the General Practice Research Database is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female as recorded in the General Practice Research Database."} ;; "the sex of the patient as recorded in the General Practice Research Database"
(declare-const patient_sex_is_male_in_hospital_episode_statistics Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is male as recorded in Hospital Episode Statistics.","when_to_set_to_false":"Set to false if the patient's sex is not male as recorded in Hospital Episode Statistics.","when_to_set_to_null":"Set to null if the patient's sex as recorded in Hospital Episode Statistics is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male as recorded in Hospital Episode Statistics."} ;; "the sex of the patient as recorded in Hospital Episode Statistics"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is male as recorded in the General Practice Research Database.","when_to_set_to_false":"Set to false if the patient's sex is not male as recorded in the General Practice Research Database.","when_to_set_to_null":"Set to null if the patient's sex as recorded in the General Practice Research Database is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male as recorded in the General Practice Research Database."} ;; "the sex of the patient as recorded in the General Practice Research Database"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: Sex as recorded in each source is either male or female (no other values are considered)
(assert
  (! (= patient_sex_is_female_in_hospital_episode_statistics
        (not patient_sex_is_male_in_hospital_episode_statistics))
     :named REQ3_AUXILIARY0)) ;; "the sex of the patient as recorded in Hospital Episode Statistics must be the same as the sex of the patient as recorded in General Practice Research Database" (binary sex encoding)

(assert
  (! (= patient_sex_is_female_now
        (not patient_sex_is_male_now))
     :named REQ3_AUXILIARY1)) ;; "the sex of the patient as recorded in General Practice Research Database must be the same as the sex of the patient as recorded in Hospital Episode Statistics" (binary sex encoding)

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Age must match between General Practice Research Database and Hospital Episode Statistics
(assert
  (! (= patient_age_value_recorded_now_in_years
        patient_age_value_recorded_in_hospital_episode_statistics_in_years)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the age of the patient as recorded in the General Practice Research Database must be the same as the age of the patient as recorded in Hospital Episode Statistics"

;; Component 1: Sex must match between General Practice Research Database and Hospital Episode Statistics
(assert
  (! (= patient_sex_is_female_now
        patient_sex_is_female_in_hospital_episode_statistics)
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the sex of the patient as recorded in the General Practice Research Database must be the same as the sex of the patient as recorded in Hospital Episode Statistics"
