;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_implanted_electronic_device_in_chest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted electronic device located in the chest.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted electronic device located in the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted electronic device located in the chest.","meaning":"Boolean indicating whether the patient currently has an implanted electronic device located in the chest."} ;; "The patient is excluded if the patient has an implanted electronic device in the chest."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_implanted_electronic_device_in_chest_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an implanted electronic device in the chest."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_receiving_therapy_for_suspected_chest_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving therapy for a suspected chest infection, regardless of the specific suspected pathogen.","when_to_set_to_false":"Set to false if the patient is not currently receiving therapy for a suspected chest infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving therapy for a suspected chest infection.","meaning":"Boolean indicating whether the patient is currently receiving therapy for a suspected chest infection."} ;; "receiving therapy for suspected chest infection"

(declare-const patient_has_suspicion_of_mycosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical suspicion of mycosis (fungal infection).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical suspicion of mycosis (fungal infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical suspicion of mycosis (fungal infection).","meaning":"Boolean indicating whether the patient currently has a clinical suspicion of mycosis (fungal infection)."} ;; "suspected fungal infection"

(declare-const patient_has_suspicion_of_mycosis_now@@located_in_chest Bool) ;; {"when_to_set_to_true":"Set to true if the clinical suspicion of mycosis (fungal infection) is specifically for an infection located in the chest.","when_to_set_to_false":"Set to false if the clinical suspicion of mycosis (fungal infection) is not for an infection located in the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspected mycosis is located in the chest.","meaning":"Boolean indicating whether the clinical suspicion of mycosis (fungal infection) is for an infection located in the chest."} ;; "suspected fungal infection located in chest"

(declare-const patient_has_suspicion_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical suspicion of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical suspicion of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical suspicion of tuberculosis.","meaning":"Boolean indicating whether the patient currently has a clinical suspicion of tuberculosis."} ;; "suspected tuberculosis"

(declare-const patient_has_suspicion_of_tuberculosis_now@@located_in_chest Bool) ;; {"when_to_set_to_true":"Set to true if the clinical suspicion of tuberculosis is specifically for an infection located in the chest.","when_to_set_to_false":"Set to false if the clinical suspicion of tuberculosis is not for an infection located in the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspected tuberculosis is located in the chest.","meaning":"Boolean indicating whether the clinical suspicion of tuberculosis is for an infection located in the chest."} ;; "suspected tuberculosis located in chest"

(declare-const patient_has_suspicion_of_tuberculosis_now@@receiving_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving therapy for the clinical suspicion of tuberculosis.","when_to_set_to_false":"Set to false if the patient is not currently receiving therapy for the clinical suspicion of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving therapy for the clinical suspicion of tuberculosis.","meaning":"Boolean indicating whether the patient is currently receiving therapy for the clinical suspicion of tuberculosis."} ;; "receiving therapy for suspected tuberculosis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_suspicion_of_mycosis_now@@located_in_chest
           patient_has_suspicion_of_tuberculosis_now@@located_in_chest)
       patient_is_receiving_therapy_for_suspected_chest_infection_now)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (suspected fungal infection, suspected tuberculosis)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_suspicion_of_mycosis_now@@located_in_chest
       patient_has_suspicion_of_mycosis_now)
:named REQ1_AUXILIARY1)) ;; "suspected fungal infection located in chest"

(assert
(! (=> patient_has_suspicion_of_tuberculosis_now@@located_in_chest
       patient_has_suspicion_of_tuberculosis_now)
:named REQ1_AUXILIARY2)) ;; "suspected tuberculosis located in chest"

