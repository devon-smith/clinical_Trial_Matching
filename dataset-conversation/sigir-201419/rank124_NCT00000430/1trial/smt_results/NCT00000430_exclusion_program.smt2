;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has any history of malignant neoplastic disease (cancer)."} ;; "any history of cancer"

(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant epithelial neoplasm (carcinoma) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant epithelial neoplasm (carcinoma) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant epithelial neoplasm (carcinoma).","meaning":"Boolean indicating whether the patient has any history of malignant epithelial neoplasm (carcinoma)."} ;; "carcinoma"

(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@is_superficial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is superficial.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not superficial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is superficial.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is superficial."} ;; "superficial basal cell carcinoma of the skin" and "superficial squamous cell carcinoma of the skin"

(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@located_in_skin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) is located in the skin.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) is not located in the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma is located in the skin.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) is located in the skin."} ;; "basal cell carcinoma of the skin" and "squamous cell carcinoma of the skin"

(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@completely_resected_or_resolved_by_topical_chemotherapeutic_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant epithelial neoplasm (carcinoma) has been completely resected or resolved by a topical chemotherapeutic agent.","when_to_set_to_false":"Set to false if the patient's malignant epithelial neoplasm (carcinoma) has not been completely resected or resolved by a topical chemotherapeutic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma has been completely resected or resolved by a topical chemotherapeutic agent.","meaning":"Boolean indicating whether the patient's malignant epithelial neoplasm (carcinoma) has been completely resected or resolved by a topical chemotherapeutic agent."} ;; "completely resected OR resolved by a topical chemotherapeutic agent"

(declare-const patient_has_history_of_malignancy_treated_curatively_at_least_10_years_ago Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of any malignancy that was treated curatively at least ten years ago.","when_to_set_to_false":"Set to false if the patient does not have a history of any malignancy treated curatively at least ten years ago.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any malignancy treated curatively at least ten years ago.","meaning":"Boolean indicating whether the patient has a history of any malignancy that was treated curatively at least ten years previously."} ;; "other malignancy treated curatively at least ten years previously"

(declare-const patient_has_history_of_malignancy_treated_curatively_at_least_10_years_ago@@no_evidence_of_recurrence Bool) ;; {"when_to_set_to_true":"Set to true if there is no evidence of recurrence of the malignancy that was treated curatively at least ten years previously.","when_to_set_to_false":"Set to false if there is evidence of recurrence of the malignancy that was treated curatively at least ten years previously.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is evidence of recurrence of the malignancy that was treated curatively at least ten years previously.","meaning":"Boolean indicating whether there is no evidence of recurrence of the malignancy that was treated curatively at least ten years previously."} ;; "without any evidence of recurrence"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@is_superficial
      patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory)
:named REQ0_AUXILIARY0)) ;; "superficial basal cell carcinoma of the skin" and "superficial squamous cell carcinoma of the skin"

(assert
(! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@located_in_skin
      patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory)
:named REQ0_AUXILIARY1)) ;; "basal cell carcinoma of the skin" and "squamous cell carcinoma of the skin"

(assert
(! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@completely_resected_or_resolved_by_topical_chemotherapeutic_agent
      patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory)
:named REQ0_AUXILIARY2)) ;; "completely resected OR resolved by a topical chemotherapeutic agent"

(assert
(! (=> patient_has_history_of_malignancy_treated_curatively_at_least_10_years_ago@@no_evidence_of_recurrence
      patient_has_history_of_malignancy_treated_curatively_at_least_10_years_ago)
:named REQ0_AUXILIARY3)) ;; "other malignancy treated curatively at least ten years previously AND no evidence of recurrence"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: history of cancer except for the three allowed exceptions
(assert
(! (not
      (and
        patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
        (not
          (or
            ;; (a) history of superficial basal cell carcinoma of the skin which has been completely resected OR resolved by a topical chemotherapeutic agent
            (and
              patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@is_superficial
              patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@located_in_skin
              patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@completely_resected_or_resolved_by_topical_chemotherapeutic_agent
            )
            ;; (b) history of superficial squamous cell carcinoma of the skin which has been completely resected OR resolved by a topical chemotherapeutic agent
            (and
              patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@is_superficial
              patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@located_in_skin
              patient_has_diagnosis_of_malignant_epithelial_neoplasm_inthehistory@@completely_resected_or_resolved_by_topical_chemotherapeutic_agent
            )
            ;; (c) history of other malignancy treated curatively at least ten years previously AND no evidence of recurrence
            (and
              patient_has_history_of_malignancy_treated_curatively_at_least_10_years_ago
              patient_has_history_of_malignancy_treated_curatively_at_least_10_years_ago@@no_evidence_of_recurrence
            )
          )
        )
      )
   )
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has any history of cancer) AND NOT ((the patient has a history of superficial basal cell carcinoma of the skin which has been completely resected OR resolved by a topical chemotherapeutic agent) OR (the patient has a history of superficial squamous cell carcinoma of the skin which has been completely resected OR resolved by a topical chemotherapeutic agent) OR (the patient has a history of other malignancy treated curatively at least ten years previously AND the patient does NOT have any evidence of recurrence))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_transvaginal_echography_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a transvaginal ultrasound now and the result was abnormal.","when_to_set_to_false":"Set to false if the patient has undergone a transvaginal ultrasound now and the result was not abnormal (i.e., normal or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a transvaginal ultrasound now and the outcome is abnormal.","meaning":"Boolean indicating whether the patient has undergone a transvaginal ultrasound now and the outcome is abnormal."} ;; "the patient has an abnormal transvaginal ultrasound"
(declare-const patient_has_undergone_transvaginal_echography_now_outcome_is_abnormal@@not_investigated_and_cleared_by_endometrial_biopsy Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal transvaginal ultrasound result has NOT been investigated AND cleared by endometrial biopsy.","when_to_set_to_false":"Set to false if the abnormal transvaginal ultrasound result has been investigated AND cleared by endometrial biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal transvaginal ultrasound result has been investigated AND cleared by endometrial biopsy.","meaning":"Boolean indicating whether the abnormal transvaginal ultrasound result has NOT been investigated AND cleared by endometrial biopsy."} ;; "the abnormal transvaginal ultrasound has NOT been investigated AND cleared by endometrial biopsy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_transvaginal_echography_now_outcome_is_abnormal@@not_investigated_and_cleared_by_endometrial_biopsy
     patient_has_undergone_transvaginal_echography_now_outcome_is_abnormal)
:named REQ1_AUXILIARY0)) ;; "the abnormal transvaginal ultrasound has NOT been investigated AND cleared by endometrial biopsy" implies "the patient has an abnormal transvaginal ultrasound"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_undergone_transvaginal_echography_now_outcome_is_abnormal
             patient_has_undergone_transvaginal_echography_now_outcome_is_abnormal@@not_investigated_and_cleared_by_endometrial_biopsy))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an abnormal transvaginal ultrasound) AND (the abnormal transvaginal ultrasound has NOT been investigated AND cleared by endometrial biopsy)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with fracture of the proximal end of femur (hip fracture) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with fracture of the proximal end of femur (hip fracture) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with fracture of the proximal end of femur (hip fracture).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of fracture of the proximal end of femur (hip fracture) in their history."} ;; "hip fracture"
