;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sickle cell hemoglobin SS disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sickle cell hemoglobin SS disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sickle cell hemoglobin SS disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sickle cell hemoglobin SS disease."} // "diagnosis of hemoglobin SS (two copies of the hemoglobin S gene)"
(declare-const patient_has_diagnosis_of_sickle_cell_hemoglobin_c_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sickle cell hemoglobin SC disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sickle cell hemoglobin SC disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sickle cell hemoglobin SC disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sickle cell hemoglobin SC disease."} // "diagnosis of hemoglobin SC (one copy of the hemoglobin S gene and one copy of the hemoglobin C gene)"
(declare-const patient_has_diagnosis_of_sickle_cell_beta_thalassemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sickle cell beta thalassemia (either β+ or β0 type).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sickle cell beta thalassemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sickle cell beta thalassemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sickle cell beta thalassemia."} // "diagnosis of hemoglobin S-β thalassemia (β+ or β0)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have a diagnosis of hemoglobin SS, hemoglobin SC, or hemoglobin S-β thalassemia (β+ or β0).
(assert
  (! (or patient_has_diagnosis_of_sickle_cell_hemoglobin_ss_disease_now
         patient_has_diagnosis_of_sickle_cell_hemoglobin_c_disease_now
         patient_has_diagnosis_of_sickle_cell_beta_thalassemia_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of hemoglobin SS (two copies of the hemoglobin S gene) or a diagnosis of hemoglobin SC (one copy of the hemoglobin S gene and one copy of the hemoglobin C gene) or a diagnosis of hemoglobin S-β thalassemia (β+ or β0)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_chest_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute chest syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute chest syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute chest syndrome.","meaning":"Boolean indicating whether the patient currently has acute chest syndrome."} // "acute chest syndrome"
(declare-const patient_has_finding_of_acute_chest_syndrome_now@@clinically_apparent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute chest syndrome and it is clinically apparent.","when_to_set_to_false":"Set to false if the patient currently has acute chest syndrome but it is not clinically apparent, or if the patient does not have acute chest syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether acute chest syndrome is clinically apparent.","meaning":"Boolean indicating whether the patient's acute chest syndrome is clinically apparent."} // "clinically apparent acute chest syndrome"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_acute_chest_syndrome_now@@clinically_apparent
         patient_has_finding_of_acute_chest_syndrome_now)
     :named REQ1_AUXILIARY0)) ;; "clinically apparent acute chest syndrome" implies "acute chest syndrome"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have NO clinically apparent acute chest syndrome
(assert
  (! (not patient_has_finding_of_acute_chest_syndrome_now@@clinically_apparent)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have no clinically apparent acute chest syndrome"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_prior_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in any part of the study.","when_to_set_to_false":"Set to false if the patient has not previously participated in any part of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in any part of the study.","meaning":"Boolean indicating whether the patient has previously participated in any part of the study."} // "no prior participation in either part of the study"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_prior_participation_in_study)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "no prior participation in either part of the study"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_fever_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient had fever within the past 24 hours.","when_to_set_to_false":"Set to false if the patient did not have fever within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had fever within the past 24 hours.","meaning":"Boolean indicating whether the patient had fever within the past 24 hours."} // "fever within the same 24-hour window"
(declare-const patient_has_undergone_plain_chest_x_ray_inthepast12hours_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient underwent a chest radiograph within the past 12 hours and the result was negative for new pulmonary infiltrate.","when_to_set_to_false":"Set to false if the patient underwent a chest radiograph within the past 12 hours and the result was not negative for new pulmonary infiltrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient underwent a chest radiograph within the past 12 hours and the result was negative for new pulmonary infiltrate.","meaning":"Boolean indicating whether the patient underwent a chest radiograph within the past 12 hours and the result was negative for new pulmonary infiltrate."} // "chest radiograph negative for new pulmonary infiltrate within the last 12 hours of the 24-hour window"
(declare-const patient_phospholipase_a_2_value_recorded_inthepast24hours_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the measured value of secretory phospholipase A2 in ng/mL if recorded within the past 24 hours.","when_to_set_to_null":"Set to null if no measurement of secretory phospholipase A2 in ng/mL is available within the past 24 hours or the value is indeterminate.","meaning":"Numeric value of secretory phospholipase A2 (ng/mL) measured within the past 24 hours."} // "secretory phospholipase A2 level greater than 100 ng/mL within the same 24-hour window"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: All three conditions must be met within the specified time windows
(assert
  (! (and
        (> patient_phospholipase_a_2_value_recorded_inthepast24hours_withunit_ng_per_ml 100.0) ;; "secretory phospholipase A2 level greater than 100 ng/mL within the same 24-hour window"
        patient_has_finding_of_fever_inthepast24hours ;; "fever within the same 24-hour window"
        patient_has_undergone_plain_chest_x_ray_inthepast12hours_outcome_is_negative ;; "chest radiograph negative for new pulmonary infiltrate within the last 12 hours of the 24-hour window"
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Constraint Assertions (REQ 4) =====================
;; "To be included, the patient must have fever greater than 38.0º C within the same 24-hour window that coincides with an elevated secretory phospholipase A2 level (greater than 100 ng/mL) and chest radiograph negative for new pulmonary infiltrate within the last 12 hours of the 24-hour window."

(assert
  (! (and patient_has_finding_of_fever_inthepast24hours
          (> patient_phospholipase_a_2_value_recorded_inthepast24hours_withunit_ng_per_ml 100.0)
          patient_has_undergone_plain_chest_x_ray_inthepast12hours_outcome_is_negative)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "fever >38.0ºC in same 24h window, elevated secretory phospholipase A2 (>100 ng/mL), and chest radiograph negative for new pulmonary infiltrate within last 12h of 24h window"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_undergone_plain_chest_x_ray_inthepast12hours_outcome_is_negative@@temporalcontext_withinlast12hours_of_24hour_window_of_abnormal_phospholipase_a_2_and_fever Bool) ;; {"when_to_set_to_true":"Set to true if the chest x-ray was performed within the last 12 hours of the 24-hour window defined by abnormal secretory phospholipase A2 level and fever.","when_to_set_to_false":"Set to false if the chest x-ray was not performed within the last 12 hours of the 24-hour window defined by abnormal secretory phospholipase A2 level and fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest x-ray was performed within the last 12 hours of the 24-hour window defined by abnormal secretory phospholipase A2 level and fever.","meaning":"Boolean indicating whether the chest x-ray was performed within the last 12 hours of the 24-hour window defined by abnormal secretory phospholipase A2 level and fever."} // "chest radiograph negative for new pulmonary infiltrate within the last 12 hours of the 24-hour window of an abnormal secretory phospholipase A2 level and fever"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_plain_chest_x_ray_inthepast12hours_outcome_is_negative@@temporalcontext_withinlast12hours_of_24hour_window_of_abnormal_phospholipase_a_2_and_fever
         patient_has_undergone_plain_chest_x_ray_inthepast12hours_outcome_is_negative)
     :named REQ5_AUXILIARY0)) ;; "chest radiograph negative for new pulmonary infiltrate within the last 12 hours of the 24-hour window of an abnormal secretory phospholipase A2 level and fever"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_undergone_plain_chest_x_ray_inthepast12hours_outcome_is_negative@@temporalcontext_withinlast12hours_of_24hour_window_of_abnormal_phospholipase_a_2_and_fever
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a chest radiograph negative for new pulmonary infiltrate within the last 12 hours of the 24-hour window of an abnormal secretory phospholipase A2 level and fever."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const hemoglobin_level_value_recorded_at_study_entry_withunit_g_per_dl Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's hemoglobin level in g/dL as measured at the time of study entry.","when_to_set_to_null":"Set to null if the hemoglobin level at the time of study entry is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's hemoglobin level in g/dL at the time of study entry."} // "hemoglobin level equal to or less than 10 g/dL at time of study entry"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (<= hemoglobin_level_value_recorded_at_study_entry_withunit_g_per_dl 10.0)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "hemoglobin level equal to or less than 10 g/dL at time of study entry"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const informed_consent_provided_by_parent_or_legal_guardian Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been provided by the patient's parent(s) or legal guardian.","when_to_set_to_false":"Set to false if informed consent has not been provided by the patient's parent(s) or legal guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been provided by the patient's parent(s) or legal guardian.","meaning":"Boolean indicating whether informed consent has been provided by the patient's parent(s) or legal guardian."} // "informed consent of parent(s) or legal guardian"
(declare-const informed_consent_provided_by_participant_as_applicable Bool) ;; {"when_to_set_to_true":"Set to true if informed consent has been provided by the participant, as applicable.","when_to_set_to_false":"Set to false if informed consent has not been provided by the participant, as applicable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether informed consent has been provided by the participant, as applicable.","meaning":"Boolean indicating whether informed consent has been provided by the participant, as applicable."} // "informed consent ... of participant as applicable"
(declare-const assent_provided_by_participant_as_applicable Bool) ;; {"when_to_set_to_true":"Set to true if assent has been provided by the participant, as applicable.","when_to_set_to_false":"Set to false if assent has not been provided by the participant, as applicable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether assent has been provided by the participant, as applicable.","meaning":"Boolean indicating whether assent has been provided by the participant, as applicable."} // "assent of participant as applicable"

;; ===================== Constraint Assertions (REQ 7) =====================
;; The patient must have informed consent of parent(s) or legal guardian; informed consent or assent of participant as applicable.
(assert
  (! (and informed_consent_provided_by_parent_or_legal_guardian
          (or informed_consent_provided_by_participant_as_applicable
              assent_provided_by_participant_as_applicable))
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have informed consent of parent(s) or legal guardian; informed consent or assent of participant as applicable."
