;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const legal_guardian_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal guardian has signed the informed consent.","when_to_set_to_false":"Set to false if the patient's legal guardian has not signed the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal guardian has signed the informed consent.","meaning":"Boolean indicating whether the patient's legal guardian has signed the informed consent."} // "who has signed the informed consent"
(declare-const parent_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent has signed the informed consent.","when_to_set_to_false":"Set to false if the patient's parent has not signed the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent has signed the informed consent.","meaning":"Boolean indicating whether the patient's parent has signed the informed consent."} // "who has signed the informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must have (a parent OR a legal guardian) who has signed the informed consent.
(assert
  (! (or parent_has_signed_informed_consent
         legal_guardian_has_signed_informed_consent)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have (a parent OR a legal guardian) who has signed the informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_weeks_post_conception Real) ;; {"when_to_set_to_value":"Set to the patient's age in weeks post-conception if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in weeks post-conception is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in weeks post-conception, recorded at the current time."} // "greater than 48 weeks post-conception"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "less than 18 years of age"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must be greater than 48 weeks post-conception
(assert
  (! (> patient_age_value_recorded_now_in_weeks_post_conception 48)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "greater than 48 weeks post-conception"

;; Component 1: patient must be less than 18 years of age
(assert
  (! (< patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "less than 18 years of age"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing mechanical ventilation (artificial respiration).","when_to_set_to_false":"Set to false if the patient is currently not undergoing mechanical ventilation (artificial respiration).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing mechanical ventilation (artificial respiration).","meaning":"Boolean indicating whether the patient is currently undergoing mechanical ventilation (artificial respiration)."} // "require mechanical ventilation"
(declare-const patient_is_undergoing_artificial_respiration_now@@performed_in_intensive_care_unit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing mechanical ventilation (artificial respiration) and the procedure is performed in the intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently undergoing mechanical ventilation (artificial respiration) but the procedure is not performed in the intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is performed in the intensive care unit.","meaning":"Boolean indicating whether the patient's mechanical ventilation is performed in the intensive care unit."} // "mechanical ventilation in the intensive care unit"
(declare-const patient_is_undergoing_intubation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing intubation.","when_to_set_to_false":"Set to false if the patient is currently not undergoing intubation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing intubation.","meaning":"Boolean indicating whether the patient is currently undergoing intubation."} // "require intubation"
(declare-const patient_is_undergoing_intubation_now@@solely_for_the_purpose_of_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing intubation and the procedure is performed solely for the purpose of this study.","when_to_set_to_false":"Set to false if the patient is currently undergoing intubation but the procedure is not performed solely for the purpose of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is performed solely for the purpose of this study.","meaning":"Boolean indicating whether the patient's intubation is performed solely for the purpose of this study."} // "require intubation solely for the purpose of this study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_undergoing_artificial_respiration_now@@performed_in_intensive_care_unit
         patient_is_undergoing_artificial_respiration_now)
     :named REQ2_AUXILIARY0)) ;; "mechanical ventilation in the intensive care unit"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_undergoing_intubation_now@@solely_for_the_purpose_of_this_study
         patient_is_undergoing_intubation_now)
     :named REQ2_AUXILIARY1)) ;; "require intubation solely for the purpose of this study"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must require mechanical ventilation in the intensive care unit
(assert
  (! patient_is_undergoing_artificial_respiration_now@@performed_in_intensive_care_unit
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "require mechanical ventilation in the intensive care unit"

;; Component 1: Must NOT require intubation solely for the purpose of this study
(assert
  (! (not patient_is_undergoing_intubation_now@@solely_for_the_purpose_of_this_study)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT require intubation solely for the purpose of this study"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_plain_chest_x_ray_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest x-ray now and the outcome is abnormal.","when_to_set_to_false":"Set to false if the patient has undergone a plain chest x-ray now and the outcome is not abnormal, or if the patient has not undergone the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest x-ray now with an abnormal outcome.","meaning":"Boolean indicating whether the patient has undergone a plain chest x-ray now and the result is abnormal."} // "an abnormal chest radiograph"
(declare-const patient_has_undergone_plain_chest_x_ray_now_outcome_is_abnormal@@determined_by_primary_care_team Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal outcome of the patient's plain chest x-ray now is determined by the primary care team.","when_to_set_to_false":"Set to false if the abnormal outcome of the patient's plain chest x-ray now is not determined by the primary care team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal outcome was determined by the primary care team.","meaning":"Boolean indicating whether the abnormal outcome of the patient's plain chest x-ray now is determined by the primary care team."} // "as determined by the primary care team"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_now_outcome_is_abnormal@@determined_by_primary_care_team
         patient_has_undergone_plain_chest_x_ray_now_outcome_is_abnormal)
     :named REQ3_AUXILIARY0)) ;; "as determined by the primary care team" implies "abnormal chest radiograph"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_undergone_plain_chest_x_ray_now_outcome_is_abnormal@@determined_by_primary_care_team
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an abnormal chest radiograph as determined by the primary care team."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone antibiotic therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy in the past.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy in the past."} // "initiation of antibiotic therapy"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@initiated_by_assigned_health_care_providers Bool) ;; {"when_to_set_to_true":"Set to true if the patient's antibiotic therapy was initiated by the assigned health care providers.","when_to_set_to_false":"Set to false if the patient's antibiotic therapy was not initiated by the assigned health care providers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the assigned health care providers initiated the antibiotic therapy.","meaning":"Boolean indicating whether the patient's antibiotic therapy was initiated by the assigned health care providers."} // "by the assigned health care providers"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@for_suspected_bacterial_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's antibiotic therapy was for suspected bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient's antibiotic therapy was not for suspected bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy was for suspected bacterial pneumonia.","meaning":"Boolean indicating whether the patient's antibiotic therapy was for suspected bacterial pneumonia."} // "for suspected bacterial pneumonia"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@initiated_less_than_or_equal_to_12_hours_prior_to_non_bronchoscopic_bronchoalveolar_lavage Bool) ;; {"when_to_set_to_true":"Set to true if the patient's antibiotic therapy was initiated less than or equal to 12 hours prior to undergoing non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_false":"Set to false if the patient's antibiotic therapy was not initiated less than or equal to 12 hours prior to undergoing non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy was initiated less than or equal to 12 hours prior to non-bronchoscopic bronchoalveolar lavage.","meaning":"Boolean indicating whether the patient's antibiotic therapy was initiated less than or equal to 12 hours prior to non-bronchoscopic bronchoalveolar lavage."} // "initiation of antibiotic therapy less than or equal to 12 hours prior to undergoing non-bronchoscopic bronchoalveolar lavage"
(declare-const antibiotic_therapy_initiation_to_non_bronchoscopic_bronchoalveolar_lavage_time_difference_value_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours between the initiation of antibiotic therapy and the performance of non-bronchoscopic bronchoalveolar lavage for the patient.","when_to_set_to_null":"Set to null if the time difference cannot be determined, is unknown, or not documented.","meaning":"Numeric value representing the time difference in hours between antibiotic therapy initiation and non-bronchoscopic bronchoalveolar lavage."} // "less than or equal to 12 hours prior to undergoing non-bronchoscopic bronchoalveolar lavage"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable: initiated by assigned health care providers
(assert
  (! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@initiated_by_assigned_health_care_providers
         patient_has_undergone_antibiotic_therapy_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "initiation of antibiotic therapy by the assigned health care providers"

;; Qualifier variable implies stem variable: for suspected bacterial pneumonia
(assert
  (! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@for_suspected_bacterial_pneumonia
         patient_has_undergone_antibiotic_therapy_inthehistory)
     :named REQ4_AUXILIARY1)) ;; "for suspected bacterial pneumonia"

;; Qualifier variable implies stem variable: initiated less than or equal to 12 hours prior to non-bronchoscopic BAL
(assert
  (! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@initiated_less_than_or_equal_to_12_hours_prior_to_non_bronchoscopic_bronchoalveolar_lavage
         patient_has_undergone_antibiotic_therapy_inthehistory)
     :named REQ4_AUXILIARY2)) ;; "initiation of antibiotic therapy less than or equal to 12 hours prior to undergoing non-bronchoscopic bronchoalveolar lavage"

;; Definition: time difference less than or equal to 12 hours implies the corresponding qualifier
(assert
  (! (= patient_has_undergone_antibiotic_therapy_inthehistory@@initiated_less_than_or_equal_to_12_hours_prior_to_non_bronchoscopic_bronchoalveolar_lavage
        (<= antibiotic_therapy_initiation_to_non_bronchoscopic_bronchoalveolar_lavage_time_difference_value_in_hours 12.0))
     :named REQ4_AUXILIARY3)) ;; "less than or equal to 12 hours prior to undergoing non-bronchoscopic bronchoalveolar lavage"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: initiation of antibiotic therapy by assigned health care providers for suspected bacterial pneumonia
(assert
  (! (and patient_has_undergone_antibiotic_therapy_inthehistory@@initiated_by_assigned_health_care_providers
          patient_has_undergone_antibiotic_therapy_inthehistory@@for_suspected_bacterial_pneumonia)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "initiation of antibiotic therapy by the assigned health care providers for suspected bacterial pneumonia"

;; Component 1: initiation of antibiotic therapy less than or equal to 12 hours prior to non-bronchoscopic BAL
(assert
  (! patient_has_undergone_antibiotic_therapy_inthehistory@@initiated_less_than_or_equal_to_12_hours_prior_to_non_bronchoscopic_bronchoalveolar_lavage
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "initiation of antibiotic therapy less than or equal to 12 hours prior to undergoing non-bronchoscopic bronchoalveolar lavage"