;; Therapy qualifier implies umbrella therapy variable for tuberculosis
(assert
(! (=> patient_has_suspicion_of_tuberculosis_now@@receiving_therapy
       patient_is_receiving_therapy_for_suspected_chest_infection_now)
:named REQ1_AUXILIARY3)) ;; "receiving therapy for suspected tuberculosis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_receiving_therapy_for_suspected_chest_infection_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving therapy for suspected chest infection with non-exhaustive examples (suspected fungal infection, suspected tuberculosis)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (any cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (any cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (any cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (any cancer)."} ;; "diagnosed malignancy"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer)."} ;; "diagnosed lung cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplasm of skin (skin cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplasm of skin (skin cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplasm of skin (skin cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplasm of skin (skin cancer)."} ;; "diagnosed non-melanoma skin cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@not_suspected_metastatic_to_lung_by_principal_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (any cancer) and the Principal Investigator does not suspect metastatic disease to the lung.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malignant neoplastic disease (any cancer) and the Principal Investigator does suspect metastatic disease to the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Principal Investigator suspects metastatic disease to the lung in the context of the patient's cancer diagnosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (any cancer) and the Principal Investigator does not suspect metastatic disease to the lung."} ;; "any diagnosed cancer in which the Principal Investigator does not suspect metastatic disease to the lung"
(declare-const patient_multiple_nodules_of_lung_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured count if the number of pulmonary nodules currently present in the patient is known.","when_to_set_to_null":"Set to null if the count of pulmonary nodules is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of pulmonary nodules currently present in the patient."} ;; "number of pulmonary nodules"
(declare-const patient_multiple_nodules_of_lung_value_recorded_now_withunit_count@@suspicious Bool) ;; {"when_to_set_to_true":"Set to true if the pulmonary nodules counted are suspicious.","when_to_set_to_false":"Set to false if the pulmonary nodules counted are not suspicious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary nodules are suspicious.","meaning":"Boolean indicating whether the pulmonary nodules counted are suspicious."} ;; "suspicious pulmonary nodules"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable for cancer diagnosis
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@not_suspected_metastatic_to_lung_by_principal_investigator
      patient_has_diagnosis_of_malignant_neoplastic_disease_now)
    :named REQ2_AUXILIARY0)) ;; "any diagnosed cancer in which the Principal Investigator does not suspect metastatic disease to the lung"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: (diagnosed malignancy other than diagnosed lung cancer OR diagnosed non-melanoma skin cancer OR any diagnosed cancer in which the PI does not suspect metastatic disease to the lung)
;; AND (two or more suspicious pulmonary nodules)
(assert
(! (not (and
         (or
           (and patient_has_diagnosis_of_malignant_neoplastic_disease_now
                (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)
                (not patient_has_diagnosis_of_malignant_neoplasm_of_skin_now)
                (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@not_suspected_metastatic_to_lung_by_principal_investigator))
           patient_has_diagnosis_of_malignant_neoplastic_disease_now@@not_suspected_metastatic_to_lung_by_principal_investigator)
         (and patient_multiple_nodules_of_lung_value_recorded_now_withunit_count@@suspicious
              (>= patient_multiple_nodules_of_lung_value_recorded_now_withunit_count 2))))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a diagnosed malignancy other than diagnosed lung cancer OR diagnosed non-melanoma skin cancer OR any diagnosed cancer in which the Principal Investigator does not suspect metastatic disease to the lung) AND (the patient has two or more suspicious pulmonary nodules)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_procedure_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any procedure within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not undergone any procedure within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any procedure within the past 30 days.","meaning":"Boolean indicating whether the patient has undergone any procedure within the past 30 days."} ;; "has received an invasive medical procedure within the thoracic cavity within thirty days prior to the ProLung Test" or "has received an invasive surgical procedure within the thoracic cavity within thirty days prior to the ProLung Test"
(declare-const patient_has_undergone_procedure_inthepast30days@@is_invasive Bool) ;; {"when_to_set_to_true":"Set to true if the procedure undergone within the past 30 days is invasive.","when_to_set_to_false":"Set to false if the procedure is not invasive.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the procedure is invasive.","meaning":"Boolean indicating whether the procedure undergone within the past 30 days is invasive."} ;; "invasive medical procedure" or "invasive surgical procedure"
(declare-const patient_has_undergone_procedure_inthepast30days@@performed_within_thoracic_cavity Bool) ;; {"when_to_set_to_true":"Set to true if the procedure undergone within the past 30 days was performed within the thoracic cavity.","when_to_set_to_false":"Set to false if the procedure was not performed within the thoracic cavity.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the procedure was performed within the thoracic cavity.","meaning":"Boolean indicating whether the procedure undergone within the past 30 days was performed within the thoracic cavity."} ;; "within the thoracic cavity"
(declare-const patient_has_undergone_procedure_inthepast30days@@temporalcontext_within30days_before_prolung_test Bool) ;; {"when_to_set_to_true":"Set to true if the procedure was received within 30 days prior to the ProLung Test.","when_to_set_to_false":"Set to false if the procedure was not received within 30 days prior to the ProLung Test.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the procedure was received within 30 days prior to the ProLung Test.","meaning":"Boolean indicating whether the procedure was received within 30 days prior to the ProLung Test."} ;; "within thirty days prior to the ProLung Test"
(declare-const patient_has_undergone_surgical_procedure_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any surgical procedure within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not undergone any surgical procedure within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any surgical procedure within the past 30 days.","meaning":"Boolean indicating whether the patient has undergone any surgical procedure within the past 30 days."} ;; "invasive surgical procedure"
(declare-const patient_has_undergone_surgical_procedure_inthepast30days@@is_invasive Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone within the past 30 days is invasive.","when_to_set_to_false":"Set to false if the surgical procedure is not invasive.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the surgical procedure is invasive.","meaning":"Boolean indicating whether the surgical procedure undergone within the past 30 days is invasive."} ;; "invasive surgical procedure"
(declare-const patient_has_undergone_surgical_procedure_inthepast30days@@performed_within_thoracic_cavity Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone within the past 30 days was performed within the thoracic cavity.","when_to_set_to_false":"Set to false if the surgical procedure was not performed within the thoracic cavity.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the surgical procedure was performed within the thoracic cavity.","meaning":"Boolean indicating whether the surgical procedure undergone within the past 30 days was performed within the thoracic cavity."} ;; "within the thoracic cavity"
(declare-const patient_has_undergone_surgical_procedure_inthepast30days@@temporalcontext_within30days_before_prolung_test Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure was received within 30 days prior to the ProLung Test.","when_to_set_to_false":"Set to false if the surgical procedure was not received within 30 days prior to the ProLung Test.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the surgical procedure was received within 30 days prior to the ProLung Test.","meaning":"Boolean indicating whether the surgical procedure was received within 30 days prior to the ProLung Test."} ;; "within thirty days prior to the ProLung Test"
(declare-const patient_has_undergone_bronchoscopy_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a bronchoscopy within the past 14 days.","when_to_set_to_false":"Set to false if the patient has not undergone a bronchoscopy within the past 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a bronchoscopy within the past 14 days.","meaning":"Boolean indicating whether the patient has undergone a bronchoscopy within the past 14 days."} ;; "has received a bronchoscopic procedure within the previous fourteen days"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_has_undergone_procedure_inthepast30days
             patient_has_undergone_procedure_inthepast30days@@is_invasive
             patient_has_undergone_procedure_inthepast30days@@performed_within_thoracic_cavity
             patient_has_undergone_procedure_inthepast30days@@temporalcontext_within30days_before_prolung_test))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received an invasive medical procedure within the thoracic cavity within thirty days prior to the ProLung Test."

(assert
(! (not (and patient_has_undergone_surgical_procedure_inthepast30days
             patient_has_undergone_surgical_procedure_inthepast30days@@is_invasive
             patient_has_undergone_surgical_procedure_inthepast30days@@performed_within_thoracic_cavity
             patient_has_undergone_surgical_procedure_inthepast30days@@temporalcontext_within30days_before_prolung_test))
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received an invasive surgical procedure within the thoracic cavity within thirty days prior to the ProLung Test."

(assert
(! (not patient_has_undergone_bronchoscopy_inthepast14days)
   :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received a bronchoscopic procedure within the previous fourteen days."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_anomalous_physical_condition_that_precludes_prolung_test_measurement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with an anomalous physical condition that precludes ProLung Test measurement.","when_to_set_to_false":"Set to false if the patient currently does not present with an anomalous physical condition that precludes ProLung Test measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with an anomalous physical condition that precludes ProLung Test measurement.","meaning":"Boolean indicating whether the patient currently presents with an anomalous physical condition that precludes ProLung Test measurement."} ;; "the patient presents with an anomalous physical condition that precludes ProLung Test measurement"

(declare-const patient_has_anomalous_anatomical_condition_that_precludes_prolung_test_measurement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with an anomalous anatomical condition that precludes ProLung Test measurement.","when_to_set_to_false":"Set to false if the patient currently does not present with an anomalous anatomical condition that precludes ProLung Test measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with an anomalous anatomical condition that precludes ProLung Test measurement.","meaning":"Boolean indicating whether the patient currently presents with an anomalous anatomical condition that precludes ProLung Test measurement."} ;; "the patient presents with an anomalous anatomical condition that precludes ProLung Test measurement"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_anomalous_physical_condition_that_precludes_prolung_test_measurement_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient presents with an anomalous physical condition that precludes ProLung Test measurement."

(assert
(! (not patient_has_anomalous_anatomical_condition_that_precludes_prolung_test_measurement_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient presents with an anomalous anatomical condition that precludes ProLung Test measurement."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_physical_activity_target_strenuous_exercise_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has engaged in strenuous exercise at any time within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not engaged in strenuous exercise at any time within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has engaged in strenuous exercise within the past 24 hours.","meaning":"Boolean indicating whether the patient has engaged in strenuous exercise within the past 24 hours."} ;; "has undergone unusually strenuous exercise within twenty-four hours"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_physical_activity_target_strenuous_exercise_inthepast24hours)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone unusually strenuous exercise within twenty-four hours."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a systemic disease.","meaning":"Boolean indicating whether the patient currently has a systemic disease."} ;; "significant systemic diseases"
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poorly controlled diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have poorly controlled diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has poorly controlled diabetes mellitus."} ;; "uncontrolled diabetes mellitus"
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "advanced heart failure"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction in their history.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in their history."} ;; "recent myocardial infarction"
(declare-const patient_has_finding_of_medical_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have another medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another medical condition.","meaning":"Boolean indicating whether the patient currently has another medical condition."} ;; "another medical condition"
(declare-const patient_has_finding_of_medical_condition_now@@makes_patient_unsuitable_for_study_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current other medical condition, in the judgment of the Principal Investigator, would make the patient unsuitable for the Study.","when_to_set_to_false":"Set to false if the patient's current other medical condition, in the judgment of the Principal Investigator, would not make the patient unsuitable for the Study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current other medical condition, in the judgment of the Principal Investigator, would make the patient unsuitable for the Study.","meaning":"Boolean indicating whether the patient's current other medical condition, in the judgment of the Principal Investigator, would make the patient unsuitable for the Study."} ;; "that in the judgment of the Principal Investigator would make the patient unsuitable for the Study"
(declare-const patient_has_finding_of_morbid_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has morbid obesity.","when_to_set_to_false":"Set to false if the patient currently does not have morbid obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has morbid obesity.","meaning":"Boolean indicating whether the patient currently has morbid obesity."} ;; "morbid obesity"
(declare-const patient_has_finding_of_morbid_obesity_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has morbid obesity and the morbid obesity is severe.","when_to_set_to_false":"Set to false if the patient currently has morbid obesity but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's morbid obesity is severe.","meaning":"Boolean indicating whether the patient's morbid obesity is severe."} ;; "severe morbid obesity"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term for significant systemic diseases
(assert
(! (=> (or patient_has_finding_of_diabetic_poor_control_now
          patient_has_finding_of_heart_failure_now
          patient_has_finding_of_myocardial_infarction_inthehistory)
        patient_has_finding_of_systemic_disease_now)
    :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (uncontrolled diabetes mellitus, advanced heart failure, recent myocardial infarction)"

;; Non-exhaustive example implies umbrella term for other medical condition
(assert
(! (=> patient_has_finding_of_morbid_obesity_now@@severe
        patient_has_finding_of_medical_condition_now@@makes_patient_unsuitable_for_study_investigator_judgment)
    :named REQ6_AUXILIARY1)) ;; "with non-exhaustive examples (severe morbid obesity) that in the judgment of the Principal Investigator would make the patient unsuitable for the Study"

;; Qualifier variable implies corresponding stem variable for other medical condition
(assert
(! (=> patient_has_finding_of_medical_condition_now@@makes_patient_unsuitable_for_study_investigator_judgment
        patient_has_finding_of_medical_condition_now)
    :named REQ6_AUXILIARY2)) ;; "another medical condition"

;; Qualifier variable implies corresponding stem variable for morbid obesity
(assert
(! (=> patient_has_finding_of_morbid_obesity_now@@severe
        patient_has_finding_of_morbid_obesity_now)
    :named REQ6_AUXILIARY3)) ;; "severe morbid obesity"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: significant systemic diseases
(assert
(! (not patient_has_finding_of_systemic_disease_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant systemic diseases with non-exhaustive examples (uncontrolled diabetes mellitus, advanced heart failure, recent myocardial infarction)."

;; Exclusion: another medical condition that in the judgment of the Principal Investigator would make the patient unsuitable for the Study
(assert
(! (not patient_has_finding_of_medical_condition_now@@makes_patient_unsuitable_for_study_investigator_judgment)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another medical condition with non-exhaustive examples (severe morbid obesity) that in the judgment of the Principal Investigator would make the patient unsuitable for the Study."
