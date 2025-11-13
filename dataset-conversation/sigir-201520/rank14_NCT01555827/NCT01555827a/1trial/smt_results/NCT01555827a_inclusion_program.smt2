;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."} // "diagnosis of probable Alzheimer's disease"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosis_is_probable Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease, and the diagnosis is classified as 'probable' (not possible or definite)." {"when_to_set_to_true":"Set to true if the patient's current diagnosis of Alzheimer's disease is classified as 'probable'.","when_to_set_to_false":"Set to false if the patient's current diagnosis of Alzheimer's disease is not classified as 'probable'.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is classified as 'probable'.","meaning":"Boolean indicating whether the patient's current diagnosis of Alzheimer's disease is classified as 'probable'."} // "probable Alzheimer's disease"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosis_defined_by_nincds_adrda_criteria Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease, and the diagnosis is defined according to the National Institute of Neurological and Communicative Disorders and Stroke and the Alzheimer's Disease and Related Disorders Association (NINCDS-ADRDA) criteria." {"when_to_set_to_true":"Set to true if the patient's current diagnosis of Alzheimer's disease is defined according to the NINCDS-ADRDA criteria.","when_to_set_to_false":"Set to false if the patient's current diagnosis of Alzheimer's disease is not defined according to the NINCDS-ADRDA criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is defined according to the NINCDS-ADRDA criteria.","meaning":"Boolean indicating whether the patient's current diagnosis of Alzheimer's disease is defined according to the NINCDS-ADRDA criteria."} // "defined according to the National Institute of Neurological and Communicative Disorders and Stroke and the Alzheimer's Disease and Related Disorders Association criteria"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable: probable diagnosis implies diagnosis
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosis_is_probable
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY0)) ;; "probable Alzheimer's disease" implies "diagnosis of Alzheimer's disease"

;; Qualifier variable implies stem variable: NINCDS-ADRDA criteria implies diagnosis
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosis_defined_by_nincds_adrda_criteria
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ0_AUXILIARY1)) ;; "diagnosis defined by NINCDS-ADRDA criteria" implies "diagnosis of Alzheimer's disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Must have probable Alzheimer's disease defined by NINCDS-ADRDA criteria
(assert
  (! (and patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosis_is_probable
          patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosis_defined_by_nincds_adrda_criteria)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "diagnosis of probable Alzheimer's disease (defined according to the National Institute of Neurological and Communicative Disorders and Stroke and the Alzheimer's Disease and Related Disorders Association criteria)"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_light Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease and the severity is light." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease and the severity is light.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of Alzheimer's disease but the severity is not light.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of Alzheimer's disease is light.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease with light severity."} // "light severity of Alzheimer's disease"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_moderate Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease and the severity is moderate." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease and the severity is moderate.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of Alzheimer's disease but the severity is not moderate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of Alzheimer's disease is moderate.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease with moderate severity."} // "moderate severity of Alzheimer's disease"
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_score Real) ;; "Numeric value representing the patient's current Mini-Mental State Examination score." {"when_to_set_to_value":"Set to the measured value if a numeric Mini-Mental State Examination score recorded now is available.","when_to_set_to_null":"Set to null if no such score measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Mini-Mental State Examination score."} // "Mini-Mental State Examination score"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_light
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ1_AUXILIARY0)) ;; "light severity of Alzheimer's disease"

(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_moderate
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ1_AUXILIARY1)) ;; "moderate severity of Alzheimer's disease"

;; Definition: light or moderate severity is defined by MMSE score > 10
(assert
  (! (= (or patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_light
            patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_moderate)
        (> patient_mini_mental_state_examination_score_value_recorded_now_withunit_score 10))
     :named REQ1_AUXILIARY2)) ;; "defined by Mini-Mental State Examination score > 10 (global evaluation of cognition)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_light
         patient_has_diagnosis_of_alzheimer_s_disease_now@@severity_moderate)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (light severity of Alzheimer's disease OR moderate severity of Alzheimer's disease) (defined by Mini-Mental State Examination score > 10 (global evaluation of cognition))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "To be included, the patient must be aged ≥ 50 years." {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 50.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 50 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_benefiting_from_social_insurance_now Bool) ;; "To be included, the patient must be benefiting from social insurance." {"when_to_set_to_true":"Set to true if the patient is currently benefiting from social insurance.","when_to_set_to_false":"Set to false if the patient is currently not benefiting from social insurance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently benefiting from social insurance.","meaning":"Boolean indicating whether the patient is currently benefiting from social insurance."}

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_benefiting_from_social_insurance_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be benefiting from social insurance."
