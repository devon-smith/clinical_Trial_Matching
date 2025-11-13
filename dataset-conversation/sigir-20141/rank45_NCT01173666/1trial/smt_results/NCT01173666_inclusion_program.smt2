;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic heart disease."} // "To be included, the patient must have ischemic heart disease."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_ischemic_heart_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ischemic heart disease."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_atherosclerotic_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atherosclerotic renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atherosclerotic renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atherosclerotic renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atherosclerotic renal artery stenosis."} // "atherosclerotic renal artery stenosis"
(declare-const patient_has_diagnosis_of_atherosclerotic_renal_artery_stenosis_now@@diagnosed_by_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of atherosclerotic renal artery stenosis was made by angiography.","when_to_set_to_false":"Set to false if the diagnosis was not made by angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made by angiography.","meaning":"Boolean indicating whether the diagnosis of atherosclerotic renal artery stenosis was made by angiography."} // "angiographic diagnosis"
(declare-const patient_atherosclerotic_renal_artery_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of stenosis percentage in atherosclerotic renal artery stenosis is available now (typically by angiography).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current degree of atherosclerotic renal artery stenosis."} // "stenosis percentage"
(declare-const patient_atherosclerotic_renal_artery_stenosis_value_recorded_now_withunit_percent@@measured_by_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the stenosis percentage measurement was performed by angiography.","when_to_set_to_false":"Set to false if the measurement was not performed by angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was performed by angiography.","meaning":"Boolean indicating whether the stenosis percentage measurement was performed by angiography."} // "angiographic diagnosis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable for diagnosis
(assert
  (! (=> patient_has_diagnosis_of_atherosclerotic_renal_artery_stenosis_now@@diagnosed_by_angiography
         patient_has_diagnosis_of_atherosclerotic_renal_artery_stenosis_now)
     :named REQ1_AUXILIARY0)) ;; "angiographic diagnosis of atherosclerotic renal artery stenosis"

;; Qualifier variable implies stem variable for stenosis percentage measurement
(assert
  (! (=> patient_atherosclerotic_renal_artery_stenosis_value_recorded_now_withunit_percent@@measured_by_angiography
         (exists ((v Real)) (= v patient_atherosclerotic_renal_artery_stenosis_value_recorded_now_withunit_percent)))
     :named REQ1_AUXILIARY1)) ;; "stenosis percentage measured by angiography"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Angiographic diagnosis of atherosclerotic renal artery stenosis with stenosis percentage > 50%
(assert
  (! (and patient_has_diagnosis_of_atherosclerotic_renal_artery_stenosis_now@@diagnosed_by_angiography
          patient_atherosclerotic_renal_artery_stenosis_value_recorded_now_withunit_percent@@measured_by_angiography
          (> patient_atherosclerotic_renal_artery_stenosis_value_recorded_now_withunit_percent 50.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "angiographic diagnosis of atherosclerotic renal artery stenosis with stenosis percentage > 50%"

;; Component 1: Angiographic diagnosis of atherosclerotic renal artery stenosis with stenosis percentage ≤ 80%
(assert
  (! (and patient_has_diagnosis_of_atherosclerotic_renal_artery_stenosis_now@@diagnosed_by_angiography
          patient_atherosclerotic_renal_artery_stenosis_value_recorded_now_withunit_percent@@measured_by_angiography
          (<= patient_atherosclerotic_renal_artery_stenosis_value_recorded_now_withunit_percent 80.0))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "angiographic diagnosis of atherosclerotic renal artery stenosis with stenosis percentage ≤ 80%"
