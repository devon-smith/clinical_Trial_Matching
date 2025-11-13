;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "an adult (age ≥ 18 years)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an adult (age ≥ 18 years)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} // "hypertension"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} // "diabetes mellitus"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now@@high_risk_patient_according_to_esc_esh_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension) and is classified as a high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hypertensive disorder (hypertension) and is not classified as a high risk patient according to these guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension) and is classified as a high risk patient according to these guidelines.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension) and is classified as a high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines."} // "the patient is a high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now@@very_high_risk_patient_according_to_esc_esh_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient is classified as a very high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines.","when_to_set_to_false":"Set to false if the patient is not classified as a very high risk patient according to these guidelines.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the patient is classified as a very high risk patient according to these guidelines.","meaning":"Boolean indicating whether the patient is classified as a very high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines."} // "the patient is a very high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure is recorded now in mmHg.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure recorded now, in mmHg."} // "sitting systolic blood pressure > 140 mmHg" and "sitting systolic blood pressure > 130 mmHg"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable (hypertensive disorder)
(assert
  (! (=> patient_has_diagnosis_of_hypertensive_disorder_now@@high_risk_patient_according_to_esc_esh_guidelines
         patient_has_diagnosis_of_hypertensive_disorder_now)
     :named REQ1_AUXILIARY0)) ;; "the patient is a high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines"

(assert
  (! (=> patient_has_diagnosis_of_hypertensive_disorder_now@@very_high_risk_patient_according_to_esc_esh_guidelines
         patient_has_diagnosis_of_hypertensive_disorder_now)
     :named REQ1_AUXILIARY1)) ;; "the patient is a very high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have hypertension.
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have hypertension"

