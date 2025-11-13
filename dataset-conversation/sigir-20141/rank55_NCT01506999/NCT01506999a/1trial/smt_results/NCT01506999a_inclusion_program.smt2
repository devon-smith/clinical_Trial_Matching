;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_diagnosis_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with angina pectoris at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with angina pectoris in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with angina pectoris.","meaning":"Boolean indicating whether the patient has ever been diagnosed with angina pectoris in their history."} ;; "angina pectoris"
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with ischemic heart disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with ischemic heart disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with ischemic heart disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with ischemic heart disease in their history."} ;; "ischemic heart disease"
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@non_fatal_evolution Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of ischemic heart disease was non-fatal (i.e., the patient survived the disease episode).","when_to_set_to_false":"Set to false if the patient's history of ischemic heart disease was fatal (i.e., the patient did not survive the disease episode).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evolution of the patient's ischemic heart disease was non-fatal.","meaning":"Boolean indicating whether the patient's history of ischemic heart disease was non-fatal."} ;; "ischemic heart disease with a non-fatal evolution"
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@exhaustive_subcategories_angina_pectoris_or_acute_myocardial_infarction_as_first_manifestation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of ischemic heart disease includes exhaustive subcategories: angina pectoris or acute myocardial infarction as the first manifestation.","when_to_set_to_false":"Set to false if the patient's history of ischemic heart disease does not include these subcategories as the first manifestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of ischemic heart disease includes these subcategories as the first manifestation.","meaning":"Boolean indicating whether the patient's history of ischemic heart disease includes exhaustive subcategories: angina pectoris or acute myocardial infarction as the first manifestation."} ;; "exhaustive subcategories (angina pectoris OR acute myocardial infarction as first manifestation)"
(declare-const patient_age_value_recorded_inthehistory_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time when ischemic heart disease first manifested, if this information is known and documented.","when_to_set_to_null":"Set to null if the patient's age at onset of ischemic heart disease is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time of onset of ischemic heart disease."} ;; "age at the onset of the disease < 50 years OR age at the onset of the disease > 60 years"
(declare-const patient_disease_value_recorded_inthehistory_withunit_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the onset of the disease, if recorded in the patient's history.","when_to_set_to_null":"Set to null if the age at onset of the disease is not recorded, unknown, or indeterminate.","meaning":"Numeric value representing the patient's age in years at the onset of the disease, recorded in the patient's history."} ;; "disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for non-fatal evolution implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@non_fatal_evolution
         patient_has_diagnosis_of_ischemic_heart_disease_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "ischemic heart disease with a non-fatal evolution"

;; Qualifier variable for exhaustive subcategories implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@exhaustive_subcategories_angina_pectoris_or_acute_myocardial_infarction_as_first_manifestation
         patient_has_diagnosis_of_ischemic_heart_disease_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "exhaustive subcategories (angina pectoris OR acute myocardial infarction as first manifestation)"

;; Exhaustive subcategories: angina pectoris or acute myocardial infarction as first manifestation
;; (We only have angina pectoris variable; acute myocardial infarction as first manifestation is not separately declared, so only angina pectoris is used here.)
(assert
  (! (= patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@exhaustive_subcategories_angina_pectoris_or_acute_myocardial_infarction_as_first_manifestation
         patient_has_diagnosis_of_angina_pectoris_inthehistory)
     :named REQ0_AUXILIARY2)) ;; "exhaustive subcategories (angina pectoris OR acute myocardial infarction as first manifestation)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have history of ischemic heart disease with non-fatal evolution and exhaustive subcategories (angina pectoris or acute myocardial infarction as first manifestation)
(assert
  (! (and patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@non_fatal_evolution
          patient_has_diagnosis_of_ischemic_heart_disease_inthehistory@@exhaustive_subcategories_angina_pectoris_or_acute_myocardial_infarction_as_first_manifestation)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be affected by a history of ischemic heart disease with a non-fatal evolution (with exhaustive subcategories (angina pectoris OR acute myocardial infarction as first manifestation))"

;; Component 1: Age at onset of disease < 50 years OR > 60 years
(assert
  (! (or (< patient_age_value_recorded_inthehistory_in_years 50)
         (> patient_age_value_recorded_inthehistory_in_years 60))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "age at the onset of the disease < 50 years OR age at the onset of the disease > 60 years"
