;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of stable angina.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of stable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stable angina.","meaning":"Boolean indicating whether the patient currently has stable angina."}  ;; "To be included, the patient must have stable angina."
(declare-const patient_has_finding_of_finding_of_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of lesion.","meaning":"Boolean indicating whether the patient currently has a clinical finding of lesion."}  ;; "coronary artery lesions"
(declare-const patient_has_finding_of_finding_of_lesion_now@@confirmed_by_coronary_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lesion finding is confirmed by coronary angiography.","when_to_set_to_false":"Set to false if the patient's lesion finding is not confirmed by coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion finding is confirmed by coronary angiography.","meaning":"Boolean indicating whether the patient's lesion finding is confirmed by coronary angiography."}  ;; "coronary artery lesions confirmed by coronary angiography"
(declare-const patient_has_finding_of_finding_of_lesion_now@@located_in_coronary_artery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lesion finding is located in the coronary artery.","when_to_set_to_false":"Set to false if the patient's lesion finding is not located in the coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion finding is located in the coronary artery.","meaning":"Boolean indicating whether the patient's lesion finding is located in the coronary artery."}  ;; "coronary artery lesions"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention in their history."}  ;; "have received percutaneous coronary intervention"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_finding_of_lesion_now@@confirmed_by_coronary_angiography
         patient_has_finding_of_finding_of_lesion_now)
     :named REQ0_AUXILIARY0)) ;; "coronary artery lesions confirmed by coronary angiography" implies "lesion"

(assert
  (! (=> patient_has_finding_of_finding_of_lesion_now@@located_in_coronary_artery
         patient_has_finding_of_finding_of_lesion_now)
     :named REQ0_AUXILIARY1)) ;; "lesion located in coronary artery" implies "lesion"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must have stable angina
(assert
  (! patient_has_finding_of_stable_angina_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have stable angina."

;; Component 1: patient must have (coronary artery lesions confirmed by coronary angiography) OR (have received percutaneous coronary intervention)
(assert
  (! (or
        (and patient_has_finding_of_finding_of_lesion_now@@confirmed_by_coronary_angiography
             patient_has_finding_of_finding_of_lesion_now@@located_in_coronary_artery)
        patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have coronary artery lesions confirmed by coronary angiography) OR (have received percutaneous coronary intervention)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has a diagnosis of unstable angina (preinfarction syndrome)."}  ;; "unstable angina"
(declare-const patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-ST elevation myocardial infarction (NSTEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-ST elevation myocardial infarction (NSTEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-ST elevation myocardial infarction (NSTEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-ST elevation myocardial infarction (NSTEMI)."}  ;; "non-ST elevation myocardial infarction"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@performed_for_main_coronary_artery_lesions Bool) ;; {"when_to_set_to_true":"Set to true if the PCI was performed for main coronary artery lesions.","when_to_set_to_false":"Set to false if the PCI was not performed for main coronary artery lesions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCI was performed for main coronary artery lesions.","meaning":"Boolean indicating whether the PCI was performed for main coronary artery lesions."}  ;; "percutaneous coronary intervention for main coronary artery lesions"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@procedure_is_completed Bool) ;; {"when_to_set_to_true":"Set to true if the percutaneous coronary intervention (PCI) is completed.","when_to_set_to_false":"Set to false if the percutaneous coronary intervention (PCI) is not completed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCI is completed.","meaning":"Boolean indicating whether the PCI is completed."}  ;; "completed percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@performed_for_main_coronary_artery_lesions@@procedure_is_completed Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone PCI at any time in the past, the procedure was performed for main coronary artery lesions, and the procedure is completed.","when_to_set_to_false":"Set to false if the patient has never undergone PCI at any time in the past, or the procedure was not performed for main coronary artery lesions, or the procedure is not completed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone PCI at any time in the past, whether the procedure was performed for main coronary artery lesions, or whether the procedure is completed.","meaning":"Boolean indicating whether the patient has ever undergone PCI at any time in the past, the procedure was performed for main coronary artery lesions, and the procedure is completed."}  ;; "completed percutaneous coronary intervention for main coronary artery lesions"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@performed_for_main_coronary_artery_lesions
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "percutaneous coronary intervention for main coronary artery lesions" implies PCI in history

(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@procedure_is_completed
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "completed percutaneous coronary intervention" implies PCI in history

(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@performed_for_main_coronary_artery_lesions@@procedure_is_completed
         (and patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@performed_for_main_coronary_artery_lesions
              patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@procedure_is_completed))
     :named REQ1_AUXILIARY2)) ;; "completed PCI for main coronary artery lesions" implies both qualifiers

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: (unstable angina OR non-ST elevation MI)
(assert
  (! (or patient_has_diagnosis_of_preinfarction_syndrome_now
         patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have unstable angina OR have non-ST elevation myocardial infarction"

;; Component 1: completed PCI for main coronary artery lesions
(assert
  (! patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@performed_for_main_coronary_artery_lesions@@procedure_is_completed
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have completed percutaneous coronary intervention for main coronary artery lesions"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value of the patient's current systolic blood pressure in mmHg."}  ;; "systolic blood pressure > 130 mmHg"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current diastolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement in mmHg is available or the value is indeterminate.","meaning":"Numeric value of the patient's current diastolic blood pressure in mmHg."}  ;; "diastolic blood pressure > 80 mmHg"
(declare-const patient_is_taking_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antihypertensive drug (hypotensive agent).","when_to_set_to_false":"Set to false if the patient is currently not taking an antihypertensive drug (hypotensive agent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an antihypertensive drug (hypotensive agent).","meaning":"Boolean indicating whether the patient is currently taking an antihypertensive drug (hypotensive agent)."}  ;; "be taking antihypertensive drugs"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must ((have systolic blood pressure > 130 mmHg) OR (have diastolic blood pressure > 80 mmHg) OR (be taking antihypertensive drugs)).
(assert
  (! (or (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 130.0)
         (> patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 80.0)
         patient_is_taking_hypotensive_agent_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have systolic blood pressure > 130 mmHg) OR (have diastolic blood pressure > 80 mmHg) OR (be taking antihypertensive drugs))."
