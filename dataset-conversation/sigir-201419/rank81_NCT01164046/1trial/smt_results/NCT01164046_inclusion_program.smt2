;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."}

(declare-const patient_has_diagnosis_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary embolism."}
(declare-const patient_has_diagnosis_of_pulmonary_embolism_now@@confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of pulmonary embolism is confirmed.","when_to_set_to_false":"Set to false if the patient's diagnosis of pulmonary embolism is not confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of pulmonary embolism is confirmed.","meaning":"Boolean indicating whether the patient's diagnosis of pulmonary embolism is confirmed."}

(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_of_lower_extremity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of deep venous thrombosis of the lower extremity (leg).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of deep venous thrombosis of the lower extremity (leg).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of deep venous thrombosis of the lower extremity (leg).","meaning":"Boolean indicating whether the patient currently has a diagnosis of deep venous thrombosis of the lower extremity (leg)."}
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_of_lower_extremity_now@@confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of deep venous thrombosis of the lower extremity (leg) is confirmed.","when_to_set_to_false":"Set to false if the patient's diagnosis of deep venous thrombosis of the lower extremity (leg) is not confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of deep venous thrombosis of the lower extremity (leg) is confirmed.","meaning":"Boolean indicating whether the patient's diagnosis of deep venous thrombosis of the lower extremity (leg) is confirmed."}

(declare-const patient_is_exposed_to_anticoagulant_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to anticoagulants at any time in the past 12 months.","when_to_set_to_false":"Set to false if the patient has not been exposed to anticoagulants at any time in the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to anticoagulants in the past 12 months.","meaning":"Boolean indicating whether the patient has been exposed to anticoagulants at any time in the past 12 months."}
(declare-const patient_is_exposed_to_anticoagulant_inthepast12months@@administered_at_therapeutic_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to anticoagulants in the past 12 months was at therapeutic doses.","when_to_set_to_false":"Set to false if the patient's exposure to anticoagulants in the past 12 months was not at therapeutic doses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anticoagulants were administered at therapeutic doses.","meaning":"Boolean indicating whether the patient's exposure to anticoagulants in the past 12 months was at therapeutic doses."}
(declare-const patient_anticoagulant_treatment_duration_value_recorded_past_12_months_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has been treated with therapeutic doses of anticoagulants in the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient has been treated with therapeutic doses of anticoagulants in the past 12 months.","meaning":"Numeric value indicating the total duration in months that the patient has been treated with therapeutic doses of anticoagulants in the past 12 months."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Confirmed diagnosis implies diagnosis for pulmonary embolism
(assert
  (! (=> patient_has_diagnosis_of_pulmonary_embolism_now@@confirmed
         patient_has_diagnosis_of_pulmonary_embolism_now)
     :named REQ0_AUXILIARY0)) ;; "have confirmed pulmonary embolism"

;; Confirmed diagnosis implies diagnosis for deep vein thrombosis of the leg
(assert
  (! (=> patient_has_diagnosis_of_deep_venous_thrombosis_of_lower_extremity_now@@confirmed
         patient_has_diagnosis_of_deep_venous_thrombosis_of_lower_extremity_now)
     :named REQ0_AUXILIARY1)) ;; "have confirmed deep vein thrombosis of the leg"

;; Therapeutic dose qualifier implies exposure
(assert
  (! (=> patient_is_exposed_to_anticoagulant_inthepast12months@@administered_at_therapeutic_dose
         patient_is_exposed_to_anticoagulant_inthepast12months)
     :named REQ0_AUXILIARY2)) ;; "treated with therapeutic doses of anticoagulants"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have cancer
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have cancer."

;; Component 1: Must have confirmed pulmonary embolism OR confirmed deep vein thrombosis of the leg
(assert
  (! (or patient_has_diagnosis_of_pulmonary_embolism_now@@confirmed
         patient_has_diagnosis_of_deep_venous_thrombosis_of_lower_extremity_now@@confirmed)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have confirmed pulmonary embolism) OR (have confirmed deep vein thrombosis of the leg)."

;; Component 2: Must have been treated for ≥ 6 months AND ≤ 12 months with therapeutic doses of anticoagulants
(assert
  (! (and patient_is_exposed_to_anticoagulant_inthepast12months@@administered_at_therapeutic_dose
          (>= patient_anticoagulant_treatment_duration_value_recorded_past_12_months_in_months 6.0)
          (<= patient_anticoagulant_treatment_duration_value_recorded_past_12_months_in_months 12.0))
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been treated for (≥ 6 months AND ≤ 12 months) with therapeutic doses of anticoagulants"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} ;; "To be included, the patient must have provided written informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_indication_for_long_term_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an indication for long-term anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient currently does not have an indication for long-term anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an indication for long-term anticoagulant therapy.","meaning":"Boolean indicating whether the patient currently has an indication for long-term anticoagulant therapy."} ;; "To be included, the patient must have an indication for long-term anticoagulant therapy."
(declare-const patient_is_exposed_to_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to anticoagulant substances.","when_to_set_to_false":"Set to false if the patient is currently not exposed to anticoagulant substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to anticoagulant substances.","meaning":"Boolean indicating whether the patient is currently exposed to anticoagulant substances."} ;; "anticoagulant"
;; The following variable is already declared and reused:
;; (declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply the umbrella term (indication for long-term anticoagulant therapy)
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now
         patient_has_indication_for_long_term_anticoagulant_therapy_now)
     :named REQ2_AUXILIARY0)) ;; "metastasized disease" is a non-exhaustive example for indication for long-term anticoagulant therapy

;; Non-exhaustive examples imply the umbrella term (indication for long-term anticoagulant therapy)
(assert
  (! (=> patient_is_exposed_to_anticoagulant_now
         patient_has_indication_for_long_term_anticoagulant_therapy_now)
     :named REQ2_AUXILIARY1)) ;; "chemotherapy" is a non-exhaustive example for indication for long-term anticoagulant therapy (exposure to anticoagulant now may be due to chemotherapy)

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_indication_for_long_term_anticoagulant_therapy_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have an indication for long-term anticoagulant therapy."
