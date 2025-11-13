;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."} ;; "To be included, the patient must provide informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_hospitalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized.","when_to_set_to_false":"Set to false if the patient is currently not hospitalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized."} ;; "To be included, the patient must be hospitalized"
(declare-const patient_has_diagnosis_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of myocardial infarction."} ;; "To be included, the patient must have a diagnosis of ST-segment elevation myocardial infarction OR have a diagnosis of non-ST-segment elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_now@@st_segment_elevation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of myocardial infarction is specifically of the ST-segment elevation subtype.","when_to_set_to_false":"Set to false if the patient's current diagnosis of myocardial infarction is not of the ST-segment elevation subtype.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of myocardial infarction is of the ST-segment elevation subtype.","meaning":"Boolean indicating whether the patient's current diagnosis of myocardial infarction is of the ST-segment elevation subtype."} ;; "have a diagnosis of ST-segment elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_now@@non_st_segment_elevation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of myocardial infarction is specifically of the non-ST-segment elevation subtype.","when_to_set_to_false":"Set to false if the patient's current diagnosis of myocardial infarction is not of the non-ST-segment elevation subtype.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of myocardial infarction is of the non-ST-segment elevation subtype.","meaning":"Boolean indicating whether the patient's current diagnosis of myocardial infarction is of the non-ST-segment elevation subtype."} ;; "have a diagnosis of non-ST-segment elevation myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_myocardial_infarction_now@@st_segment_elevation
         patient_has_diagnosis_of_myocardial_infarction_now)
     :named REQ1_AUXILIARY0)) ;; "have a diagnosis of ST-segment elevation myocardial infarction" implies "diagnosis of myocardial infarction"

(assert
  (! (=> patient_has_diagnosis_of_myocardial_infarction_now@@non_st_segment_elevation
         patient_has_diagnosis_of_myocardial_infarction_now)
     :named REQ1_AUXILIARY1)) ;; "have a diagnosis of non-ST-segment elevation myocardial infarction" implies "diagnosis of myocardial infarction"

;; The umbrella term "diagnosis of myocardial infarction" is defined as the OR of the two subtypes (exhaustive subcategories)
(assert
  (! (= patient_has_diagnosis_of_myocardial_infarction_now
        (or patient_has_diagnosis_of_myocardial_infarction_now@@st_segment_elevation
            patient_has_diagnosis_of_myocardial_infarction_now@@non_st_segment_elevation))
     :named REQ1_AUXILIARY2)) ;; "diagnosis of myocardial infarction" ≡ (STEMI ∨ NSTEMI)

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must (be hospitalized AND (have a diagnosis of ST-segment elevation myocardial infarction OR have a diagnosis of non-ST-segment elevation myocardial infarction)).
(assert
  (! (and patient_is_hospitalized_now
          (or patient_has_diagnosis_of_myocardial_infarction_now@@st_segment_elevation
              patient_has_diagnosis_of_myocardial_infarction_now@@non_st_segment_elevation))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (be hospitalized AND (have a diagnosis of ST-segment elevation myocardial infarction OR have a diagnosis of non-ST-segment elevation myocardial infarction))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_hospitalized_within_24_hours_of_onset_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient was hospitalized within 24 hours of onset of symptoms.","when_to_set_to_false":"Set to false if the patient was not hospitalized within 24 hours of onset of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was hospitalized within 24 hours of onset of symptoms.","meaning":"Boolean indicating whether the patient was hospitalized within 24 hours of onset of symptoms."} ;; "be hospitalized within 24 hours of onset of symptoms"
(declare-const patient_is_transferred_from_another_hospital_within_24_hours_of_onset_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient was transferred from another hospital within 24 hours of onset of symptoms.","when_to_set_to_false":"Set to false if the patient was not transferred from another hospital within 24 hours of onset of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was transferred from another hospital within 24 hours of onset of symptoms.","meaning":"Boolean indicating whether the patient was transferred from another hospital within 24 hours of onset of symptoms."} ;; "be transferred from another hospital within 24 hours of onset of symptoms"
(declare-const time_from_onset_of_symptoms_to_hospitalization_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours between onset of symptoms and hospitalization.","when_to_set_to_null":"Set to null if the time from onset of symptoms to hospitalization is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in hours from onset of symptoms to hospitalization."} ;; "within 24 hours of onset of symptoms"
(declare-const time_from_onset_of_symptoms_to_transfer_from_another_hospital_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours between onset of symptoms and transfer from another hospital.","when_to_set_to_null":"Set to null if the time from onset of symptoms to transfer from another hospital is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in hours from onset of symptoms to transfer from another hospital."} ;; "within 24 hours of onset of symptoms"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: patient_is_hospitalized_within_24_hours_of_onset_of_symptoms is true iff time from onset to hospitalization is ≤ 24 hours
(assert
  (! (= patient_is_hospitalized_within_24_hours_of_onset_of_symptoms
        (<= time_from_onset_of_symptoms_to_hospitalization_in_hours 24.0))
     :named REQ2_AUXILIARY0)) ;; "be hospitalized within 24 hours of onset of symptoms"

;; Definition: patient_is_transferred_from_another_hospital_within_24_hours_of_onset_of_symptoms is true iff time from onset to transfer is ≤ 24 hours
(assert
  (! (= patient_is_transferred_from_another_hospital_within_24_hours_of_onset_of_symptoms
        (<= time_from_onset_of_symptoms_to_transfer_from_another_hospital_in_hours 24.0))
     :named REQ2_AUXILIARY1)) ;; "be transferred from another hospital within 24 hours of onset of symptoms"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must (be hospitalized within 24 hours of onset of symptoms) OR (be transferred from another hospital within 24 hours of onset of symptoms)
(assert
  (! (or patient_is_hospitalized_within_24_hours_of_onset_of_symptoms
         patient_is_transferred_from_another_hospital_within_24_hours_of_onset_of_symptoms)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be hospitalized within 24 hours of onset of symptoms) OR (be transferred from another hospital within 24 hours of onset of symptoms))."