(declare-const patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_inthehistory@@low_trauma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of fracture of the proximal end of femur (hip fracture) was specifically due to low-trauma.","when_to_set_to_false":"Set to false if the patient's history of fracture of the proximal end of femur (hip fracture) was not due to low-trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fracture was due to low-trauma.","meaning":"Boolean indicating whether the patient's history of fracture of the proximal end of femur (hip fracture) was due to low-trauma."} ;; "low-trauma hip fracture"
(declare-const patient_has_diagnosis_of_fracture_of_vertebral_column_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with fracture of the vertebral column (spine fracture) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with fracture of the vertebral column (spine fracture) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with fracture of the vertebral column (spine fracture).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of fracture of the vertebral column (spine fracture) in their history."} ;; "spine fracture"
(declare-const patient_has_diagnosis_of_fracture_of_vertebral_column_inthehistory@@low_trauma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of fracture of the vertebral column (spine fracture) was specifically due to low-trauma.","when_to_set_to_false":"Set to false if the patient's history of fracture of the vertebral column (spine fracture) was not due to low-trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fracture was due to low-trauma.","meaning":"Boolean indicating whether the patient's history of fracture of the vertebral column (spine fracture) was due to low-trauma."} ;; "low-trauma spine fracture"
(declare-const patient_has_diagnosis_of_fracture_of_vertebral_column_inthehistory@@previously_diagnosed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of fracture of the vertebral column (spine fracture) was previously diagnosed (diagnosis made prior to current assessment).","when_to_set_to_false":"Set to false if the patient's history of fracture of the vertebral column (spine fracture) was not previously diagnosed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fracture was previously diagnosed.","meaning":"Boolean indicating whether the patient's history of fracture of the vertebral column (spine fracture) was previously diagnosed."} ;; "spine fracture previously diagnosed"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_inthehistory@@low_trauma
      patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "low-trauma hip fracture"

(assert
(! (=> patient_has_diagnosis_of_fracture_of_vertebral_column_inthehistory@@low_trauma
      patient_has_diagnosis_of_fracture_of_vertebral_column_inthehistory)
   :named REQ2_AUXILIARY1)) ;; "low-trauma spine fracture"

(assert
(! (=> patient_has_diagnosis_of_fracture_of_vertebral_column_inthehistory@@previously_diagnosed
      patient_has_diagnosis_of_fracture_of_vertebral_column_inthehistory)
   :named REQ2_AUXILIARY2)) ;; "spine fracture previously diagnosed"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_fracture_of_proximal_end_of_femur_inthehistory@@low_trauma)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of low-trauma hip fracture"

(assert
(! (not (and patient_has_diagnosis_of_fracture_of_vertebral_column_inthehistory@@low_trauma
             patient_has_diagnosis_of_fracture_of_vertebral_column_inthehistory@@previously_diagnosed))
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of low-trauma spine fracture previously diagnosed"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_serious_residuals_from_cerebral_vascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has serious residuals that are caused by cerebral vascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have serious residuals caused by cerebral vascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has serious residuals caused by cerebral vascular disease.","meaning":"Boolean indicating whether the patient currently has serious residuals that are caused by cerebral vascular disease."} ;; "serious residuals from cerebral vascular disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_serious_residuals_from_cerebral_vascular_disease_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious residuals from cerebral vascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus, regardless of type or control status.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus (any type or control status)."} ;; "diabetes mellitus"

(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus (insulin dependent), regardless of control status or complications.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus (insulin dependent), regardless of control status or complications."} ;; "insulin dependent diabetes mellitus"

(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now@@easily_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has type 1 diabetes mellitus and the diabetes is easily controlled.","when_to_set_to_false":"Set to false if the patient currently has type 1 diabetes mellitus and the diabetes is not easily controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's type 1 diabetes mellitus is easily controlled.","meaning":"Boolean indicating whether the patient's type 1 diabetes mellitus is easily controlled."} ;; "easily controlled insulin dependent diabetes mellitus"

(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now@@without_significant_microvascular_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has type 1 diabetes mellitus and does not have significant microvascular disease.","when_to_set_to_false":"Set to false if the patient currently has type 1 diabetes mellitus and does have significant microvascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has significant microvascular disease.","meaning":"Boolean indicating whether the patient's type 1 diabetes mellitus is without significant microvascular disease."} ;; "without significant microvascular disease"

(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now@@without_significant_neuropathic_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has type 1 diabetes mellitus and does not have significant neuropathic disease.","when_to_set_to_false":"Set to false if the patient currently has type 1 diabetes mellitus and does have significant neuropathic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has significant neuropathic disease.","meaning":"Boolean indicating whether the patient's type 1 diabetes mellitus is without significant neuropathic disease."} ;; "without significant neuropathic disease"

(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus (non-insulin dependent), regardless of control status.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus (non-insulin dependent), regardless of control status."} ;; "non-insulin dependent diabetes mellitus"

(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@easily_controlled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has type 2 diabetes mellitus and the diabetes is easily controlled.","when_to_set_to_false":"Set to false if the patient currently has type 2 diabetes mellitus and the diabetes is not easily controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's type 2 diabetes mellitus is easily controlled.","meaning":"Boolean indicating whether the patient's type 2 diabetes mellitus is easily controlled."} ;; "easily controlled non-insulin dependent diabetes mellitus"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_type_1_diabetes_mellitus_now@@easily_controlled
     patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ4_AUXILIARY0)) ;; "easily controlled insulin dependent diabetes mellitus"

(assert
(! (=> patient_has_diagnosis_of_type_1_diabetes_mellitus_now@@without_significant_microvascular_disease
     patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ4_AUXILIARY1)) ;; "without significant microvascular disease"

(assert
(! (=> patient_has_diagnosis_of_type_1_diabetes_mellitus_now@@without_significant_neuropathic_disease
     patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ4_AUXILIARY2)) ;; "without significant neuropathic disease"

(assert
(! (=> patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@easily_controlled
     patient_has_diagnosis_of_type_2_diabetes_mellitus_now)
:named REQ4_AUXILIARY3)) ;; "easily controlled non-insulin dependent diabetes mellitus"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient has diabetes mellitus AND NOT (easily controlled non-insulin dependent diabetes OR easily controlled insulin dependent diabetes without significant microvascular disease AND without significant neuropathic disease)
(assert
(! (not (and
         patient_has_diagnosis_of_diabetes_mellitus_now
         (not (or
                patient_has_diagnosis_of_type_2_diabetes_mellitus_now@@easily_controlled
                (and patient_has_diagnosis_of_type_1_diabetes_mellitus_now@@easily_controlled
                     patient_has_diagnosis_of_type_1_diabetes_mellitus_now@@without_significant_microvascular_disease
                     patient_has_diagnosis_of_type_1_diabetes_mellitus_now@@without_significant_neuropathic_disease)
             ))
         ))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has diabetes mellitus) AND NOT ((the patient has easily controlled non-insulin dependent diabetes mellitus) OR (the patient has easily controlled insulin dependent diabetes mellitus without significant microvascular disease AND without significant neuropathic disease))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine concentration in mg/dl is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine concentration in mg/dl."} ;; "serum creatinine concentration > 1.9 mg/dl."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 1.9))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine concentration > 1.9 mg/dl."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_chronic_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic liver disease.","meaning":"Boolean indicating whether the patient currently has chronic liver disease."} ;; "chronic liver disease"
(declare-const patient_has_finding_of_alcoholism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcoholism.","when_to_set_to_false":"Set to false if the patient currently does not have alcoholism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcoholism.","meaning":"Boolean indicating whether the patient currently has alcoholism."} ;; "alcoholism"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (or patient_has_finding_of_chronic_liver_disease_now
              patient_has_finding_of_alcoholism_now))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has chronic liver disease) OR (the patient has alcoholism)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_bone_active_agent_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any bone active agent within the past two years.","when_to_set_to_false":"Set to false if the patient has not been exposed to any bone active agent within the past two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any bone active agent within the past two years.","meaning":"Boolean indicating whether the patient has been exposed to any bone active agent within the past two years."} ;; "has received treatment with bone active agent ... within the previous two years"

(declare-const patient_is_exposed_to_bone_active_agent_inthepast2years@@received_as_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any bone active agent within the past two years was specifically due to receiving it as a treatment.","when_to_set_to_false":"Set to false if the patient's exposure to any bone active agent within the past two years was not due to receiving it as a treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was due to receiving the bone active agent as a treatment.","meaning":"Boolean indicating whether the patient's exposure to any bone active agent within the past two years was specifically as a treatment."} ;; "received treatment with bone active agent ... within the previous two years"

(declare-const patient_is_exposed_to_fluoride_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to fluoride within the past two years.","when_to_set_to_false":"Set to false if the patient has not been exposed to fluoride within the past two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to fluoride within the past two years.","meaning":"Boolean indicating whether the patient has been exposed to fluoride within the past two years."} ;; "fluoride ... within the previous two years"

(declare-const patient_is_exposed_to_fluoride_inthepast2years@@received_as_treatment_with_bone_active_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to fluoride within the past two years was specifically due to receiving it as a bone active agent treatment.","when_to_set_to_false":"Set to false if the patient's exposure to fluoride within the past two years was not due to receiving it as a bone active agent treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was due to receiving fluoride as a bone active agent treatment.","meaning":"Boolean indicating whether the patient's exposure to fluoride within the past two years was specifically as a bone active agent treatment."} ;; "fluoride ... as a bone active agent treatment ... within the previous two years"

(declare-const patient_is_exposed_to_bisphosphonate_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to bisphosphonate within the past two years.","when_to_set_to_false":"Set to false if the patient has not been exposed to bisphosphonate within the past two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to bisphosphonate within the past two years.","meaning":"Boolean indicating whether the patient has been exposed to bisphosphonate within the past two years."} ;; "bisphosphonate ... within the previous two years"

(declare-const patient_is_exposed_to_bisphosphonate_inthepast2years@@received_as_treatment_with_bone_active_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to bisphosphonate within the past two years was specifically due to receiving it as a bone active agent treatment.","when_to_set_to_false":"Set to false if the patient's exposure to bisphosphonate within the past two years was not due to receiving it as a bone active agent treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was due to receiving bisphosphonate as a bone active agent treatment.","meaning":"Boolean indicating whether the patient's exposure to bisphosphonate within the past two years was specifically as a bone active agent treatment."} ;; "bisphosphonate ... as a bone active agent treatment ... within the previous two years"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_fluoride_inthepast2years@@received_as_treatment_with_bone_active_agent
          patient_is_exposed_to_bisphosphonate_inthepast2years@@received_as_treatment_with_bone_active_agent)
     patient_is_exposed_to_bone_active_agent_inthepast2years@@received_as_treatment)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (fluoride, bisphosphonate)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_bone_active_agent_inthepast2years@@received_as_treatment
       patient_is_exposed_to_bone_active_agent_inthepast2years)
:named REQ7_AUXILIARY1)) ;; "received as treatment"

(assert
(! (=> patient_is_exposed_to_fluoride_inthepast2years@@received_as_treatment_with_bone_active_agent
       patient_is_exposed_to_fluoride_inthepast2years)
:named REQ7_AUXILIARY2)) ;; "fluoride as bone active agent treatment"

(assert
(! (=> patient_is_exposed_to_bisphosphonate_inthepast2years@@received_as_treatment_with_bone_active_agent
       patient_is_exposed_to_bisphosphonate_inthepast2years)
:named REQ7_AUXILIARY3)) ;; "bisphosphonate as bone active agent treatment"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_bone_active_agent_inthepast2years@@received_as_treatment)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with bone active agent with non-exhaustive examples (fluoride, bisphosphonate) within the previous two years."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_taken_calcitonin_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with a calcitonin-containing product within the previous six months.","when_to_set_to_false":"Set to false if the patient has not received treatment with a calcitonin-containing product within the previous six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with a calcitonin-containing product within the previous six months.","meaning":"Boolean indicating whether the patient has received treatment with a calcitonin-containing product within the previous six months."} ;; "the patient has received treatment with calcitonin within the previous six months."
(declare-const patient_has_taken_estrogen_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with an estrogen-containing product within the previous six months.","when_to_set_to_false":"Set to false if the patient has not received treatment with an estrogen-containing product within the previous six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with an estrogen-containing product within the previous six months.","meaning":"Boolean indicating whether the patient has received treatment with an estrogen-containing product within the previous six months."} ;; "the patient has received treatment with estrogen within the previous six months."
(declare-const patient_has_taken_selective_estrogen_receptor_modulator_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with a selective estrogen receptor modulator-containing product within the previous six months.","when_to_set_to_false":"Set to false if the patient has not received treatment with a selective estrogen receptor modulator-containing product within the previous six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with a selective estrogen receptor modulator-containing product within the previous six months.","meaning":"Boolean indicating whether the patient has received treatment with a selective estrogen receptor modulator-containing product within the previous six months."} ;; "the patient has received treatment with selective estrogen receptor modulator within the previous six months."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_taken_calcitonin_containing_product_inthepast6months)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with calcitonin within the previous six months."

(assert
(! (not patient_has_taken_estrogen_containing_product_inthepast6months)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with estrogen within the previous six months."

(assert
(! (not patient_has_taken_selective_estrogen_receptor_modulator_containing_product_inthepast6months)
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with selective estrogen receptor modulator within the previous six months."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a corticosteroid and corticosteroid derivative containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken a corticosteroid and corticosteroid derivative containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a corticosteroid and corticosteroid derivative containing product.","meaning":"Boolean indicating whether the patient has ever taken a corticosteroid and corticosteroid derivative containing product at any time in the past."} ;; "corticosteroid"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@systemic_route Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid and corticosteroid derivative containing product was administered systemically.","when_to_set_to_false":"Set to false if the product was not administered systemically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product was administered systemically.","meaning":"Boolean indicating whether the product was administered via a systemic route."} ;; "systemic corticosteroid therapy"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@pharmacologic_level Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid and corticosteroid derivative containing product was received at pharmacologic levels.","when_to_set_to_false":"Set to false if the product was not received at pharmacologic levels.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product was received at pharmacologic levels.","meaning":"Boolean indicating whether the product was received at pharmacologic levels."} ;; "pharmacologic levels"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@duration_greater_than_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid and corticosteroid derivative containing product was taken for more than six months.","when_to_set_to_false":"Set to false if the product was taken for six months or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product was taken for more than six months.","meaning":"Boolean indicating whether the product was taken for a duration greater than six months."} ;; "more than six months duration"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@systemic_route@@pharmacologic_level@@duration_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the total number of months the patient has received systemic corticosteroid therapy at pharmacologic levels in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient has received systemic corticosteroid therapy at pharmacologic levels.","meaning":"Numeric value representing the total duration in months for which the patient has received systemic corticosteroid therapy at pharmacologic levels."} ;; "duration in months for systemic corticosteroid therapy at pharmacologic levels"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Duration greater than 6 months is defined by the numeric value
(assert
(! (= patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@duration_greater_than_6_months
    (> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@systemic_route@@pharmacologic_level@@duration_value_recorded_in_months 6))
:named REQ9_AUXILIARY0)) ;; "duration greater than six months"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@systemic_route
    patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory)
:named REQ9_AUXILIARY1)) ;; "systemic route"

(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@pharmacologic_level
    patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory)
:named REQ9_AUXILIARY2)) ;; "pharmacologic levels"

(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@duration_greater_than_6_months
    patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory)
:named REQ9_AUXILIARY3)) ;; "duration greater than six months"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have received systemic corticosteroid therapy at pharmacologic levels for more than six months duration
(assert
(! (not (and
    patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@systemic_route
    patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@pharmacologic_level
    patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@duration_greater_than_6_months))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received systemic corticosteroid therapy at pharmacologic levels for more than six months duration."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_undergone_administration_of_steroid_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of corticosteroid therapy at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone administration of corticosteroid therapy within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of corticosteroid therapy within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone administration of corticosteroid therapy within the past 6 months."} ;; "has received any corticosteroid therapy within the previous 6 months."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_undergone_administration_of_steroid_inthepast6months)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received any corticosteroid therapy within the previous 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_undergone_anticonvulsant_therapy_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone anticonvulsant therapy at any time within the past 1 year.","when_to_set_to_false":"Set to false if the patient has not undergone anticonvulsant therapy within the past 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone anticonvulsant therapy within the past 1 year.","meaning":"Boolean indicating whether the patient has undergone anticonvulsant therapy within the past 1 year."} ;; "has received treatment with anticonvulsant therapy within the previous 1 year."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_undergone_anticonvulsant_therapy_inthepast1years)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with anticonvulsant therapy within the previous 1 year."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_clinically_significant_abnormality_on_pre_study_laboratory_screen Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an abnormality detected on the pre-study laboratory screen and the abnormality is clinically significant.","when_to_set_to_false":"Set to false if the patient does not have any abnormality detected on the pre-study laboratory screen, or if any abnormality detected is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinically significant abnormality on the pre-study laboratory screen.","meaning":"Boolean indicating whether the patient has a clinically significant abnormality detected on the pre-study laboratory screen."} ;; "clinically significant abnormality on pre-study laboratory screen"
(declare-const patient_has_clinically_significant_abnormality_on_pre_study_clinical_screen Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an abnormality detected on the pre-study clinical screen and the abnormality is clinically significant.","when_to_set_to_false":"Set to false if the patient does not have any abnormality detected on the pre-study clinical screen, or if any abnormality detected is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinically significant abnormality on the pre-study clinical screen.","meaning":"Boolean indicating whether the patient has a clinically significant abnormality detected on the pre-study clinical screen."} ;; "clinically significant abnormality on pre-study clinical screen"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (or patient_has_clinically_significant_abnormality_on_pre_study_laboratory_screen
            patient_has_clinically_significant_abnormality_on_pre_study_clinical_screen))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has clinically significant abnormality on pre-study laboratory screen) OR (the patient has clinically significant abnormality on pre-study clinical screen)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_taking_thyroid_hormone_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with a thyroid hormone-containing product.","when_to_set_to_false":"Set to false if the patient is not currently receiving treatment with a thyroid hormone-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with a thyroid hormone-containing product.","meaning":"Boolean indicating whether the patient is currently taking a thyroid hormone-containing product."} ;; "the patient is receiving treatment with thyroid hormone"

