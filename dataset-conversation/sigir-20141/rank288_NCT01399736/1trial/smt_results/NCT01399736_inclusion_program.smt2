;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 85 years"
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute ST-segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute ST-segment elevation myocardial infarction."} // "present with ST-elevation myocardial infarction"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention (PCI) now.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous coronary intervention (PCI) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention (PCI) now.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention (PCI) now."} // "be treated with primary percutaneous coronary intervention (PCI)"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_now@@temporalcontext_within_12_hours_after_onset_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone PCI now and the procedure was performed within less than 12 hours after the onset of symptoms.","when_to_set_to_false":"Set to false if the patient has undergone PCI now but the procedure was not performed within less than 12 hours after the onset of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCI was performed within less than 12 hours after the onset of symptoms.","meaning":"Boolean indicating that the PCI was performed within less than 12 hours after the onset of symptoms."} // "be treated with primary percutaneous coronary intervention (PCI) within < 12 hours after the onset of symptoms"
(declare-const patient_has_stenosis_in_non_infarct_related_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one stenosis in a non-infarct related artery.","when_to_set_to_false":"Set to false if the patient currently does not have any stenosis in a non-infarct related artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has at least one stenosis in a non-infarct related artery.","meaning":"Boolean indicating whether the patient currently has at least one stenosis in a non-infarct related artery."} // "have at least one stenosis in a non-infarct related artery"
(declare-const patient_has_stenosis_in_non_infarct_related_artery_now@@identified_on_quantitative_or_visual_estimation_of_baseline_coronary_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the stenosis in a non-infarct related artery is identified on quantitative coronary angiography or visual estimation of baseline coronary angiography.","when_to_set_to_false":"Set to false if the stenosis in a non-infarct related artery is not identified on these methods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stenosis in a non-infarct related artery is identified on quantitative coronary angiography or visual estimation of baseline coronary angiography.","meaning":"Boolean indicating whether the stenosis in a non-infarct related artery is identified on quantitative coronary angiography or visual estimation of baseline coronary angiography."} // "on (quantitative coronary angiography OR visual estimation of baseline coronary angiography)"
(declare-const stenosis_diameter_percent_value_recorded_now_in_percent Real) ;; {"when_to_set_to_value":"Set to the percent diameter stenosis value of a stenosis identified now, in percent (%).","when_to_set_to_null":"Set to null if the percent diameter stenosis value of a stenosis identified now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the percent diameter stenosis of a stenosis identified now, in percent."} // "diameter stenosis > 50%"
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is judged feasible to undergo percutaneous coronary intervention (PCI) now by the operator.","when_to_set_to_false":"Set to false if the patient is judged not feasible to undergo percutaneous coronary intervention (PCI) now by the operator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is judged feasible to undergo percutaneous coronary intervention (PCI) now by the operator.","meaning":"Boolean indicating whether the patient is judged feasible to undergo percutaneous coronary intervention (PCI) now."} // "be judged feasible for treatment with percutaneous coronary intervention (PCI) by the operator"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_now@@temporalcontext_within_12_hours_after_onset_of_symptoms
         patient_has_undergone_percutaneous_coronary_intervention_now)
     :named REQ0_AUXILIARY0)) ;; "be treated with primary percutaneous coronary intervention (PCI) within < 12 hours after the onset of symptoms"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_stenosis_in_non_infarct_related_artery_now@@identified_on_quantitative_or_visual_estimation_of_baseline_coronary_angiography
         patient_has_stenosis_in_non_infarct_related_artery_now)
     :named REQ0_AUXILIARY1)) ;; "have at least one stenosis in a non-infarct related artery on (quantitative coronary angiography OR visual estimation of baseline coronary angiography)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be aged ≥ 18 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be aged ≥ 18 years"

;; Component 1: patient must be aged ≤ 85 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be aged ≤ 85 years"

;; Component 2: patient must present with ST-elevation myocardial infarction
(assert
  (! patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "present with ST-elevation myocardial infarction"

;; Component 3: patient must be treated with primary PCI within < 12 hours after onset of symptoms
(assert
  (! patient_has_undergone_percutaneous_coronary_intervention_now@@temporalcontext_within_12_hours_after_onset_of_symptoms
     :named REQ0_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be treated with primary percutaneous coronary intervention (PCI) within < 12 hours after the onset of symptoms"

;; Component 4: patient must have at least one stenosis with diameter stenosis > 50% in a non-infarct related artery on (quantitative coronary angiography OR visual estimation of baseline coronary angiography)
(assert
  (! (and patient_has_stenosis_in_non_infarct_related_artery_now@@identified_on_quantitative_or_visual_estimation_of_baseline_coronary_angiography
          (> stenosis_diameter_percent_value_recorded_now_in_percent 50))
     :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "have at least one stenosis with diameter stenosis > 50% in a non-infarct related artery on (quantitative coronary angiography OR visual estimation of baseline coronary angiography)"

;; Component 5: patient must be judged feasible for treatment with PCI by the operator
(assert
  (! patient_can_undergo_percutaneous_coronary_intervention_now
     :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "be judged feasible for treatment with percutaneous coronary intervention (PCI) by the operator"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_symptom_duration_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has experienced symptoms, as documented or reported.","when_to_set_to_null":"Set to null if the duration of symptoms is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in hours that the patient has had symptoms."} // "have had symptoms for > 12 hours"
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of angina pectoris (angina).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of angina pectoris (angina).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has angina pectoris (angina).","meaning":"Boolean indicating whether the patient currently has angina pectoris (angina)."} // "angina"
(declare-const patient_has_finding_of_angina_pectoris_now@@ongoing Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris (angina) and the complaint is ongoing.","when_to_set_to_false":"Set to false if the patient currently has angina pectoris (angina) but the complaint is not ongoing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina complaint is ongoing.","meaning":"Boolean indicating whether the patient's current angina pectoris (angina) complaint is ongoing."} // "ongoing angina complaints"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_angina_pectoris_now@@ongoing
         patient_has_finding_of_angina_pectoris_now)
     :named REQ1_AUXILIARY0)) ;; "ongoing angina complaints" implies "angina"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "have had symptoms for > 12 hours"
(assert
  (! (> patient_symptom_duration_value_recorded_in_hours 12.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; Component 1: "have ongoing angina complaints"
(assert
  (! patient_has_finding_of_angina_pectoris_now@@ongoing
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS))
