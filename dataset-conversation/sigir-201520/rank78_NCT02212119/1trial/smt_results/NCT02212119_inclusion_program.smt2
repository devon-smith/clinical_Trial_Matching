;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_severe_cognitive_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe cognitive impairment.","meaning":"Boolean indicating whether the patient currently has severe cognitive impairment."} ;; "severe cognitive impairment (defined as complete dependency in all activities of daily living)"
(declare-const patient_has_finding_of_requires_assistance_with_all_daily_activities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently requires assistance with all activities of daily living (is completely dependent in all ADLs).","when_to_set_to_false":"Set to false if the patient currently does not require assistance with all activities of daily living.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently requires assistance with all activities of daily living.","meaning":"Boolean indicating whether the patient currently requires assistance with all activities of daily living."} ;; "complete dependency in all activities of daily living"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Severe cognitive impairment is defined as complete dependency in all activities of daily living
(assert
  (! (= patient_has_finding_of_severe_cognitive_impairment_now
        patient_has_finding_of_requires_assistance_with_all_daily_activities_now)
     :named REQ0_AUXILIARY0)) ;; "severe cognitive impairment (defined as complete dependency in all activities of daily living)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_severe_cognitive_impairment_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have severe cognitive impairment (defined as complete dependency in all activities of daily living)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer's disease."} ;; "a diagnosis of Alzheimer's disease"
(declare-const patient_has_diagnosis_of_vascular_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of vascular dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of vascular dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of vascular dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of vascular dementia."} ;; "a diagnosis of vascular dementia"
(declare-const patient_has_diagnosis_of_frontotemporal_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of frontotemporal dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of frontotemporal dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of frontotemporal dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of frontotemporal dementia."} ;; "a diagnosis of frontotemporal dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have a diagnosis of Alzheimer's disease OR a diagnosis of vascular dementia OR a diagnosis of frontotemporal dementia.
(assert
  (! (or patient_has_diagnosis_of_alzheimer_s_disease_now
         patient_has_diagnosis_of_vascular_dementia_now
         patient_has_diagnosis_of_frontotemporal_dementia_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (a diagnosis of Alzheimer's disease OR a diagnosis of vascular dementia OR a diagnosis of frontotemporal dementia)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const paratonic_assessment_instrument_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current score on the paratonic assessment instrument, measured in points.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current score on the paratonic assessment instrument, in points."} ;; "a score > 3 on the paratonic assessment instrument"
(declare-const patient_has_finding_of_paratonic_rigidity_in_arm_interfering_with_provision_of_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paratonic rigidity in an arm that interferes with the provision of care.","when_to_set_to_false":"Set to false if the patient currently does not have paratonic rigidity in an arm that interferes with the provision of care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paratonic rigidity in an arm that interferes with the provision of care.","meaning":"Boolean indicating whether the patient currently has paratonic rigidity in an arm that interferes with the provision of care."} ;; "paratonic rigidity in an arm interfering in the provision of care"
(declare-const patient_has_finding_of_paratonic_rigidity_in_arms_interfering_with_provision_of_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paratonic rigidity in both arms that interferes with the provision of care.","when_to_set_to_false":"Set to false if the patient currently does not have paratonic rigidity in both arms that interferes with the provision of care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paratonic rigidity in both arms that interferes with the provision of care.","meaning":"Boolean indicating whether the patient currently has paratonic rigidity in both arms that interferes with the provision of care."} ;; "paratonic rigidity in arms interfering in the provision of care"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: score > 3 on the paratonic assessment instrument
(assert
  (! (> paratonic_assessment_instrument_score_value_recorded_now_withunit_points 3.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a score > 3 on the paratonic assessment instrument"

;; Component 1: (paratonic rigidity in an arm interfering in the provision of care) OR (paratonic rigidity in arms interfering in the provision of care)
(assert
  (! (or patient_has_finding_of_paratonic_rigidity_in_arm_interfering_with_provision_of_care_now
         patient_has_finding_of_paratonic_rigidity_in_arms_interfering_with_provision_of_care_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "((paratonic rigidity in an arm interfering in the provision of care) OR (paratonic rigidity in arms interfering in the provision of care))"
