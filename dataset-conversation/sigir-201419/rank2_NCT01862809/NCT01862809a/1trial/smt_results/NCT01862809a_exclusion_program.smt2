;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_belongs_to_racial_group_that_represents_very_small_numbers_and_is_difficult_to_match Bool) ;; {"when_to_set_to_true":"Set to true if the patient belongs to a racial group that may represent very small numbers and is difficult to match.","when_to_set_to_false":"Set to false if the patient does not belong to a racial group that may represent very small numbers and is difficult to match.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient belongs to a racial group that may represent very small numbers and is difficult to match.","meaning":"Boolean indicating whether the patient belongs to a racial group that may represent very small numbers and is difficult to match."} ;; "The patient belongs to a racial group that may represent very small numbers and thus be difficult to match."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_belongs_to_racial_group_that_represents_very_small_numbers_and_is_difficult_to_match)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient belongs to a racial group that may represent very small numbers and thus be difficult to match."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const antibiotics_use_count_recorded_last_3_months_withunit_events Real) ;; {"when_to_set_to_value":"Set to the number of distinct events in which the patient used antibiotics within the last three months.","when_to_set_to_null":"Set to null if the number of antibiotic use events within the last three months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of times antibiotics were used by the patient within the last three months, measured in events."} ;; "number of times antibiotics were used by the patient within the last three months"
(declare-const patient_has_used_antibiotics_within_last_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used antibiotics at any time within the last three months.","when_to_set_to_false":"Set to false if the patient has not used antibiotics within the last three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used antibiotics within the last three months.","meaning":"Boolean indicating whether the patient has used antibiotics within the last three months."} ;; "has used antibiotics within the last three months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Define the Boolean in terms of the numeric count
(assert
(! (= patient_has_used_antibiotics_within_last_3_months
     (> antibiotics_use_count_recorded_last_3_months_withunit_events 0))
:named REQ2_AUXILIARY0)) ;; "has used antibiotics within the last three months" is true iff count > 0

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_used_antibiotics_within_last_3_months)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used antibiotics within the last three months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_periodontal_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of periodontal disease at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of periodontal disease at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of periodontal disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of periodontal disease at any time in their medical history."} ;; "the patient has a previous diagnosis of major periodontal disease"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of malignant neoplastic disease (cancer) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of malignant neoplastic disease (cancer) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer) at any time in their medical history."} ;; "the patient has a previous diagnosis of cancer"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_diagnosis_of_periodontal_disease_inthehistory
            patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a previous diagnosis of major periodontal disease) OR (the patient has a previous diagnosis of cancer)."