(declare-const patient_has_finding_of_euthyroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of being euthyroid.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of being euthyroid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of being euthyroid.","meaning":"Boolean indicating whether the patient currently has the clinical finding of being euthyroid."} ;; "the patient is NOT euthyroid at the time of entry"

(declare-const patients_thyrotrophin_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's serum thyrotrophin (TSH) is currently within the normal range as measured by ultrasensitive assay.","when_to_set_to_false":"Set to false if the patient's serum thyrotrophin (TSH) is currently not within the normal range as measured by ultrasensitive assay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's serum thyrotrophin (TSH) is currently within the normal range as measured by ultrasensitive assay.","meaning":"Boolean indicating whether the patient's serum thyrotrophin (TSH) is currently within the normal range."} ;; "the serum thyroid stimulating hormone by ultrasensitive assay is NOT normal"

(declare-const patients_thyrotrophin_is_normal_now@@measured_by_ultrasensitive_assay Bool) ;; {"when_to_set_to_true":"Set to true if the patient's serum thyrotrophin (TSH) normality is determined by a measurement performed using an ultrasensitive assay.","when_to_set_to_false":"Set to false if the patient's serum thyrotrophin (TSH) normality is not determined by a measurement performed using an ultrasensitive assay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's serum thyrotrophin (TSH) normality is determined by an ultrasensitive assay.","meaning":"Boolean indicating whether the patient's serum thyrotrophin (TSH) normality is determined by an ultrasensitive assay."} ;; "serum thyroid stimulating hormone by ultrasensitive assay"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patients_thyrotrophin_is_normal_now@@measured_by_ultrasensitive_assay
       patients_thyrotrophin_is_normal_now)
   :named REQ13_AUXILIARY0)) ;; "serum thyroid stimulating hormone by ultrasensitive assay is NOT normal"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: (receiving thyroid hormone AND NOT euthyroid) OR (serum TSH by ultrasensitive assay is NOT normal)