;; Component 1: The patient must have ((sitting systolic blood pressure > 140 mmHg) OR ((sitting systolic blood pressure > 130 mmHg) AND (the patient has diabetes mellitus OR the patient is a high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines OR the patient is a very high risk patient according to European Society of Cardiology / European Society of Hypertension Guidelines)))
(assert
  (! (or
        (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 140.0)
        (and
          (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 130.0)
          (or patient_has_diagnosis_of_diabetes_mellitus_now
              patient_has_diagnosis_of_hypertensive_disorder_now@@high_risk_patient_according_to_esc_esh_guidelines
              patient_has_diagnosis_of_hypertensive_disorder_now@@very_high_risk_patient_according_to_esc_esh_guidelines)))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "sitting systolic blood pressure > 140 mmHg OR (sitting systolic blood pressure > 130 mmHg AND (the patient has diabetes mellitus OR the patient is a high risk patient ... OR the patient is a very high risk patient ...))"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_eprosartan_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently prescribed or taking an eprosartan-containing product.","when_to_set_to_false":"Set to false if the patient is not currently prescribed or taking an eprosartan-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently prescribed or taking an eprosartan-containing product.","meaning":"Boolean indicating whether the patient is currently prescribed or taking an eprosartan-containing product."} // "eprosartan"
(declare-const patient_is_taking_eprosartan_containing_product_now@@prescribed_under_terms_and_conditions_of_local_label Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently prescribed or taking an eprosartan-containing product and the prescription is under the terms and conditions of the local label.","when_to_set_to_false":"Set to false if the patient is currently prescribed or taking an eprosartan-containing product but the prescription is not under the terms and conditions of the local label.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prescription is under the terms and conditions of the local label.","meaning":"Boolean indicating whether the prescription of eprosartan-containing product is under the terms and conditions of the local label."} // "prescribed eprosartan under the terms and conditions of the local label"
(declare-const patient_is_taking_eprosartan_containing_product_now@@administered_according_to_standard_medical_practice Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently prescribed or taking an eprosartan-containing product and the administration is according to standard medical practice.","when_to_set_to_false":"Set to false if the patient is currently prescribed or taking an eprosartan-containing product but the administration is not according to standard medical practice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration is according to standard medical practice.","meaning":"Boolean indicating whether the administration of eprosartan-containing product is according to standard medical practice."} // "administered eprosartan according to standard medical practice"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for prescription under local label implies the patient is taking eprosartan
(assert
  (! (=> patient_is_taking_eprosartan_containing_product_now@@prescribed_under_terms_and_conditions_of_local_label
         patient_is_taking_eprosartan_containing_product_now)
     :named REQ2_AUXILIARY0)) ;; "prescribed eprosartan under the terms and conditions of the local label"

;; Qualifier variable for administration according to standard medical practice implies the patient is taking eprosartan
(assert
  (! (=> patient_is_taking_eprosartan_containing_product_now@@administered_according_to_standard_medical_practice
         patient_is_taking_eprosartan_containing_product_now)
     :named REQ2_AUXILIARY1)) ;; "administered eprosartan according to standard medical practice"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: prescribed eprosartan under the terms and conditions of the local label
(assert
  (! patient_is_taking_eprosartan_containing_product_now@@prescribed_under_terms_and_conditions_of_local_label
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "prescribed eprosartan under the terms and conditions of the local label"

;; Component 1: administered eprosartan according to standard medical practice
(assert
  (! patient_is_taking_eprosartan_containing_product_now@@administered_according_to_standard_medical_practice
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "administered eprosartan according to standard medical practice"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now@@newly_diagnosed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of hypertensive disorder (hypertension) is newly made (recent onset).","when_to_set_to_false":"Set to false if the patient's current diagnosis of hypertensive disorder (hypertension) is not newly made (longstanding).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is newly made.","meaning":"Boolean indicating whether the patient's current diagnosis of hypertensive disorder (hypertension) is newly made."} // "newly diagnosed hypertension"
(declare-const patient_has_intolerance_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to hypotensive agents (antihypertensive medication).","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to hypotensive agents (antihypertensive medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to hypotensive agents (antihypertensive medication).","meaning":"Boolean indicating whether the patient currently has intolerance to hypotensive agents (antihypertensive medication)."} // "inability to tolerate other antihypertensive medication"
(declare-const patient_has_lack_of_response_to_antihypertensive_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lack of response to antihypertensive medication.","when_to_set_to_false":"Set to false if the patient currently does not have a lack of response to antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lack of response to antihypertensive medication.","meaning":"Boolean indicating whether the patient currently has a lack of response to antihypertensive medication."} // "lack of response to current antihypertensive medication"
(declare-const patient_has_lack_of_response_to_antihypertensive_medication_now@@applies_to_current_medication_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lack of response to antihypertensive medication applies to the current medication regimen.","when_to_set_to_false":"Set to false if the patient's lack of response to antihypertensive medication does not apply to the current medication regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lack of response applies to the current medication regimen.","meaning":"Boolean indicating whether the patient's lack of response to antihypertensive medication applies to the current medication regimen."} // "lack of response to current antihypertensive medication"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_hypertensive_disorder_now@@newly_diagnosed
         patient_has_diagnosis_of_hypertensive_disorder_now)
     :named REQ3_AUXILIARY0)) ;; "newly diagnosed hypertension" implies "hypertension"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_lack_of_response_to_antihypertensive_medication_now@@applies_to_current_medication_regimen
         patient_has_lack_of_response_to_antihypertensive_medication_now)
     :named REQ3_AUXILIARY1)) ;; "lack of response to current antihypertensive medication" applies to current regimen

;; ===================== Constraint Assertions (REQ 3) =====================
;; At least one of: newly diagnosed hypertension OR inability to tolerate other antihypertensive medication OR lack of response to current antihypertensive medication
(assert
  (! (or patient_has_diagnosis_of_hypertensive_disorder_now@@newly_diagnosed
         patient_has_intolerance_to_hypotensive_agent_now
         patient_has_lack_of_response_to_antihypertensive_medication_now@@applies_to_current_medication_regimen)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one of the following conditions: newly diagnosed hypertension OR inability to tolerate other antihypertensive medication OR lack of response to current antihypertensive medication"
