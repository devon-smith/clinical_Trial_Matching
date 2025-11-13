;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_essential_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of essential hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of essential hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of essential hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of essential hypertension."} // "have essential hypertension"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a current systolic blood pressure measurement in mmHg is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} // "systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if a current diastolic blood pressure measurement in mmHg is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in mmHg."} // "diastolic blood pressure"
(declare-const patient_is_undergoing_antihypertensive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antihypertensive drug therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing antihypertensive drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antihypertensive drug therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antihypertensive drug therapy."} // "antihypertensive drug therapy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition in the requirement: essential hypertension is defined as (systolic BP ≥ 140 mmHg) OR (diastolic BP ≥ 90 mmHg)
(assert
  (! (= patient_has_diagnosis_of_essential_hypertension_now
        (or (>= patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 140.0)
            (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 90.0)))
     :named REQ0_AUXILIARY0)) ;; "essential hypertension (defined as (systolic blood pressure ≥ 140 mmHg) OR (diastolic blood pressure ≥ 90 mmHg))"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must ((have essential hypertension (defined as ...)) OR (be treated with antihypertensive drug therapy)).
(assert
  (! (or patient_has_diagnosis_of_essential_hypertension_now
         patient_is_undergoing_antihypertensive_therapy_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have essential hypertension (defined as (systolic blood pressure ≥ 140 mmHg) OR (diastolic blood pressure ≥ 90 mmHg))) OR (be treated with antihypertensive drug therapy))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of stroke.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of stroke.","meaning":"Boolean indicating whether the patient currently has a finding of stroke."} // "stroke"
(declare-const patient_has_finding_of_cerebrovascular_accident_now@@detected_on_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current finding of stroke is detected on magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient's current finding of stroke is not detected on magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current finding of stroke is detected on magnetic resonance imaging.","meaning":"Boolean indicating whether the patient's current finding of stroke is detected on magnetic resonance imaging."} // "stroke on MRI"
(declare-const patient_has_finding_of_silent_cerebral_infarct_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of silent cerebral infarct.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of silent cerebral infarct.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of silent cerebral infarct.","meaning":"Boolean indicating whether the patient currently has a finding of silent cerebral infarct."} // "silent brain infarction"
(declare-const patient_has_finding_of_silent_cerebral_infarct_now@@detected_on_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current finding of silent cerebral infarct is detected on magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient's current finding of silent cerebral infarct is not detected on magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current finding of silent cerebral infarct is detected on magnetic resonance imaging.","meaning":"Boolean indicating whether the patient's current finding of silent cerebral infarct is detected on magnetic resonance imaging."} // "silent brain infarction on MRI"
(declare-const patient_has_finding_of_white_matter_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of white matter lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of white matter lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of white matter lesion.","meaning":"Boolean indicating whether the patient currently has a finding of white matter lesion."} // "white matter lesion"
(declare-const patient_has_finding_of_white_matter_lesion_now@@detected_on_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current finding of white matter lesion is detected on magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient's current finding of white matter lesion is not detected on magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current finding of white matter lesion is detected on magnetic resonance imaging.","meaning":"Boolean indicating whether the patient's current finding of white matter lesion is detected on magnetic resonance imaging."} // "white matter lesion on MRI"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_cerebrovascular_accident_now@@detected_on_magnetic_resonance_imaging
         patient_has_finding_of_cerebrovascular_accident_now)
     :named REQ1_AUXILIARY0)) ;; "stroke on MRI" implies "stroke"

(assert
  (! (=> patient_has_finding_of_silent_cerebral_infarct_now@@detected_on_magnetic_resonance_imaging
         patient_has_finding_of_silent_cerebral_infarct_now)
     :named REQ1_AUXILIARY1)) ;; "silent brain infarction on MRI" implies "silent brain infarction"

(assert
  (! (=> patient_has_finding_of_white_matter_lesion_now@@detected_on_magnetic_resonance_imaging
         patient_has_finding_of_white_matter_lesion_now)
     :named REQ1_AUXILIARY2)) ;; "white matter lesion on MRI" implies "white matter lesion"

;; ===================== Constraint Assertions (REQ 1) =====================
;; At least one finding (stroke OR silent brain infarction OR white matter lesion) on MRI
(assert
  (! (or patient_has_finding_of_cerebrovascular_accident_now@@detected_on_magnetic_resonance_imaging
         patient_has_finding_of_silent_cerebral_infarct_now@@detected_on_magnetic_resonance_imaging
         patient_has_finding_of_white_matter_lesion_now@@detected_on_magnetic_resonance_imaging)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least one finding (of stroke OR silent brain infarction OR white matter lesion) on magnetic resonance imaging"
