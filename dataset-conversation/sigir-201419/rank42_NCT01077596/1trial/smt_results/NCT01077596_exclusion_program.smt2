;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (cancer) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever been diagnosed with malignant neoplastic disease (cancer) in their history."} ;; "cancer"

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within_12_months_after_antidepressant_therapy_initiation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplastic disease (cancer) occurred within twelve months after initiation of antidepressant pharmacotherapy.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplastic disease (cancer) did not occur within twelve months after initiation of antidepressant pharmacotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis occurred within twelve months after initiation of antidepressant pharmacotherapy.","meaning":"Boolean indicating whether the patient's cancer diagnosis occurred within twelve months after starting antidepressant pharmacotherapy."} ;; "diagnosed with cancer within twelve months after initiation (that is, new use) of antidepressant pharmacotherapy"

(declare-const patient_has_undergone_antidepressant_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone antidepressant therapy at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone antidepressant therapy at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone antidepressant therapy.","meaning":"Boolean indicating whether the patient has ever undergone antidepressant therapy in their history."} ;; "antidepressant pharmacotherapy"

(declare-const patient_has_undergone_antidepressant_therapy_inthehistory@@initiation_is_anchor_for_cancer_diagnosis_window Bool) ;; {"when_to_set_to_true":"Set to true if the patient's initiation of antidepressant therapy is used as the anchor for the time window in which cancer diagnosis is considered.","when_to_set_to_false":"Set to false if the patient's initiation of antidepressant therapy is not used as the anchor for the time window in which cancer diagnosis is considered.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether initiation of antidepressant therapy is used as the anchor for the cancer diagnosis window.","meaning":"Boolean indicating whether initiation of antidepressant therapy is the anchor for the cancer diagnosis time window."} ;; "initiation (that is, new use) of antidepressant pharmacotherapy"

(declare-const time_from_antidepressant_therapy_initiation_to_cancer_diagnosis_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months between the patient's initiation of antidepressant pharmacotherapy and the diagnosis of malignant neoplastic disease (cancer), if both dates are known.","when_to_set_to_null":"Set to null if either the date of antidepressant therapy initiation or the date of cancer diagnosis is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the time in months from initiation of antidepressant pharmacotherapy to cancer diagnosis."} ;; "within twelve months after initiation (that is, new use) of antidepressant pharmacotherapy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within_12_months_after_antidepressant_therapy_initiation
      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ0_AUXILIARY0)) ;; "diagnosed with cancer within twelve months after initiation (that is, new use) of antidepressant pharmacotherapy"

;; Qualifier variable for antidepressant therapy initiation anchor implies stem variable
(assert
(! (=> patient_has_undergone_antidepressant_therapy_inthehistory@@initiation_is_anchor_for_cancer_diagnosis_window
      patient_has_undergone_antidepressant_therapy_inthehistory)
:named REQ0_AUXILIARY1)) ;; "initiation (that is, new use) of antidepressant pharmacotherapy"

;; Definition: cancer diagnosis within 12 months after antidepressant therapy initiation
(assert
(! (= patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within_12_months_after_antidepressant_therapy_initiation
      (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
           patient_has_undergone_antidepressant_therapy_inthehistory@@initiation_is_anchor_for_cancer_diagnosis_window
           (<= time_from_antidepressant_therapy_initiation_to_cancer_diagnosis_value_recorded_in_months 12)))
:named REQ0_AUXILIARY2)) ;; "diagnosed with cancer within twelve months after initiation (that is, new use) of antidepressant pharmacotherapy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@temporalcontext_within_12_months_after_antidepressant_therapy_initiation)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with cancer within twelve months after initiation (that is, new use) of antidepressant pharmacotherapy."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@diagnosis_occurred_before_first_antidepressant_prescription Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplastic disease (cancer) occurred at any time before the first antidepressant prescription recorded during the study period.","when_to_set_to_false":"Set to false if the diagnosis occurred at or after the first antidepressant prescription, or if no antidepressant prescription is recorded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis occurred before the first antidepressant prescription.","meaning":"Boolean indicating whether the patient's diagnosis of malignant neoplastic disease (cancer) occurred before the first antidepressant prescription recorded during the study period."} ;; "cancer diagnosis recorded in tumor registries at any time before the first antidepressant prescription recorded during the study period"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@diagnosis_recorded_in_tumor_registries Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplastic disease (cancer) is specifically recorded in tumor registries.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplastic disease (cancer) is not recorded in tumor registries.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is recorded in tumor registries.","meaning":"Boolean indicating whether the patient's diagnosis of malignant neoplastic disease (cancer) is recorded in tumor registries."} ;; "cancer diagnosis recorded in tumor registries"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@diagnosis_occurred_before_first_antidepressant_prescription
      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "diagnosis occurred at any time before the first antidepressant prescription"

(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@diagnosis_recorded_in_tumor_registries
      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
   :named REQ1_AUXILIARY1)) ;; "diagnosis recorded in tumor registries"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have a cancer diagnosis recorded in tumor registries at any time before the first antidepressant prescription
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@diagnosis_recorded_in_tumor_registries
             patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@diagnosis_occurred_before_first_antidepressant_prescription))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cancer (cancer diagnosis recorded in tumor registries at any time before the first antidepressant prescription recorded during the study period)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_antidepressant_therapy_inthehistory@@temporalcontext_within_6_months_of_january_1_1996 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antidepressant therapy and the use occurred within 6 months of January 1, 1996.","when_to_set_to_false":"Set to false if the patient has undergone antidepressant therapy but the use did not occur within 6 months of January 1, 1996.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use occurred within 6 months of January 1, 1996.","meaning":"Boolean indicating whether the patient's antidepressant therapy use occurred within 6 months of January 1, 1996."} ;; "use of antidepressant within 6 months of January 1, 1996"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_antidepressant_therapy_inthehistory@@temporalcontext_within_6_months_of_january_1_1996
      patient_has_undergone_antidepressant_therapy_inthehistory)
:named REQ2_AUXILIARY0)) ;; "use of antidepressant within 6 months of January 1, 1996""

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_antidepressant_therapy_inthehistory@@temporalcontext_within_6_months_of_january_1_1996)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has use of antidepressant within 6 months of January 1, 1996."
