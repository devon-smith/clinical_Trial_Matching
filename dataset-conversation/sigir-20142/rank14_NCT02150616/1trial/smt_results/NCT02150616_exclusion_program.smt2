;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_s_condition_unstable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an unstable condition.","when_to_set_to_false":"Set to false if the patient currently does not have an unstable condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an unstable condition.","meaning":"Boolean indicating whether the patient currently has an unstable condition."} ;; "unstable condition"
(declare-const patient_has_finding_of_patient_s_condition_worsened_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an exacerbated (worsened) condition.","when_to_set_to_false":"Set to false if the patient currently does not have an exacerbated (worsened) condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an exacerbated (worsened) condition.","meaning":"Boolean indicating whether the patient currently has an exacerbated (worsened) condition."} ;; "exacerbated condition"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_patient_s_condition_unstable_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an unstable condition."

(assert
  (! (not patient_has_finding_of_patient_s_condition_worsened_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an exacerbated condition."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension."} ;; "pulmonary hypertension"
(declare-const patient_has_finding_of_pulmonary_hypertension_now_classified_as_nyha_class_4 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary hypertension and it is classified as New York Heart Association class 4.","when_to_set_to_false":"Set to false if the patient currently has pulmonary hypertension and it is not classified as New York Heart Association class 4, or if the patient does not currently have pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary hypertension classified as New York Heart Association class 4.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension classified as New York Heart Association class 4."} ;; "very severe pulmonary hypertension defined as New York Heart Association class 4"
(declare-const patient_has_finding_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease."} ;; "interstitial lung disease"
(declare-const patient_has_finding_of_interstitial_lung_disease_now_classified_as_nyha_class_4 Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has interstitial lung disease and it is classified as New York Heart Association class 4.","when_to_set_to_false":"Set to false if the patient currently has interstitial lung disease and it is not classified as New York Heart Association class 4, or if the patient does not currently have interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has interstitial lung disease classified as New York Heart Association class 4.","meaning":"Boolean indicating whether the patient currently has interstitial lung disease classified as New York Heart Association class 4."} ;; "very severe interstitial lung disease defined as New York Heart Association class 4"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for pulmonary hypertension implies stem variable
(assert
(! (=> patient_has_finding_of_pulmonary_hypertension_now_classified_as_nyha_class_4
       patient_has_finding_of_pulmonary_hypertension_now)
   :named REQ1_AUXILIARY0)) ;; "very severe pulmonary hypertension defined as New York Heart Association class 4"

;; Qualifier variable for interstitial lung disease implies stem variable
(assert
(! (=> patient_has_finding_of_interstitial_lung_disease_now_classified_as_nyha_class_4
       patient_has_finding_of_interstitial_lung_disease_now)
   :named REQ1_AUXILIARY1)) ;; "very severe interstitial lung disease defined as New York Heart Association class 4"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_pulmonary_hypertension_now_classified_as_nyha_class_4)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has very severe pulmonary hypertension defined as New York Heart Association class 4."

(assert
(! (not patient_has_finding_of_interstitial_lung_disease_now_classified_as_nyha_class_4)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has very severe interstitial lung disease defined as New York Heart Association class 4."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_undergoing_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing oxygen therapy."} ;; "oxygen therapy"
(declare-const patient_is_undergoing_oxygen_therapy_now@@required_at_low_altitude_residence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current oxygen therapy is required at the patient's low altitude residence.","when_to_set_to_false":"Set to false if the patient's current oxygen therapy is not required at the patient's low altitude residence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current oxygen therapy is required at the patient's low altitude residence.","meaning":"Boolean indicating whether the patient's current oxygen therapy is required at the patient's low altitude residence."} ;; "requires oxygen therapy at the low altitude residence of the patient"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_oxygen_therapy_now@@required_at_low_altitude_residence
      patient_is_undergoing_oxygen_therapy_now)
   :named REQ2_AUXILIARY0)) ;; "oxygen therapy at the low altitude residence of the patient"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_undergoing_oxygen_therapy_now@@required_at_low_altitude_residence)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires oxygen therapy at the low altitude residence of the patient."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypoventilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoventilation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoventilation.","meaning":"Boolean indicating whether the patient currently has hypoventilation."} ;; "hypoventilation"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hypoventilation_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypoventilation."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a disorder of the cardiovascular system."} ;; "cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_more_than_mild Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the cardiovascular system and its severity is more than mild.","when_to_set_to_false":"Set to false if the patient currently has a disorder of the cardiovascular system but its severity is mild or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of the disorder of the cardiovascular system is more than mild.","meaning":"Boolean indicating whether the patient currently has a disorder of the cardiovascular system with severity more than mild."} ;; "more than mild cardiovascular disease"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_more_than_mild
      patient_has_finding_of_disorder_of_cardiovascular_system_now)
   :named REQ4_AUXILIARY0)) ;; "the patient has more than mild cardiovascular disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_finding_of_disorder_of_cardiovascular_system_now@@severity_more_than_mild
            patient_has_finding_of_patient_s_condition_unstable_now))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has more than mild cardiovascular disease) OR (the patient has unstable cardiovascular disease)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "drugs"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@affects_respiratory_center_drive Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed affects respiratory center drive.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed does not affect respiratory center drive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient is currently exposed affects respiratory center drive.","meaning":"Boolean indicating whether the drug or medicament to which the patient is currently exposed affects respiratory center drive."} ;; "drugs that affect respiratory center drive"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@affects_respiratory_center_drive
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ5_AUXILIARY0)) ;; "drugs that affect respiratory center drive""

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@affects_respiratory_center_drive)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses drugs that affect respiratory center drive."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_internal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of internal disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of internal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of internal disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of internal disease."} ;; "internal disease"
(declare-const patient_has_diagnosis_of_internal_disease_now@@interferes_with_protocol_compliance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current internal disease interferes with protocol compliance.","when_to_set_to_false":"Set to false if the patient's current internal disease does not interfere with protocol compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current internal disease interferes with protocol compliance.","meaning":"Boolean indicating whether the patient's current internal disease interferes with protocol compliance."} ;; "internal disease that interferes with protocol compliance"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of nervous system (neurologic disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of nervous system (neurologic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of nervous system (neurologic disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of nervous system (neurologic disease)."} ;; "neurologic disease"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_now@@interferes_with_protocol_compliance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of nervous system interferes with protocol compliance.","when_to_set_to_false":"Set to false if the patient's current disorder of nervous system does not interfere with protocol compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of nervous system interferes with protocol compliance.","meaning":"Boolean indicating whether the patient's current disorder of nervous system interferes with protocol compliance."} ;; "neurologic disease that interferes with protocol compliance"
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mental disorder (psychiatric disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mental disorder (psychiatric disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mental disorder (psychiatric disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of mental disorder (psychiatric disease)."} ;; "psychiatric disease"
(declare-const patient_has_diagnosis_of_mental_disorder_now@@interferes_with_protocol_compliance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disorder interferes with protocol compliance.","when_to_set_to_false":"Set to false if the patient's current mental disorder does not interfere with protocol compliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current mental disorder interferes with protocol compliance.","meaning":"Boolean indicating whether the patient's current mental disorder interferes with protocol compliance."} ;; "psychiatric disease that interferes with protocol compliance"
(declare-const patient_has_finding_of_heavy_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a heavy smoker.","when_to_set_to_false":"Set to false if the patient is currently not a heavy smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a heavy smoker.","meaning":"Boolean indicating whether the patient is currently a heavy smoker."} ;; "current heavy smoking (more than 20 cigarettes per day)"
(declare-const patient_can_undergo_6_minute_walk_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo a 6 minute walk test.","when_to_set_to_false":"Set to false if the patient cannot currently undergo a 6 minute walk test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a 6 minute walk test.","meaning":"Boolean indicating whether the patient can currently undergo a 6 minute walk test."} ;; "inability to perform a 6 minute walk test"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_internal_disease_now@@interferes_with_protocol_compliance
      patient_has_diagnosis_of_internal_disease_now)
    :named REQ6_AUXILIARY0)) ;; "internal disease that interferes with protocol compliance"

(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_now@@interferes_with_protocol_compliance
      patient_has_diagnosis_of_disorder_of_nervous_system_now)
    :named REQ6_AUXILIARY1)) ;; "neurologic disease that interferes with protocol compliance"

(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@interferes_with_protocol_compliance
      patient_has_diagnosis_of_mental_disorder_now)
    :named REQ6_AUXILIARY2)) ;; "psychiatric disease that interferes with protocol compliance"