(assert
(! (not (or (and patient_is_taking_thyroid_hormone_containing_product_now
                 (not patient_has_finding_of_euthyroid_now))
            (not patients_thyrotrophin_is_normal_now@@measured_by_ultrasensitive_assay)))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is receiving treatment with thyroid hormone AND the patient is NOT euthyroid at the time of entry) OR (the serum thyroid stimulating hormone by ultrasensitive assay is NOT normal)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor hypertension control (uncontrolled hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have poor hypertension control (uncontrolled hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor hypertension control (uncontrolled hypertension).","meaning":"Boolean indicating whether the patient currently has poor hypertension control (uncontrolled hypertension) at the present time."} ;; "uncontrolled hypertension"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina (preinfarction syndrome)."} ;; "unstable angina"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_preinfarction_syndrome_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction at any time within the 1 year prior to entry.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the 1 year prior to entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the 1 year prior to entry.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the 1 year prior to entry."} ;; "myocardial infarction within 1 year prior to entry"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast1years)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had myocardial infarction within 1 year prior to entry."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_hyperparathyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of hyperparathyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of hyperparathyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of hyperparathyroidism.","meaning":"Boolean indicating whether the patient currently has evidence of hyperparathyroidism."} ;; "hyperparathyroidism"
(declare-const patient_has_finding_of_hypoparathyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of hypoparathyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of hypoparathyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of hypoparathyroidism.","meaning":"Boolean indicating whether the patient currently has evidence of hypoparathyroidism."} ;; "hypoparathyroidism"
(declare-const patient_has_finding_of_metabolic_bone_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of metabolic bone disease.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of metabolic bone disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of metabolic bone disease.","meaning":"Boolean indicating whether the patient currently has evidence of metabolic bone disease."} ;; "metabolic bone disease"
(declare-const patient_has_finding_of_osteitis_deformans_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of Paget's disease (osteitis deformans).","when_to_set_to_false":"Set to false if the patient currently does not have evidence of Paget's disease (osteitis deformans).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of Paget's disease (osteitis deformans).","meaning":"Boolean indicating whether the patient currently has evidence of Paget's disease (osteitis deformans)."} ;; "Paget's disease"
(declare-const patient_has_finding_of_osteogenesis_imperfecta_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of osteogenesis imperfecta.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of osteogenesis imperfecta.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of osteogenesis imperfecta.","meaning":"Boolean indicating whether the patient currently has evidence of osteogenesis imperfecta."} ;; "osteogenesis imperfecta"
(declare-const patient_has_finding_of_osteomalacia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of osteomalacia.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of osteomalacia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of osteomalacia.","meaning":"Boolean indicating whether the patient currently has evidence of osteomalacia."} ;; "osteomalacia"
(declare-const patient_has_finding_of_other_metabolic_bone_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of other metabolic bone disease not otherwise specified in the listed examples (hyperparathyroidism, hypoparathyroidism, Paget's disease, osteomalacia, osteogenesis imperfecta).","when_to_set_to_false":"Set to false if the patient currently does not have evidence of other metabolic bone disease not otherwise specified in the listed examples.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of other metabolic bone disease not otherwise specified in the listed examples.","meaning":"Boolean indicating whether the patient currently has evidence of other metabolic bone disease not otherwise specified in the listed examples."} ;; "other metabolic bone disease"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Non-exhaustive examples imply umbrella term (metabolic bone disease)
(assert
(! (=> patient_has_finding_of_hyperparathyroidism_now
      patient_has_finding_of_metabolic_bone_disease_now)
    :named REQ17_AUXILIARY0)) ;; "with non-exhaustive examples (hyperparathyroidism)"

(assert
(! (=> patient_has_finding_of_hypoparathyroidism_now
      patient_has_finding_of_metabolic_bone_disease_now)
    :named REQ17_AUXILIARY1)) ;; "with non-exhaustive examples (hypoparathyroidism)"

(assert
(! (=> patient_has_finding_of_osteitis_deformans_now
      patient_has_finding_of_metabolic_bone_disease_now)
    :named REQ17_AUXILIARY2)) ;; "with non-exhaustive examples (Paget's disease)"

(assert
(! (=> patient_has_finding_of_osteomalacia_now
      patient_has_finding_of_metabolic_bone_disease_now)
    :named REQ17_AUXILIARY3)) ;; "with non-exhaustive examples (osteomalacia)"

(assert
(! (=> patient_has_finding_of_osteogenesis_imperfecta_now
      patient_has_finding_of_metabolic_bone_disease_now)
    :named REQ17_AUXILIARY4)) ;; "with non-exhaustive examples (osteogenesis imperfecta)"

;; Qualifier variable for "other metabolic bone disease" also implies umbrella term
(assert
(! (=> patient_has_finding_of_other_metabolic_bone_disease_now
      patient_has_finding_of_metabolic_bone_disease_now)
    :named REQ17_AUXILIARY5)) ;; "evidence of other metabolic bone disease"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Exclusion: patient must NOT have evidence of metabolic bone disease (any form)
(assert
(! (not patient_has_finding_of_metabolic_bone_disease_now)
    :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of metabolic bone disease with non-exhaustive examples (hyperparathyroidism) OR ... OR evidence of other metabolic bone disease."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_diagnosis_of_rheumatoid_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of rheumatoid arthritis."} ;; "rheumatoid arthritis"
(declare-const patient_has_diagnosis_of_rheumatoid_arthritis_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of rheumatoid arthritis and the disease is active.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of rheumatoid arthritis but the disease is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is active.","meaning":"Boolean indicating whether the patient's current rheumatoid arthritis diagnosis is active."} ;; "active rheumatoid arthritis"
(declare-const patient_has_diagnosis_of_collagen_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of collagen disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of collagen disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of collagen disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of collagen disease."} ;; "collagen disease"
(declare-const patient_has_diagnosis_of_collagen_disease_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of collagen disease and the disease is active.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of collagen disease but the disease is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is active.","meaning":"Boolean indicating whether the patient's current collagen disease diagnosis is active."} ;; "active collagen disease"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_rheumatoid_arthritis_now@@active_status
      patient_has_diagnosis_of_rheumatoid_arthritis_now)
    :named REQ18_AUXILIARY0)) ;; "active rheumatoid arthritis"

(assert
(! (=> patient_has_diagnosis_of_collagen_disease_now@@active_status
      patient_has_diagnosis_of_collagen_disease_now)
    :named REQ18_AUXILIARY1)) ;; "active collagen disease"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_diagnosis_of_rheumatoid_arthritis_now@@active_status)
    :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active rheumatoid arthritis."

(assert
(! (not patient_has_diagnosis_of_collagen_disease_now@@active_status)
    :named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active collagen disease."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of any major gastrointestinal disease within the previous 1 year (excluding specific subtypes already captured by other variables).","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of any major gastrointestinal disease within the previous 1 year (excluding specific subtypes already captured by other variables).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of any major gastrointestinal disease within the previous 1 year.","meaning":"Boolean indicating whether the patient has had a diagnosis of major gastrointestinal disease within the previous 1 year, regardless of specific subtype."} ;; "recent major gastrointestinal disease within the previous 1 year"
(declare-const patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years@@major Bool) ;; {"when_to_set_to_true":"Set to true if the major gastrointestinal disease diagnosis within the previous 1 year is major in severity.","when_to_set_to_false":"Set to false if the major gastrointestinal disease diagnosis within the previous 1 year is not major in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the major gastrointestinal disease diagnosis within the previous 1 year is major in severity.","meaning":"Boolean indicating whether the major gastrointestinal disease diagnosis within the previous 1 year is major in severity."} ;; "major gastrointestinal disease"
(declare-const patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the major gastrointestinal disease diagnosis within the previous 1 year is recent.","when_to_set_to_false":"Set to false if the major gastrointestinal disease diagnosis within the previous 1 year is not recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the major gastrointestinal disease diagnosis within the previous 1 year is recent.","meaning":"Boolean indicating whether the major gastrointestinal disease diagnosis within the previous 1 year is recent."} ;; "recent major gastrointestinal disease"
(declare-const patient_has_diagnosis_of_peptic_ulcer_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of peptic ulcer within the previous 1 year.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of peptic ulcer within the previous 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of peptic ulcer within the previous 1 year.","meaning":"Boolean indicating whether the patient has had a diagnosis of peptic ulcer within the previous 1 year."} ;; "peptic ulcer"
(declare-const patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malabsorption syndrome within the previous 1 year.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malabsorption syndrome within the previous 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malabsorption syndrome within the previous 1 year.","meaning":"Boolean indicating whether the patient has had a diagnosis of malabsorption syndrome within the previous 1 year."} ;; "malabsorption"
(declare-const patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years@@major Bool) ;; {"when_to_set_to_true":"Set to true if the malabsorption syndrome diagnosis within the previous 1 year is major.","when_to_set_to_false":"Set to false if the malabsorption syndrome diagnosis within the previous 1 year is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malabsorption syndrome diagnosis within the previous 1 year is major.","meaning":"Boolean indicating whether the malabsorption syndrome diagnosis within the previous 1 year is major."} ;; "major malabsorption"
(declare-const patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the malabsorption syndrome diagnosis within the previous 1 year is recent.","when_to_set_to_false":"Set to false if the malabsorption syndrome diagnosis within the previous 1 year is not recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malabsorption syndrome diagnosis within the previous 1 year is recent.","meaning":"Boolean indicating whether the malabsorption syndrome diagnosis within the previous 1 year is recent."} ;; "recent malabsorption"
(declare-const patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of chronic ulcerative colitis within the previous 1 year.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of chronic ulcerative colitis within the previous 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of chronic ulcerative colitis within the previous 1 year.","meaning":"Boolean indicating whether the patient has had a diagnosis of chronic ulcerative colitis within the previous 1 year."} ;; "chronic ulcerative colitis"
(declare-const patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years@@major Bool) ;; {"when_to_set_to_true":"Set to true if the chronic ulcerative colitis diagnosis within the previous 1 year is major.","when_to_set_to_false":"Set to false if the chronic ulcerative colitis diagnosis within the previous 1 year is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic ulcerative colitis diagnosis within the previous 1 year is major.","meaning":"Boolean indicating whether the chronic ulcerative colitis diagnosis within the previous 1 year is major."} ;; "major chronic ulcerative colitis"
(declare-const patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the chronic ulcerative colitis diagnosis within the previous 1 year is recent.","when_to_set_to_false":"Set to false if the chronic ulcerative colitis diagnosis within the previous 1 year is not recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic ulcerative colitis diagnosis within the previous 1 year is recent.","meaning":"Boolean indicating whether the chronic ulcerative colitis diagnosis within the previous 1 year is recent."} ;; "recent chronic ulcerative colitis"
(declare-const patient_has_diagnosis_of_crohn_s_disease_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of Crohn's disease (regional enteritis) within the previous 1 year.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of Crohn's disease (regional enteritis) within the previous 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of Crohn's disease (regional enteritis) within the previous 1 year.","meaning":"Boolean indicating whether the patient has had a diagnosis of Crohn's disease (regional enteritis) within the previous 1 year."} ;; "regional enteritis"
(declare-const patient_has_finding_of_chronic_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic diarrhea.","when_to_set_to_false":"Set to false if the patient currently does not have chronic diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic diarrhea.","meaning":"Boolean indicating whether the patient currently has chronic diarrhea."} ;; "chronic diarrhea state"
(declare-const patient_has_finding_of_chronic_diarrhea_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the chronic diarrhea currently present is significant.","when_to_set_to_false":"Set to false if the chronic diarrhea currently present is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic diarrhea currently present is significant.","meaning":"Boolean indicating whether the chronic diarrhea currently present is significant."} ;; "significant chronic diarrhea state"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Non-exhaustive examples imply umbrella term for major GI disease (peptic ulcer)
(assert
(! (=> patient_has_diagnosis_of_peptic_ulcer_inthepast1years
      patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years)
    :named REQ19_AUXILIARY0)) ;; "non-exhaustive examples (peptic ulcer)"

;; Non-exhaustive examples imply umbrella term for major GI disease (malabsorption)
(assert
(! (=> patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years
      patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years)
    :named REQ19_AUXILIARY1)) ;; "non-exhaustive examples (malabsorption)"

;; Non-exhaustive examples imply umbrella term for major GI disease (chronic ulcerative colitis)
(assert
(! (=> patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years
      patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years)
    :named REQ19_AUXILIARY2)) ;; "non-exhaustive examples (chronic ulcerative colitis)"

;; Non-exhaustive examples imply umbrella term for major GI disease (regional enteritis)
(assert
(! (=> patient_has_diagnosis_of_crohn_s_disease_inthepast1years
      patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years)
    :named REQ19_AUXILIARY3)) ;; "non-exhaustive examples (regional enteritis)"

;; Qualifier variables imply corresponding stem variables (major GI disease)
(assert
(! (=> patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years@@major
      patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years)
    :named REQ19_AUXILIARY4)) ;; "major gastrointestinal disease"

(assert
(! (=> patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years@@recent
      patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years)
    :named REQ19_AUXILIARY5)) ;; "recent major gastrointestinal disease"

;; Qualifier variables imply corresponding stem variables (malabsorption syndrome)
(assert
(! (=> patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years@@major
      patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years)
    :named REQ19_AUXILIARY6)) ;; "major malabsorption"

(assert
(! (=> patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years@@recent
      patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years)
    :named REQ19_AUXILIARY7)) ;; "recent malabsorption"

;; Qualifier variables imply corresponding stem variables (chronic ulcerative colitis)
(assert
(! (=> patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years@@major
      patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years)
    :named REQ19_AUXILIARY8)) ;; "major chronic ulcerative colitis"

(assert
(! (=> patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years@@recent
      patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years)
    :named REQ19_AUXILIARY9)) ;; "recent chronic ulcerative colitis"

;; Qualifier variable implies corresponding stem variable (significant chronic diarrhea)
(assert
(! (=> patient_has_finding_of_chronic_diarrhea_now@@significant
      patient_has_finding_of_chronic_diarrhea_now)
    :named REQ19_AUXILIARY10)) ;; "significant chronic diarrhea state"

;; ===================== Constraint Assertions (REQ 19) =====================
;; Exclusion: patient must NOT have any of the following:
(assert
(! (not patient_has_diagnosis_of_major_gastrointestinal_disease_inthepast1years)
    :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "recent major gastrointestinal disease within the previous 1 year with non-exhaustive examples (peptic ulcer)"

(assert
(! (not patient_has_diagnosis_of_malabsorption_syndrome_inthepast1years)
    :named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "recent major gastrointestinal disease within the previous 1 year with non-exhaustive examples (malabsorption)"

(assert
(! (not patient_has_diagnosis_of_chronic_ulcerative_colitis_inthepast1years)
    :named REQ19_COMPONENT2_OTHER_REQUIREMENTS)) ;; "recent major gastrointestinal disease within the previous 1 year with non-exhaustive examples (chronic ulcerative colitis)"

(assert
(! (not patient_has_diagnosis_of_crohn_s_disease_inthepast1years)
    :named REQ19_COMPONENT3_OTHER_REQUIREMENTS)) ;; "recent major gastrointestinal disease within the previous 1 year with non-exhaustive examples (regional enteritis)"

(assert
(! (not patient_has_finding_of_chronic_diarrhea_now@@significant)
    :named REQ19_COMPONENT4_OTHER_REQUIREMENTS)) ;; "any significant chronic diarrhea state"

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_tobacco_user_value_recorded_now_withunit_cigarettes_per_day Real) ;; {"when_to_set_to_value":"Set to the measured or reported number of cigarettes per day the patient currently uses, if available now.","when_to_set_to_null":"Set to null if no such measurement or report is available now or the value is indeterminate.","meaning":"Numeric value representing the number of cigarettes per day the patient currently uses."} ;; "uses tobacco at a level of more than 10 cigarettes per day."

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
  (! (not (> patient_tobacco_user_value_recorded_now_withunit_cigarettes_per_day 10))
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses tobacco at a level of more than 10 cigarettes per day."