;; Non-exhaustive examples imply umbrella term (psychiatric disease that interferes with protocol compliance)
(assert
(! (=> (or patient_has_finding_of_heavy_smoker_now
           (not patient_can_undergo_6_minute_walk_test_now))
      patient_has_diagnosis_of_mental_disorder_now@@interferes_with_protocol_compliance)
    :named REQ6_AUXILIARY3)) ;; "with non-exhaustive examples (current heavy smoking (more than 20 cigarettes per day), inability to perform a 6 minute walk test)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_internal_disease_now@@interferes_with_protocol_compliance)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has internal disease that interferes with protocol compliance."

(assert
(! (not patient_has_diagnosis_of_disorder_of_nervous_system_now@@interferes_with_protocol_compliance)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neurologic disease that interferes with protocol compliance."

(assert
(! (not patient_has_diagnosis_of_mental_disorder_now@@interferes_with_protocol_compliance)
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has psychiatric disease that interferes with protocol compliance with non-exhaustive examples (current heavy smoking (more than 20 cigarettes per day), inability to perform a 6 minute walk test)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const altitude_value_recorded_for_previous_intolerance_in_meters Real) ;; {"when_to_set_to_value":"Set to the altitude in meters at which the patient's previous intolerance occurred, if known and documented.","when_to_set_to_null":"Set to null if the altitude at which previous intolerance occurred is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the altitude in meters at which the patient's previous intolerance occurred."} ;; "less than 2600 meters"
(declare-const patient_has_previous_intolerance_to_moderate_altitude_less_than_2600_meters Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to moderate altitude (less than 2600 meters).","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to moderate altitude (less than 2600 meters).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to moderate altitude (less than 2600 meters).","meaning":"Boolean indicating whether the patient has a history of intolerance to moderate altitude (less than 2600 meters)."} ;; "previous intolerance to moderate altitude (less than 2600 meters)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_previous_intolerance_to_moderate_altitude_less_than_2600_meters)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous intolerance to moderate altitude (less than 2600 meters)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_exposure_to_altitude_greater_than_1500_meters_within_last_4_weeks_before_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had exposure to altitudes greater than 1500 meters within the last 4 weeks before the study.","when_to_set_to_false":"Set to false if the patient has not had exposure to altitudes greater than 1500 meters within the last 4 weeks before the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had exposure to altitudes greater than 1500 meters within the last 4 weeks before the study.","meaning":"Boolean indicating whether the patient has had exposure to altitudes greater than 1500 meters within the last 4 weeks before the study."} ;; "exposure to altitudes greater than 1500 meters within the last 4 weeks before the study"
(declare-const patient_has_exposure_to_altitude_greater_than_1500_meters_within_last_4_weeks_before_study@@duration_of_exposure_in_days Real) ;; {"when_to_set_to_value":"Set to the total number of days the patient was exposed to altitudes greater than 1500 meters within the last 4 weeks before the study.","when_to_set_to_null":"Set to null if the duration of exposure is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the total number of days the patient was exposed to altitudes greater than 1500 meters within the last 4 weeks before the study."} ;; "for more than 2 days within the last 4 weeks before the study"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_has_exposure_to_altitude_greater_than_1500_meters_within_last_4_weeks_before_study
             (> patient_has_exposure_to_altitude_greater_than_1500_meters_within_last_4_weeks_before_study@@duration_of_exposure_in_days 2)))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had exposure to altitudes greater than 1500 meters for more than 2 days within the last 4 weeks before the study."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."
